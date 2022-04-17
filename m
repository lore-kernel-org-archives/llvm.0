Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D27A
	for <llvm@lists.linux.dev>; Sun, 17 Apr 2022 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g+VGcQSyD2fFLvBG8PEWktONdiVrKkU+unDmYhG9zN0=; b=hup/2LfEcXok9HZKmBX2s/Fw1W
	OLwmG0gLKs8pC2t6XLfLQv9FhUGuoFiHv37MTRZ2HhUVMeyQq3Yl2uCszRscQ3Z0cx5j3YsMhrGXQ
	veap/LhLNhhvQ3Xs+idXXUldHEDTU/pB/4cFzRn1i+mrTvHfr5Y6jYspwUcoWbMguPJcrqrWZg6LT
	bBuv0Awx1HY9hOhMAyHTLaNTruW7QAfQW3nCZNQvAH3ZDz0By+jdus9C6Ag38FT3g5SsvcC8omgKh
	Hrieel+/zR3YSksfqex6Qt4mbxaX54B51QVIoALd5KL+XIKZotHjkPtmJx4jFhTJcIW8gVUEaWHO8
	cMulkEmQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng74b-001RpW-1l; Sun, 17 Apr 2022 15:44:25 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8F6B49861C1; Sun, 17 Apr 2022 17:44:22 +0200 (CEST)
Date: Sun, 17 Apr 2022 17:44:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220417154422.GH2731@worktop.programming.kicks-ass.net>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
 <20220416104809.GC2731@worktop.programming.kicks-ass.net>
 <20220416160742.6g4nejji4xyrgpvp@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220416160742.6g4nejji4xyrgpvp@treble>

On Sat, Apr 16, 2022 at 09:07:42AM -0700, Josh Poimboeuf wrote:

> I guess objtool will need to bite the bullet and create section symbols.

---
Subject: objtool: Fix relocs vs weak symbols
From: Peter Zijlstra <peterz@infradead.org>
Date: Sun Apr 17 17:03:36 CEST 2022

Occasionally objtool driven code patching (think .static_call_sites
.retpoline_sites etc..) goes sideways and it tries to patch an
instruction that doesn't match.

Much head-scatching and cursing later the problem is as follows:

Consider:

foo-weak.c:

extern void __SCT__foo(void);

__attribute__((weak)) void foo(void)
{
        return __SCT__foo();
}

foo.c:

extern void __SCT__foo(void);
extern void my_foo(void);

void foo(void)
{
        my_foo();
        return __SCT__foo();
}

These generate the obvious code
(gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -c foo*.c):

foo-weak.o:
0000000000000000 <foo>:
   0:   e9 00 00 00 00          jmpq   5 <foo+0x5>      1: R_X86_64_PLT32       __SCT__foo-0x4

foo.o:
0000000000000000 <foo>:
   0:   48 83 ec 08             sub    $0x8,%rsp
   4:   e8 00 00 00 00          callq  9 <foo+0x9>      5: R_X86_64_PLT32       my_foo-0x4
   9:   48 83 c4 08             add    $0x8,%rsp
   d:   e9 00 00 00 00          jmpq   12 <foo+0x12>    e: R_X86_64_PLT32       __SCT__foo-0x4

Now, when we link these two files together, you get something like (ld -r -o foos.o foo-weak.o foo.o):

foos.o:
0000000000000000 <foo-0x10>:
   0:   e9 00 00 00 00          jmpq   5 <foo-0xb>      1: R_X86_64_PLT32       __SCT__foo-0x4
   5:   66 2e 0f 1f 84 00 00 00 00 00   nopw   %cs:0x0(%rax,%rax,1)
   f:   90                      nop

0000000000000010 <foo>:
  10:   48 83 ec 08             sub    $0x8,%rsp
  14:   e8 00 00 00 00          callq  19 <foo+0x9>     15: R_X86_64_PLT32      my_foo-0x4
  19:   48 83 c4 08             add    $0x8,%rsp
  1d:   e9 00 00 00 00          jmpq   22 <foo+0x12>    1e: R_X86_64_PLT32      __SCT__foo-0x4

Noting that ld preserves the weak function text, but strips the symbol
off of it (hence objdump doing that funny negative offset thing). This
does lead to 'interesting' unused code issues with objtool when ran on
linked objects, but that seems to be working (fingers crossed).

