# !/bin/bash
PS3='Show what kind of dependencies? '
IFS=' '
services=('package' 'reference' 'exit')

select selection in ${services[@]}; do
        if [ $selection ]; then
                case $selection in
                        "package")
                          find . -name "*.csproj" | while IFS= read -r proj; do
                              echo $proj
                              projName=$(basename "$proj")
                              echo "Package dependencies for $projName:"
                              dotnet list "$proj" package
                              echo
                          done
                          ;;
                        "reference")
                          find . -name "*.csproj" | while IFS= read -r proj; do
                              projName=$(basename "$proj")
                              echo "Project references for $projName:"
                              dotnet list "$proj" reference
                              echo
                          done
                          ;;
                        "exit")
                          break
                          ;;
                        *)
                          echo "not supported."
                          echo
                          ;;
                esac
        else
                echo 'invalid option.'
        fi
done
