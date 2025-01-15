Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A765156F57
	for <llvm@lists.linux.dev>; Wed, 15 Jan 2025 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981405; cv=none; b=VnLtNUAg/4R3QXTfcAFUytP8WyR/osVOVyPRRIy7527ZhiEiEmZ7Ug0KxYQh+KSy/d2d2SldD3+b1Knijx4JJ+YGRuwCpJilAL4SCTNH/H9CtEuwHAjgGid/Bakcq8Oim2cEiDAbWWmZ+er8rjcWruunyrhlQVsS91WwADRLrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981405; c=relaxed/simple;
	bh=aQ3xTILH+GfwiY+a8f3LvBKwTjOvpcWTTyPoV8IF2/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8aQNQJ0NytBSLBhJVfX+v7mPNJWj2LRy8B1sKS9qAYX5+RIduHXBIRq37iVsSfh7N6iRr4NBDEV2S/ouLUEt+/AbIFq4/ai+cIB64CGIYRfmIbkcBRX2LrIhwltVC1ys4n4VFRf1diWdk4Yhg98Y5u2suC+ELa2Bs2cXWsobjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcK41Ryz9sS8;
	Wed, 15 Jan 2025 23:42:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cY6dlER2MY5v; Wed, 15 Jan 2025 23:42:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcK3GlMz9sS7;
	Wed, 15 Jan 2025 23:42:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BFE68B77A;
	Wed, 15 Jan 2025 23:42:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3e-6oFIGtkBR; Wed, 15 Jan 2025 23:42:57 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 04B5A8B774;
	Wed, 15 Jan 2025 23:42:54 +0100 (CET)
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
Subject: [PATCH v5 03/15] objtool: Allow an architecture to disable objtool on ASM files
Date: Wed, 15 Jan 2025 23:42:43 +0100
Message-ID: <cd0fcb6c1f0b4b1e8ece9c47dcd57dac9055a17c.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1401; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aQ3xTILH+GfwiY+a8f3LvBKwTjOvpcWTTyPoV8IF2/4=; b=4dGCDIhqCl+/VTvnT0rbYhLt7E29M1UaD3mJ5uLo607oESZPPwq/A0BJNYeJC8ZDV7ofnxa/j ClJ5K0+2XcxDfTIUKR35ErQGeeZo9TtJOcH8aYqVlJEmhZZvmHIhcED
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Supporting objtool on ASM files requires quite an effort.

Features like UACCESS validation don't require ASM files validation.

In order to allow architectures to enable objtool validation
without spending unnecessary effort on cleaning up ASM files,
provide an option to disable objtool validation on ASM files.

Suggested-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/Kconfig         | 5 +++++
 scripts/Makefile.lib | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 6682b2a53e34..137ef643e865 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1305,6 +1305,11 @@ config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 config HAVE_OBJTOOL
 	bool
 
+config ARCH_OBJTOOL_SKIP_ASM
+	bool
+	help
+	  Architecture doesn't support objtool on ASM files
+
 config HAVE_JUMP_LABEL_HACK
 	bool
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da..3c5e6de76b11 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -325,7 +325,11 @@ define rule_cc_o_c
 endef
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
+ifndef CONFIG_ARCH_OBJTOOL_SKIP_ASM
       cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
+else
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+endif
 
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
-- 
2.47.0

