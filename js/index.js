document.querySelectorAll('li').forEach(list => {
    list.onclick = a => {
        list.childElementCount > 0 ? navigator.clipboard.writeText(list.children[0].innerText) : navigator.clipboard.writeText(list.innerText);
        list.classList.add('active');
        list.onanimationend = e => list.classList.remove('active');
    };
});
