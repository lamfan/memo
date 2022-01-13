let P = document.querySelector('#P')
let Q = document.querySelector('#Q')
let M = document.querySelector('#M')
let n,
	o,
	e,
	d,
	encrypt = 0

P.oninput = e => getKey()
Q.oninput = e => getKey()
M.oninput = e => testKey()

let getKey = () => {
	if (P.value && Q.value) {
		n = P.value * Q.value
		o = lcm(P.value - 1, Q.value - 1)
		e = getEncrypt()
		d = getDecrypt()

		//更新dom
		document.querySelectorAll('.N').forEach(e => (e.innerText = n))
		document.querySelector('#container-create-key').classList.remove('d-none')
		document.querySelector('#result-1').classList.remove('d-none')
		document.querySelector(
			'#result-1'
		).innerHTML = `n = ${n} <br> λ(n) = ${o} <br> encrypt key = (${e},${n}) <br> decrypt key = (${d},${n})`
	}
}

let testKey = () => {
	if (document.querySelector('#M').value >= n) {
		alert('encrypt message cannot bigger or equal to n')
		return
	}
	//更新dom
	encrypt = BigInt(Number(document.querySelector('#M').value)) ** BigInt(e) % BigInt(n)
	document.querySelector('#result-2').classList.remove('d-none')
	document.querySelector('#result-2').innerHTML = `encryted = ${encrypt} <br> decryted = ${
		BigInt(encrypt) ** BigInt(d) % BigInt(n)
	}`
}

let getEncrypt = () => {
	for (let i = 2; i < o; i++) {
		if (coprime(i, o)) return i
	}
}

let getDecrypt = () => {
	for (let i = 2; i < o; i++) {
		if ((e * i) % o === 1) return i
	}
}

let lcm = (x, y) => {
	if (typeof x !== 'number' || typeof y !== 'number') return false
	return !x || !y ? 0 : Math.abs((x * y) / gcd(x, y))
}

let gcd = (x, y) => {
	x = Math.abs(x)
	y = Math.abs(y)
	while (y) {
		var t = y
		y = x % y
		x = t
	}
	return x
}

let coprime = (num1, num2) => {
	const smaller = num1 > num2 ? num1 : num2
	for (let ind = 2; ind < smaller; ind++) {
		const condition1 = num1 % ind === 0
		const condition2 = num2 % ind === 0
		if (condition1 && condition2) {
			return false
		}
	}
	return true
}
