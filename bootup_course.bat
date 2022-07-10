Rem Open course on system default browser
echo "Opening course on browser..."
start "" https://learn.oracle.com/ols/course/oracle-weblogic-server-12c-administration-i/37565/79436/109349

Rem Open TigerVNC viewer to show Remote desktop of OCI

echo "Booting up OCI Desktop and login to OCI compute"
@echo off
set VNC_PASSWORD=aditya1998
start /b cmd /k vncviewer 140.238.240.154:2 &

start /b cmd /k ssh -i "%UserProfile%\Documents\OCI_Keys\weblogic_practise\wls_priv_key.key" opc@140.238.240.154

