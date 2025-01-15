Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855661DE3BF
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981423; cv=none; b=fVxDErhcAYRPXWW5vr2bsTD8l6wApKKY4QsR2cfskATAVbwfUTN+HCxypF0NrDIrUsNnLmetqaCrEismC5Wsibf8lNNInKt3cGH61sZcNOHs2xO+RJujKiL9N0Dg5ZAziM+C4f61oWEcyPoDUZzkyuuniHDRPmhBM/ZVxCw9hmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981423; c=relaxed/simple;
	bh=Y/lU/ClBPP266lfq5TBMJ0Mc7FqwzIGQ/ba4ZqZNO8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpXFl4kkgSKjgjTWcpF1x6XDYZsaZjSP+XsiDHnMCNtLHNQPse/LzpXezAcDoar2L+ZIhoVkM1JY5IPL8nRT9/WIRd+9QVS9ufPKjzIKoL/RjMlqstKTabT60N+/pi+nRO9rsutaBmlkHD4Rq1rd7sixeoMgkZcnIxw/+MxdY8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcX29s1z9sST;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwAN_bvuo6ta; Wed, 15 Jan 2025 23:43:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcX1QY9z9sSS;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FE798B77A;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MyG2dnFOf3Vo; Wed, 15 Jan 2025 23:43:08 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B1A9B8B774;
	Wed, 15 Jan 2025 23:43:05 +0100 (CET)
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
Subject: [PATCH v5 07/15] objtool: Merge mark_func_jump_tables() and add_func_jump_tables()
Date: Wed, 15 Jan 2025 23:42:47 +0100
Message-ID: <98a12e927d23a817a11b2ad9cdf209f64be53567.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1841; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y/lU/ClBPP266lfq5TBMJ0Mc7FqwzIGQ/ba4ZqZNO8o=; b=ihN06500jJgWzVltSkCjOOw0Dd4+kOXr7vMofNesf4gxw29RG1Dve/n4b9Uq1ABgP/9Hcf40A hlXu1vJuIUlDCYzDGUJfz3m6xFv9AAZZI5W6raZIDtyeCgjot3kjjjB
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Those two functions loop over the instructions of a function.
Merge the two loops in order to ease enhancement of table end
in a following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4495e7823b29..613d169eb6b8 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2061,10 +2061,11 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
  * First pass: Mark the head of each jump table so that in the next pass,
  * we know when a given jump table ends and the next one starts.
  */
-static void mark_func_jump_tables(struct objtool_file *file,
-				    struct symbol *func)
+static int mark_add_func_jump_tables(struct objtool_file *file,
+				     struct symbol *func)
 {
-	struct instruction *insn, *last = NULL;
+	struct instruction *insn, *last = NULL, *insn_t1 = NULL, *insn_t2;
+	int ret = 0;
 
 	func_for_each_insn(file, func, insn) {
 		if (!last)
@@ -2088,16 +2089,7 @@ static void mark_func_jump_tables(struct objtool_file *file,
 			continue;
 
 		find_jump_table(file, func, insn);
-	}
-}
 
-static int add_func_jump_tables(struct objtool_file *file,
-				  struct symbol *func)
-{
-	struct instruction *insn, *insn_t1 = NULL, *insn_t2;
-	int ret = 0;
-
-	func_for_each_insn(file, func, insn) {
 		if (!insn_jump_table(insn))
 			continue;
 
@@ -2138,8 +2130,7 @@ static int add_jump_table_alts(struct objtool_file *file)
 		if (func->type != STT_FUNC)
 			continue;
 
-		mark_func_jump_tables(file, func);
-		ret = add_func_jump_tables(file, func);
+		ret = mark_add_func_jump_tables(file, func);
 		if (ret)
 			return ret;
 	}
-- 
2.47.0

