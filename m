Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967C51DD9AC
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981428; cv=none; b=SNO1HGjP2uRgKT6Vld4hPlR1FDotuulRCenG5sPGcHzIZHf/op9jSJOz2nc0M81b/+A5iANaUYIrJsTWG94uVkz8cu11ttcrKanQ927o/7BRiRdXTsuYyogyxlcXmLpgr96jTa5nsC0BPD/9/DlHAAtjWP/+4O7IzeM+w1Bto+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981428; c=relaxed/simple;
	bh=jUmgRhfOUOKcm47vVLJz0Uk+vweVINDmw47p9P553do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J90MH2O0GA2OkkZdLmxxKqjSIsq3Oy24dLaDSlX7R98AMDLWkuOuTDa4KCu5/nN6FMLa1g4xdvR/xIn7IiNKqGd+DFOGLrPoF3ku9xDzHiuI6hiPkWOkZye93u4xKMAz5VzbQg5+3ob7Ce8VsylT5Zl7zMfMaZWhzv1UufTltsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcn297Rz9sSh;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuPRgmlINGTC; Wed, 15 Jan 2025 23:43:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcn13D6z9sSg;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13A798B77A;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TTrr0vm5x28f; Wed, 15 Jan 2025 23:43:20 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E1CBB8B774;
	Wed, 15 Jan 2025 23:43:18 +0100 (CET)
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
Subject: [PATCH v5 12/15] objtool: Add support for more complex UACCESS control
Date: Wed, 15 Jan 2025 23:42:52 +0100
Message-ID: <64a6921ec7bc78c4b25561cf13e8147f26e884a6.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=3081; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jUmgRhfOUOKcm47vVLJz0Uk+vweVINDmw47p9P553do=; b=PvDeZ1WUGIKvE/gRmmck4Oiaz1dQxNwL0Klut/cRBsip4QjA8Cuhi0vktmLlI0qxgq4GTnG0y eXtRWgLdHSeApvZuNEn1PuyKh8XD4VLq3y6BPOz72m6IFeg10tqv7oo
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

On x86, UACCESS is controlled by two instructions: STAC and CLAC.
STAC instruction enables UACCESS while CLAC disables UACCESS.
This is simple enough for objtool to locate UACCESS enable and
disable.

But on powerpc it is a bit more complex, the same instruction is
used for enabling and disabling UACCESS, and the same instruction
can be used for many other things. It would be too complex to use
exclusively instruction decoding.

To help objtool, annotate such instructions, on the same principle as
reachable/unreachable instructions. And add ANNOTATE_UACCESS_BEGIN
and ANNOTATE_UACCESS_END macros to be used in inline assembly code to
annotate UACCESS enable and UACCESS disable instructions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Use generic annotation infrastructure
---
 include/linux/objtool.h             | 3 +++
 include/linux/objtool_types.h       | 2 ++
 tools/include/linux/objtool_types.h | 2 ++
 tools/objtool/check.c               | 8 ++++++++
 4 files changed, 15 insertions(+)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index c722a921165b..7efd731da2a2 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -183,6 +183,9 @@
  */
 #define ANNOTATE_REACHABLE(label)	__ASM_ANNOTATE(label, ANNOTYPE_REACHABLE)
 
+#define ANNOTATE_UACCESS_BEGIN		ASM_ANNOTATE(ANNOTYPE_UACCESS_BEGIN)
+#define ANNOTATE_UACCESS_END		ASM_ANNOTATE(ANNOTYPE_UACCESS_END)
+
 #else
 #define ANNOTATE_NOENDBR		ANNOTATE type=ANNOTYPE_NOENDBR
 #define ANNOTATE_RETPOLINE_SAFE		ANNOTATE type=ANNOTYPE_RETPOLINE_SAFE
diff --git a/include/linux/objtool_types.h b/include/linux/objtool_types.h
index df5d9fa84dba..28da3d989e65 100644
--- a/include/linux/objtool_types.h
+++ b/include/linux/objtool_types.h
@@ -65,5 +65,7 @@ struct unwind_hint {
 #define ANNOTYPE_IGNORE_ALTS		6
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
+#define ANNOTYPE_UACCESS_BEGIN		9
+#define ANNOTYPE_UACCESS_END		10
 
 #endif /* _LINUX_OBJTOOL_TYPES_H */
diff --git a/tools/include/linux/objtool_types.h b/tools/include/linux/objtool_types.h
index df5d9fa84dba..28da3d989e65 100644
--- a/tools/include/linux/objtool_types.h
+++ b/tools/include/linux/objtool_types.h
@@ -65,5 +65,7 @@ struct unwind_hint {
 #define ANNOTYPE_IGNORE_ALTS		6
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
+#define ANNOTYPE_UACCESS_BEGIN		9
+#define ANNOTYPE_UACCESS_END		10
 
 #endif /* _LINUX_OBJTOOL_TYPES_H */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 91436f4b3622..54625f09d831 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2422,6 +2422,14 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
 		insn->dead_end = false;
 		break;
 
+	case ANNOTYPE_UACCESS_BEGIN:
+		insn->type = INSN_STAC;
+		break;
+
+	case ANNOTYPE_UACCESS_END:
+		insn->type = INSN_CLAC;
+		break;
+
 	default:
 		WARN_INSN(insn, "Unknown annotation type: %d", type);
 		break;
-- 
2.47.0

