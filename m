Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E571DEFE2
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981468; cv=none; b=b6JgDOwq3242oJoMbjgYtRjKaTMGoa2bkBcS6J0GVmCYt87AZazPqZF9gt+xmyNAo9RGqEGFeFFREj+kht2KzUUfhi3eMIt7EqdrzoM0PKhYU0HvJ+EJYkZ3WUeWSvWKyXUECbvM1aiGS0cdBeY0PSz6cJDqf734htUc5Io2ESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981468; c=relaxed/simple;
	bh=U81L49Nw0AgeWOM9sdxxGuzlO2Zt+79EWQdKerlwdC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZQvAPsM3kRac2qRvaQcArOTTDHut9vUsGa41kUREbww6jaA9P9IF7fXuSPM/EdDiqIkH7kkAkgwGC6WYkxyuaI+ybLhQ2CXsPa8fpUBZcAQ8bps2JOhLUiLxxtA8/FTaRYrDejMRGxzU+ZC87OtgkWihOsFNG65ZRiyCtrj9B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcZ6D8Cz9sSW;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXAcOl9CibBJ; Wed, 15 Jan 2025 23:43:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcZ5DQSz9sSV;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F8058B77A;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aK_2SN5iBKqh; Wed, 15 Jan 2025 23:43:10 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 461A68B774;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 08/15] objtool: Track general purpose register used for switch table base
Date: Wed, 15 Jan 2025 23:42:48 +0100
Message-ID: <36ab728d242109aeb3fe5464123a2da672f406d6.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=5395; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=U81L49Nw0AgeWOM9sdxxGuzlO2Zt+79EWQdKerlwdC8=; b=/3AoT0IbBunpN8fIeZAmfBT1tDugFsaMy4vciiR2Ev7oz0U4eNfGYGo6t94PhVVi+ekkjoRdX oZPEEnQZ95iBlA6yAatcKE7QMTV7e2XcrslIHcfUSzy7jcqVJbmAahm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

A function can contain nested switch tables using different registers
as base address.

In order to avoid failure in tracking those switch tables, the register
containing the base address needs to be taken into account.

To do so, add a 5 bits field in struct instruction that will hold the
ID of the register containing the base address of the switch table and
take that register into account during the backward search in order to
not stop the walk when encountering a jump related to another switch
table.

On architectures not handling it, the ID stays nul and has no impact
on the search.

To enable that, also provide to arch_find_switch_table() the dynamic
instruction related to a table search.

Also allow prev_insn_same_sec() to be used outside check.c so that
architectures can backward walk through instruction to find out which
register is used as base address for a switch table.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/powerpc/special.c    | 3 ++-
 tools/objtool/arch/x86/special.c        | 3 ++-
 tools/objtool/check.c                   | 9 +++++----
 tools/objtool/include/objtool/check.h   | 6 ++++--
 tools/objtool/include/objtool/special.h | 3 ++-
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index 51610689abf7..0b3a766c4842 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -14,7 +14,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
-				     unsigned long *table_size)
+				     unsigned long *table_size,
+				     struct instruction *orig_insn)
 {
 	exit(-1);
 }
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 76c7933bcb19..b0147923a70c 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -110,7 +110,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
  */
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
-				     unsigned long *table_size)
+				     unsigned long *table_size,
+				     struct instruction *orig_insn)
 {
 	struct reloc  *text_reloc, *rodata_reloc;
 	struct section *table_sec;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 613d169eb6b8..72b977f81dd6 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -81,8 +81,8 @@ static struct instruction *next_insn_same_func(struct objtool_file *file,
 	return find_insn(file, func->cfunc->sec, func->cfunc->offset);
 }
 
-static struct instruction *prev_insn_same_sec(struct objtool_file *file,
-					      struct instruction *insn)
+struct instruction *prev_insn_same_sec(struct objtool_file *file,
+				       struct instruction *insn)
 {
 	if (insn->idx == 0) {
 		if (insn->prev_len)
@@ -2028,7 +2028,8 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 	     insn && insn_func(insn) && insn_func(insn)->pfunc == func;
 	     insn = insn->first_jump_src ?: prev_insn_same_sym(file, insn)) {
 
-		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
+		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC &&
+		    insn->gpr == orig_insn->gpr)
 			break;
 
 		/* allow small jumps within the range */
@@ -2038,7 +2039,7 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		     insn->jump_dest->offset > orig_insn->offset))
 		    break;
 
-		table_reloc = arch_find_switch_table(file, insn, &table_size);
+		table_reloc = arch_find_switch_table(file, insn, &table_size, orig_insn);
 		if (!table_reloc)
 			continue;
 
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index e1cd13cd28a3..8b68f840dddb 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -63,8 +63,9 @@ struct instruction {
 	    noendbr		: 1,
 	    unret		: 1,
 	    visited		: 4,
-	    no_reloc		: 1;
-		/* 10 bit hole */
+	    no_reloc		: 1,
+	    gpr			: 5;
+		/* 5 bit hole */
 
 	struct alt_group *alt_group;
 	struct instruction *jump_dest;
@@ -118,6 +119,7 @@ struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset);
 
 struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruction *insn);
+struct instruction *prev_insn_same_sec(struct objtool_file *file, struct instruction *insn);
 
 #define sec_for_each_insn(file, _sec, insn)				\
 	for (insn = find_insn(file, _sec, 0);				\
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index e7ee7ffccefd..aca1f7762f5d 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -39,5 +39,6 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct reloc *reloc);
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
-				     unsigned long *table_size);
+				     unsigned long *table_size,
+				     struct instruction *orig_insn);
 #endif /* _SPECIAL_H */
-- 
2.47.0

