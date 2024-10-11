Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2691C68BF
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666556; cv=none; b=IZ+S+g3iX3Cjr96CwXHAc06HHmnO0rBTH0URwKLtDI+pHne1t29iWCuhrLVbockRwsezyZCPIzcqqjTjKxCH9NBILiPiD1Xl4h1MlQxXxZ1CY0s4kkMm68aTQFJ4RQRYkGOxeVFx3ea9D7PbSEmsWzkCbuXnUEfqCepSnw5MAs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666556; c=relaxed/simple;
	bh=sRBC3imC2fsNC2651TKH0KS++dKocaTpJWGS92trpJI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VilgCtFtWWF+alUuZNcqwU4YiJvnMzzKS4XJ8XzWXWzH7I+tLQ6QBw63CCe3z2H2RODyOM+69ZW3Qmv/UJEaPiG6A7hbRrfB+WYTmv9ilFiR9939PUEYQeP9XX9FJJXJwntBO3S1QxgbmXo28PR1noUYQpa+JQsO9wBlPf1X3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCp5NElU; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCp5NElU"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so40448497b3.2
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728666554; x=1729271354; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NFjU8MWypV/vmYVD9Z8mN2L/hjHRNn6Cg6IdwFQVZM=;
        b=JCp5NElUZbrD/jlE86luqD/O2kw6b8N5m4U0PEKWRZQ9kjowpdtnum+MeJsIZIiuNs
         7sI+9N9oc09bzmkW1SuJFa3KYPYC2j4C3WAgOXwe7cvTX8ZB7E5sK/gRe+x/RC5CaOPX
         fl3G+NdhW1xUL7B7HNfP7+GT2C70Kn7gEBZEKupNZuBYOout4LscHprGqy+J7xFs5nIW
         PrmBhP3vTL5HMrfHcNP818qbs4j9Ai22tHiPgVvWLYzsNVeJgghtRcMLwNsNTT+7mMCw
         nXZVRBgHcFsk8AlfZNl0xLN+3Yqhon7xb76TNUfdcI7014BX01qqPgs/UPHj6rZwlSD7
         moDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666554; x=1729271354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NFjU8MWypV/vmYVD9Z8mN2L/hjHRNn6Cg6IdwFQVZM=;
        b=piJLAmg5G7MEvPNrp47QqO5L/mTftRXJWL+S8JGTOigDKDZmymyUz22CEH8fKh/XK0
         1MnTbwg445oTbKgs8DCzLOu8AbsZ4AhjkjtGTJZhHvGVdG5/LaiGUeIWjTJmJ0MhZ18S
         mw4VvhUoubrgAioUeYn2JWy5IA2Lbx4oyVNy4kQlywggg2F9A/t7KKlgKvbS35DkyGCl
         j+ZcWaC3RhKG8NW8qTt2PyXlQ5Ka1hZ+rESvLG+npg3EPFTKU8u4scrgQzP48cheTLBU
         rsjpC3nibRK8EiPucKGCJ3LMAbjR0CTZUkzpHd7Qd3MPM50NN2JKa5xun+EtIYkRQkh9
         +jHg==
X-Gm-Message-State: AOJu0YxQkTF7Vp9/u+36ubr43vj7LwR2yC1gryMWM4igQxmOoQ7j8Mdz
	ydPTETBm8XIMhVfwFUPJGQNNlGjtl1MWw2aw9Nsfwo3jWsB6zKpGvNSi5VZduAsJIEVeDg==
X-Google-Smtp-Source: AGHT+IGMNagPLd2f5e3cks8tlI/NbU5Eiyxm0UEjGwCJmB1Pvx62gpt8GDgIRWCX+baPrvA1I2aArE9A
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:5048:b0:6db:bd8f:2c59 with SMTP id
 00721157ae682-6e347b3aa77mr657047b3.4.1728666553837; Fri, 11 Oct 2024
 10:09:13 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:08:52 +0200
In-Reply-To: <20241011170847.334429-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011170847.334429-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=10349; i=ardb@kernel.org;
 h=from:subject; bh=Ubt7RQjuRDIfCARVycqrXHI/7Y7hGzCx+rj5JuA2brA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ0zemnHHr2KoxPDrWaG8jOvEHNbtmqutkHemsRvq+fMK
 TE41jWjo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyku5zhf8LMnDCH1BctSt81
 m+5cDbr5KerLtMDgrU32/x4zLv9pWs3IsK/V6oTzsQ/P/+/V7FUU+mq3Skz3cuI6ZgO+fEnha5l PGQE=
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011170847.334429-14-ardb+git@google.com>
Subject: [PATCH v3 4/8] objtool: Move jump table heuristics to a x86 specific
 source file
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In preparation for implementing support for the use of compiler emitted
jump table annotations, move the existing code out of the generic
sources. This will permit a clean separation between the two approaches,
where the old one will not be wired up for architectures other than x86.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/arch/loongarch/special.c  |   7 --
 tools/objtool/arch/powerpc/special.c    |   7 --
 tools/objtool/arch/x86/special.c        | 114 +++++++++++++++++++-
 tools/objtool/check.c                   | 112 +------------------
 tools/objtool/include/objtool/special.h |   9 +-
 5 files changed, 122 insertions(+), 127 deletions(-)

diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
index 87230ed570fd..acf3a391a2f9 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -7,10 +7,3 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 {
 	return false;
 }
-
-struct reloc *arch_find_switch_table(struct objtool_file *file,
-				     struct instruction *insn,
-				     unsigned long *table_size)
-{
-	return NULL;
-}
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index 51610689abf7..3a108437cfa6 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -11,10 +11,3 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 {
 	exit(-1);
 }
-
-struct reloc *arch_find_switch_table(struct objtool_file *file,
-				     struct instruction *insn,
-				     unsigned long *table_size)
-{
-	exit(-1);
-}
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index f8fb67636384..cd964b85e2b1 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -108,9 +108,9 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
  *
  *    NOTE: MITIGATION_RETPOLINE made it harder still to decode dynamic jumps.
  */
-struct reloc *arch_find_switch_table(struct objtool_file *file,
-				     struct instruction *insn,
-				     unsigned long *table_size)
+static struct reloc *find_switch_table(struct objtool_file *file,
+				       struct instruction *insn,
+				       unsigned long *table_size)
 {
 	struct reloc  *text_reloc, *rodata_reloc;
 	struct section *table_sec;
@@ -154,3 +154,111 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	*table_size = 0;
 	return rodata_reloc;
 }
+
+/*
+ * find_jump_table() - Given a dynamic jump, find the switch jump table
+ * associated with it.
+ */
+static void find_jump_table(struct objtool_file *file,
+			    struct symbol *func,
+			    struct instruction *insn)
+{
+	struct reloc *table_reloc;
+	struct instruction *dest_insn, *orig_insn = insn;
+	unsigned long table_size;
+
+	/*
+	 * Backward search using the @first_jump_src links, these help avoid
+	 * much of the 'in between' code. Which avoids us getting confused by
+	 * it.
+	 */
+	for (;
+	     insn && insn_func(insn) && insn_func(insn)->pfunc == func;
+	     insn = insn->first_jump_src ?: prev_insn_same_sym(file, insn)) {
+
+		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
+			break;
+
+		/* allow small jumps within the range */
+		if (insn->type == INSN_JUMP_UNCONDITIONAL &&
+		    insn->jump_dest &&
+		    (insn->jump_dest->offset <= insn->offset ||
+		     insn->jump_dest->offset > orig_insn->offset))
+		    break;
+
+		table_reloc = find_switch_table(file, insn, &table_size);
+		if (!table_reloc)
+			continue;
+		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
+		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
+			continue;
+
+		orig_insn->_jump_table = table_reloc;
+		orig_insn->_jump_table_size = table_size;
+		break;
+	}
+}
+
+/*
+ * First pass: Mark the head of each jump table so that in the next pass,
+ * we know when a given jump table ends and the next one starts.
+ */
+static void mark_func_jump_tables(struct objtool_file *file,
+				    struct symbol *func)
+{
+	struct instruction *insn, *last = NULL;
+
+	func_for_each_insn(file, func, insn) {
+		if (!last)
+			last = insn;
+
+		/*
+		 * Store back-pointers for unconditional forward jumps such
+		 * that find_jump_table() can back-track using those and
+		 * avoid some potentially confusing code.
+		 */
+		if (insn->type == INSN_JUMP_UNCONDITIONAL && insn->jump_dest &&
+		    insn->offset > last->offset &&
+		    insn->jump_dest->offset > insn->offset &&
+		    !insn->jump_dest->first_jump_src) {
+
+			insn->jump_dest->first_jump_src = insn;
+			last = insn->jump_dest;
+		}
+
+		if (insn->type == INSN_JUMP_DYNAMIC)
+			find_jump_table(file, func, insn);
+	}
+}
+
+int add_func_jump_tables(struct objtool_file *file,
+			 struct symbol *func)
+{
+	struct instruction *insn, *insn_t1 = NULL, *insn_t2;
+	int ret = 0;
+
+	mark_func_jump_tables(file, func);
+
+	func_for_each_insn(file, func, insn) {
+		if (!insn_jump_table(insn))
+			continue;
+
+		if (!insn_t1) {
+			insn_t1 = insn;
+			continue;
+		}
+
+		insn_t2 = insn;
+
+		ret = add_jump_table(file, insn_t1, insn_jump_table(insn_t2));
+		if (ret)
+			return ret;
+
+		insn_t1 = insn_t2;
+	}
+
+	if (insn_t1)
+		ret = add_jump_table(file, insn_t1, NULL);
+
+	return ret;
+}
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index fbb05e973acc..389475dde47c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2091,8 +2091,8 @@ static int add_special_section_alts(struct objtool_file *file)
 	return ret;
 }
 
