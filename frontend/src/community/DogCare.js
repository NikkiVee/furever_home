import React, { Component } from 'react';
import { Link }from 'react-router-dom';
import axios from 'axios';
import { Paper, Grid } from '@material-ui/core';

import '../css/care.css';

class DogCare extends Component {
  constructor() {
    super();

    this.state = {
      dogPost: [],
    };
  }

  componentDidMount() {
    this.getDogPosts();
  }

  getDogPosts = () => {
    axios
      .get('/posts/dogs')
      .then(res => {
        console.log(res);
        this.setState({
          dogPost: res.data.post,
        });
      })
      .catch(err => {
        console.log(err);
      });
  };

  displayDogPosts = () => {
    let { dogPost } = this.state;
    return dogPost.map(post => {
      return (
        <div>
          <img src={post.post_url} alt=""/>
          <h2 className='postTitle'>{post.title}</h2>
          <p className='petType'>Tip for: {post.pet_type}s</p>
          <p className='postBody'>{post.post_body.slice(0, 50) + '...'}<Link to={`/posts/${post.id}`}>(click for more)</Link></p>
        </div>
      );
    });
  };

  render() {
    console.log(this.state, 'state');
    return (
      <Paper>
      <div>
        <p className='careAdvice'>Dog Care Advice </p>
        <div className='wholePost'>{this.displayDogPosts()}</div>
      </div>
      </Paper>
    );
  }
}

export default DogCare;
