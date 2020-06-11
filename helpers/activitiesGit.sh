# ! /bin/bash root

#The function loops through the json file and clones the activity repository based on it's version or latest commit
for k in $(jq '.repository | keys | .[]' repository.json); do
    value=$(jq -r ".repository[$k]" repository.json)
    repositoryName=$(jq -r '.name' <<<"$value")
    link=$(jq -r '.link' <<<"$value")
    flagVersion=$(jq -r 'if .version == "" then 0 else 1 end' <<<"$value")

    if [ $flagVersion == 0 ]; then
        commit=$(jq -r '.last_commit' <<<"$value")
        git clone $link
        cd $repositoryName
        git checkout $commit
        cd ..
    else
        version=$(jq -r '.version' <<<"$value")
        git clone -b $version $link
    fi
done
