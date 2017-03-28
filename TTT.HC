
//Sprites removed so you can see this in GitHub



//Sprite Pointers
U64 sprites[] = {<1>,<2>,<3>};

//Game State
//state[0] => Winner
I64  state[]  = {0,0,0,0,
		   0,0,0,
		   0,0,0};

//Board
U64 *board[]  = {sprites[0],sprites[0],sprites[0],
		 sprites[0],sprites[0],sprites[0],
		 sprites[0],sprites[0],sprites[0]};

I64 checks[]  = {0,0,0,
		 0,0,0,
		 0,0,0};

U8 ch;

Bool PlayerX=TRUE;
Bool PlayerXAI;
Bool PlayerOAI;
Bool PlayAgain=TRUE;

U0 Reset(){
I32 j;
for(j=0;j<=9;j++)
  state[j]=0;
for(j=0;j<9;j++){
  board[j] =sprites[0];
  checks[j]=0;
}
}
U0 Debug(){
I32 j;
for(j=0;j<=9;j++)
"%d",state[j];
for(j=0;j<9;j++)
	Sprite(board[j]);
	"\n\n";
}

U0 DrawIt(CTask *, CDC *dc){

dc->color=GREEN;
GrFloodFill(dc,0,0);
dc->color=YELLOW;
Sprite3(dc,100,100,0,board[0]);
Sprite3(dc,128,100,0,board[1]);
Sprite3(dc,156,100,0,board[2]);
Sprite3(dc,100,128,0,board[3]);
Sprite3(dc,128,128,0,board[4]);
Sprite3(dc,156,128,0,board[5]);
Sprite3(dc,100,156,0,board[6]);
Sprite3(dc,128,156,0,board[7]);
Sprite3(dc,156,156,0,board[8]);
GrPrint(dc,128,200,"Press 0 to quit");
}


U0 GameOver(){

if(state[0]>0)
  PopUpOk("Player O won!");
else if(state[0]<0)
  PopUpOk("Player X won!");
else
  PopUpOk("Nobody won");
DCFill;
state[0]=2;
PlayAgain = PopUpNoYes("Play Again?");
}

U0 UpdateBoard(){

I64 i;
for(i=1;i<=9;i++){
	if(state[i]>0)
	  board[i-1]=sprites[2];
	else if(state[i]<0)
	  board[i-1]=sprites[1];
	else
	  board[i-1]=sprites[0];

checks[0] = state[1]+state[2]+state[3];
checks[1] = state[4]+state[5]+state[6];
checks[2] = state[7]+state[8]+state[9];
checks[3] = state[1]+state[4]+state[7];
checks[4] = state[2]+state[5]+state[8];
checks[5] = state[3]+state[6]+state[9];
checks[6] = state[1]+state[5]+state[9];
checks[7] = state[7]+state[5]+state[3];

}
}

U0 GetInput(){

if((!PlayerX&&PlayerOAI)||(PlayerX&&PlayerXAI)){
	while(ch<1||state[ch]!=0)
	  ch=RandU16%10;
	  //"%d",ch;
	Sleep(250);
}
else{
	do{	
		do{
		  //"$$BG,GREEN$$Press 0 to cancel";
		  ch=GetChar;
		  DocClear;
		}
		while(ch<'0'||ch>'9');
		if(ch=='0'){GameOver;break;}
		ch-=48;
	}while(state[ch]!=0);
}
}

U0 IsOver(){
	Bool free=FALSE;
	I32 f;


	for(f=0;f<8;f++){
	  //"%d",checks[f];
	  if(checks[f]==3){state[0]=1;}
	  else if(checks[f]==-3){state[0]=-1;}
	}
	for(f=1;f<=9;f++)
	  if(state[f]==0)
	    free=TRUE;

	if(!free||state[0]!=0)
	  GameOver;
}

U0 Main(){


while(state[0]!=2){

	GetInput;
	
	if(state[0]==2)break;
	Beep(55);
//ch=1;

	if(PlayerX)
	  state[ch] =-1;
	else
	  state[ch] = 1;

	PlayerX = !PlayerX;


	UpdateBoard;
	//"%d",state[2];
	//Debug;
	IsOver;
}
}


SettingsPush;
WinMax;
WinBorder;
AutoComplete;
DocCursor;
DocClear;
//"$$FD,BLACK$$$$BG,YELLOW$$";
PlayerXAI=PopUp2("Human",0,"Random",1,"Player X:")>0;
PlayerOAI=PopUp2("Human",0,"Random",1,"Player O:")>0;
PlayerX  =PopUp2("Player X",1,"Player O",0,"Who shall start?")>0;
Fs->draw_it=&DrawIt;
do{
  if(PlayAgain)Reset;
  PlayAgain=FALSE;
  Main;
}while(PlayAgain);
DocClear;
SettingsPop;
Kill(Fs);