Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BD71DDA3B
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981437; cv=none; b=ONGyL3wbgGWHKAFZPPwaZDkSc4xSTiGPbCmAJUUkSjIrSulUSth3M1EAVWbmlE1+NgAC1lFQSljovm4jd+zXVYzooEc4OJsin5uHsw5CZhkneMEh3JZ2ktY2FtVStSLa6t3FT9mlEciHTWgNwAhfJ3tjBzZudFhzZs1MTqH6/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981437; c=relaxed/simple;
	bh=n5PKzA7GDiJ+vIl39yQ9EFUuhqglOyZ5+cDQqSVGCYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYiHpAdTfoJggwzliteaHCnImCvwll6BTAzuGoWJb8Xxvmt3O0k5NMQfWmEWIcOWZ+Z8HjHPokN30yt8LSbmp+zttO8TCK2+RvZrNlCj5KPHiOPxbsFsdSl+E16c6u3lKxn0zzQejOE7fY42T5bpceiIgpUsprRJZ7zCIi2rAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcD37V4z9sRr;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RuBQKud5YVsR; Wed, 15 Jan 2025 23:42:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcD2Npxz9sRk;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DCAA8B77A;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AEhSP7Uv2wGL; Wed, 15 Jan 2025 23:42:52 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15DC18B774;
	Wed, 15 Jan 2025 23:42:49 +0100 (CET)
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
Subject: [PATCH v5 01/15] objtool: Fix generic annotation infrastructure cross build
Date: Wed, 15 Jan 2025 23:42:41 +0100
Message-ID: <0ac0217b174efcefe772822089e9b64ff8c65da3.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1213; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=n5PKzA7GDiJ+vIl39yQ9EFUuhqglOyZ5+cDQqSVGCYs=; b=9nUpCHBH2MuF6kXRB8OESgj5pUg/Vwv9wBjo8aA5eEAfC5w5ABcr8HV2k0ZEnp+s+LP7Gxt50 WQWIL/XE0cwCPiSVvzpusLaUHSL+qQXRPwvYEDKhMfdGh7WefoesJgX
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Cross build for powerpc/32 on x86_64 leads to:

  CC      init/main.o
init/main.o: warning: objtool: early_randomize_kstack_offset+0xf0: Unknown annotation type: 134217728
init/main.o: warning: objtool: start_kernel+0x4a8: Unknown annotation type: 134217728
init/main.o: warning: objtool: do_one_initcall+0x178: Unknown annotation type: 134217728

Fix byte order.

Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New in v5
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e92c5564d9ca..129c4e2245ae 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2272,7 +2272,7 @@ static int read_annotate(struct objtool_file *file,
 	}
 
 	for_each_reloc(sec->rsec, reloc) {
-		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
+		type = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4));
 
 		offset = reloc->sym->offset + reloc_addend(reloc);
 		insn = find_insn(file, reloc->sym->sec, offset);
-- 
2.47.0

