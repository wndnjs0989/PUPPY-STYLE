function goPopup(){
	var pop = window.open("/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 	
}

function jusoCallBack(maddr1,maddr2,mzip){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.member.maddr1.value = maddr1;
    	document.member.maddr2.value = maddr2;
		document.member.mzip.value = mzip;			
}
function validateForm() {

    let f = document.member;

    // 아이디
    if (f.mid.value.trim() == "") {
        alert("아이디를 입력하세요.");
        f.mid.focus();
        return false;
    }

    if (f.mid.value.length < 4) {
        alert("아이디는 4자 이상 입력하세요.");
        f.mid.focus();
        return false;
    }

    // 비밀번호
    if (f.mpasswd.value == "") {
        alert("비밀번호를 입력하세요.");
        f.mpasswd.focus();
        return false;
    }

    if (f.mpasswd.value.length < 4) {
        alert("비밀번호는 4자 이상 입력하세요.");
        f.mpasswd.focus();
        return false;
    }

    // 비밀번호 확인
    if (f.mpasswd.value != f.mpasswdCheck.value) {
        alert("비밀번호가 일치하지 않습니다.");
        f.mpasswdCheck.focus();
        return false;
    }

    // 이름
    if (f.mname.value.trim() == "") {
        alert("이름을 입력하세요.");
        f.mname.focus();
        return false;
    }

    // 전화번호
    let mtel1 = f.mtel1.value.trim();
    let mtel2 = f.mtel2.value.trim();
    let mtel3 = f.mtel3.value.trim();

    if (!/^\d{3}$/.test(mtel1)) {
        alert("전화번호 앞자리를 확인하세요.");
        f.mtel1.focus();
        return false;
    }

    if (!/^\d{4}$/.test(mtel2)) {
        alert("전화번호 가운데 자리를 확인하세요.");
        f.mtel2.focus();
        return false;
    }

    if (!/^\d{4}$/.test(mtel3)) {
        alert("전화번호 마지막 자리를 확인하세요.");
        f.mtel3.focus();
        return false;
    }

    // 이메일
    if (f.memail.value.trim() != "") {
        let memailPattern =
            /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

        if (!memailPattern.test(f.memail.value)) {
            alert("이메일 형식이 올바르지 않습니다.");
            f.memail.focus();
            return false;
        }
    }

    // 취미 1개 이상 선택
    let mhobbies = document.getElementsByName("mhobby");
    let checked = false;

    for (let i = 0; i < mhobbies.length; i++) {
        if (mhobbies[i].checked) {
            checked = true;
            break;
        }
    }

    if (!checked) {
        alert("취미를 1개 이상 선택하세요.");
        return false;
    }

    return true;
}  
	   