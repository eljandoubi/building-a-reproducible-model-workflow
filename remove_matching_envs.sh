pattern="$1"

conda env list --json | jq -r '.envs[]' | while read -r env_path; do
    env_name=$(basename "$env_path")
    if [[ $env_name =~ $pattern ]]; then
        echo "Removing environment: $env_name"
        conda env remove --name "$env_name" -y
    fi
done
