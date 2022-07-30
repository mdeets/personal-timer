import QtQuick 2.0
import "theControls"
import "thePages"
Item
{

    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }//end of root

    ListView
    {
        id:listViewMain;
        anchors
        {
            fill:parent;
//            top:root.top;
//            left:root.left;
//            right:root.right;
//            bottom:idMyThreeBottomButtons.top;
        }
        clip:true;
        model:
        ListModel
        {
            id:listModelMain;
            ListElement
            {
                clock:"02:12";
                am:false;
            }
            ListElement
            {
                clock:"11:21";
                am:true;
            }
            ListElement
            {
                clock:"02:12";
                am:false;
            }
            ListElement
            {
                clock:"11:21";
                am:true;
            }
            ListElement
            {
                clock:"02:12";
                am:false;
            }
            ListElement
            {
                clock:"11:21";
                am:true;
            }

        }
        delegate:
        Item
        {
            width: listViewMain.width;
            height: 160;
            Rectangle
            {
                anchors.fill: parent;
                color:cBG;
                MyAlarmContentStyle
                {
                    setClock: clock;
                    setStatusAm: am;

                    onSignalEditAlarm:
                    {
                        console.log("clicked on "+clock);
                    }
                }
            }




        }//end of item delegate

    }//end of list view





    MyThreeBottomButtons
    {
        id:idMyThreeBottomButtons;
        width: root.width;
        height:root.height/10.5;
        setCenterButtonText: "+";
        setLeftButtonText: "";
        setRightButtonText: ""; //null string make em invisible
        setCenterButtonCircleStyled: true;

        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
        onCenterButtonPressed:
        {
            baseAlarmSet.visible=true;
        }
    }//end of mytheebuttons



    Rectangle
    {
        id:baseAlarmSet;
        anchors.fill: parent;
        color:"transparent";
        visible: false;
        AlarmSetPage
        {
            onButtonSave:
            {
                console.log("save");
            }
            onButtonCancel:
            {
                visible=false;
            }
        }

    }


}//end of item
