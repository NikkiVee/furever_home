import React, { Component } from 'react'
import { NavLink } from 'react-router-dom';
import { AppBar, Paper, Tabs, SwipeableViews } from '@material-ui/core';
import Tab from '@material-ui/core/Tab'

import '../css/bar.css'
let logo = require('../assets/logo.png');

function TabContainer(props) {
  const { children, dir } = props;

  TabContainer.propTypes = {
  children: PropTypes.node.isRequired,
  dir: PropTypes.string.isRequired,
};

class Bar extends Component {
  render(){
    return(
      <>
        <AppBar className='navbar'>

        <Tabs className='tabs'>

          <div className='logoContainer'>
            <NavLink to={'/'} className="logoLink">
              <img src={logo} alt="" className="logo"/>
            </NavLink>
          </div>

          <div className='fureverHome'>
           furever home
          </div>

          <Tab label="BREEDS" />
          <Tab label="COMMUNITY" />
        </Tabs>
        <SwipeableViews>
        </SwipeableViews>

         </AppBar>
       </>
    )
  }
}

export default Bar
