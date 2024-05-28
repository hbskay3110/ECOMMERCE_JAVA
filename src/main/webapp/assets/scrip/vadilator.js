// Đối tượng
function Vadilator(options) {
    function getParent(element ,selector){
        while(element.parentElement){
            if(element.parentElement.matches(selector)){
                return element.parentElement
            }
            element = element.parentElement
        }

    }
    var selectorRules = {};
    // Hàm thực hiện validate
    function validate(inputElement, rule) {
        var errorMgs 
        var errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector)

        // Lấy ra các rules của selector
        var rules = selectorRules[rule.selector]
        //  Lặp qua từng rule(check)
        // Nếu có lỗi thì dừng việc kiểm tra
        for(var i=0 ; i< rules.length ; i++){
            errorMgs = rules[i](inputElement.value)
            if(errorMgs){
                break;
            };
        }
        if (errorMgs) {
            errorElement.innerText = errorMgs;
            getParent(inputElement, options.formGroupSelector).classList.add('auth-form__group-invalid')
        } else {
            errorElement.innerText = "";
            getParent(inputElement, options.formGroupSelector).classList.remove('auth-form__group-invalid')

        }
        return !errorMgs;
    }
    // Lấy element của form cần validate
    var formElement = document.querySelector(options.form)

    if (formElement) {
        //Khi submitform
        formElement.onsubmit = function (e){
            e.preventDefault();
           
            
           
            var isFormValid = true;
            // Thực hiện lặp qua từng rules và validate
            options.rules.forEach(function (rule) {
                var inputElement = formElement.querySelector(rule.selector)
               var isValid = validate(inputElement, rule);
               if(!isValid){
                   isFormValid = false;
                   
               }
               
            })
          
             // Thự hiện thong báo khi người dùng đk or đăng nhập thành công
             var modalForm =  document.querySelector(options.modal)
             var register1 =  document.querySelector(options.register)
             var login1 =  document.querySelector(options.login)

            
             if(options.form == options.formAlertRegister){
                if(isFormValid){
                   alert("Chúc mừng bạn đã đăng kí thành công")
                   modalForm.classList.remove('modal--open')
                }
            }
            if(options.form == options.formAlertLogin){
                if(isFormValid){
                    register1.style.display = "none";
                    login1.style.display = "none";
                   alert("Chúc mừng bạn đã đăng nhập thành công")
                    
                     modalForm.classList.remove('modal--open')                
                }
            }
            
          

        
          if(isFormValid){
            //   Trường hopwk submit với js
              if(typeof options.onSubmit === 'function'){
                var enableInputs = formElement.querySelectorAll('[name]')
                var formValues = Array.from(enableInputs).reduce(function(values, input){
                    values[input.name] = input.value;
                    return values;
                },{})
    
                  options.onSubmit(formValues)
              }
            // trường hợp submit với hành vi mặc địmh
            else{
                formElement.submit();
            }
          }
           
        }
        options.rules.forEach(function (rule) {
            //Lưu lại các rules cho mỗi input
            if(Array.isArray(selectorRules[rule.selector])){
                selectorRules[rule.selector].push(rule.test)
            }else{
                selectorRules[rule.selector] = [rule.test];
            }
            var inputElement = formElement.querySelector(rule.selector)

            if (inputElement) {
                // Sử lý khi người dùng blur ra khỏi input
                inputElement.onblur = function () {
                    // value :inputElement.value
                    // test : rule.test
                    validate(inputElement, rule);
                //Sử lý khi người dùng nhập vào input
                inputElement.oninput = function(){
                    var errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector)
                    errorElement.innerText = "";
                    getParent(inputElement, options.formGroupSelector).classList.remove('auth-form__group-invalid')
        
                }
                }
            }
           
        })
    }

}
// Định nghĩa rules
//Nguyen tắc của các rule
// 1. Khi có lỗi thì trả ra mgs lỗi
// 2. Khi khong  có lỗi thì không trả ra gì
Vadilator.isEmail = function (selector , message) {
    return {
        selector: selector,
        test: function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
            var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
            return regex.test(value) ||  vnf_regex.test(value) ? undefined : message|| 'Trường này phải là email'
         
        }
    }

}



Vadilator.isRequired = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            return value.trim() ? undefined : 'Vui lòng nhập trường này'
         
        }
    }

}
Vadilator.minLength = function (selector , min) {
    return {
        selector: selector,
        test: function (value) {
            return value.length >= min ? undefined : `Vui lòng nhập tối thiểu ${min} kí tự`;
         
        }
    }

}
Vadilator.isCheckpass = function (selector , getPassValue, message) {
    return {
        selector: selector,
        test: function (value) {
            return value === getPassValue() ? undefined : message || `Giá trị nhập vào không trùng khớp`;
         
        }
    }

}
var index = -1
var listTenDangNhap = new Array("a@gmail.com" , "0366457457")
Vadilator.isCheckEmail = function(selector ,message){
    return {
        selector: selector,
        test: function(value) {
            for(var i = 0; i < listTenDangNhap.length; i++) {
                if(listTenDangNhap[i]== value){
                    index = i;
                    console.log(index)
                    return  undefined 
                   
                }else{
                    return message || `Giá trị nhập vào không tồn tại`;
                }
           }  
        }      
    }
}
Vadilator.isCheckTK = function(selector ,message){
    return {
        selector: selector,
        test: function(value) {
            
            var listMatKhau = new Array("123456","234567");
                if(listMatKhau[index]== value){
                    return  undefined 
                   
                }else{
                    return message || `Giá trị nhập vào không tồn tại`;
                }
           
        }      
    }
}
Vadilator.ischekExist = function(selector,message){
    return {
        selector: selector,
        test: function (value) {
            for(var i = 0; i < listTenDangNhap.length; i++) {
                if(listTenDangNhap[i]== value){
                    return message || `Giá trị nhập vào đã tồn tại`;
                    
                }else{
                    return  undefined 
                }
           }  
         
        }
    }

}



