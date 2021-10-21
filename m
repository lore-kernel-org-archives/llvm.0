Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235E2C98
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 21:45:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 849616128E;
	Thu, 21 Oct 2021 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634852743;
	bh=p9AmvMZJ4SxaFh07OaoCvWShpHSr+aSW9gIIO9BOZTw=;
	h=From:To:Cc:Subject:Date:From;
	b=bBwP7OEDsqzTMf/0AYeTWcsEI2uc7slCOGDfx1SHqv+y8tM8uMoMQGhuJK+ZxB7sD
	 wbHLmpP+flWiCh6nDTyPMRKkDTtfI9ga9oGCw+bWgm+07WgeVH0gzqCOBAu8IR0u/k
	 47htRWT7oeJH6GX5mm95sKCeScs59derpi7Mv956FygaUhmOq2aFloG4fvB2uF2JCY
	 hRub63vbT/sot6Ni6/ZBu+nsCkiPheSCEKB5LyR5HYwheGeXS+/+sLx3OsHBTnvAW7
	 FMfu+qKJu9WLSrwyx25Mx4Ep4KRwF1Shb31sD4MSgusno9nhm6s7eKGpDTJFFDR8wd
	 mJwxWdL6RV2+Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] soc/tegra: fuse: Fix bitwise vs. logical OR warning
Date: Thu, 21 Oct 2021 14:45:00 -0700
Message-Id: <20211021214500.2388146-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.1.637.gf443b226ca
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

A new warning in clang points out two instances where boolean
expressions are being used with a bitwise OR instead of logical OR:

drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
                reg = tegra_fuse_read_spare(i) |
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                               ||
drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: note: cast one or both operands to int to silence this warning
drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
                reg = tegra_fuse_read_spare(i) |
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                               ||
drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: note: cast one or both operands to int to silence this warning
2 warnings generated.

The motivation for the warning is that logical operations short circuit
while bitwise operations do not. In this case, it does not seem like
short circuiting is harmful so implement the suggested fix of changing
to a logical operation to fix the warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/1488
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/soc/tegra/fuse/speedo-tegra20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra20.c b/drivers/soc/tegra/fuse/speedo-tegra20.c
index 2546bddbab93..4984246605ae 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra20.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
@@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
 
 	val = 0;
 	for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
-		reg = tegra_fuse_read_spare(i) |
+		reg = tegra_fuse_read_spare(i) ||
 			tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
 		val = (val << 1) | (reg & 0x1);
 	}
@@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
 
 	val = 0;
 	for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
-		reg = tegra_fuse_read_spare(i) |
+		reg = tegra_fuse_read_spare(i) ||
 			tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
 		val = (val << 1) | (reg & 0x1);
 	}

base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.33.1.637.gf443b226ca

