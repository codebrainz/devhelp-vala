#
# Makefile to generate DevHelp Vala bindings
#

VAPIDIR = `pkg-config --variable=vapidir vala-1.0`
DH = libdevhelp-2.0

all: $(DH).vapi

$(DH).vapi: $(DH).gi $(DH).metadata
	vapigen --metadata=$(DH).metadata \
	--pkg gtk+-2.0 --pkg webkit-1.0 \
	--library $(DH) $(DH).gi
    
$(DH).gi: $(DH).namespace $(DH).files
	vala-gen-introspect $(DH) .

clean:
	rm -f $(DH).gi $(DH).vapi
	
install:
	install -m 0644 $(DH).vapi $(VAPIDIR)

uninstall:
	rm -f $(VAPIDIR)/$(DH).vapi
