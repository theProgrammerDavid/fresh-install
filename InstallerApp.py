
class Package:
    def __init__(self, name):
        self.name = name
    
    def setName(self, name):
        self.name = name
    
    def setLinks(self, apt, rpm, pacman, zypper, portage):
        self.apt = apt
        self.rpm = rpm
        self.pacman = pacman
        self.zypper = zypper
        self.portage = portage
    
    