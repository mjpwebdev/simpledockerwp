# WordPress Starter on Mac with Docker

This project provides a starter template for setting up WordPress on a Mac using Docker. It simplifies the process of getting a WordPress environment up and running, allowing you to focus on developing your site.

## Quick Start

To quickly set up WordPress, run the `quickstart.sh` script. This script automates the necessary Docker commands to establish your WordPress environment.

```sh
./quickstart.sh
```


## Usage

### Downloading the Template

To use this project as a base for your own WordPress projects, you have two options:

- **Download the Template as a ZIP File:**

  If you're not familiar with Git or prefer not to use it, you can download the project directly:

  1. Navigate to the repository's GitHub page.
  2. Click the "Code" button, then select "Download ZIP".
  3. Extract the contents of the ZIP file to your desired location on your Mac.

  This method provides a snapshot of the project without version history.

- **Clone the Repository:**

  If you're comfortable with Git and prefer to have the full version history, you can clone the repository:

  ```sh
  git clone https://github.com/yourusername/wordpress-docker-starter.git
  cd wordpress-docker-starter
  ```

  Cloning creates a local copy of the repository, including its history, allowing you to track changes over time.

### Customizing for Your Project

1. **Update Configuration:** Modify any configuration files as needed for your specific project requirements.
2. **Run Quick Start:** Execute the `quickstart.sh` script to set up the Docker environment.
3. **Develop:** Start developing your WordPress site.

### Saving Your Work

If you've cloned the repository and wish to keep your changes under version control, you can save your work:

```sh
git add .
git commit -m "Your commit message"
git push origin main
```


If you downloaded the ZIP file, your changes will be local to your machine. Consider using Git to track changes if you anticipate making significant modifications.

## Additional Information

For more detailed instructions on how the `quickstart.sh` script works, please refer to the comments within the script itself.

Happy developing! 
