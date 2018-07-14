//格式化时间 yyyy-MM-dd hh:mm:ss
function getFormatDateWithHours(date) {
	var date = new Date(date);
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var strHours = date.getHours();
    var strMin = date.getMinutes();
    var strSeconds = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (strHours >= 0 && strHours <= 9) {
    	strHours = "0" + strHours;
    }
    if (strMin >= 0 && strMin <= 9) {
    	strMin = "0" + strMin;
    }
    if (strSeconds >= 0 && strSeconds <= 9) {
    	strSeconds = "0" + strSeconds;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + strHours + seperator2 + strMin
            + seperator2 + strSeconds;
    return currentdate;
}