So far so good.. Now lets consider the objtool static_call output
section (readelf output, old binutils):

foo-weak.o:

Relocation section '.rela.static_call_sites' at offset 0x2c8 contains 1 entry:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000200000002 R_X86_64_PC32          0000000000000000 .text + 0
0000000000000004  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1

foo.o:

Relocation section '.rela.static_call_sites' at offset 0x310 contains 2 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000200000002 R_X86_64_PC32          0000000000000000 .text + d
0000000000000004  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1

foos.o:

Relocation section '.rela.static_call_sites' at offset 0x430 contains 4 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000100000002 R_X86_64_PC32          0000000000000000 .text + 0
0000000000000004  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1
0000000000000008  0000000100000002 R_X86_64_PC32          0000000000000000 .text + 1d
000000000000000c  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1

So we have two patch sites, one in the dead code of the weak foo and one
in the real foo. All is well.

*HOWEVER*, sometimes it generates things like this (using new enough
binutils):

foo-weak.o:

Relocation section '.rela.static_call_sites' at offset 0x2c8 contains 1 entry:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000200000002 R_X86_64_PC32          0000000000000000 foo + 0
0000000000000004  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1

foo.o:

Relocation section '.rela.static_call_sites' at offset 0x310 contains 2 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000200000002 R_X86_64_PC32          0000000000000000 foo + d
0000000000000004  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1

foos.o:

Relocation section '.rela.static_call_sites' at offset 0x430 contains 4 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000100000002 R_X86_64_PC32          0000000000000000 foo + 0
0000000000000004  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1
0000000000000008  0000000100000002 R_X86_64_PC32          0000000000000000 foo + d
000000000000000c  0000000d00000002 R_X86_64_PC32          0000000000000000 __SCT__foo + 1

And now we can see how that foos.o .static_call_sites goes side-ways, we
now have _two_ patch sites in foo. One for the weak symbol at foo+0
(which is no longer a static_call site!) and one at foo+d which is in
fact the right location.

This seems to happen when objtool cannot find a section symbol, in which
case it falls back to any other symbol to key off of, however in this
case that goes terribly wrong!

As such, teach objtool to create a section symbol when there isn't
one.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 tools/objtool/elf.c |  182 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 160 insertions(+), 22 deletions(-)

--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -575,37 +575,175 @@ int elf_add_reloc(struct elf *elf, struc
 	return 0;
 }
 
