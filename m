Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572394;
	b=L0nZd6CH94IbBBHuuATXxnbdBuJgbhtmoRdJldzX+B/+8PzTmdFUI2NdF/GADWC96mb+
	 WWT/94NavSzpWfrJYcJIa1Tgry4E9e6h8Ph3fwY6iqdRAuWFiVKBXqaFyyObwrAcAoJjW
	 hgGaAKSTLWvwcnMGrBEYewi7hIxrulRVpfBJ9jpAx8khkWGW9oVsrmNFTaDuqeDNS0su2
	 WUketckI0wIpgzFeTVbEHlF7XCNVXVILo4icx6b3wC8x4ujdRol2JJkMuR4Inp27iwfU9
	 eUt9Kt6wWHBLNgbbLfV1ccMf8N4mjRBb7Iz/fcMsvfgJKRRby1KSpg2ApF1HKE7w5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572394;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y3MxDcr/D7QPJuVTHcjGIiAQ4MrNYzspdtIWUzS88kk=;
	b=xX4lsK01YYKkNagri826DrKYJKWCRrJat0Tv+ykanPz6zUTJZwetKD1oC+3vgvqZmQRH
	 b5JkR3xd/FFzDF89Ti6Jzc+2l637V/pxNJqsnTYa9DVYe1YuW9QgwnDGb32zFSDqqmWO2
	 Uk2Yj3dWXETeBCd4F/fv1uKqdCv7wRxjwvaS+k7RDkTJsAJ/u1dinILoAxb5OE4f/nvoQ
	 sy8a1fDduzmUgekXv/Do+FJ8DkzFZGd466BdDlY108SkKSi6ZTwUPYU3wyLILLg1eXiE0
	 AVkEj980hciaRU8vNNHRSl1tjBDbDH1flKgThEYSkRNHL9XTUYfL2klJLiutYGBK+hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9wByG7W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A5606A31E;
	Wed, 25 Nov 2026 02:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9wByG7W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127C11F00A19;
	Wed, 25 Nov 2026 02:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572393;
	bh=Y3MxDcr/D7QPJuVTHcjGIiAQ4MrNYzspdtIWUzS88kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N9wByG7WTAai1SQ1JWHcrLqbNy4u+XLlAPcfW2nADfyqE3b943bHVLGp3EIS5bJyl
	 ichIm+vRyVICJc1WaPy9rghvb72Vm3Zyx0pZFeWrQnD+YIIw6fwvr5GVjVZGpWWKhZ
	 aalmUr612DXCXf5frGlOq6brbG+64LWxWBhAtDakbbDLmok14B54vQCWl/fvyUriu5
	 pUdLnXV0HPwEFvs4QGBF2Bx3iOvP1Rme6DDMNfgiDo1XJszDGrY/dazNzKcMOnR0DR
	 0Q4E8DNKrHFFJScmpREY7tOIUQ6Hv072rYjSGM+3ckUtj1x40jbUGg9yTj79krRAQJ
	 20QKVIqDRKkCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 10/19] objtool: Remove coverage counter updates from noinstr code
Date: Tue, 24 Nov 2026 21:05:54 -0500
Message-ID: <20261125020603.3934222-11-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcov and Clang's source-based code coverage update their counters
inline, with an instruction like

	lock addq $0x1,__gcov0.foo(%rip)

