Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670789;
	b=AUae8Q80MTWeE111Vo2HzWhi2czR7IOQfkZrmER7Cn08XJdrr02WKdtxoKZFoCgzf8Mk
	 Z7tSXgllYX5dwWdmpou3igT+6ilEVNYKNaXlq3auLUjEcEDoATKHksUqGVw2Fw0ocG1qV
	 1z02fOx2ZhUVBCAAh0fD3ZEZcpA+GpnzWfSGfIaT1rVFQvN/F0xz00mNXxLyQoBuYrRaK
	 Dewodf23yUYhxbbp+Ody/edGAZcEqnEdTbcVP3TzAqbxWmlM6t88ApA5vSpUOQvuQIM5V
	 eA/pOwv/IscpNbgsZWK9HwujuW4SWfH9V/2w8wd/q9fjJIVS4MVsaBVbQkMH70mgsxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670789;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aO8z261Uf3Eb4/no0VbBDXWfL2JpTVR98bXNAEVyRT0=;
	b=FtWSLW0hqyaJIXPO9CYtKiaSlZd7PfBePnNozuYfXb8pnfGH71SQRSFwVJTC0AP8ZOa0
	 5J3G/cRwXY+2ke7yOfrP4+IXCNt/gCdFXwukklsjGB4QvUIHmkwxAaMVLXut7T65gI44p
	 5sLmNaxPAaeizTzHwvRklVrYdjkhGScXdkeoVSsZeVopRpvCGYcNzYSvbHhPYtWxOUn8V
	 vpa8ze+YZGVLBKeN5nUa4/oecEvpnB+sPrLfqcRycBLDzRP7HUiVHcAZhNaLJ5NmogUK0
	 5Agw0o8ssRH8Cyt1u1YHlEdSFlddH3xqhS0zE9qWkmxnvd4G7rfjAloifDd4J+WX4sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhOI+0Lv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8B606D83B;
	Tue,  3 Nov 2026 01:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhOI+0Lv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700F81F00A02;
	Tue,  3 Nov 2026 01:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670783;
	bh=aO8z261Uf3Eb4/no0VbBDXWfL2JpTVR98bXNAEVyRT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jhOI+0Lv7v7ACa9wzapWjtP3K5zITYpE0Rjw67VnQ9NrQDXFd0sAWkXM1BINplzyP
	 xoEGTXy1ZjJsGc/IgLxShl59WK1+zKQgq+F+L6zagc7dUTniO5F7S6z2mKgJCQ01KG
	 XDgGbIkat5TZRNH1++qIwGcdmdDNvMVxgVyeBt+oOfdTk9BhY0M6woenPjxxdFSE2l
	 s3kFApp8JD7lTviBa5E4Beqn8FpiyO01vI8qNICjyUCxMTqcQF67g8/9lKwaMxwDjo
	 8qdCUrbmXY/AVpi9Y7MiO39D9cGavocJU0bTUAswZUDu8FFVzHwqnAwmRU0Ot/41NQ
	 dq+rrSRsgazeA==
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
Subject: [PATCH v2 11/20] objtool: Detect code coverage instrumentation in noinstr code
Date: Mon,  2 Nov 2026 20:52:29 -0500
Message-ID: <20261103015238.3780910-12-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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
inline, rather than by calling into a runtime like KCOV does, so
coverage instrumentation in noinstr code goes unnoticed by the noinstr
validation of call destinations.

Flag instructions in noinstr code, outside of instrumentation_begin()
and instrumentation_end() sections, that reference coverage counters:
GCC's __gcov<N>.* counters (including the MC/DC counters), Clang's gcov
__llvm_gcov_ctr* counters, and the __llvm_prf_cnts and __llvm_prf_bits
sections of Clang's source-based code coverage.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/objtool/check.c               | 60 ++++++++++++++++++++++++++++-
 tools/objtool/include/objtool/elf.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 931c5c412f15d..b0ea6e42c4fda 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4,6 +4,7 @@
  */
 
 #define _GNU_SOURCE /* memmem() */
+#include <ctype.h>
 #include <fnmatch.h>
 #include <string.h>
 #include <stdlib.h>
@@ -2490,6 +2491,21 @@ static bool is_profiling_func(const char *name)
 	return false;
 }
 
+/*
+ * Return true if sym is a code coverage counter: GCC's __gcov<N>.* and
+ * Clang's __llvm_gcov_ctr* gcov counters, or the counters and MC/DC bitmaps
+ * of Clang's source-based code coverage.
+ */
+static bool is_coverage_counter(struct symbol *sym)
+{
+	if (!strcmp(sym->sec->name, "__llvm_prf_cnts") ||
+	    !strcmp(sym->sec->name, "__llvm_prf_bits"))
+		return true;
+
+	return (strstarts(sym->name, "__gcov") && isdigit((unsigned char)sym->name[6])) ||
+	       strstarts(sym->name, "__llvm_gcov_ctr");
+}
+
 static int classify_symbols(struct objtool_file *file)
 {
 	struct symbol *func;
@@ -2499,6 +2515,9 @@ static int classify_symbols(struct objtool_file *file)
 		if (is_notype_sym(func) && strstarts(func->name, ".L"))
 			func->local_label = true;
 
+		if (is_coverage_counter(func))
+			func->coverage_counter = true;
+
 		if (!is_global_sym(func))
 			continue;
 
@@ -3508,6 +3527,39 @@ static inline bool noinstr_call_dest(struct objtool_file *file,
 	return false;
 }
 
+/*
+ * Code coverage instrumentation (gcov, Clang's source-based coverage) updates
+ * its counters inline rather than through calls, so it can't be caught by
+ * checking the call destinations of noinstr code.
+ */
+static bool insn_updates_coverage(struct objtool_file *file,
+				  struct instruction *insn)
+{
+	struct symbol *sym;
+	struct reloc *reloc;
+
+	for (reloc = insn_reloc(file, insn);
+	     reloc;
+	     reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+					      reloc_offset(reloc) + 1,
+					      insn->offset + insn->len -
+					      (reloc_offset(reloc) + 1))) {
+
+		sym = reloc->sym;
+		if (is_sec_sym(sym)) {
+			sym = find_symbol_containing(sym->sec,
+						     arch_insn_adjusted_addend(insn, reloc));
+			if (!sym)
+				sym = reloc->sym;
+		}
+
+		if (sym->coverage_counter)
+			return true;
+	}
+
+	return false;
+}
+
 static int validate_call(struct objtool_file *file,
 			 struct instruction *insn,
 			 struct insn_state *state)
@@ -3678,9 +3730,15 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		nr_insns_visited++;
 	}
 
-	if (statep->noinstr)
+	if (statep->noinstr) {
 		statep->instr += insn->instr;
 
+		if (statep->instr <= 0 && insn_updates_coverage(file, insn)) {
+			WARN_INSN(insn, "coverage counter update in .noinstr.text section");
+			return 1;
+		}
+	}
+
 	if (insn->hint) {
 		if (insn->restore) {
 			struct instruction *save_insn, *i;
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

