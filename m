Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A857C1DDC08
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981442; cv=none; b=oAmT6NwN/ZhK3a+3alFsbm0y942XqtcG5ujwcd5tJG5l2fpBg9gRP75RsPBAAFiVIHd95ne9I/yRYiCTxghIe1P0ZSeqxCBfl5pQxFSfGIa17Kl3bRJlJiF0+33vHFRiSt6hTJqSOpCDCfq6bRm1irdX8zkFLna6N/Rlr9jUoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981442; c=relaxed/simple;
	bh=5NdIHm7DD4bTebG2kf3cj71x6eBUoq5xTfa2EU+XO1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqXWpZUY/if8M9s8ibpxXTr0JyZoyUFXz5xE6/qqgupo5gKvSBUyQGJFLTJt1aRRl4M2QL7JCCqvL64occvwSJLnjHFlVnMgk8LqR7llp531I9MoyRv9S8CQ+0QJ61xhcY7GAlUdMgR9rodhoHtLfksEGcMNopZ4O/YpprvAXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcd2pn8z9sSY;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdYktiID7W5v; Wed, 15 Jan 2025 23:43:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcd1v6Vz9sSX;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F7B08B77A;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Kex8_2sVL1dd; Wed, 15 Jan 2025 23:43:13 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BAC938B774;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
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
Subject: [PATCH v5 09/15] objtool: Find end of switch table directly
Date: Wed, 15 Jan 2025 23:42:49 +0100
Message-ID: <3e31a9910c471ad9c17b76a96cc910e7a8aa2a10.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=3780; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5NdIHm7DD4bTebG2kf3cj71x6eBUoq5xTfa2EU+XO1s=; b=BcAyjkvv2GQlZ+Fyl9KJ+tQwNqAdeIWlAHl9O6Ty4zCgkXVj/S8xZQe1aKUxm5oF0FDMbJc7W JOP1Tx9G/avATVxQ3jZE7d6jRzv5jFdeUmD+Jmkmbse21bYHCv8HrCo
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

At the time being, the end of a switch table can only be known
once the start of the following switch table has ben located.

This is a problem when switch tables are nested because until the first
switch table is properly added, the second one cannot be located as a
the backward walk will abut on the dynamic switch of the previous one.

So perform a first forward walk in the code in order to locate all
possible relocations to switch tables and build a local table with
those relocations. Later on once one switch table is found, go through
this local table to know where next switch table starts.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 63 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 72b977f81dd6..0ad2bdd92232 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2058,14 +2058,30 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 	}
 }
 
+static struct reloc *find_next_table(struct instruction *insn,
+				     struct reloc **table, unsigned int size)
+{
+	unsigned long offset = reloc_offset(insn_jump_table(insn));
+	int i;
+	struct reloc *reloc = NULL;
+
+	for (i = 0; i < size; i++) {
+		if (reloc_offset(table[i]) > offset &&
+		    (!reloc || reloc_offset(table[i]) < reloc_offset(reloc)))
+			reloc = table[i];
+	}
+	return reloc;
+}
+
 /*
  * First pass: Mark the head of each jump table so that in the next pass,
  * we know when a given jump table ends and the next one starts.
  */
 static int mark_add_func_jump_tables(struct objtool_file *file,
-				     struct symbol *func)
+				     struct symbol *func,
+				     struct reloc **table, unsigned int size)
 {
-	struct instruction *insn, *last = NULL, *insn_t1 = NULL, *insn_t2;
+	struct instruction *insn, *last = NULL;
 	int ret = 0;
 
 	func_for_each_insn(file, func, insn) {
@@ -2094,23 +2110,11 @@ static int mark_add_func_jump_tables(struct objtool_file *file,
 		if (!insn_jump_table(insn))
 			continue;
 
-		if (!insn_t1) {
-			insn_t1 = insn;
-			continue;
-		}
-
-		insn_t2 = insn;
-
-		ret = add_jump_table(file, insn_t1, insn_jump_table(insn_t2));
+		ret = add_jump_table(file, insn, find_next_table(insn, table, size));
 		if (ret)
 			return ret;
-
-		insn_t1 = insn_t2;
 	}
 
-	if (insn_t1)
-		ret = add_jump_table(file, insn_t1, NULL);
-
 	return ret;
 }
 
@@ -2123,15 +2127,42 @@ static int add_jump_table_alts(struct objtool_file *file)
 {
 	struct symbol *func;
 	int ret;
+	struct instruction *insn;
+	unsigned int size = 0, i = 0;
+	struct reloc **table = NULL;
 
 	if (!file->rodata)
 		return 0;
 
+	for_each_insn(file, insn) {
+		struct instruction *dest_insn;
+		struct reloc *reloc;
+		unsigned long table_size;
+
+		func = insn_func(insn) ? insn_func(insn)->pfunc : NULL;
+		reloc = arch_find_switch_table(file, insn, &table_size, NULL);
+		/*
+		 * Each table entry has a rela associated with it.  The rela
+		 * should reference text in the same function as the original
+		 * instruction.
+		 */
+		if (!reloc)
+			continue;
+		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
+			continue;
+		if (i == size) {
+			size += 1024;
+			table = realloc(table, size * sizeof(*table));
+		}
+		table[i++] = reloc;
+	}
+
 	for_each_sym(file, func) {
 		if (func->type != STT_FUNC)
 			continue;
 
-		ret = mark_add_func_jump_tables(file, func);
+		ret = mark_add_func_jump_tables(file, func, table, i);
 		if (ret)
 			return ret;
 	}
-- 
2.47.0