rather than by calling into a runtime the way KCOV does. noinstr
functions aren't instrumented themselves: noinstr implies __no_profile
since commit 380d53c45ff2 ("compiler_attributes.h: define __no_profile,
add to noinstr"). But the compilers add the counter updates before
inlining, and the attribute doesn't cover what gets inlined into a
function, so the counter updates of every inlined function come along,
whether it is __always_inline or not. An x86-64 defconfig kernel with
KVM, built with GCC 16 and gcov for the whole kernel, has 1823 of them
in 108 noinstr functions of vmlinux and 106 more in the KVM modules.

noinstr code runs where the kernel can't take an exception yet [1], and
a counter update is a store, which can cause one. On x86 that is a data
breakpoint. With gcov profiling the whole kernel, exc_debug_kernel()
updates a counter before it has read and cleared DR7, so with a data
breakpoint on that counter the next kernel #DB never returns: the
handler keeps interrupting itself. On v7.4-rc4, a guest with one CPU
hangs that way once a second breakpoint, on jiffies_64, fires.
exc_page_fault() updates a counter right before it reads CR2, which is
lost if the #DB taken there faults.

The data that such code touches is kept away from data breakpoints by
hand, see within_cpu_entry() and for example commit 3943abf2dbfa
("x86/debug: Prevent data breakpoints on cpu_dr7"). That doesn't work
for coverage counters: there are thousands of them, and with gcov they
are ordinary variables spread over .bss.

The compilers could drop the instrumentation that ends up in a
no_profile_instrument_function function after inlining, but neither
does. So have objtool remove the counter updates from noinstr code,
under --hacks=noinstr, which already removes the KCOV calls that
compilers leave there. An update of a counter has no other output than
the arithmetic flags, which nothing uses: the only reader after one of
them is native_save_fl(), which is after the interrupt flag. Replace
them with NOPs. That covers everything GCC generates with the atomic
counter updates that the kernel asks for (-fprofile-update=prefer-atomic).
Clang needs more, which the next patch adds.

A counter is recognized when the relocation names it or the section
that Clang's source-based code coverage keeps its counters in. gcov's
counters are local objects in .bss though, referenced through the
section like the objects next to them, where an address inside a
counter can also be the end of the object in front of it or the base of
an indexed access to a neighbour. There, only an instruction that reads
or writes the memory at that very address is taken for an access to a
counter. Those are the instructions with a one byte opcode and a memory
operand without a base and an index register, lea aside. The compilers
use nothing else on the counters, and the longer opcodes include bit
tests that reach beyond their operand and instructions that only use
its address.

Like the KCOV calls, the counter updates are removed from all the code
in the noinstr sections, including the instrumentation_begin() and
instrumentation_end() sections of noinstr functions. That keeps this
independent of the control flow, so it works on single objects and
modules as well. The cost is that a function which gets inlined into
noinstr code no longer counts the executions that come through it.

Select OBJTOOL for gcov like KCOV does, for the configurations that
don't run objtool otherwise.

This is limited to x86-64, the only architecture with
HAVE_NOINSTR_HACK. Nothing changes for the others.

[1] https://lore.kernel.org/all/20210614190700.GF68749@worktop.programming.kicks-ass.net/

Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/coverage/Kconfig              |   1 +
 tools/objtool/arch/x86/decode.c      | 121 ++++++++++++++++++++-
 tools/objtool/check.c                | 154 +++++++++++++++++++++++++++
 tools/objtool/include/objtool/arch.h |   2 +
 tools/objtool/include/objtool/elf.h  |   1 +
 5 files changed, 277 insertions(+), 2 deletions(-)

diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
index d16fa049995c6..6e70065be06b9 100644
--- a/kernel/coverage/Kconfig
+++ b/kernel/coverage/Kconfig
@@ -42,6 +42,7 @@ config GCOV_KERNEL
 	bool "gcov-based kernel profiling"
 	depends on DEBUG_FS
 	select CONSTRUCTORS
+	select OBJTOOL if HAVE_NOINSTR_HACK
 	help
 	  This option enables gcov-based code profiling (e.g. for code coverage
 	  measurements), with GCC or Clang. The coverage data of the kernel
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 1b387d5a195ba..6416426a89326 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -97,6 +97,112 @@ s64 arch_insn_adjusted_addend(struct instruction *insn, struct reloc *reloc)
 	return phys_to_virt(addend);
 }
 
