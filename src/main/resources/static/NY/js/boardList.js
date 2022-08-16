/**
 * 
 */
 
 //친구리스트 설정 페이지 나타남
function F_openFReReplace(){
    document.querySelector('.FriendReplace').style.display = "block";   //서버 수정 페이지 나타남
    document.querySelector('#chatIcon_2').style.display = "block";   //닫히는 아이콘 나타남
    document.querySelector('#chatIcon').style.display = "none";   //열리는 아이콘 없어짐

}
//친구리스트 설정 페이지 없어짐
function F_closeFReReplace(){
    document.querySelector('.FriendReplace').style.display = "none";   //서버 수정 페이지 없어짐
    document.querySelector('#chatIcon_2').style.display = "none";         //열리는 아이콘 나타남
    document.querySelector('#chatIcon').style.display = "block";      //닫히는 아이콘 없어짐  
}
//친구 삭제 나타남
function F_closeFReReplace(){
    document.querySelector('.FriendReplace').style.display = "none";   //서버 수정 페이지 없어짐
    document.querySelector('#chatIcon_2').style.display = "none";         //열리는 아이콘 나타남
    document.querySelector('#chatIcon').style.display = "block";      //닫히는 아이콘 없어짐  
}