Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44D5C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4325EC433C1;
	Sun,  9 Oct 2022 22:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665354321;
	bh=t3CbAvrhrhpg1JmKI57AiF0gIHfjBlBOUt+MDyXOzIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EuLPUuYAaS3bfuz1Au7Yy0xh4on10yGh2tJANQoWsmqx89BdhN/Rxa8itO9T18KmM
	 6bvjx7Rjd/Tnqrk9RjM+wnhVQ0S+y8f2QSJmSQ0D8ysvHORm2xzBXkK8b0aow/0cm7
	 9RMymGXWo2yEtVjdnyGUK99ksoPZahEuE/UAACkBlUDmNc1Z1qp1SKN1vBI6Jcf0lM
	 OHemKu39MHLl1ZH0/VjJO/+KHoRN0N8e683J+ClnqezkvBCAGUTiD8I7SzXQg8T4B9
	 KIXuy1mN9LSYrvdCsdjbcziYNbVIRHv+cmYfGqeVzJ893ND+PvPTrHt922EtrZ0Rlk
	 HdbwBDkzttJQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	ndesaulniers@google.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	geoff@infradead.org,
	shayagr@amazon.com,
	bigunclemax@gmail.com,
	chi.minghao@zte.com.cn,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/25] net: ethernet: ti: davinci_emac: Fix return type of emac_dev_xmit
Date: Sun,  9 Oct 2022 18:24:18 -0400
Message-Id: <20221009222436.1219411-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009222436.1219411-1-sashal@kernel.org>
References: <20221009222436.1219411-1-sashal@kernel.org>
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

[ Upstream commit 5972ca946098487c5155fe13654743f9010f5ed5 ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of emac_dev_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20220912195023.810319-1-nhuck@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ti/davinci_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 566da1e3cfbc..337e38b98d69 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -955,7 +955,7 @@ static void emac_tx_handler(void *token, int len, int status)
  *
  * Returns success(NETDEV_TX_OK) or error code (typically out of desc's)
  */
-static int emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
+static netdev_tx_t emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	struct device *emac_dev = &ndev->dev;
 	int ret_code;
-- 
2.35.1

