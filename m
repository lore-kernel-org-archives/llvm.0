Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A82C82
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 21:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7A2C340E3;
	Thu, 20 Jan 2022 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642714814;
	bh=RK4Wx98CLevcla/neFB51ar1oynVV09cZXlwV/iBl0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCEpVAnxHTlYlDlnSydVPYCOExOZSkkZhdu2Z+23XnUf2NGCzgQvV5rbNiDdcHgkc
	 zR0GdGJlKW0vIpkdwUgb3P940t99p88zslzsE237+o5IlakNO6DtK8+8KOxlLxb5I/
	 5CY5z8mHvg5Dx7Ro3l87/0hpuLWuZB3T0q1/3bir7TRkUjw7BFhBlhK7V389inaArG
	 IOzZd5LK6sJkwRfeznFpz1bPRCmWzbbqpjPP+Mid/STD729IGJOmuecNbzNssv0BQ8
	 uPmY9Ogw+6Kl4Tre5MmlD8DDuMCPZbi8ef2uC+yiZI8pdWCabxx4CE0yvwAmhY4PQg
	 18KSRheaLuDGw==
From: Nathan Chancellor <nathan@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 2/2] MIPS: Loongson64: Wrap -mno-branch-likely with cc-option
Date: Thu, 20 Jan 2022 14:40:01 -0700
Message-Id: <20220120214001.1879469-2-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120214001.1879469-1-nathan@kernel.org>
References: <20220120214001.1879469-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag is not supported by clang, which results in a warning:

  clang-14: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]

This breaks cc-option, which adds -Werror to make this warning fatal and
catch flags that are not supported. Wrap the flag in cc-option so that
it does not cause cc-option to fail, which can cause randconfigs to be
really noisy.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/loongson64/Platform | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index 981d3abc150e..acf9edc9b15d 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -26,5 +26,6 @@ cflags-y += $(call cc-option,-mno-loongson-mmi)
 # Loongson Machines' Support
 #
 
-cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
+cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64
+cflags-$(CONFIG_MACH_LOONGSON64) += $(call cc-option,-mno-branch-likely)
 load-$(CONFIG_CPU_LOONGSON64) += 0xffffffff80200000
-- 
2.34.1

