program project;
uses wincrt;
var  infile:text;
     pic:text;
     I,k:char;
     data:string;
     yn:char;
     link:char;
procedure display;
var
   data:string;
begin
     Assign(infile,'tel.txt');
     reset(infile);
     while not eof(infile)do
     begin
          readln(infile,data);
          writeln('name:',copy(data,1,15));
          writeln('tel:',copy(data,16,8));
          writeln('email:',copy(data,24,40));
          writeln('sex:',copy(data,64,1));
     end;
     close(infile)
end;
       
procedure delname;
var
   data:array[1..15] of string;
   i,j:integer;
   name:string[15];
begin
     assign(infile,'tel.txt');
     reset(infile);
     i:=0;
     write('Please enter delete name: ');
     readln(name);
     name:=name+'               ';
     while not eof(infile) do
     begin
          i:=i+1;
          readln(infile,data[i]);
          if name=copy(data[i],1,15)
             then data[i]:='*'
     end;
     rewrite(infile);
     for j:=1 to i do
              if data[j]<>'*'
                 then writeln(infile,data[j]);
     close(infile)
end;

procedure modify;
var
   oldname,newname:string[15];
   newtel:string[8];
   newemail:string[20];
   newsex:string[1];
   data:array[1..15]of string;
   I:integer;
   J:integer;
begin
     Assign(infile,'tel.txt');
     reset(infile);
     i:=0;
     write('Old name');
     readln(oldname);
     oldname:=oldname+'               ';
     write('New name');
     readln(newname);
     write('new telephone number:');
     readln(newtel);
     write('newemail:');
     readln(newemail);
     write('newsex:');
     readln(newsex);
     newname:=newname+'               ';
     newtel:=newtel+'        ';
     newemail:=newemail+'                 ';
     while not eof(infile)do
     begin
          I:=i+1;
          readln(infile,data[i]);
          if oldname=copy(data[i],1,15)
             then
               data[i]:=newname+newtel+newemail+newsex;
            
     end;
          rewrite(infile);
          for j:=1 to i do             
          writeln(infile,data[j]);
          close(infile)
end;

procedure search;
var
   data:string;
   name:string[15];
   tel:string[8];
   email:string[20];
   sex:string[1];
   place,long:integer;
   cho:char;
begin
     assign(infile,'tel.txt');
     reset(infile);
     writeln('Choice data to search: ');
     writeln('1-Name, 2-Telphone, 3-Email address and 4-Sex');
     readln(cho);
     case cho of
          '1':begin
                   place:=1;
                   long:=15;
                   write('Please enter the name: ');
                   readln(name);
                   name:=name+'               '
              end;
          '2':begin
                   place:=16;
                   long:=8;
                   write('Plase enter the telephone Number: ');
                   readln(tel);
                   tel:=tel+'        ';
              end;
          '3':begin
                   place:=24;
                   long:=40;
                   write('Please enter the Email:');
                   readln(email);
                   email:=email+'                                        ';
              end;
          '4':begin
                   place:=65;
                   long:=1;
                   write('Please enter the sex: ');
                   readln(sex);
              end
     end;
     while not eof(infile) do
     begin
          readln(infile,data);
          if (name=copy(data,place,long)) or (tel=copy(data,place,long)) or (email=copy(data,place,long))
             or (sex=copy(data,place,long))
             then
                 writeln(data);
     end;
     close(infile)
end;

procedure add;
var
   name:string[15];
   tel:string[8];
   email:string[40];
   sex:string[1];
   I:string;
begin
     assign(infile,'tel.txt');
     append(infile);
     repeat
           write('Please enter a name:');
           readln(name);
           name:=name+'               ';
           write(infile,name);
           write('Telephone number:');
           readln(tel);
           write(infile,tel);
           tel:=tel+'        ';
           write('E-mail address:');
           readln(email);
           email:=email+'                                        ';
           write(infile, email);
           write('Sex:');
           readln(sex);
           writeln(infile,sex);
           write('Continue?');
           readln(I);
     until
          I='n';
     close(infile)
end;

begin
    repeat
    assign(pic, 'Pic.txt');
    reset(pic);
    while not eof(pic) do
      begin
           readln(pic,data);
           writeln(data)
      end;
    writeln('Please enter the number you chose.');
    readln(yn);
    case yn of
         '1':display;
         '2':delname;
         '3':modify;
         '4':search;
         '5':add;
    end;
    if yn <> '6'
       then
           begin 
                 writeln('Would you continous?');
                 readln(link);
                              end
    until (link='n') or (yn='6')
end
