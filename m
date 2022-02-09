Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4336A2C9C
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644433154; x=1675969154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/bF5RmnQNXXN3+vz6F4r6xI2KMbv9yOGNKvu69qEHKw=;
  b=m6iX21ChLQKkuNZ6sJK0M4qNBt3eN7gfvBKV+LQa8jsFX7SO/4F6sfPg
   0ueRo5dqsZSlBu7gtqkkFuwqceLgrBizKwIVbNTPuDqLM7QaYKHobvsqz
   7Weme6uTUb2p34F8oOk10vZWbhIeP7Wx77h+yoKqAaUCoB1t9HbT5XjiO
   Y0G5Rdgfcm+5XEZYF3xzRa/zTn3ueBpYP6fTYz8m3Ou1vh+2p0PRoBL8F
   im4cl94DNo/NPYKv6ogAXH3IMt2s8R9X0OESSNGpz2b5AYqKGtS5YcFYD
   Jthvzlr0wAf1x7dBy/9PCqPca/2Ln7V+wv4j2ugTLVPLdwg6TTFzSAkrg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249254408"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="249254408"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 10:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="622393036"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Feb 2022 10:59:05 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 219IwjQV031082;
	Wed, 9 Feb 2022 18:59:02 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: linux-hardening@vger.kernel.org, x86@kernel.org
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>, Miklos Szeredi <miklos@szeredi.hu>,
        Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Bruce Schlobohm <bruce.schlobohm@intel.com>,
        Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH v10 08/15] x86/tools: Add relative relocs for randomized functions
Date: Wed,  9 Feb 2022 19:57:45 +0100
Message-Id: <20220209185752.1226407-9-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kristen Carlson Accardi <kristen@linux.intel.com>

When reordering functions, the relative offsets for relocs that
are either in the randomized sections, or refer to the randomized
sections will need to be adjusted. Add code to detect whether a
reloc satisfies these cases, and if so, add them to the appropriate
reloc list.

Alexander Lobakin:

Don't split relocs' usage string across lines to ease grepping.

Signed-off-by: Kristen Carlson Accardi <kristen@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 arch/x86/boot/compressed/Makefile |  7 ++++++-
 arch/x86/tools/relocs.c           | 32 +++++++++++++++++++++++++++----
 arch/x86/tools/relocs.h           |  4 ++--
 arch/x86/tools/relocs_common.c    | 14 +++++++++-----
 4 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index e7ee94d5f55a..b1f5817c5737 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -110,6 +110,11 @@ $(obj)/vmlinux: $(vmlinux-objs-y) $(efi-obj-y) FORCE
 	$(call if_changed,ld)
 
 OBJCOPYFLAGS_vmlinux.bin :=  -R .comment -S
