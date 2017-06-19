function validateLoginForm() {
    var x = document.getElementById("login_text").value;
    var y = document.getElementById("password").value;
    if ((x == null || x == "" || x.match(/^\s*$/)) || (y==null || y=="")) {
        alert("Username, email and password cannot be empty!");
        return false;
    } else {
        return true;
        
    }
}

function validateEmployeeForm () {
    var firstname = document.getElementById("eFirstname").value;
    var lastname = document.getElementById("eLastname").value;
    var startdate = document.getElementById("eStartdate").value;
    var enddate = document.getElementById("eEnddate").value;
    var ucost = document.getElementById("eUcost").value;
    var salary = document.getElementById("eSalary").value;
    var regEx = /^\d{4}-\d{2}-\d{2}$/;
    
    if ((firstname == null || firstname == "" || firstname.match(/^\s*$/) || !firstname.match(/^[A-Za-z]+$/)) &&
       (lastname==null || lastname=="" || lastname.match(/^\s*$/)) || !lastname.match(/^[A-Za-z]+$/)) {
            
        alert('Both First Name and Last Name cannot be empty and must contain only letters.');  
        return false;
    } else if (firstname==null || firstname=="" || firstname.match(/^\s*$/) || !firstname.match(/^[A-Za-z]+$/)) {
        alert('First Name cannot be empty and must contain only letters.');  
        return false;
    } else if (lastname==null || lastname=="" || lastname.match(/^\s*$/) || !lastname.match(/^[A-Za-z]+$/)) {
        alert('Last Name cannot be empty and must contain only letters.');  
        return false;
    } else if(!startdate.match(regEx)) {
        alert('You must enter a valid start date. The pattern should be YYYY-MM-DD');  
        return false;
    
    } else if (!enddate.match(regEx)) {
        alert('You must enter a valid end date. The pattern should be YYYY-MM-DD');  
        return false; 
    } else if (enddate<=startdate) {
        alert('End date must be latter than start date.');
        return false; 
    } else if (!ucost.match(/^[0-9.]+$/)) {
        alert('Unit Cost field cannot be empty and must contain only numbers excluding comma (,).');  
        return false;
    } else if (!salary.match(/^[0-9.]+$/)) {
        alert('Salary field cannot be empty and must contain only numbers excluding comma (,).');  
        return false;
    } else {
        return true;
    }
}

function validateEmployeeFormOp () {
    var firstname = document.getElementById("eFirstname").value;
    var lastname = document.getElementById("eLastname").value;
    var startdate = document.getElementById("eSDate").value;
    var enddate = document.getElementById("eEDate").value;
    var ucost = document.getElementById("eUcost").value;
    var salary = document.getElementById("eSalary").value;
    var regEx = /^\d{4}-\d{2}-\d{2}$/;
    
    if ((firstname == null || firstname == "" || firstname.match(/^\s*$/) || !firstname.match(/^[A-Za-z]+$/)) &&
       (lastname==null || lastname=="" || lastname.match(/^\s*$/)) || !lastname.match(/^[A-Za-z]+$/)) {
            
        alert('Both First Name and Last Name cannot be empty and must contain only letters.');  
        return false;
    } else if (firstname==null || firstname=="" || firstname.match(/^\s*$/) || !firstname.match(/^[A-Za-z]+$/)) {
        alert('First Name cannot be empty and must contain only letters.');  
        return false;
    } else if (lastname==null || lastname=="" || lastname.match(/^\s*$/) || !lastname.match(/^[A-Za-z]+$/)) {
        alert('Last Name cannot be empty and must contain only letters.');  
        return false;
    } else if(!startdate.match(regEx)) {
        alert('You must enter a valid start date. The pattern should be YYYY-MM-DD');  
        return false;
    
    } else if (!enddate.match(regEx)) {
        alert('You must enter a valid end date. The pattern should be YYYY-MM-DD');  
        return false; 
    } else if (enddate<=startdate) {
        alert('End date must be latter than start date.');
        return false; 
    } else if (!ucost.match(/^[0-9.]+$/)) {
        alert('Unit Cost field cannot be empty and must contain only numbers excluding comma (,).');  
        return false;
    } else if (!salary.match(/^[0-9.]+$/)) {
        alert('Salary field cannot be empty and must contain only numbers excluding comma (,).');  
        return false;
    } else {
        return true;
    }
}