-static int add_jump_table(struct objtool_file *file, struct instruction *insn,
-			  struct reloc *next_table)
+int add_jump_table(struct objtool_file *file, struct instruction *insn,
+		   struct reloc *next_table)
 {
 	unsigned long table_size = insn_jump_table_size(insn);
 	struct symbol *pfunc = insn_func(insn)->pfunc;
@@ -2169,111 +2169,10 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	return 0;
 }
 
-/*
- * find_jump_table() - Given a dynamic jump, find the switch jump table
- * associated with it.
- */
-static void find_jump_table(struct objtool_file *file, struct symbol *func,
-			    struct instruction *insn)
+int __weak add_func_jump_tables(struct objtool_file *file,
+				struct symbol *func)
 {
-	struct reloc *table_reloc;
-	struct instruction *dest_insn, *orig_insn = insn;
-	unsigned long table_size;
-
-	/*
-	 * Backward search using the @first_jump_src links, these help avoid
-	 * much of the 'in between' code. Which avoids us getting confused by
-	 * it.
-	 */
-	for (;
-	     insn && insn_func(insn) && insn_func(insn)->pfunc == func;
-	     insn = insn->first_jump_src ?: prev_insn_same_sym(file, insn)) {
-
-		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
-			break;
-
-		/* allow small jumps within the range */
-		if (insn->type == INSN_JUMP_UNCONDITIONAL &&
-		    insn->jump_dest &&
-		    (insn->jump_dest->offset <= insn->offset ||
-		     insn->jump_dest->offset > orig_insn->offset))
-		    break;
-
-		table_reloc = arch_find_switch_table(file, insn, &table_size);
-		if (!table_reloc)
-			continue;
-		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
-		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
-			continue;
-
-		orig_insn->_jump_table = table_reloc;
-		orig_insn->_jump_table_size = table_size;
-		break;
-	}
-}
-
-/*
- * First pass: Mark the head of each jump table so that in the next pass,
- * we know when a given jump table ends and the next one starts.
- */
-static void mark_func_jump_tables(struct objtool_file *file,
-				    struct symbol *func)
-{
-	struct instruction *insn, *last = NULL;
-
-	func_for_each_insn(file, func, insn) {
-		if (!last)
-			last = insn;
-
-		/*
-		 * Store back-pointers for unconditional forward jumps such
-		 * that find_jump_table() can back-track using those and
-		 * avoid some potentially confusing code.
-		 */
-		if (insn->type == INSN_JUMP_UNCONDITIONAL && insn->jump_dest &&
-		    insn->offset > last->offset &&
-		    insn->jump_dest->offset > insn->offset &&
-		    !insn->jump_dest->first_jump_src) {
-
-			insn->jump_dest->first_jump_src = insn;
-			last = insn->jump_dest;
-		}
-
-		if (insn->type != INSN_JUMP_DYNAMIC)
-			continue;
-
-		find_jump_table(file, func, insn);
-	}
-}
-
-static int add_func_jump_tables(struct objtool_file *file,
-				  struct symbol *func)
-{
-	struct instruction *insn, *insn_t1 = NULL, *insn_t2;
-	int ret = 0;
-
-	func_for_each_insn(file, func, insn) {
-		if (!insn_jump_table(insn))
-			continue;
-
-		if (!insn_t1) {
-			insn_t1 = insn;
-			continue;
-		}
-
-		insn_t2 = insn;
-
-		ret = add_jump_table(file, insn_t1, insn_jump_table(insn_t2));
-		if (ret)
-			return ret;
-
-		insn_t1 = insn_t2;
-	}
-
-	if (insn_t1)
-		ret = add_jump_table(file, insn_t1, NULL);
-
-	return ret;
+	return 0;
 }
 
 /*
@@ -2293,7 +2192,6 @@ static int add_jump_table_alts(struct objtool_file *file)
 		if (func->type != STT_FUNC)
 			continue;
 
-		mark_func_jump_tables(file, func);
 		ret = add_func_jump_tables(file, func);
 		if (ret)
 			return ret;
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index e7ee7ffccefd..019b511eca6e 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -37,7 +37,10 @@ void arch_handle_alternative(unsigned short feature, struct special_alt *alt);
 bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
 				 struct reloc *reloc);
-struct reloc *arch_find_switch_table(struct objtool_file *file,
-				     struct instruction *insn,
-				     unsigned long *table_size);
+
+int add_func_jump_tables(struct objtool_file *file, struct symbol *func);
+
+int add_jump_table(struct objtool_file *file, struct instruction *insn,
+		   struct reloc *next_table);
+
 #endif /* _SPECIAL_H */
-- 
2.47.0.rc1.288.g06298d1525-goog

