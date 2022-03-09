Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D915127
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54141C340E8;
	Wed,  9 Mar 2022 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646863898;
	bh=HmvsiGSQjiI2xl+jRt4WuuLlCbjPYieEVzKyv095jlE=;
	h=From:To:Cc:Subject:Date:From;
	b=tXQ9MrxxiOVy0rvnjrr+4mCAfLwOshejb+bZvqHFsZ7PzD/IYjZaB308J3WYkBfXl
	 IsDrgMLZBIeJgm+ySMqyQ9fcP8YfCQx0DP61pj8nPEfeTsk1DTyEBKnWoHtZvgv+FU
	 dtDdngC1UoDgsugR9qvosbWHo4KIjIDXa1JNCxPKWMXvUajcBF9lZ9qdtW1F+mHkND
	 XW3z9/ItiXaOMcsXolyFUal6uzgRMK7+JsdwKa4lAW+jOAiDhJo2+mWWQ2DGbEQ30r
	 TftbIrZ+JYmobAG0qQ62IGHS4dcBCQyVVpJjfEcNQq4ks5X87TYGuB7MzjPt0/HKoy
	 1CnAHJ2ZM1kcQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: Do not use NOCROSSREFS directive with ld.lld
Date: Wed,  9 Mar 2022 15:07:27 -0700
Message-Id: <20220309220726.1525113-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ld.lld does not support the NOCROSSREFS directive at the moment, which
breaks the build after commit b9baf5c8c5c3 ("ARM: Spectre-BHB
workaround"):

  ld.lld: error: ./arch/arm/kernel/vmlinux.lds:34: AT expected, but got NOCROSSREFS

Support for this directive will eventually be implemented, at which
point a version check can be added. To avoid breaking the build in the
meantime, just define NOCROSSREFS to nothing when using ld.lld, with a
link to the issue for tracking.

Cc: stable@vger.kernel.org
Fixes: b9baf5c8c5c3 ("ARM: Spectre-BHB workaround")
Link: https://github.com/ClangBuiltLinux/linux/issues/1609
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

Since b9baf5c8c5c3 has been backported to stable, I have marked this for
stable as well, using a Fixes tag to notate that this should go back to
all releases that have b9baf5c8c5c3, not to indicate any blame of
b9baf5c8c5c3, as this is clearly an ld.lld deficiency.

It would be nice if this could be applied directly to unblock our CI if
there are no objections.

 arch/arm/include/asm/vmlinux.lds.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/include/asm/vmlinux.lds.h b/arch/arm/include/asm/vmlinux.lds.h
index 0ef21bfae9f6..fad45c884e98 100644
--- a/arch/arm/include/asm/vmlinux.lds.h
+++ b/arch/arm/include/asm/vmlinux.lds.h
@@ -26,6 +26,14 @@
 #define ARM_MMU_DISCARD(x)	x
 #endif
 
+/*
+ * ld.lld does not support NOCROSSREFS:
+ * https://github.com/ClangBuiltLinux/linux/issues/1609
+ */
+#ifdef CONFIG_LD_IS_LLD
+#define NOCROSSREFS
+#endif
+
 /* Set start/end symbol names to the LMA for the section */
 #define ARM_LMA(sym, section)						\
 	sym##_start = LOADADDR(section);				\

base-commit: e7e19defa57580d679bf0d03f8a34933008a7930
-- 
2.35.1

