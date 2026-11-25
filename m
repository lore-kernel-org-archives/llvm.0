Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572396;
	b=YIIOHCYQpZmXi8W2mcR1FlUmFCsgRClvgWPylB8ieY2vxkHrsxeN9vaD5bZ2MB/hTT+H
	 vo1a8FN2OKl9lkk28rutrDIiVhNHKlPEA9164qBScUWvVDTWvhDMxE7M33/sXVP6/+OOk
	 15s69M6JqedRmlmHsDYSdClXag6EpYDDLVDQ5BFkRQBKtQYPg0IyU+ep4eKXOJNJmc3pe
	 FhffN2uWykeyaLtbL9Ex2hyc5/O8PsLsGTqDhpVF8998VFcu/83Zmma71d6m6eLUAmr1z
	 mRMTySONaPUdi9yd/9lTUqNVAody/kvW8mqLGQ+XehIyCyDdEDApJnVGXafjHe+fvzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572396;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uq8XVQTyjMBZl/FoNjHAmWzLGtzvkTmPcvhgPObfx3w=;
	b=acoaobD/0ohb9lS5anFmdt9ZJB9h+JfZB0OPDPgGu036LAPVC8Zz0y+/nuyEoZRBj0lU
	 njHjXaEtqKwxhOeYPlq8y2IsMBwO5soRlVRJTHUwpSD9aROcI77QQxOGpOVB7QzoA9o7T
	 dP15/aM0JxzSc7b2TXD/Ye0RS9BDNxBOm0VU9LD0qIrvllM/HM6XpI8l3+TUfaHrRmnpa
	 vaHAadl+2oxuT4XtTFmB6cNvLfCrJiOVEX6ovvM2v413VMjbC/9fVRFlW4Cusup4yuREZ
	 EzX4/CECtVuqQUTTWkgWrmJ9XY1J+lEZOeimsvfHvFPgaE3AK3QJL4hjFu1FsqLZkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1wSjf6s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A0B606A697;
	Wed, 25 Nov 2026 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1wSjf6s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD911F000E6;
	Wed, 25 Nov 2026 02:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572396;
	bh=uq8XVQTyjMBZl/FoNjHAmWzLGtzvkTmPcvhgPObfx3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M1wSjf6su+GCdjVM7WppgjX5GT1Blx7KXwFc56CNaenveMvh9UfUt5ASCZzAmK/8F
	 6D6wbaH+KH6VDn+LrvMkEYmoSAD9Wt6agSrMl+SEzixrf9L6+W0tmomlFkFTlagypD
	 ihNfISnyUNmvLdXlC/HpxqWTR122PpPnCypk43tadm/2WeACLS0U9bxskFkvNHzxI0
	 e8MGRl3CWSBilFU/Q47N0ggDR5HEPuyu7iy2KAaciibtrDL5wzgE6rwdcoO2ol6y4V
	 5hbQXjkz50xDYDj77YFnV+sl3M7qz9rkb+2K4TAAU2LPmO3qiIAx3MjwJHQsztH6RQ
	 fkRkZ74CGEtaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 11/19] objtool: Point the remaining coverage accesses in noinstr code at a sink
Date: Tue, 24 Nov 2026 21:05:55 -0500
Message-ID: <20261125020603.3934222-12-sashal@kernel.org>
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

Not every reference to a coverage counter in noinstr code is an update
that a NOP can replace. Clang's source-based code coverage may load
the address of one of several counters into a register and update the
counter through it:

	movq	$__llvm_prf_cnts+0x20,%rax
	...
	lock incq (%rax)

and its MC/DC bitmap updates load the byte of the bitmap first, to test
the bit. The update at the end can be replaced by a NOP, the load can't:

	movzbl	__llvm_prf_bits(%rdi),%ecx
	btl	%esi,%ecx
	jae	...
	lock orb %r8b,__llvm_prf_bits(%rdi)

Clang's gcov, whose counter updates aren't atomic, loads a counter,
keeps it in a register across a loop and stores it back. Removing these
takes following the values through the registers.

Change where they point instead. Retarget the relocation of every such
access to a sink, a new .bss section that objtool adds to the object,
and leave the instructions as they are. The counters of every function
are mapped to the same place in the sink with their offsets kept, and
the sink has room for the largest of them on either side of that place,
so that an indexed access stays within it whether it is relative to the
start of its counters or to their end.

With the configuration of the previous patch, a kernel built with
Clang 22, source-based code coverage and MC/DC gets 3319 counter updates
in noinstr code replaced by NOPs and 229 accesses pointed at a sink of
2048 bytes. With Clang's gcov that is 2020 and 177. GCC's atomic counter
updates don't need a sink.

