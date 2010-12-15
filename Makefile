#
# Makefile to generate DevHelp Vala bindings
#

VAPIDIR = `pkg-config --variable=vapidir vala-1.0`
DH = libdevhelp-2.0

all: $(DH).vapi example

$(DH).vapi: $(DH).gi $(DH).metadata
	vapigen --metadata=$(DH).metadata \
	--pkg gtk+-2.0 --pkg webkit-1.0 \
	--library $(DH) $(DH).gi
    
$(DH).gi: $(DH).namespace $(DH).files
	vala-gen-introspect $(DH) .

example: example.c
	gcc -g -Wall -o example example.c \
	`pkg-config --cflags --libs glib-2.0 gtk+-2.0 libdevhelp-2.0`

example.c: example.vala
	valac --vapidir . --pkg gtk+-2.0 --pkg webkit-1.0 --pkg libdevhelp-2.0 \
	-C example.vala

clean:
	rm -f $(DH).gi $(DH).vapi example example.c
	
install:
	install -m 0644 $(DH).vapi $(VAPIDIR)
	install -m 0644 $(DH).deps $(VAPIDIR)

uninstall:
	rm -f $(VAPIDIR)/$(DH).vapi
	rm -f $(VAPIDIR)/$(DH).deps
