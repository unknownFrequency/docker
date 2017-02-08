class ImageListItem extends React.Component {
  constructor(props) {
    super(props);
    //let size = scaleSize(100,100, this.props.image.image.width, this.props.image.image.height)
  }

  formatDate(date) {
    //formattedDate = new Date(date);
    let yearMonthDay = date.match(/(\d{4})\-(\d{2})\-(\d{2})/);
    let day = yearMonthDay[3];
    let month = yearMonthDay[2];
    let year = yearMonthDay[1];
    return `${day}-${month}-${year}`;
  };

  render() {
    console.log(this.props.image.image.url);
    return (
      <div className="image-container">
        <img src={this.props.image.image.url} />
        <p>Uploadet: {this.formatDate(this.props.image.created_at)}</p>
      </div>
    );
  }

};
