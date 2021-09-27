Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6272
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 09:38:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2650161157;
	Mon, 27 Sep 2021 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632735487;
	bh=r3unqzpj0fOYnSoUg73JGoF/nR4E/IrF3UzNJJ94Uo0=;
	h=From:To:Cc:Subject:Date:From;
	b=nOGLAXutnF5xHS+z4e+lVuOVwFQVbpfJgMEeXfRc0oKyftVekmdLpju/822dj9Bkz
	 Y4CAR9PqjBSnWf36ZSUQ1ANnc/U0aI6mVlbkoVoxgNlMKz7RTunvfXCYu3XECMBe7V
	 Fl03K7orN2moG2+rvewTgJlElMXTHirV9FQpv7MoC8RzxktNPeY++odzjn9RwfZ2r+
	 U59jA5Uf4scfxk2xdZ0GM6vwbHwlGzBEhCF5B2/rcNU97Mud4JDcndVGBt99aYSboA
	 /Mr7fEhhl9MLByyRfQYSeLq7pa8GgG8g+BQR9QiUpyIZa2ySlxBtRwUmcxRcBOqrRq
	 B4MDgsuiAVI+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] am65-cpsw: avoid null pointer arithmetic
Date: Mon, 27 Sep 2021 11:37:57 +0200
Message-Id: <20210927093803.474510-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang warns about arithmetic on NULL pointers:

drivers/net/ethernet/ti/am65-cpsw-ethtool.c:71:2: error: performing pointer subtraction with a null pointer has undefined behavior [-Werror,-Wnull-pointer-subtraction]
        AM65_CPSW_REGDUMP_REC(AM65_CPSW_REGDUMP_MOD_NUSS, 0x0, 0x1c),
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/ti/am65-cpsw-ethtool.c:64:29: note: expanded from macro 'AM65_CPSW_REGDUMP_REC'
        .hdr.len = (((u32 *)(end)) - ((u32 *)(start)) + 1) * sizeof(u32) * 2 + \
                                   ^ ~~~~~~~~~~~~~~~~

The expression here is easily changed to a calculation based on integers
that is no less readable.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
index 6e4d4f9e32e0..b05de9b61ad6 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
@@ -61,7 +61,7 @@ struct am65_cpsw_regdump_item {
 
 #define AM65_CPSW_REGDUMP_REC(mod, start, end) { \
 	.hdr.module_id = (mod), \
-	.hdr.len = (((u32 *)(end)) - ((u32 *)(start)) + 1) * sizeof(u32) * 2 + \
+	.hdr.len = (end + 4 - start) * 2 + \
 		   sizeof(struct am65_cpsw_regdump_hdr), \
 	.start_ofs = (start), \
 	.end_ofs = end, \
-- 
2.29.2

