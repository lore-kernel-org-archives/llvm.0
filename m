Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505F41DE8BA
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981450; cv=none; b=qGOU0MFMhO4puJarMcAe9Z//wPOJzja8lRY4vEL/H8aCEs2R02T36HegW8KFYze5IiG3I2Oo4xOXTPnxjrohbXd7WO1Fmw6dpJvR0JhRLqoX4u1eLMYRJboDKuIc36kAlinL8RsMdK6OdhElT3fJ1cwhyb6c7x+YLZZ9rXPaAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981450; c=relaxed/simple;
	bh=buhY3GoC0LGY1HUaDu1bTWqVjA42DPm4i5qlmE4s1Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDMjMJvXFaTKQQntQJseThlGOaROVXsDb0DTRh3FYBOJZBWM+pPXbE2OFnEPsLKDs1qx/0J18L0MfIud3GTxVJTTbgGHSjF+mWK5ZMUAxDxE4hNb9We6yQ78na0YGc2mvK9FT+vJUmPzqJx9MbaZsk5aiAL9jumrstsfnQ1YWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLct50S8z9sSq;
	Wed, 15 Jan 2025 23:43:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzmB7gqQMCTP; Wed, 15 Jan 2025 23:43:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLct3ptxz9sSn;
	Wed, 15 Jan 2025 23:43:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F3AF8B77A;
	Wed, 15 Jan 2025 23:43:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xL4HBP5zkE8F; Wed, 15 Jan 2025 23:43:26 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08F088B774;
	Wed, 15 Jan 2025 23:43:23 +0100 (CET)
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
Subject: [PATCH v5 14/15] powerpc/bug: Annotate reachable after warning trap
Date: Wed, 15 Jan 2025 23:42:54 +0100
Message-ID: <25e776852c18471a78dca172c6253e16e8d28c51.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=2325; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=buhY3GoC0LGY1HUaDu1bTWqVjA42DPm4i5qlmE4s1Nc=; b=Zzx0LN7CaVkiZJDwdxeV+ibCLDFY96znMCMxLBDAlvwLJ2kQLdeuupSEGG4ZBBiXYwNYUUDFV Q5UGbSOaXY1D8KkUN/X3yxxwGstc0o5rsND8gM0oXshr0I9HPzvQNOo
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

This commit is copied from commit bfb1a7c91fb7 ("x86/bug: Merge
annotate_reachable() into _BUG_FLAGS() asm")

'twi 31,0,0' is a BUG instruction, which is by default a dead end.

But the same instruction is used for WARNINGs and the execution
resumes with the following instruction. Mark it reachable so
that objtool knows that it is not a dead end in that case.

Also change the unreachable() annotation by __builtin_unreachable()
since objtool already knows that a BUG instruction is a dead end.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/bug.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1db485aacbd9..c41e9f903b5b 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -4,6 +4,7 @@
 #ifdef __KERNEL__
 
 #include <asm/asm-compat.h>
+#include <linux/objtool.h>
 
 #ifdef CONFIG_BUG
 
@@ -51,10 +52,11 @@
 	".previous\n"
 #endif
 
-#define BUG_ENTRY(insn, flags, ...)			\
+#define BUG_ENTRY(insn, flags, extra, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
+		extra					\
 		: : "i" (__FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
@@ -67,12 +69,12 @@
  */
 
 #define BUG() do {						\
-	BUG_ENTRY("twi 31, 0, 0", 0);				\
-	unreachable();						\
+	BUG_ENTRY("twi 31, 0, 0", 0, "");			\
+	__builtin_unreachable();				\
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
+#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), ANNOTATE_REACHABLE(1b))
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -80,7 +82,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "", "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -92,7 +94,7 @@
 	} else {						\
 		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-			  "r" (__ret_warn_on));	\
+			  "", "r" (__ret_warn_on));	\
 	}							\
 	unlikely(__ret_warn_on);				\
 })
-- 
2.47.0

