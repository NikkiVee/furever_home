import React, { Component } from 'react';
import axios from 'axios';
import { Paper } from '@material-ui/core';
import { MyContext } from '../provider/MyProvider';
import { Link, Redirect } from 'react-router-dom';
import Auth from '../utils/Auth.js';
import '../css/login.css';

class Login extends Component {
  constructor() {
    super();

    this.state = {
      emailInput: '',
      passwordInput: '',
      redirect: false,
    };
  }

  handleChange = e => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = (e, contextConfirm) => {
    e.preventDefault();
    axios
      .post('/users/login', {
        email: this.state.emailInput,
        password: this.state.passwordInput,
      })
      .then(res => {
        contextConfirm(res.data);
        Auth.authenticateUser(res.data.email);
        this.setState({
          emailInput: '',
          passwordInput: '',
          redirect: true,
        });
      })
      .catch(err => {
        console.log(err);
      });
  };

  renderRedirect = () => {
    if (this.state.redirect) {
      return <Redirect to={'/'} />;
    }
  };

  demoLogin = contextConfirm => {
    axios
      .post('/users/login', {
        email: 'corey@fh.com',
        password: '123',
      })
      .then(res => {
        Auth.authenticateUser(res.data.email);
        contextConfirm(res.data);
        this.setState({
          emailInput: '',
          passwordInput: '',
          redirect: true,
        });
      })
      .catch(err => {
        console.log(err);
      });
  };

  render() {
    return (
      <MyContext.Consumer>
        {context => {
          if (context.state.currentUser.id) {
            return <Redirect to={'/'} />;
          } else {
            return (
              <div className="login_container">
                <Paper
                  style={{
                    width: '15%',
                    padding: '5%',
                    fontFamily: 'Open Sans Condensed',
                    display: 'flex',
                    justifyContent: 'center',
                    flexDirection: 'column',
                    marginLeft: '2%',
                  }}
                >
                  <p
                    style={{
                      fontWeight: '900',
                      marginLeft: '37%',
                      fontSize: '25px',
                      marginTop: '-14%',
                      marginBottom: '4%',
                    }}
                  >
                    LOGIN
                  </p>
                  <form
                    onSubmit={e => {
                      this.handleSubmit(e, context.functions.loginUser);
                    }}
                  >
                    <div className="inputCont">
                      <input
                        type="text"
                        name="emailInput"
                        value={this.state.emailInput}
                        onChange={this.handleChange}
                        placeholder="Email"
                        style={{ marginLeft: '22%' }}
                      />
                    </div>
                    <input
                      type="password"
                      name="passwordInput"
                      value={this.state.passwordInput}
                      onChange={this.handleChange}
                      placeholder="Password"
                      style={{ marginLeft: '22%' }}
                    />
                    <div>
                      <button
                        style={{
                          borderRadius: '1px',
                          marginLeft: '24%',
                          color: 'white',
                          backgroundColor: '#001049',
                        }}
                      >
                        Login
                      </button>
                      <button
                        onClick={() =>
                          this.demoLogin(context.functions.loginUser)
                        }
                        style={{
                          borderRadius: '1px',
                          color: 'white',
                          backgroundColor: '#001049',
                        }}
                      >
                        Demo Login
                      </button>
                    </div>
                  </form>
                  {this.renderRedirect()}
                  <div>
                    <Link to={"/register"}>
                      <p style={{ marginLeft: "14%", paddingTop: "2%" }}>
                        Need to create an account? Register
                      </p>
                    </Link>
                  </div>
                </Paper>
              </div>
            );
          }
        }}
      </MyContext.Consumer>
    );
  }
}

export default Login;
