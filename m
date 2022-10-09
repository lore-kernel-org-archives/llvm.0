Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1505C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209A7C433C1;
	Sun,  9 Oct 2022 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665354463;
	bh=ghDC2JzNsdRhtz2HD3XyUozmlKJwAlnnnYqKEva3Eh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/BBmtqt1rZNRT+oWMXfnIGnT9atnckCMeIm3jsg5/wt6Uyd3rbM7kL/NLoo34b3M
	 WYvPaxt8WZ1q6KDXjiN1HHkWq0l9gVadOOCcfxNhwJFDirMHqsqOFXvPvfYJ9/bMeP
	 ApHBmdE6adWSjJ9LqQjyyQp9sn3ObK4/qObhGaMa/o1dV8j9Nmy+F+jjQ2BMbpBxJt
	 HEez8qgZZ82MmPsgTP0oZS7z6jCtohhj9MksZPBOv2r0f7T7tQX2KbmCZqHION59/R
	 wMZ2mhZ6UKvwTLhbef37xUoxiuslhLV9Yf9T1KJSm5Vq/LG0gkI5SvQATH+yvllB7B
	 023DFVgObLhxg==
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
	chi.minghao@zte.com.cn,
	leon@kernel.org,
	bigunclemax@gmail.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 10/16] net: ethernet: ti: davinci_emac: Fix return type of emac_dev_xmit
Date: Sun,  9 Oct 2022 18:27:06 -0400
Message-Id: <20221009222713.1220394-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009222713.1220394-1-sashal@kernel.org>
References: <20221009222713.1220394-1-sashal@kernel.org>
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
index 37162492e263..ebf22429c349 100644
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

