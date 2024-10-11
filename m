Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F11C460F
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666552; cv=none; b=hRzYKQTGpSnifa32Ys89XSCxZ5QYOXgL0p6xa7LZ+ohZEkRZxloYq3eMT0ggb0/vV0Ps5AwEOxBbCZnOdRfZMzRTkkAPJQ5qL4DDC/ioiYD9GkhJhT1Iji8SeG+vtuKyH3PwMXLl/MOE1SO1Peg8N4Hsnzp7A8nKV2uMpta/jec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666552; c=relaxed/simple;
	bh=VUujYBiQvSszgV0qs3fJK1Hvr5k7z7tzS0djEyuvxZs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lJXm1IvJQm5RrVP3WYRyEMJ5Y54G9bfoej2Le3STEpvwFwSHFlZoQoJVKS7XXyYTPvx5R3FD4ngiz0GqPutaQYCr7AaUg/pnSLGOzGegO/h1FEf+D64eqXfs9DLFaVICopM7Ko5nT4IR6q3YK/f++XhmATTq+MaPK8oRj7r098E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=20XJJ2a/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="20XJJ2a/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-431207426e3so3512645e9.1
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728666549; x=1729271349; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfj0B3nnHjUxcCyCalhugd5ngmM/JrZzfePhPsFLeh4=;
        b=20XJJ2a/Sy5Cy/rBSGIp04nd0GCuU92beNNUyIxXJf/f5NUVPzIGEZ9sCCOPHpF9ft
         5zWfod5sQdP4PmpP5+SM36blepA2zohpw9wiSSKZjESL4aA9VYydMRXgV4/TPukBaEl8
         HspMD1spU+FONMa3XtRuS/6FOZ8bU+iyhAsMoGGcUlvHYhfjopU7y4j7opjmSI5fSJ7K
         X4IgNmPyj+A/o3ZqOZ97Kxk9J/sxFjl6j5DLBE2APhCk5REQhu8cg//tp1tI55WKyGLX
         m/MnSKwgphPgdyVv+sQyg/dVuWHCUn/FJaw2sFQqhi6l+RA/kAhu+1qHL4FDDFoj/SPH
         vreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666549; x=1729271349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfj0B3nnHjUxcCyCalhugd5ngmM/JrZzfePhPsFLeh4=;
        b=TIA44dTxcX7NNlvpezCbPCf1C9ZZf0Ftm/MJYg6/gfNYwnFsZohziW7mbSCy9nRMJ4
         ZGM1wzUs9nVWUorUXJ2zDgFYFeUqjJqt9uLesuTT5WvQ2OpdBz9w3yoywtu2sIl6OyCV
         UPS6DO0ThPtm9ERHeWo3HgIDBpwZ7Lbb+X87Zgargl7eCUwuA1DWNY/2Bjldfg0gu74Y
         ldskQQAO/qdG9Tv/GYNTYts4Q50tyKKhnMuyBYKxqBn5rzwAO/l8oB2jHuECxZ/wgMRj
         uKnQYGJ7B+yxgCDy2urKPwAtpHfcAv0W4rtSIUdraxvqKYafkzpYZnZkcSvuzxq/hpfd
         mAZg==
X-Gm-Message-State: AOJu0YywMtxC9krsjOlHfUiYG1/R4Wdv4m9niVL5oZeSCpfTFiIvRpDj
	QZeuH8dbpMD+LBLVNdw+T+krPJSx7Ve7l5nbIdLG8PRtZBYKl6nnHeor8vHalmka5M/vcw==
X-Google-Smtp-Source: AGHT+IFvX/saq2RUfGzHvn3Yuhv8T3E5DzVonOGZChHXCjZPWicr/2IaSFuxMZRFRkaqCDpZgMyInJz/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:6890:0:b0:374:badf:9b16 with SMTP id
 ffacd0b85a97d-37d54de7715mr5662f8f.0.1728666548505; Fri, 11 Oct 2024 10:09:08
 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:08:50 +0200
In-Reply-To: <20241011170847.334429-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011170847.334429-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6898; i=ardb@kernel.org;
 h=from:subject; bh=2jvHADU7c8PNtY41id5iwZpe+A4RE0tCIX4zDl/IOwI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ0zevGeuTemSKv5/VnNF3SJkT37m5jGny9B0qcX3hCdy
 FY1fcO/jlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR2tMM/wteCl2WXp4vrqrU
 8/PM1Tu7eE0Ka+2OVWe/PrexdoZEgQ3DP7MzGyWTi0uENn70OL9B8qPnx/4X27Z1bYtzXq58O1l YjB8A
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011170847.334429-12-ardb+git@google.com>
Subject: [PATCH v3 2/8] objtool: Allow arch code to discover jump table size
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In preparation for adding support for annotated jump tables, where
ELF relocations and symbols are used to describe the locations of jump
tables in the executable, refactor the jump table discovery logic so the
table size can be returned from arch_find_switch_table().

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/arch/loongarch/special.c  |  3 +-
 tools/objtool/arch/powerpc/special.c    |  3 +-
 tools/objtool/arch/x86/special.c        |  4 ++-
 tools/objtool/check.c                   | 31 +++++++++++++-------
 tools/objtool/include/objtool/check.h   |  5 +++-
 tools/objtool/include/objtool/special.h |  3 +-
 6 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
