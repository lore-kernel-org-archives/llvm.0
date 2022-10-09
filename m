Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A835C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20DAC433C1;
	Sun,  9 Oct 2022 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353871;
	bh=ogt3V7+LBk8Gdt6iLASjve7CAKDWMDuO9ZpCqoRCGro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLvwEizf6EyvxkyX4pTm6p7EOULUwi4UP20MufbiJo5ZZ4beo8WJTlZPik3qzra27
	 QP//xckQij/Z1UcwTF1Dnb0XQZ1M6qdHPLHn/re9gI2PXjmAd28kdPC3xtqf8yk+vU
	 taaWRgI4nZYiPdALvlC1fSuIj1UbN0/55ebCfN9+A+VBWmKiQeh8yCyRXdN4jmGhXe
	 EubtzePuxUzbzjIzjN7RI8cAtd/orN0yAtQFsirJlP1/sxydtauapD1atJ75hm7HNe
	 adTHOjdmiOT3RxoaC6lH+oaY7aPH74uy13vIpTH7JmGjuLwCbbE2pvqvbJkuZ+MGTp
	 L9rtetQALEH9w==
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
	shayagr@amazon.com,
	geoff@infradead.org,
	thomas.lendacky@amd.com,
	wsa+renesas@sang-engineering.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 46/73] net: korina: Fix return type of korina_send_packet
Date: Sun,  9 Oct 2022 18:14:24 -0400
Message-Id: <20221009221453.1216158-46-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221453.1216158-1-sashal@kernel.org>
References: <20221009221453.1216158-1-sashal@kernel.org>
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

[ Upstream commit 106c67ce46f3c82dd276e983668a91d6ed631173 ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of korina_send_packet should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20220912214344.928925-1-nhuck@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/korina.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index df9a8eefa007..eec6a9ec528b 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -416,7 +416,8 @@ static void korina_abort_rx(struct net_device *dev)
 }
 
 /* transmit packet */
-static int korina_send_packet(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t korina_send_packet(struct sk_buff *skb,
+				      struct net_device *dev)
 {
 	struct korina_private *lp = netdev_priv(dev);
 	u32 chain_prev, chain_next;
-- 
2.35.1

