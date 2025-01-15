Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDFF1DDC1D
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981446; cv=none; b=IWsSJbUhprBPGNDS8Cd4pGDFO/wiCbZ0B5czjAvPQprJuVm3SUnylnPDoGxDS5Zc6Aw3X5wTqCv0PJIYZL69XyCW7x3MsJfQnb+kbVVQpVUKczgbSObJ0xp9W2r+FAYavrfOMBmKlAvtcgZtvlcxboVfO+P8haByrHdcg3JrLxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981446; c=relaxed/simple;
	bh=JuwlSgEwF/YR6LrF/3dyTUkenLYF1P/hJhBSM22DTYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcBKO4eML3BHv/rHewI0J//kGQqiF9ezUWwNkO4yzEx8NZK9ESGK5dBDKJg/JtgU8wUzXB/aYOi+HEIfkvnSK4V3yP1lflezaRY0Fi9DfS2OT7CZJlAnX7MOyGNdf8hXfmMMoPatH4r4nvh+s7pDWzG+IOo/belu7gkO8MhOHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcg4pRZz9sSc;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdwoUHxHyRny; Wed, 15 Jan 2025 23:43:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcg43nvz9sSZ;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 75C5F8B77A;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3fVrbZ-f6jS4; Wed, 15 Jan 2025 23:43:15 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 498838B774;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
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
Subject: [PATCH v5 10/15] objtool: When looking for switch tables also follow conditional and dynamic jumps
Date: Wed, 15 Jan 2025 23:42:50 +0100
Message-ID: <a191a5fb599889c3c64489adaf6adfe38746035d.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=1637; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JuwlSgEwF/YR6LrF/3dyTUkenLYF1P/hJhBSM22DTYs=; b=6n79kSoRqJEkcLY6Y1MpivBmSAT/lzEzZyAMGNN3v6mvPqEx/uoTD+ysqCfWtDqZDQCsWhr20 HH+SYrmEjHED2JmmWjRWWspBKF4dphfKId01AsZ6iKYLf6WU0zSih5j
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

When walking backward to find the base address of a switch table,
also take into account conditionnal branches and dynamic jumps from
a previous switch table.

To avoid mis-routing, break when stumbling on a function return.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 0ad2bdd92232..87b81d8e01c0 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1998,6 +1998,8 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		alt->next = insn->alts;
 		insn->alts = alt;
 		prev_offset = reloc_offset(reloc);
+		if (!dest_insn->first_jump_src)
+			dest_insn->first_jump_src = insn;
 	}
 
 	if (!prev_offset) {
@@ -2032,6 +2034,9 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		    insn->gpr == orig_insn->gpr)
 			break;
 
+		if (insn->type == INSN_RETURN)
+			break;
+
 		/* allow small jumps within the range */
 		if (insn->type == INSN_JUMP_UNCONDITIONAL &&
 		    insn->jump_dest &&
@@ -2093,8 +2098,7 @@ static int mark_add_func_jump_tables(struct objtool_file *file,
 		 * that find_jump_table() can back-track using those and
 		 * avoid some potentially confusing code.
 		 */
-		if (insn->type == INSN_JUMP_UNCONDITIONAL && insn->jump_dest &&
-		    insn->offset > last->offset &&
+		if (is_static_jump(insn) && insn->jump_dest &&
 		    insn->jump_dest->offset > insn->offset &&
 		    !insn->jump_dest->first_jump_src) {
 
-- 
2.47.0