Clang's gcov can also update a counter through its address in a
register, which it loads as an immediate. Such an address looks just
like the end of the object in front of the counter, so those are left
alone. The kernel above has none.

The sink is ordinary memory, and nothing keeps a data breakpoint away
from it yet.

Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/objtool/check.c | 207 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 203 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 85cb21b41508b..41a5e587a129e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -22,6 +22,7 @@
 #include <objtool/warn.h>
 #include <objtool/util.h>
 
+#include <linux/align.h>
 #include <linux/objtool_types.h>
 #include <linux/hashtable.h>
 #include <linux/kernel.h>
@@ -408,7 +409,7 @@ static void *cfi_hash_alloc(unsigned long size)
 
 static unsigned long nr_insns;
 static unsigned long nr_insns_visited;
-static unsigned long nr_coverage_nops;
+static unsigned long nr_coverage_nops, nr_coverage_sink;
 
 /*
  * Call the arch-specific instruction decoder for all the instructions and add
@@ -2721,6 +2722,184 @@ static bool is_coverage_update(struct objtool_file *file,
 	       arch_insn_is_mem_update(insn, reloc);
 }
 
+/* The alignment of the sink, and the extra room at both of its ends */
+#define COVERAGE_SINK_ALIGN	64
+
+struct coverage_access {
+	struct reloc *reloc;
+	struct symbol *sym;
+	s64 addend;
+};
+
+struct coverage_sink {
+	struct coverage_access *accs;
+	unsigned int nr, max;
+	unsigned long size;
+};
+
+/*
+ * Find the counters that @reloc refers to: the counters or the MC/DC bitmap
+ * of one function. Those of gcov are sized symbols, the ones of Clang's
+ * source-based code coverage are unsized and end where the next ones start.
+ *
+ * Returns the room that accesses relative to @reloc may need around the start
+ * of the counters.
+ */
+static unsigned long coverage_object(struct instruction *insn,
+				     struct reloc *reloc, unsigned long *start)
+{
+	struct section *sec = reloc->sym->sec;
+	struct symbol *sym = reloc->sym;
+	unsigned long end, prev = 0;
+	s64 offset;
+
+	if (sym->len) {
+		*start = sym->offset;
+		return sym->len;
+	}
+
+	offset = clamp(insn_reloc_dest(insn, reloc), (s64)0, (s64)sec_size(sec));
+
+	if (!sym->coverage_counter) {
+		sym = find_symbol_containing(sec, offset);
+		if (sym) {
+			*start = sym->offset;
+			return sym->len;
+		}
+	}
+
+	*start = 0;
+	end = sec_size(sec);
+
+	sec_for_each_sym(sec, sym) {
+		if (sym->offset > offset) {
+			end = min(end, sym->offset);
+			continue;
+		}
+
+		*start = max(*start, sym->offset);
+		if (sym->offset < offset)
+			prev = max(prev, sym->offset);
+	}
+
+	/* The start of these counters is also the end of the ones before */
+	if (offset == *start)
+		return max(end - *start, *start - prev);
+
+	return end - *start;
+}
+
+static int add_coverage_access(struct coverage_sink *sink,
+			       struct instruction *insn, struct reloc *reloc)
+{
+	struct coverage_access *acc;
+	unsigned long start, size;
+
+	if (sink->nr == sink->max) {
+		sink->max = sink->max ? sink->max * 2 : 64;
+		sink->accs = realloc(sink->accs, sink->max * sizeof(*acc));
+		if (!sink->accs) {
+			ERROR_GLIBC("realloc");
+			return -1;
+		}
+	}
+
+	size = coverage_object(insn, reloc, &start);
+
+	acc = &sink->accs[sink->nr++];
+	acc->reloc = reloc;
+	acc->sym = reloc->sym;
+	acc->addend = reloc_addend(reloc) + reloc->sym->offset - start;
+
+	sink->size = max(sink->size, size);
+
+	return 0;
+}
+
+/* Take the relocations that no longer refer to @sym off its list */
+static void prune_sym_relocs(struct symbol *sym)
+{
+	struct reloc *reloc, *prev = NULL, *next;
+
+	for (reloc = sym->relocs; reloc; reloc = next) {
+		next = sym_next_reloc(reloc);
+
+		if (reloc->sym == sym) {
+			prev = reloc;
+			continue;
+		}
+
+		if (prev)
+			set_sym_next_reloc(prev, next);
+		else
+			sym->relocs = next;
+	}
+}
+
+/*
+ * Point the accesses at a sink in a new .bss section. Only the relocations
+ * change, so this also works when the address of the counters gets loaded
+ * into a register first. The counters of every function start at the same
+ * place in the sink, which keeps their offsets and alignment, with room for
+ * the largest of them on either side: an indexed access stays within the sink
+ * whether it is relative to the start of its counters or to their end.
+ */
+static int create_coverage_sink(struct objtool_file *file,
+				struct coverage_sink *sink)
+{
+	unsigned long base = ALIGN(sink->size, COVERAGE_SINK_ALIGN) +
+			     COVERAGE_SINK_ALIGN;
+	struct coverage_access *accs = sink->accs;
+	struct section *sec;
+	struct symbol *sym;
+	unsigned int i, j;
+	char name[32];
+
+	/* Don't trip over a section of that name which is already there */
+	for (i = 0; ; i++) {
+		snprintf(name, sizeof(name),
+			 i ? ".bss.coverage_sink.%u" : ".bss.coverage_sink", i);
+		if (!find_section_by_name(file->elf, name))
+			break;
+	}
+
+	sec = elf_create_section(file->elf, name, 2 * base, 0, SHT_NOBITS,
+				 COVERAGE_SINK_ALIGN, SHF_ALLOC | SHF_WRITE);
+	if (!sec)
+		return -1;
+
+	sym = elf_create_symbol(file->elf, "__coverage_sink", sec, STB_LOCAL,
+				STT_OBJECT, 0, sec_size(sec));
+	if (!sym)
+		return -1;
+
+	for (i = 0; i < sink->nr; i++) {
+		accs[i].reloc->sym = sym;
+		set_reloc_sym(file->elf, accs[i].reloc, sym->idx);
+		set_reloc_addend(file->elf, accs[i].reloc,
+				 base + accs[i].addend);
+	}
+
+	for (i = 0; i < sink->nr; i++) {
+		for (j = 0; j < i; j++) {
+			if (accs[j].sym == accs[i].sym)
+				break;
+		}
+
+		if (j == i)
+			prune_sym_relocs(accs[i].sym);
+	}
+
+	for (i = 0; i < sink->nr; i++) {
+		set_sym_next_reloc(accs[i].reloc, sym->relocs);
+		sym->relocs = accs[i].reloc;
+	}
+
+	nr_coverage_sink += sink->nr;
+
+	return 0;
+}
+
 /*
  * gcov and Clang's source-based code coverage update their counters inline,
  * and the compilers add those updates before inlining. The counter updates of
@@ -2728,13 +2907,17 @@ static bool is_coverage_update(struct objtool_file *file,
  * the noinstr function is __no_profile.
  *
  * Remove them. An update of a counter has no other output than the flags, which
- * the compilers don't use, so a NOP can take its place.
+ * the compilers don't use, so a NOP can take its place. Everything else that
+ * refers to the counters, like the loads and the address calculations of
+ * Clang's MC/DC bitmap updates, is pointed at a sink instead.
  */
 static int remove_noinstr_coverage(struct objtool_file *file)
 {
+	struct coverage_sink sink = {};
 	struct instruction *insn;
 	struct section *sec;
 	struct reloc *reloc;
+	int ret = 0;
 
 	for_each_sec(file->elf, sec) {
 		if (!sec->noinstr)
@@ -2742,9 +2925,19 @@ static int remove_noinstr_coverage(struct objtool_file *file)
 
 		sec_for_each_insn(file, sec, insn) {
 			reloc = insn_reloc(file, insn);
-			if (!reloc || !is_coverage_update(file, insn, reloc))
+			if (!reloc)
 				continue;
 
+			if (!is_coverage_update(file, insn, reloc)) {
+				for (; reloc; reloc = insn_next_reloc(file, insn, reloc)) {
+					if (is_coverage_reloc(file, insn, reloc) &&
+					    add_coverage_access(&sink, insn, reloc))
+						return -1;
+				}
+
+				continue;
+			}
+
 			set_reloc_type(file->elf, reloc, R_NONE);
 
 			if (elf_write_insn(file->elf, insn->sec, insn->offset,
@@ -2756,7 +2949,12 @@ static int remove_noinstr_coverage(struct objtool_file *file)
 		}
 	}
 
-	return 0;
+	if (sink.nr)
+		ret = create_coverage_sink(file, &sink);
+
+	free(sink.accs);
+
+	return ret;
 }
 
 int decode_file(struct objtool_file *file)
@@ -5104,6 +5302,7 @@ int check(struct objtool_file *file)
 		printf("nr_cfi_reused: %ld\n", nr_cfi_reused);
 		printf("nr_cfi_cache: %ld\n", nr_cfi_cache);
 		printf("nr_coverage_nops: %ld\n", nr_coverage_nops);
+		printf("nr_coverage_sink: %ld\n", nr_coverage_sink);
 	}
 
 out:
-- 
2.53.0

