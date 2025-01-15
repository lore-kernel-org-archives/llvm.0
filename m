Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6351DE2BD
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981472; cv=none; b=uCtSpVlCfgtfB8dpTVm/ipvsgpkPumpsuF50vWOU7MWHLtfI96chB0KTDYkq8o4BqKCLXQf02V/F+xBhBw0GBOLpUO6+TgN5QPGVCclJXYqPJL5YfpF25sYgkeSZl+08/tOgNB+Otr9/1uz+k3Hy3Sy3dPzq/HfCMjaq0ttl8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981472; c=relaxed/simple;
	bh=s34YeKjlQMgJ0BPjun7wq17Hk3TXlOThHycw1E0DOE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CO90RL2Q1EfVyWBYrMlLG950pHx9sQj8LoPd/id2lkaF8/9+RRV1Lh1IDn/TSqPxj2X3zWdcuoncXkpWUDWM1zbvoT4vK+G2WaQzjtdr0tZfsOpZNBd3pmSkhdxNejkTygB2SNfRWxBvCBHu6EK4QAq4FFC719OVDHhqIKC7iqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcH0Tmjz9sRy;
	Wed, 15 Jan 2025 23:42:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lk43c_pRbiud; Wed, 15 Jan 2025 23:42:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcG6jFkz9sRs;
	Wed, 15 Jan 2025 23:42:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0BB48B77A;
	Wed, 15 Jan 2025 23:42:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v0ej-sZ1G8Ss; Wed, 15 Jan 2025 23:42:54 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 97C768B774;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
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
Subject: [PATCH v5 02/15] objtool: Move back misplaced comment
Date: Wed, 15 Jan 2025 23:42:42 +0100
Message-ID: <2700fb1284bc4f72bc835911a4ec914083ab88c7.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1950; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=s34YeKjlQMgJ0BPjun7wq17Hk3TXlOThHycw1E0DOE4=; b=FjZMuTKO1BBEU/WNDtvmcSAP87mwnWMHPfelMSZxYWv7DX6+kEpMCzJSD2yYB5uE0Ar+DqUkH CJPdTNqKIY9CRZbyQyxefgC7e5KtjsPtOfvWnYr2wWKft32htJZaqT6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

A comment was introduced by commit 113d4bc90483 ("objtool: Fix
clang switch table edge case") and wrongly moved by
commit d871f7b5a6a2 ("objtool: Refactor jump table code to support
other architectures") without the piece of code added with the
comment in the original commit.

Fixes: d871f7b5a6a2 ("objtool: Refactor jump table code to support other architectures")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/x86/special.c | 5 -----
 tools/objtool/check.c            | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 9c1c9df09aaa..76c7933bcb19 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -142,11 +142,6 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	    strcmp(table_sec->name, C_JUMP_TABLE_SECTION))
 		return NULL;
 
-	/*
-	 * Each table entry has a rela associated with it.  The rela
-	 * should reference text in the same function as the original
-	 * instruction.
-	 */
 	rodata_reloc = find_reloc_by_dest(file->elf, table_sec, table_offset);
 	if (!rodata_reloc)
 		return NULL;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 129c4e2245ae..58d9b1a750e3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2036,6 +2036,12 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		table_reloc = arch_find_switch_table(file, insn, &table_size);
 		if (!table_reloc)
 			continue;
+
+		/*
+		 * Each table entry has a rela associated with it.  The rela
+		 * should reference text in the same function as the original
+		 * instruction.
+		 */
 		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
 		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
 			continue;
-- 
2.47.0