-int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
-			  unsigned long offset, unsigned int type,
-			  struct section *insn_sec, unsigned long insn_off)
+/*
+ * Ensure that any reloc section containing references to @sym is marked
+ * changed such that it will get re-generated in elf_rebuild_reloc_sections()
+ * with the new symbol index.
+ */
+static void elf_dirty_reloc_sym(struct elf *elf, struct symbol *sym)
 {
+	struct section *sec;
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		struct reloc *reloc;
+
+		if (sec->changed)
+			continue;
+
+		list_for_each_entry(reloc, &sec->reloc_list, list) {
+			if (reloc->sym == sym) {
+				sec->changed = true;
+				break;
+			}
+		}
+	}
+}
+
+/*
+ * Move the first global symbol, as per sh_info, into a new, higher symbol
+ * index. This fees up the shndx for a new local symbol.
+ */
+static int elf_move_global_symbol(struct elf *elf, struct section *symtab,
+				  struct section *symtab_shndx)
+{
+	Elf_Data *data, *shndx_data = NULL;
+	Elf32_Word first_non_local;
 	struct symbol *sym;
-	int addend;
+	Elf_Scn *s;
 
-	if (insn_sec->sym) {
-		sym = insn_sec->sym;
-		addend = insn_off;
+	first_non_local = symtab->sh.sh_info;
 
-	} else {
-		/*
-		 * The Clang assembler strips section symbols, so we have to
-		 * reference the function symbol instead:
-		 */
-		sym = find_symbol_containing(insn_sec, insn_off);
-		if (!sym) {
-			/*
-			 * Hack alert.  This happens when we need to reference
-			 * the NOP pad insn immediately after the function.
-			 */
-			sym = find_symbol_containing(insn_sec, insn_off - 1);
+	sym = find_symbol_by_index(elf, first_non_local);
+	if (!sym) {
+		WARN("no non-local symbols !?");
+		return first_non_local;
+	}
+
+	s = elf_getscn(elf->elf, symtab->idx);
+	if (!s) {
+		WARN_ELF("elf_getscn");
+		return -1;
+	}
+
+	data = elf_newdata(s);
+	if (!data) {
+		WARN_ELF("elf_newdata");
+		return -1;
+	}
+
+	data->d_buf = &sym->sym;
+	data->d_size = sizeof(sym->sym);
+	data->d_align = 1;
+	data->d_type = ELF_T_SYM;
+
+	sym->idx = symtab->sh.sh_size / sizeof(sym->sym);
+	elf_dirty_reloc_sym(elf, sym);
+
+	symtab->sh.sh_info += 1;
+	symtab->sh.sh_size += data->d_size;
+	symtab->changed = true;
+
+	/* XXX create ? */
+	if (symtab_shndx) {
+		s = elf_getscn(elf->elf, symtab_shndx->idx);
+		if (!s) {
+			WARN_ELF("elf_getscn");
+			return -1;
 		}
 
-		if (!sym) {
-			WARN("can't find symbol containing %s+0x%lx", insn_sec->name, insn_off);
+		shndx_data = elf_newdata(s);
+		if (!shndx_data) {
+			WARN_ELF("elf_newshndx_data");
 			return -1;
 		}
 
-		addend = insn_off - sym->offset;
+		shndx_data->d_buf = &sym->sec->idx;
+		shndx_data->d_size = sizeof(Elf32_Word);
+		shndx_data->d_align = 4;
+		shndx_data->d_type = ELF_T_WORD;
+
+		symtab_shndx->sh.sh_size += 4;
+		symtab_shndx->changed = true;
+	}
+
+	return first_non_local;
+}
+
+static struct symbol *
+elf_create_section_symbol(struct elf *elf, struct section *sec)
+{
+	struct section *symtab, *symtab_shndx;
+	Elf_Data *shndx_data = NULL;
+	struct symbol *sym;
+	Elf32_Word shndx;
+
+	symtab = find_section_by_name(elf, ".symtab");
+	if (symtab) {
+		symtab_shndx = find_section_by_name(elf, ".symtab_shndx");
+		if (symtab_shndx)
+			shndx_data = symtab_shndx->data;
+	} else {
+		WARN("no .symtab");
+		return NULL;
+	}
+
+	sym = malloc(sizeof(*sym));
+	if (!sym) {
+		perror("malloc");
+		return NULL;
+	}
+	memset(sym, 0, sizeof(*sym));
+
+	sym->idx = elf_move_global_symbol(elf, symtab, symtab_shndx);
+	if (sym->idx < 0) {
+		WARN("elf_move_global_symbol");
+		return NULL;
+	}
+
+	sym->name = sec->name;
+	sym->sec = sec;
+
+	// st_name 0
+	sym->sym.st_info = GELF_ST_INFO(STB_LOCAL, STT_SECTION);
+	// st_other 0
+	// st_value 0
+	// st_size 0
+	shndx = sec->idx;
+	if (shndx >= SHN_UNDEF && shndx < SHN_LORESERVE) {
+		sym->sym.st_shndx = shndx;
+		if (!shndx_data)
+			shndx = 0;
+	} else {
+		sym->sym.st_shndx = SHN_XINDEX;
+		if (!shndx_data) {
+			WARN("no .symtab_shndx");
+			return NULL;
+		}
+	}
+
+	if (!gelf_update_symshndx(symtab->data, shndx_data, sym->idx, &sym->sym, shndx)) {
+		WARN_ELF("gelf_update_symshndx");
+		return NULL;
+	}
+
+	elf_add_symbol(elf, sym);
+
+	return sym;
+}
+
+int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
+			  unsigned long offset, unsigned int type,
+			  struct section *insn_sec, unsigned long insn_off)
+{
+	struct symbol *sym = insn_sec->sym;
+	int addend = insn_off;
+
+	if (!sym) {
+		sym = elf_create_section_symbol(elf, insn_sec);
+		if (!sym)
+			return -1;
+
+		insn_sec->sym = sym;
 	}
 
 	return elf_add_reloc(elf, sec, offset, type, sym, addend);
