include("KeyboardDialog")

function CreateTouchScreenHelperDialog(dialogTitle)
    local dialog = Dialog(dialogTitle)

    addCommandButton(dialog, "Undo")
    addCommandButton(dialog, "Redo")
    dialog:newrow()
    addCommandButton(dialog, "Copy")
    addCommandButton(dialog, "Paste")
    dialog:newrow()
    addCommandButton(dialog, "Cut")
    addCommandButton(dialog, "Clear")
    dialog:newrow()
    addCommandButton(dialog, "Cancel")
    dialog:separator()
    addCommandButton(dialog, "Toggle Grid", "ShowGrid")
    dialog:newrow():button{
        text = "Select All",
        selected = false,
        focus = false,
        onclick = function()
            app.activeSprite.selection:selectAll()
            app.refresh()
        end
    }:newrow()
    addCommandButton(dialog, "New Frame", "NewFrame")
    dialog:newrow()
    addCommandButton(dialog, "New Layer", "NewLayer")
    dialog:separator()
    addCommandButton(dialog, "Save", "SaveFile")
    dialog:separator()
    dialog:button{
        text = "Command",
        onclick = function()
            keyboardDialog = CreateKeyboardDialog(commandPrefix)
            keyboardDialog:show{wait = false}
        end
    }

    return dialog;
end
