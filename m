Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF825C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 20:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615D5C433D7;
	Sun,  9 Oct 2022 20:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665348838;
	bh=/OXXMxHwFAPpWYWH3Twq50RGB1+01cfTvXGSwWG1oCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6kmZYhzjVOfcHWKDS8MPdqFsfMzKmNIvaTv7jBXhTrBke/rHeSW1kjUOn6eY6ScP
	 3cJskZ6hBxucci7Gi9QdZHHe/P4b0ig2x+bF1Jy9z+xCNsQuB5TFlx5lnbbMjS8mgl
	 Q8/WP6Z7ha+MA1sNPYBMFSm2OFv5N+U9fdM13Wvv8uSOaznTYa5CT80r3eAeA37KX/
	 SlPmPegLb1R/qSbTsmKgpgDh7HPnkw17CJTf+d1kQGE0ltPc1JcgPGhjqUsSfseaIY
	 YkIDG1bfNX3wmvxiewNPJJamXCrN6LMWShIs2kh0VUx1drQqPAIsqX7ZgPXOiPrpIB
	 o/2FPq4OHLBFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.10 04/10] MIPS: BCM47XX: Cast memcmp() of function to (void *)
Date: Sun,  9 Oct 2022 16:53:43 -0400
Message-Id: <20221009205350.1203176-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009205350.1203176-1-sashal@kernel.org>
References: <20221009205350.1203176-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 0dedcf6e3301836eb70cfa649052e7ce4fcd13ba ]

Clang is especially sensitive about argument type matching when using
__overloaded functions (like memcmp(), etc). Help it see that function
pointers are just "void *". Avoids this error:

arch/mips/bcm47xx/prom.c:89:8: error: no matching function for call to 'memcmp'
                   if (!memcmp(prom_init, prom_init + mem, 32))
                        ^~~~~~
include/linux/string.h:156:12: note: candidate function not viable: no known conversion from 'void (void)' to 'const void *' for 1st argument extern int memcmp(const void *,const void *,__kernel_size_t);

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202209080652.sz2d68e5-lkp@intel.com
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/bcm47xx/prom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 3e2a8166377f..22509b5fab74 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -86,7 +86,7 @@ static __init void prom_init_mem(void)
 			pr_debug("Assume 128MB RAM\n");
 			break;
 		}
-		if (!memcmp(prom_init, prom_init + mem, 32))
+		if (!memcmp((void *)prom_init, (void *)prom_init + mem, 32))
 			break;
 	}
 	lowmem = mem;
@@ -163,7 +163,7 @@ void __init bcm47xx_prom_highmem_init(void)
 
 	off = EXTVBASE + __pa(off);
 	for (extmem = 128 << 20; extmem < 512 << 20; extmem <<= 1) {
-		if (!memcmp(prom_init, (void *)(off + extmem), 16))
+		if (!memcmp((void *)prom_init, (void *)(off + extmem), 16))
 			break;
 	}
 	extmem -= lowmem;
-- 
2.35.1

