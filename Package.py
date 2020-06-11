import os
import requests
import urllib.request
from tqdm import tqdm
from os import path

class DownloadProgressBar(tqdm):
    def update_to(self, b=1, bsize=1, tsize=None):
        if tsize is not None:
            self.total = tsize
        self.update(b * bsize - self.n)

def download_url(url, output_path):
    print('Downloading oracle sqlplus package....')
    with DownloadProgressBar(unit='B', unit_scale=True,
                             miniters=1, desc=url.split('/')[-1]) as t:
        urllib.request.urlretrieve(
            FILE_DOWNLOAD_URL, filename=output_path, reporthook=t.update_to)



class Package:
    def __init__(self, name, pacMan):
        self.name = name
        self.links={}
        self.activePackageManager = pacMan
    
    def setName(self, name):
        self.name = name
        
    
    def setLinks(self, apt, rpm, pacman, zypper, portage):
        self.links['apt']=apt
        self.links['rpm']=rpm
        self.links['pacman']=pacman
        self.links['zypper']=zypper
        self.links['portage']=portage
    
    def manualInstall(self, f):
        self.manualInstallation=True
        f()

vlc = Package('vlc', 'apt');
print(vlc.activePackageManager)

    
    