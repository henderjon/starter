export class HelloThingy {
// water / ratio = coffee
// coffee * 1.7 = additional water

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
