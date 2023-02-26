Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A129A9
	for <llvm@lists.linux.dev>; Sun, 26 Feb 2023 14:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0846C4339B;
	Sun, 26 Feb 2023 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677422748;
	bh=uWz/X985SxdYJil3gvKDScsqPZntTshRERdo9etL7+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SzlSi3rd+J6825ysLsaOLZ57dMq+Lp964BXW3SrfiuFVtti+3ENGvrA4bb7NsjwqH
	 bruDOsHHB5+ijx/Aj2inMIEmXLZZdb60r7pefx6/4yFReX86L1fx3akfq/XadX9KLE
	 SkAr7dQA7pMsYQAa0YGS5GZ+wkTYLKzJQa2gwA9d8xAAmUx6DpPYYnU82tFQDS+vqR
	 tlPcInMrfuSHtKKNVib7owM72EUnlAu7QGebXDJCs4tmpj52sRnLc4A3yj2CiryjdP
	 VAkY5TDaupq+RE8A5OHO/56R+D2tO+Kd1KdjjsUnikiwBw/dVgCVxB6fpJqnd/l5O3
	 6sOYDHF8PX8Ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>,
	ndesaulniers@google.com,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.2 25/53] crypto: hisilicon: Wipe entire pool on error
Date: Sun, 26 Feb 2023 09:44:17 -0500
Message-Id: <20230226144446.824580-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144446.824580-1-sashal@kernel.org>
References: <20230226144446.824580-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

[ Upstream commit aa85923a954e7704bc9d3847dabeb8540aa98d13 ]

To work around a Clang __builtin_object_size bug that shows up under
CONFIG_FORTIFY_SOURCE and UBSAN_BOUNDS, move the per-loop-iteration
mem_block wipe into a single wipe of the entire pool structure after
the loop.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1780
Cc: Weili Qian <qianweili@huawei.com>
Cc: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Link: https://lore.kernel.org/r/20230106041945.never.831-kees@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/hisilicon/sgl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/hisilicon/sgl.c b/drivers/crypto/hisilicon/sgl.c
index 2b6f2281cfd6c..0974b00414050 100644
--- a/drivers/crypto/hisilicon/sgl.c
+++ b/drivers/crypto/hisilicon/sgl.c
@@ -124,9 +124,8 @@ struct hisi_acc_sgl_pool *hisi_acc_create_sgl_pool(struct device *dev,
 	for (j = 0; j < i; j++) {
 		dma_free_coherent(dev, block_size, block[j].sgl,
 				  block[j].sgl_dma);
-		memset(block + j, 0, sizeof(*block));
 	}
-	kfree(pool);
+	kfree_sensitive(pool);
 	return ERR_PTR(-ENOMEM);
 }
 EXPORT_SYMBOL_GPL(hisi_acc_create_sgl_pool);
-- 
2.39.0

