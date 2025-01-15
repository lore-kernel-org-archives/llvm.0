Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12A21DD894
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981409; cv=none; b=dML2ReqqjQrQRakIGEoXVfYvSosjCbRfywx+MEFESPrQQJ7+jb9F/LkR3zu6TUpv2G8wQyptN17ka3z7G/0veEaS1XhysQqgEdY42ovjJAZzIgbVdHxSYDj1HrTuGfQ0HrFFgDcteCuntnztGjwqD41qD3u+aT7tVX8E9xjaq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981409; c=relaxed/simple;
	bh=AtXgcZWCVAZG0ZZoJAL+afYs9xez+Wa0PGBF3/snVyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hhn2c4meXO+RqrZm5U+/bPHWMCFUWbbaCD//NNSD2GnxRWotxP4J8ReqNneXwtJytNeqoXItpg4QF455OV900UWJF4B8D2hfxJxikTmE1vW2THjKpiN76JfNjRgJOj83JZuw0Kipzas3PeTvSkbhvfcjC8eqKSTZsP2kJF6Cbrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcN15h3z9sSH;
	Wed, 15 Jan 2025 23:43:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVQMaZJXyjmg; Wed, 15 Jan 2025 23:43:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcN0CBlz9sSC;
	Wed, 15 Jan 2025 23:43:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E884F8B77A;
	Wed, 15 Jan 2025 23:42:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Yuwf72boS7Cs; Wed, 15 Jan 2025 23:42:59 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D9BA8B774;
	Wed, 15 Jan 2025 23:42:57 +0100 (CET)
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
Subject: [PATCH v5 04/15] objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
Date: Wed, 15 Jan 2025 23:42:44 +0100
Message-ID: <908df81a11d6d48353a096256f2acdc1833f1cec.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=3047; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AtXgcZWCVAZG0ZZoJAL+afYs9xez+Wa0PGBF3/snVyw=; b=uFyZIHlQUiQ6PHRcVu0ANbt9OkrkHoVXRQu5q7KeplRbinQ0BEFg6fJwnxZNzWZt8ZPNnVXvU 8F8ARmg4IRNBHbCiTjUe3qAJW26UH3ogb/rWzzIfr8VlON8Z0x3X9fq
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

	struct jump_entry {
		s32 code;
		s32 target;
		long key;
	};

It means that the size of the third argument depends on
whether we are building a 32 bits or 64 bits kernel.

Therefore JUMP_ENTRY_SIZE must depend on elf_class_addrsize(elf).

To allow that, entries[] table must be initialised at runtime. This is
easily done by moving it into its only user which is special_get_alts().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 .../arch/powerpc/include/arch/special.h       |  2 +-
 tools/objtool/special.c                       | 55 +++++++++----------
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
index ffef9ada7133..b17802dcf436 100644
--- a/tools/objtool/arch/powerpc/include/arch/special.h
+++ b/tools/objtool/arch/powerpc/include/arch/special.h
@@ -6,7 +6,7 @@
 #define EX_ORIG_OFFSET 0
 #define EX_NEW_OFFSET 4
 
-#define JUMP_ENTRY_SIZE 16
+#define JUMP_ENTRY_SIZE (8 + elf_addr_size(elf)) /* 12 on PPC32, 16 on PPC64 */
 #define JUMP_ORIG_OFFSET 0
 #define JUMP_NEW_OFFSET 4
 #define JUMP_KEY_OFFSET 8
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 097a69db82a0..7780ed8a084a 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -26,34 +26,6 @@ struct special_entry {
 	unsigned char key; /* jump_label key */
 };
 
-static const struct special_entry entries[] = {
-	{
-		.sec = ".altinstructions",
-		.group = true,
-		.size = ALT_ENTRY_SIZE,
-		.orig = ALT_ORIG_OFFSET,
-		.orig_len = ALT_ORIG_LEN_OFFSET,
-		.new = ALT_NEW_OFFSET,
-		.new_len = ALT_NEW_LEN_OFFSET,
-		.feature = ALT_FEATURE_OFFSET,
-	},
-	{
-		.sec = "__jump_table",
-		.jump_or_nop = true,
-		.size = JUMP_ENTRY_SIZE,
-		.orig = JUMP_ORIG_OFFSET,
-		.new = JUMP_NEW_OFFSET,
-		.key = JUMP_KEY_OFFSET,
-	},
-	{
-		.sec = "__ex_table",
-		.size = EX_ENTRY_SIZE,
-		.orig = EX_ORIG_OFFSET,
-		.new = EX_NEW_OFFSET,
-	},
-	{},
-};
-
 void __weak arch_handle_alternative(unsigned short feature, struct special_alt *alt)
 {
 }
@@ -144,6 +116,33 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
 	unsigned int nr_entries;
 	struct special_alt *alt;
 	int idx, ret;
+	const struct special_entry entries[] = {
+		{
+			.sec = ".altinstructions",
+			.group = true,
+			.size = ALT_ENTRY_SIZE,
+			.orig = ALT_ORIG_OFFSET,
+			.orig_len = ALT_ORIG_LEN_OFFSET,
+			.new = ALT_NEW_OFFSET,
+			.new_len = ALT_NEW_LEN_OFFSET,
+			.feature = ALT_FEATURE_OFFSET,
+		},
+		{
+			.sec = "__jump_table",
+			.jump_or_nop = true,
+			.size = JUMP_ENTRY_SIZE,
+			.orig = JUMP_ORIG_OFFSET,
+			.new = JUMP_NEW_OFFSET,
+			.key = JUMP_KEY_OFFSET,
+		},
+		{
+			.sec = "__ex_table",
+			.size = EX_ENTRY_SIZE,
+			.orig = EX_ORIG_OFFSET,
+			.new = EX_NEW_OFFSET,
+		},
+		{},
+	};
 
 	INIT_LIST_HEAD(alts);
 
-- 
2.47.0

