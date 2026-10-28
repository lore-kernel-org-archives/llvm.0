Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188871;
	b=NFizqzs+pEj6r3pu9i6YGOorUc13xri4Orka63wuYi4F3q1QlMY1O8oBEzCQQ21KNBmz
	 vdIKibS4g+oKBRWWYyKC5KuTL8BOIazkKgYSHdgl6qtSrhVQQoYFO4gG3y2dhJD5WtBKN
	 rNpo4r7Tgby+q7WmC132ZgFZNeGSNBLaVfSNog8IXX/2EJpj/o4hi6wQzVhxrJNjMCbZ2
	 9Wi/hQluAqUvPaLspoEzfNmWl4+k4e3UPGWd1sxtP6gfbx9U1oT0DNTPle1fz61Scg3fS
	 N08FMSAE/nITev5pfzMf0mApDl0dd8r1xqd5fZuUoiCpmVAvEl2pFqsYYr8sayVLcHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188871;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XtupJ6UZXnlPn2/VxZzc4oZhDO4DobFJyxmiPhQBJMk=;
	b=EC5H/KLaj1G6hndT7AHy96TWPuCStln7T2fzdj8qAELlVWMYv/wf3ej5+cySuuF/7rpU
	 vlNk5F7uOe+H1l0LUnI1nnF9A6NPElM9A+BUH5NYQhaX6PVr/bhHcUkfdNo9tWHKZstvF
	 xS/fZi3oh5EW6R5OUFYvZ6xoE5M15k5npp/1mAxi7Eo/yMzjDrc8JXa803AAtjuYhwreZ
	 bcX9/rBLGiBwANnyNELXVKEUV7HPasco2OWzJcFX/DILU9wA4nlcWTb2z7TFzTYtICt3b
	 I0ZQRNBu1fn9MAzNiPUTmYDUquAGcZNmfOjwFoBR5Dx83ca+4vg8S8DMngN8GM3BgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah7LNya5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A9B606A330;
	Wed, 28 Oct 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah7LNya5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BCE1F01828;
	Wed, 28 Oct 2026 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188871;
	bh=XtupJ6UZXnlPn2/VxZzc4oZhDO4DobFJyxmiPhQBJMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ah7LNya5iCpiXZThOZBU7pvepMOWnTKLiZiMA/DC0BgJ+Hl6ZLhHSISpUXhPHs1a8
	 Q/6cnKVYyii2M9R6sFwm0JYzdTrNHul/lw/Wayj3QWjoQHv837iY7VKwZMRBOOgKZW
	 c0mNnCtWMOHX96S8/iyXAY5L0ci7sGDis4BL0QkeU027T+TI2Sd8b5U/62Wz+uYXsN
	 RQqeZJpzEK2sIPK9R3Ry+bVf33aP4SW+zm25Y2tkOc2HSQsu80x2q2aEv3TjygKDBK
	 rEyCxSpYuM8vbVoqkh81iqCsJ/Ra26uRpfQ6WqlRRSaYf5D+29pHPnTi/Vt7RlJrZg
	 lffRks2ohNhuQ==
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
Subject: [RFC PATCH 11/20] objtool: Detect code coverage instrumentation in noinstr code
Date: Wed, 28 Oct 2026 07:59:35 -0400
Message-ID: <20261028120034.871983-12-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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
 tools/objtool/check.c | 53 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 464f6c9d9ff0b..6382d2a44ef2b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4,6 +4,7 @@
  */
 
 #define _GNU_SOURCE /* memmem() */
+#include <ctype.h>
 #include <fnmatch.h>
 #include <string.h>
 #include <stdlib.h>
@@ -3507,6 +3508,52 @@ static inline bool noinstr_call_dest(struct objtool_file *file,
 	return false;
 }
 
+/*
+ * Code coverage instrumentation (gcov, Clang's source-based coverage) updates
+ * its counters inline rather than through calls, so it can't be caught by
+ * checking the call destinations of noinstr code.
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
+		if (!sym->sec)
+			continue;
+
+		if (is_sec_sym(sym)) {
+			sym = find_symbol_containing(sym->sec,
+						     arch_insn_adjusted_addend(insn, reloc));
+			if (!sym)
+				sym = reloc->sym;
+		}
+
+		if (is_coverage_counter(sym))
+			return true;
+	}
+
+	return false;
+}
+
 static int validate_call(struct objtool_file *file,
 			 struct instruction *insn,
 			 struct insn_state *state)
@@ -3680,6 +3727,12 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	if (statep->noinstr)
 		statep->instr += insn->instr;
 
+	if (statep->noinstr && statep->instr <= 0 &&
+	    insn_updates_coverage(file, insn)) {
+		WARN_INSN(insn, "coverage counter update in .noinstr.text section");
+		return 1;
+	}
+
 	if (insn->hint) {
 		if (insn->restore) {
 			struct instruction *save_insn, *i;
-- 
2.53.0

