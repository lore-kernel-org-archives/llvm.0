Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90EC5C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB558C433D6;
	Sun,  9 Oct 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665354028;
	bh=n88vvLEzLCq7L+pw0SYw8QoVdK3GGQ3wCUCb1G6O7lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDoJO2smetF0aZEoZ7mFMC7vwQigntUyu5jzhY/bqjsfgfOT5OoJU4qEgBhRGmDKw
	 B9fcoy6ZUcBkhPl8gdoYjncMqEHXycZsugXuINBHvpaUCjUZ1GD30uGyiFC1y9XuYF
	 0XKG714CjvNztl63TymViCXtfAn9Zs+Nc8vWDIzW3ZTqwYn2FiuwmNKXa96/OfSMmr
	 1wTXFzl1vIpEmVNF0SkZHaDAILQaEmHfRS7lkrMUZ/9fgwIsjsfldqLxgx9iaFE6VU
	 FY9o+ujOIRW/nUX3lp5cb7qiCul9uJGbpPC7Ux6jSMjpnn4MAkbacvLR7cXk5HHqfg
	 sD7hVi0a55Aug==
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
	linus.walleij@linaro.org,
	geoff@infradead.org,
	petrm@nvidia.com,
	wsa+renesas@sang-engineering.com,
	dmitry.torokhov@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 25/46] net: davicom: Fix return type of dm9000_start_xmit
Date: Sun,  9 Oct 2022 18:18:50 -0400
Message-Id: <20221009221912.1217372-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221912.1217372-1-sashal@kernel.org>
References: <20221009221912.1217372-1-sashal@kernel.org>
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

[ Upstream commit 0191580b000d50089a0b351f7cdbec4866e3d0d2 ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of dm9000_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20220912194722.809525-1-nhuck@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/davicom/dm9000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index e842de6f6635..a2ce9d7ad750 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1012,7 +1012,7 @@ static void dm9000_send_packet(struct net_device *dev,
  *  Hardware start transmission.
  *  Send a packet to media from the upper layer.
  */
-static int
+static netdev_tx_t
 dm9000_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	unsigned long flags;
-- 
2.35.1

