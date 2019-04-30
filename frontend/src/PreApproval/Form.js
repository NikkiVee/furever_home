import React from 'react';
import PersonalInfo from './PersonalInfo';
import Household from './Household'
import References from './References'
import '../css/approval.css';

class Form extends React.Component {
  render() {
    return (
      <>
        <div  className='padding'>
          <p className='formTitle'>Pre-Approval Adoption Form</p>
            <p className='waiting'>(There is a mandatory 3-5 bussiness days waiting period for all adoptions.)
            </p>
              <form className='formBorder' noValidate autoComplete="off">
                <div className='personalInfo'>Personal Info</div>
                  <PersonalInfo/>
                <div className='householdInfo'>Household Info</div>
                  <Household/>
                <div className='references'>References</div>
                    <References/>
                  <button className='preButton'>Submit</button>
              </form>
        </div>
      </>
    );
  }
}

export default Form;