function validateProjectForm () {
    var name = document.getElementById("pName").value;
    var acronym = document.getElementById("pAcr").value;
    var connum = document.getElementById("pConNum").value; 
    var startdate = document.getElementById("pSDate").value;
    var enddate = document.getElementById("pEDate").value;
    var budget = document.getElementById("pBud").value;
    var tgrant = document.getElementById("pTGrant").value;
    var cmtbudget = document.getElementById("pCMTBud").value;
    var cmttgrant = document.getElementById("pTCMTGrant").value;
	
    var letter_pattern = /^[A-Za-z]+$/;
    var number_with_digits_pattern = /^[0-9.]+$/;
    var number_pattern = /^[0-9]+$/;
    var date_pattern = /^\d{4}-\d{2}-\d{2}$/;
    var alphanumeric_pattern = /^[A-Za-z0-9_]+$/;
    
    if ((name == null) || (name == "") || (name.match(/^\s*$/)) || 
            (!name.match(alphanumeric_pattern)) || (name.length>50)) {
        alert('The name of the project must not be null, contains sysmbols or exceeds 50 characters!');  
        return false;
        
    } else if ((acronym == null) || (acronym == "") || (acronym.match(/^\s*$/)) || 
            (!acronym.match(alphanumeric_pattern)) || (acronym.length>4)) {
        
        alert('The acronym of the project must not be null, contains sysmbols or exceeds 4 characters!');  
        return false;
        
    } else if ((connum == null) || (connum == "") || (connum.match(/^\s*$/)) || 
            (!connum.match(number_pattern))) {
        
        alert('The contract number of the project must be neither null nor contain characters other than numbers!');  
        return false;   
    
    } else if(!startdate.match(date_pattern)) {
        alert('You must enter a valid start date. The pattern should be YYYY-MM-DD');  
        return false;
    
    } else if (!enddate.match(date_pattern)) {
        alert('You must enter a valid end date. The pattern should be YYYY-MM-DD');  
        return false; 
        
    } else if (enddate<=startdate) {
        alert('End date must be latter than start date.');
        return false;
    
    } else if ((budget.length>0) && (!budget.match(number_with_digits_pattern))) {
        
        alert('The budget of the project must only contain numbers and decimals!');  
        return false; 
        
    } else if ((tgrant.length>0) && (!tgrant.match(number_with_digits_pattern))) {
        
        alert('The total project grant must only contain numbers and decimals!');  
        return false; 
        
    } else if ((cmtbudget.length>0) && (!cmtbudget.match(number_with_digits_pattern))) {
        
        alert('The CMT budget of the project must only contain numbers and decimals!');  
        return false; 
        
    } else if ((cmttgrant.length>0) && (!cmttgrant.match(number_with_digits_pattern))) {
        
        alert('The total CMT grant of the project must only contain numbers and decimals!');
        return false; 
        
    } else {    
        return true;
    }
}

function validateProjectForm_Edit () {
    var name = document.getElementById("pName").value;
    var acronym = document.getElementById("pAcr").value;
    var connum = document.getElementById("pConNum").value; 
    var startdate = document.getElementById("pSDate").value;
    var enddate = document.getElementById("pEDate").value;
    var budget = document.getElementById("pBud").value;
    var tgrant = document.getElementById("pTGrant").value;
    var cmtbudget = document.getElementById("pCMTBud").value;
    var cmttgrant = document.getElementById("pTCMTGrant").value;
    var firstpay = document.getElementById("pFirstPay").value;
    var secpay = document.getElementById("pSecPay").value;
    var thirdpay = document.getElementById("pThirdPay").value;
    var fourthpay = document.getElementById("pFourthPay").value;
   	
    var letter_pattern = /^[A-Za-z]+$/;
    var number_with_digits_pattern = /^[0-9.]+$/;
    var number_pattern = /^[0-9]+$/;
    var date_pattern = /^\d{4}-\d{2}-\d{2}$/;
    var alphanumeric_pattern = /^[A-Za-z0-9_]+$/;
    
    if ((name == null) || (name == "") || (name.match(/^\s*$/)) || 
            (!name.match(alphanumeric_pattern)) || (name.length>50)) {
        alert('The name of the project must not be null, contains sysmbols or exceeds 50 characters!');  
        return false;
        
    } else if ((acronym == null) || (acronym == "") || (acronym.match(/^\s*$/)) || 
            (!acronym.match(alphanumeric_pattern)) || (acronym.length>4)) {
        
        alert('The acronym of the project must not be null, contains sysmbols or exceeds 4 characters!');  
        return false;
        
    } else if ((connum == null) || (connum == "") || (connum.match(/^\s*$/)) || 
            (!connum.match(number_pattern))) {
        
        alert('The contract number of the project must be neither null nor contain characters other than numbers!');  
        return false;   
    
    } else if(!startdate.match(date_pattern)) {
        alert('You must enter a valid start date. The pattern should be YYYY-MM-DD');  
        return false;
    
    } else if (!enddate.match(date_pattern)) {
        alert('You must enter a valid end date. The pattern should be YYYY-MM-DD');  
        return false; 
        
    } else if (enddate<=startdate) {
        alert('End date must be latter than start date.');
        return false;
    
    } else if ((budget.length>0) && (!budget.match(number_with_digits_pattern))) {
        
        alert('The budget of the project must only contain numbers and decimals!');  
        return false; 
        
    } else if ((tgrant.length>0) && (!tgrant.match(number_with_digits_pattern))) {
        
        alert('The total project grant must only contain numbers and decimals!');  
        return false; 
        
    } else if ((cmtbudget.length>0) && (!cmtbudget.match(number_with_digits_pattern))) {
        
        alert('The CMT budget of the project must only contain numbers and decimals!');  
        return false; 
        
    } else if ((cmttgrant.length>0) && (!cmttgrant.match(number_with_digits_pattern))) {
        
        alert('The total CMT grant of the project must only contain numbers and decimals!');
        return false;
        
    } else if ((firstpay.length>0) && (!firstpay.match(number_with_digits_pattern))) {
        
        alert('The first installment of the project must only contain numbers and decimals!');
        return false; 
        
    } else if ((secpay.length>0) && (!secpay.match(number_with_digits_pattern))) {
        
        alert('The second installment of the project must only contain numbers and decimals!');
        return false; 
        
    } else if ((thirdpay.length>0) && (!thirdpay.match(number_with_digits_pattern))) {
        
        alert('The third installment of the project must only contain numbers and decimals!');
        return false; 
        
    } else if ((fourthpay.length>0) && (!fourthpay.match(number_with_digits_pattern))) {
        
        alert('The fourth installment of the project must only contain numbers and decimals!');
        return false;    
        
    } else {    
        return true;
    }
}

function validateProjectPlanning () {
    var td_value = document.getElementsByClassName('form-control');
    var two_numbers_with_one_digit = /^\d{0,2}(\.\d{1})?$/;
    
    for (var i=0; i<td_value.length; i++) {
        var v = td_value[i].value;
        if (v.match(two_numbers_with_one_digit)) {
            return true;  
        } else { 
            alert('Only two numbers and one decimal are allowed!');  
            return false;
            
        }
    }    
}
