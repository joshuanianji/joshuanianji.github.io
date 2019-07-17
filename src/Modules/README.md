# Modules Homepage

I'm organizing my code somewhat like how my dad organizes it - it's actually really smart! This folder is to store the view pages of the different view components. I originally put them all under a View folder.

Dad made each module have its separate model, update, and view for easy expandability later on, but if I wanted to do that I'll have to refactor my Router.elm and that'll take a looong time.

I'll prolly end up doing it sooner or later though. I'm jsut putting this README here to assure that I think I know what I'm doing.

Oh yeah btw the UiFramework folder is supposed to hold little tidbits of code to help me style things such as buttons, forms, etc., but I don't have any need for them right now lol.

## TODO

- Make each module have its model-view-update
- Finish projects thing
- YIKES ILL HAVE TO DO A SHARED STATE BECAUSE ILL HAVE TO STORE THE DEVICE INFORMATION OOF
    - remove all instances of `import Model exposing (Model, Msg(..))` once you do that