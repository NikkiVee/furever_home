import React, { Component } from 'react';
import { Paper } from '@material-ui/core';
import '../css/profile.css';
import '../css/profilePosts.css';
import { MyContext } from '../provider/MyProvider';
import { Link, withRouter } from 'react-router-dom';

class UsersPosts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: '',
    };
  }

  displayPosts = () => {
    let posts = this.props.user_Posts;
    return posts.map(post => {
      return (
        <div className='postsProfCont'>
          <div key={post.id}>
            <Link to={`/posts/${post.id}`}>
              <p className='profPostTitle'>{post.title}</p>
            </Link>
            <Link to={`/posts/${post.id}`}>
              <img src={post.post_url} alt="" className="postImg" />
            </Link>
          </div>
        </div>
      );
    });
  };

  render() {
    return (



<MyContext.Consumer>
        {context => {
          return (
            <React.Fragment>

              <Paper style={{ padding: '2%', marginTop: '1%' }}>
                <p className="postsTitle">Posts by User</p>
                <div className='postsPetImg'>{this.displayPosts()}</div>
              </Paper>
            </React.Fragment>
          );
        }}
      </MyContext.Consumer>
    );
  }
}
export default withRouter(UsersPosts);
