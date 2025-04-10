#!/usr/bin/python3

## imports
import yaml
import sys
from pathlib import Path

def load_yaml_theme(file_path):
    """Load YAML theme from a file."""
    with file_path.open('r', encoding='utf-8') as f:
        return yaml.safe_load(f)

def write_xresources(theme_data, output_path):
    """Write the Xresources-compatible file based on the theme data."""
    lines = []

    # Extract and format color_01 to color_16
    for i in range(1, 17):
        key = f'color_{i:02d}'
        value = theme_data.get(key)
        if not value:
            raise ValueError(f"Missing required key: {key}")
        lines.append(f"*color{i - 1}: {value}")

    # Add foreground and background
    foreground = theme_data.get("foreground")
    background = theme_data.get("background")
    cursor = theme_data.get("cursor")

    if not foreground or not background:
        raise ValueError("Missing 'foreground' or 'background' keys in YAML.")

    lines.append(f"*colorforeground: {foreground}")
    lines.append(f"*colorbackground: {background}")
    lines.append(f"*colorcursor: {cursor}")

    # Write to output file
    with output_path.open('w', encoding='utf-8') as f:
        f.write("\n".join(lines) + "\n")

    print(f"Xresources file has been written to: {output_path}")

if len(sys.argv) != 2:
    print("Usage: python generate_xresources.py <input_yaml_file>")
    sys.exit(1)

input_path = Path(sys.argv[1])
if not input_path.exists():
    print(f"Error: File not found -> {input_path}")
    sys.exit(1)

if input_path.suffix.lower() not in {'.yaml', '.yml'}:
    print("Warning: Input file does not have a .yaml or .yml extension.")

# Generate output filename with .Xresources extension
output_path = input_path.with_suffix("")

# Load and convert
try:
    theme_data = load_yaml_theme(input_path)
    write_xresources(theme_data, output_path)
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)