+/*
+ * Decode @insn, if it has a memory operand with @reloc as its displacement.
+ */
+static bool decode_mem_reloc(struct instruction *insn, struct reloc *reloc,
+			     struct insn *ins)
+{
+	if (insn_decode(ins, insn->sec->data->d_buf + insn->offset, insn->len,
+			INSN_MODE_64) < 0)
+		return false;
+
+	return ins->modrm.nbytes && X86_MODRM_MOD(ins->modrm.value) != 3 &&
+	       ins->displacement.nbytes == 4 &&
+	       reloc_offset(reloc) == insn->offset + insn_offset_displacement(ins);
+}
+
+static bool has_seg_base(struct insn *ins)
+{
+	insn_byte_t p;
+
+	for_each_insn_prefix(ins, p) {
+		if (p == 0x64 || p == 0x65)
+			return true;
+	}
+
+	return false;
+}
+
+/* An instruction with a one byte opcode */
+static bool is_legacy_insn(struct insn *ins)
+{
+	return !ins->vex_prefix.nbytes && !insn_is_rex2(ins) &&
+	       ins->opcode.nbytes == 1;
+}
+
+/*
+ * An add, or, adc, sbb, and, sub, xor, inc or dec of a memory operand: these
+ * write their operand and the flags, and nothing else.
+ */
+static bool is_mem_update(struct insn *ins)
+{
+	u8 modrm_reg = X86_MODRM_REG(ins->modrm.value);
+	u8 op = ins->opcode.bytes[0];
+
+	if (!is_legacy_insn(ins))
+		return false;
+
+	/* <op> r/m, reg: the next one up, 0x38, is cmp */
+	if (op < 0x38 && !(op & 0x06))
+		return true;
+
+	switch (op) {
+	case 0x80: case 0x81: case 0x83:	/* <op> r/m, imm: 7 is cmp */
+		return modrm_reg != 7;
+	case 0xfe: case 0xff:			/* inc/dec r/m */
+		return modrm_reg <= 1;
+	}
+
+	return false;
+}
+
+/*
+ * Does @insn access the memory that @reloc stands for, and nothing else: is
+ * @reloc the address of a memory operand with no base and no index register,
+ * of an instruction that reads or writes its operand?
+ *
+ * Of the instructions with a one byte opcode, lea is the only one that
+ * doesn't. The ones with longer opcodes are left out: among them are bit
+ * tests that reach beyond their operand and instructions that only use its
+ * address, and the compilers don't use any of them on coverage counters.
+ */
+bool arch_insn_is_mem_direct(struct instruction *insn, struct reloc *reloc)
+{
+	struct insn ins;
+
+	if (!decode_mem_reloc(insn, reloc, &ins) || ins.addr_bytes != 8)
+		return false;
+
+	if (!is_legacy_insn(&ins) || ins.opcode.bytes[0] == 0x8d)
+		return false;
+
+	/* %fs and %gs add their base to the address */
+	if (has_seg_base(&ins))
+		return false;
+
+	if (insn_rip_relative(&ins))
+		return arch_pc_relative_reloc(reloc);
+
+	/* An absolute address takes a SIB byte without a base and an index */
+	return !arch_pc_relative_reloc(reloc) &&
+	       ins.sib.nbytes && X86_MODRM_MOD(ins.modrm.value) == 0 &&
+	       X86_SIB_BASE(ins.sib.value) == 5 &&
+	       X86_SIB_INDEX(ins.sib.value) == 4 &&
+	       !X86_REX_X(ins.rex_prefix.value);
+}
+
+/*
+ * Does @insn do nothing but update the memory operand that @reloc points to,
+ * and the flags? If those aren't used, a NOP can replace it.
+ */
+bool arch_insn_is_mem_update(struct instruction *insn, struct reloc *reloc)
+{
+	struct insn ins;
+
+	return decode_mem_reloc(insn, reloc, &ins) && is_mem_update(&ins);
+}
+
 static void scan_for_insn(struct section *sec, unsigned long offset,
 			  unsigned long *insn_off, unsigned int *insn_len)
 {
@@ -846,15 +952,26 @@ void arch_initial_func_cfi_state(struct cfi_init_state *state)
 
 const char *arch_nop_insn(int len)
 {
-	static const char nops[5][5] = {
+	/* Up to the longest instruction, which takes two NOPs */
+	static const char nops[15][15] = {
 		{ BYTES_NOP1 },
 		{ BYTES_NOP2 },
 		{ BYTES_NOP3 },
 		{ BYTES_NOP4 },
 		{ BYTES_NOP5 },
+		{ BYTES_NOP6 },
+		{ BYTES_NOP7 },
+		{ BYTES_NOP8 },
+		{ BYTES_NOP9 },
+		{ BYTES_NOP10 },
+		{ BYTES_NOP11 },
+		{ BYTES_NOP11, BYTES_NOP1 },
+		{ BYTES_NOP11, BYTES_NOP2 },
+		{ BYTES_NOP11, BYTES_NOP3 },
+		{ BYTES_NOP11, BYTES_NOP4 },
 	};
 
-	if (len < 1 || len > 5) {
+	if (len < 1 || len > 15) {
 		ERROR("invalid NOP size: %d\n", len);
 		return NULL;
 	}
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4ef5bf97d3335..85cb21b41508b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4,6 +4,7 @@
  */
 
 #define _GNU_SOURCE /* memmem() */
+#include <ctype.h>
 #include <fnmatch.h>
 #include <string.h>
 #include <stdlib.h>
@@ -407,6 +408,7 @@ static void *cfi_hash_alloc(unsigned long size)
 
 static unsigned long nr_insns;
 static unsigned long nr_insns_visited;
+static unsigned long nr_coverage_nops;
 
 /*
  * Call the arch-specific instruction decoder for all the instructions and add
@@ -2494,6 +2496,31 @@ static bool is_profiling_func(const char *name)
 	return false;
 }
 
+/*
+ * Return true if sym is a code coverage counter: GCC's __gcov<N>.* and Clang's
+ * __llvm_gcov_ctr* gcov counters, or the counters and MC/DC bitmaps of Clang's
+ * source-based code coverage, which have sections of their own.
+ */
+static bool is_coverage_counter(struct symbol *sym)
+{
+	const char *name = sym->name;
+
+	if (!strcmp(sym->sec->name, "__llvm_prf_cnts") ||
+	    !strcmp(sym->sec->name, "__llvm_prf_bits"))
+		return true;
+
+	if (strstarts(name, "__llvm_gcov_ctr"))
+		return true;
+
+	if (!strstarts(name, "__gcov") || !isdigit((unsigned char)name[6]))
+		return false;
+
+	for (name += 6; isdigit((unsigned char)*name); name++)
+		;
+
+	return *name == '.';
+}
+
 static int classify_symbols(struct objtool_file *file)
 {
 	struct symbol *func;
@@ -2503,6 +2530,9 @@ static int classify_symbols(struct objtool_file *file)
 		if (is_notype_sym(func) && strstarts(func->name, ".L"))
 			func->local_label = true;
 
+		if (is_coverage_counter(func))
+			func->coverage_counter = true;
+
 		if (!is_global_sym(func))
 			continue;
 
@@ -2609,6 +2639,126 @@ static bool alts_needed(void)
 	       opts.checksum;
 }
 
+__weak bool arch_insn_is_mem_direct(struct instruction *insn, struct reloc *reloc)
+{
+	return false;
+}
+
+__weak bool arch_insn_is_mem_update(struct instruction *insn, struct reloc *reloc)
+{
+	return false;
+}
+
+static struct reloc *insn_next_reloc(struct objtool_file *file,
+				     struct instruction *insn,
+				     struct reloc *reloc)
+{
+	unsigned long offset = reloc_offset(reloc) + 1;
+
+	return find_reloc_by_dest_range(file->elf, insn->sec, offset,
+					insn->offset + insn->len - offset);
+}
+
+/* Where @reloc of @insn points to, in the section of its symbol */
+static s64 insn_reloc_dest(struct instruction *insn, struct reloc *reloc)
+{
+	s64 offset = reloc->sym->offset + reloc_addend(reloc);
+
+	if (arch_pc_relative_reloc(reloc))
+		offset += insn->offset + insn->len - reloc_offset(reloc);
+
+	return offset;
+}
+
+/*
+ * Does @reloc refer to code coverage counters?
+ *
+ * It does when it names them, or the section that Clang's source-based code
+ * coverage keeps them in. The counters of gcov are local objects in .bss
+ * though, which are referenced through that section, just like their
+ * neighbours. An address in such a counter may as well be the end of the
+ * object in front of it, or the base of an indexed access to a neighbour, so
+ * there only an access to the memory at that very address counts.
+ */
+static bool is_coverage_reloc(struct objtool_file *file,
+			      struct instruction *insn, struct reloc *reloc)
+{
+	struct symbol *sym = reloc->sym;
+	unsigned long offset;
+	s64 dest;
+
+	if (reloc_type(reloc) != R_DATA32 &&
+	    !arch_absolute_reloc(file->elf, reloc))
+		return false;
+
+	dest = insn_reloc_dest(insn, reloc);
+	if (dest < 0)
+		return false;
+
+	offset = dest;
+
+	if (sym->coverage_counter) {
+		if (sym->len)
+			return offset >= sym->offset &&
+			       offset < sym->offset + sym->len;
+
+		return offset <= sec_size(sym->sec);
+	}
+
+	if (!is_sec_sym(sym) || !arch_insn_is_mem_direct(insn, reloc))
+		return false;
+
+	sym = find_symbol_containing(sym->sec, offset);
+
+	return sym && sym->coverage_counter;
+}
+
+static bool is_coverage_update(struct objtool_file *file,
+			       struct instruction *insn, struct reloc *reloc)
+{
+	return !insn_next_reloc(file, insn, reloc) &&
+	       is_coverage_reloc(file, insn, reloc) &&
+	       arch_insn_is_mem_update(insn, reloc);
+}
+
+/*
+ * gcov and Clang's source-based code coverage update their counters inline,
+ * and the compilers add those updates before inlining. The counter updates of
+ * a function that gets inlined into a noinstr function come along, even though
+ * the noinstr function is __no_profile.
+ *
+ * Remove them. An update of a counter has no other output than the flags, which
+ * the compilers don't use, so a NOP can take its place.
+ */
+static int remove_noinstr_coverage(struct objtool_file *file)
+{
+	struct instruction *insn;
+	struct section *sec;
+	struct reloc *reloc;
+
+	for_each_sec(file->elf, sec) {
+		if (!sec->noinstr)
+			continue;
+
+		sec_for_each_insn(file, sec, insn) {
+			reloc = insn_reloc(file, insn);
+			if (!reloc || !is_coverage_update(file, insn, reloc))
+				continue;
+
+			set_reloc_type(file->elf, reloc, R_NONE);
+
+			if (elf_write_insn(file->elf, insn->sec, insn->offset,
+					   insn->len, arch_nop_insn(insn->len)))
+				return -1;
+
+			insn->type = INSN_NOP;
+			nr_coverage_nops++;
+		}
+	}
+
+	return 0;
+}
+
 int decode_file(struct objtool_file *file)
 {
 	arch_initial_func_cfi_state(&initial_func_cfi);
@@ -2686,6 +2836,9 @@ int decode_file(struct objtool_file *file)
 	if (read_annotate(file, __annotate_late))
 		return -1;
 
+	if (opts.hack_noinstr && remove_noinstr_coverage(file))
+		return -1;
+
 	return 0;
 }
 
@@ -4950,6 +5103,7 @@ int check(struct objtool_file *file)
 		printf("nr_cfi: %ld\n", nr_cfi);
 		printf("nr_cfi_reused: %ld\n", nr_cfi_reused);
 		printf("nr_cfi_cache: %ld\n", nr_cfi_cache);
+		printf("nr_coverage_nops: %ld\n", nr_coverage_nops);
 	}
 
 out:
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 96d828a8401fd..c8f89da36bfb6 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -101,6 +101,8 @@ bool arch_is_embedded_insn(struct symbol *sym);
 int arch_rewrite_retpolines(struct objtool_file *file);
 
 bool arch_pc_relative_reloc(struct reloc *reloc);
+bool arch_insn_is_mem_direct(struct instruction *insn, struct reloc *reloc);
+bool arch_insn_is_mem_update(struct instruction *insn, struct reloc *reloc);
 bool arch_absolute_reloc(struct elf *elf, struct reloc *reloc);
 
 unsigned int arch_reloc_size(struct reloc *reloc);
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index a82517a76a0f6..202e77f26785a 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -84,6 +84,7 @@ struct symbol {
 	u8 return_thunk      : 1;
 	u8 fentry            : 1;
 	u8 profiling_func    : 1;
+	u8 coverage_counter  : 1;
 	u8 warned	     : 1;
 	u8 embedded_insn     : 1;
 	u8 local_label       : 1;
-- 
2.53.0