index 9bba1e9318e0..87230ed570fd 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -9,7 +9,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 }
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				     struct instruction *insn)
+				     struct instruction *insn,
+				     unsigned long *table_size)
 {
 	return NULL;
 }
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index d33868147196..51610689abf7 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -13,7 +13,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 }
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				     struct instruction *insn,
+				     unsigned long *table_size)
 {
 	exit(-1);
 }
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 415e4d035e53..f8fb67636384 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -109,7 +109,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
  *    NOTE: MITIGATION_RETPOLINE made it harder still to decode dynamic jumps.
  */
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				     struct instruction *insn,
+				     unsigned long *table_size)
 {
 	struct reloc  *text_reloc, *rodata_reloc;
 	struct section *table_sec;
@@ -150,5 +151,6 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	if (!rodata_reloc)
 		return NULL;
 
+	*table_size = 0;
 	return rodata_reloc;
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index aa07fdf1cf13..b73e43b9b9e3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -150,6 +150,15 @@ static inline struct reloc *insn_jump_table(struct instruction *insn)
 	return NULL;
 }
 
+static inline unsigned long insn_jump_table_size(struct instruction *insn)
+{
+	if (insn->type == INSN_JUMP_DYNAMIC ||
+	    insn->type == INSN_CALL_DYNAMIC)
+		return insn->_jump_table_size;
+
+	return 0;
+}
+
 static bool is_jump_table_jump(struct instruction *insn)
 {
 	struct alt_group *alt_group = insn->alt_group;
@@ -2099,6 +2108,7 @@ static int add_special_section_alts(struct objtool_file *file)
 static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			  struct reloc *next_table)
 {
+	unsigned long table_size = insn_jump_table_size(insn);
 	struct symbol *pfunc = insn_func(insn)->pfunc;
 	struct reloc *table = insn_jump_table(insn);
 	unsigned int rtype = reloc_type(table);
@@ -2116,6 +2126,8 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		unsigned long addend = reloc_addend(reloc);
 
 		/* Check for the end of the table: */
+		if (table_size && reloc_offset(reloc) - reloc_offset(table) >= table_size)
+			break;
 		if (reloc != table && reloc == next_table)
 			break;
 
@@ -2175,12 +2187,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
  * find_jump_table() - Given a dynamic jump, find the switch jump table
  * associated with it.
  */
-static struct reloc *find_jump_table(struct objtool_file *file,
-				      struct symbol *func,
-				      struct instruction *insn)
+static void find_jump_table(struct objtool_file *file, struct symbol *func,
+			    struct instruction *insn)
 {
 	struct reloc *table_reloc;
 	struct instruction *dest_insn, *orig_insn = insn;
+	unsigned long table_size;
 
 	/*
 	 * Backward search using the @first_jump_src links, these help avoid
@@ -2201,17 +2213,17 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		     insn->jump_dest->offset > orig_insn->offset))
 		    break;
 
-		table_reloc = arch_find_switch_table(file, insn);
+		table_reloc = arch_find_switch_table(file, insn, &table_size);
 		if (!table_reloc)
 			continue;
 		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
 		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
 			continue;
 
-		return table_reloc;
+		orig_insn->_jump_table = table_reloc;
+		orig_insn->_jump_table_size = table_size;
+		break;
 	}
-
-	return NULL;
 }
 
 /*
@@ -2222,7 +2234,6 @@ static void mark_func_jump_tables(struct objtool_file *file,
 				    struct symbol *func)
 {
 	struct instruction *insn, *last = NULL;
-	struct reloc *reloc;
 
 	func_for_each_insn(file, func, insn) {
 		if (!last)
@@ -2245,9 +2256,7 @@ static void mark_func_jump_tables(struct objtool_file *file,
 		if (insn->type != INSN_JUMP_DYNAMIC)
 			continue;
 
-		reloc = find_jump_table(file, func, insn);
-		if (reloc)
-			insn->_jump_table = reloc;
+		find_jump_table(file, func, insn);
 	}
 }
 
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index daa46f1f0965..e1cd13cd28a3 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -71,7 +71,10 @@ struct instruction {
 	struct instruction *first_jump_src;
 	union {
 		struct symbol *_call_dest;
-		struct reloc *_jump_table;
+		struct {
+			struct reloc *_jump_table;
+			unsigned long _jump_table_size;
+		};
 	};
 	struct alternative *alts;
 	struct symbol *sym;
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 86d4af9c5aa9..e7ee7ffccefd 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -38,5 +38,6 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
 				 struct reloc *reloc);
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn);
+				     struct instruction *insn,
+				     unsigned long *table_size);
 #endif /* _SPECIAL_H */
-- 
2.47.0.rc1.288.g06298d1525-goog

