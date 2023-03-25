import sys
import os


# constants
LOCATION = '../'


def read_file(file_path):
    data = []
    try:
        with open(file_path, 'r') as file:
            for line in file:
                data.append(line.strip())
    except FileNotFoundError:
        print(f"Error: {file_path} not found.")
        sys.exit(1)
    except IOError as e:
        print(f"Error reading {file_path}: {e}")
        sys.exit(1)
    return data


def get_all_dir(loc):
    parent_dir = loc  # The directory where subdirectories are located
    subdirs = [d for d in os.listdir(
        parent_dir) if os.path.isdir(os.path.join(parent_dir, d))]

    return subdirs


def run_commands(cmd, dir):
    for subdir in dir:
        print(f"Processing directory {subdir}")
        try:
            os.chdir(os.path.join(LOCATION, subdir))
            os.system("git pull")  # execute git pull command
            env_file = f".env.{subdir}"
            if os.path.exists(env_file):
                os.system(f"cp {env_file} .env")  # execute copy command
            # execute config:cache command
            os.system("php artisan config:cache")
            os.system("php artisan migrate --force")  # execute migrate command
            print(f"Directory {subdir} successfully processed")
        except Exception as e:
            print(f"Error processing directory {subdir}: {e}")
            continue


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 main.py file_path")
        sys.exit(1)
    dir = get_all_dir(LOCATION)
    file_path = sys.argv[1]
    data = read_file(file_path)
    print(data)
    print(dir)
