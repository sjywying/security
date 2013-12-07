console.log('b.js被调用');

function onloadAfter() {
	console.log('b.js print: ' + document.getElementById('span111').textContent);
}