+
+ifdef CONFIG_FG_KASLR
+RELOCS_ARGS += --fg-kaslr
+endif
+
 $(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
 
@@ -117,7 +122,7 @@ targets += $(patsubst $(obj)/%,%,$(vmlinux-objs-y)) vmlinux.bin.all vmlinux.relo
 
 CMD_RELOCS = arch/x86/tools/relocs
 quiet_cmd_relocs = RELOCS  $@
-      cmd_relocs = $(CMD_RELOCS) $< > $@;$(CMD_RELOCS) --abs-relocs $<
+      cmd_relocs = $(CMD_RELOCS) $(RELOCS_ARGS) $< > $@;$(CMD_RELOCS) $(RELOCS_ARGS) --abs-relocs $<
 $(obj)/vmlinux.relocs: vmlinux FORCE
 	$(call if_changed,relocs)
 
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index e2c5b296120d..96b6042fc76f 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -45,6 +45,8 @@ struct section {
 };
 static struct section *secs;
 
+static int fgkaslr_mode;
+
 static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 /*
  * Following symbols have been audited. There values are constant and do
@@ -823,6 +825,24 @@ static int is_percpu_sym(ElfW(Sym) *sym, const char *symname)
 		strncmp(symname, "init_per_cpu_", 13);
 }
 
+static int is_function_section(struct section *sec)
+{
+	if (!fgkaslr_mode)
+		return 0;
+
+	return !strncmp(sec_name(sec->shdr.sh_info), ".text.", 6);
+}
+
+static int is_randomized_sym(ElfW(Sym) *sym)
+{
+	if (!fgkaslr_mode)
+		return 0;
+
+	if (sym->st_shndx > shnum)
+		return 0;
+
+	return !strncmp(sec_name(sym_index(sym)), ".text.", 6);
+}
 
 static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 		      const char *symname)
@@ -848,12 +868,15 @@ static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 	case R_X86_64_PC32:
 	case R_X86_64_PLT32:
 		/*
-		 * PC relative relocations don't need to be adjusted unless
-		 * referencing a percpu symbol.
+		 * we need to keep pc relative relocations for sections which
+		 * might be randomized, and for the percpu section.
+		 * We also need to keep relocations for any offset which might
+		 * reference an address in a section which has been randomized.
 		 *
 		 * NB: R_X86_64_PLT32 can be treated as R_X86_64_PC32.
 		 */
-		if (is_percpu_sym(sym, symname))
+		if (is_function_section(sec) || is_randomized_sym(sym) ||
+		    is_percpu_sym(sym, symname))
 			add_reloc(&relocs32neg, offset);
 		break;
 
@@ -1168,8 +1191,9 @@ static void print_reloc_info(void)
 
 void process(FILE *fp, int use_real_mode, int as_text,
 	     int show_absolute_syms, int show_absolute_relocs,
-	     int show_reloc_info)
+	     int show_reloc_info, int fgkaslr)
 {
+	fgkaslr_mode = fgkaslr;
 	regex_init(use_real_mode);
 	read_ehdr(fp);
 	read_shdrs(fp);
diff --git a/arch/x86/tools/relocs.h b/arch/x86/tools/relocs.h
index 4c49c82446eb..269db511b243 100644
--- a/arch/x86/tools/relocs.h
+++ b/arch/x86/tools/relocs.h
@@ -32,8 +32,8 @@ enum symtype {
 
 void process_32(FILE *fp, int use_real_mode, int as_text,
 		int show_absolute_syms, int show_absolute_relocs,
-		int show_reloc_info);
+		int show_reloc_info, int fgkaslr);
 void process_64(FILE *fp, int use_real_mode, int as_text,
 		int show_absolute_syms, int show_absolute_relocs,
-		int show_reloc_info);
+		int show_reloc_info, int fgkaslr);
 #endif /* RELOCS_H */
diff --git a/arch/x86/tools/relocs_common.c b/arch/x86/tools/relocs_common.c
index 6634352a20bc..d6acda36575a 100644
--- a/arch/x86/tools/relocs_common.c
+++ b/arch/x86/tools/relocs_common.c
@@ -12,14 +12,13 @@ void die(char *fmt, ...)
 
 static void usage(void)
 {
-	die("relocs [--abs-syms|--abs-relocs|--reloc-info|--text|--realmode]" \
-	    " vmlinux\n");
+	die("relocs [--abs-syms|--abs-relocs|--reloc-info|--text|--realmode|--fg-kaslr] vmlinux\n");
 }
 
 int main(int argc, char **argv)
 {
 	int show_absolute_syms, show_absolute_relocs, show_reloc_info;
-	int as_text, use_real_mode;
+	int as_text, use_real_mode, fgkaslr_opt;
 	const char *fname;
 	FILE *fp;
 	int i;
@@ -30,6 +29,7 @@ int main(int argc, char **argv)
 	show_reloc_info = 0;
 	as_text = 0;
 	use_real_mode = 0;
+	fgkaslr_opt = 0;
 	fname = NULL;
 	for (i = 1; i < argc; i++) {
 		char *arg = argv[i];
@@ -54,6 +54,10 @@ int main(int argc, char **argv)
 				use_real_mode = 1;
 				continue;
 			}
+			if (strcmp(arg, "--fg-kaslr") == 0) {
+				fgkaslr_opt = 1;
+				continue;
+			}
 		}
 		else if (!fname) {
 			fname = arg;
@@ -75,11 +79,11 @@ int main(int argc, char **argv)
 	if (e_ident[EI_CLASS] == ELFCLASS64)
 		process_64(fp, use_real_mode, as_text,
 			   show_absolute_syms, show_absolute_relocs,
-			   show_reloc_info);
+			   show_reloc_info, fgkaslr_opt);
 	else
 		process_32(fp, use_real_mode, as_text,
 			   show_absolute_syms, show_absolute_relocs,
-			   show_reloc_info);
+			   show_reloc_info, fgkaslr_opt);
 	fclose(fp);
 	return 0;
 }
-- 
2.34.1

