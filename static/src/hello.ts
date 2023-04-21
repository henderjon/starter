export class HelloThingy {

	constructor(private greeting : HTMLInputElement) {
		greeting.addEventListener("focus", this.greet.bind(this));
	}

	private greet(){
		let g = document.getElementById("greeting-text") as HTMLInputElement;
		if(g != null) {
			g.value = "Hello World";
		}
	}
}
