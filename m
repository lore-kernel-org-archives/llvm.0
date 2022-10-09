Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F25C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B191C433B5;
	Sun,  9 Oct 2022 22:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353507;
	bh=cpkR3yihHCyaXTPeQQm/wMJ4ddFUjwbeXWAh0j03wr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eW7JKlrID9L/Bd6K64Y9q6qWgAXIyuZSgHE4oNaGYtTyGK4FGT4/OAAENLYWwVBhU
	 E+T5u6k39acnR27AMjxygW64gAkR8YwbM38rqjqiaM7Gs6TbxUhXVvHYnQgPbnxRKD
	 e7iCSauOGq8zxccU7zoRz/SmNTUvfeeZOuKnGeiFZdoQymWyoIIQnpVu/Xj3W1X2Pg
	 RpoOP+RALoHBWikspyfRCN/vGfQisILTdqKlPjUuYqAQFbAoDebpS/BECuOW3vwtaT
	 GRmoopP2umj+mIcips/t3uZlsRGNlCI3DAHSY7ooRs455TJl46w1xasI0+w6RSC80a
	 2HZvmqcXIM5Ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kgugala@antmicro.com,
	mholenko@antmicro.com,
	joel@jms.id.au,
	ndesaulniers@google.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 48/77] net: ethernet: litex: Fix return type of liteeth_start_xmit
Date: Sun,  9 Oct 2022 18:07:25 -0400
Message-Id: <20221009220754.1214186-48-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009220754.1214186-1-sashal@kernel.org>
References: <20221009220754.1214186-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nathan Huckleberry <nhuck@google.com>

[ Upstream commit 40662333dd7c64664247a6138bc33f3974e3a331 ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of liteeth_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Gabriel Somlo <gsomlo@gmail.com>
Link: https://lore.kernel.org/r/20220912195307.812229-1-nhuck@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/litex/litex_liteeth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/litex/litex_liteeth.c b/drivers/net/ethernet/litex/litex_liteeth.c
index fdd99f0de424..35f24e0f0934 100644
--- a/drivers/net/ethernet/litex/litex_liteeth.c
+++ b/drivers/net/ethernet/litex/litex_liteeth.c
@@ -152,7 +152,8 @@ static int liteeth_stop(struct net_device *netdev)
 	return 0;
 }
 
-static int liteeth_start_xmit(struct sk_buff *skb, struct net_device *netdev)
+static netdev_tx_t liteeth_start_xmit(struct sk_buff *skb,
+				      struct net_device *netdev)
 {
 	struct liteeth *priv = netdev_priv(netdev);
 	void __iomem *txbuffer;
-- 
2.35.1

