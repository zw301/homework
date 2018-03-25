import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);

    this.clear = this.clear.bind(this);
  }

  //your code here
  setNum1(e) {
  // your code here
  const num1 = e.target.value ? parseInt(e.target.value) : "";
  this.setState({ num1 });
  }

  setNum2(e) {
  // your code here
  const num2 = e.target.value ? parseInt(e.target.value) : "";
  this.setState({ num2 });
  }

  add(e){
    const result = this.state.num1 + this.state.num2;
    this.setState({ result })
  }

  subtract(e) {
    const result = this.state.num1 - this.state.num2;
    this.setState({ result })
  }

  multiply(e) {
    const result = this.state.num1 * this.state.num2;
    this.setState({ result })
  }

  divide(e) {
    const result = this.state.num1 / this.state.num2;
    this.setState({ result })
  }

  clear(e) {
    this.setState({ num1: "", num2: "", result: 0 })
  }

  render(){
    const {num1, num2, result} = this.state
    return (
      <div>
        <h1>{result}</h1>
        <input value={num1} onChange={this.setNum1} ></input>
        <input value={num2} onChange={this.setNum2} ></input>
        <button onClick={this.clear} >clear</button>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divede}>/</button>
      </div>

    );
  }
}

export default Calculator;
