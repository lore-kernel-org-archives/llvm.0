Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743ED5C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5774C43145;
	Sun,  9 Oct 2022 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665354044;
	bh=XARdSeZX6xQ7iNIn6+oYLfRF1bbpI2N8i6uwoZRS0Ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NasQZY+40P3eoDcyudUR1WbwDF2FYk8nPI9deZm+dfwID6OpSjiDMmaP0kQSyMml8
	 0veQ1J0nqZ6PA/yz+BYepMdvXeZe7gHJFw1U8Ai+Fj6LcpbSNH+3gHiQJS4H5tgq20
	 uTyRgyvAhJGpmZzjBYOfdeZxV+n9C+Jn1Nv1D5s2KVcPOTc51oJ9rUi8YmQpb3QslS
	 NiM7JjJ7BMBXOssHxoIDnacTMUx1xwmYWv7NfKPluVz/hnDP7ejew/P8NFJjegynxe
	 QqqxQnKea+6Ofg4Zuk64ryw51RsQ+Dss/XeyDaAZbUjnF8th/AH0PSmb3Q36092reB
	 uYqb0aa9ASHEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	m.chetan.kumar@intel.com,
	linuxwwan@intel.com,
	loic.poulain@linaro.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 29/46] net: wwan: iosm: Fix return type of ipc_wwan_link_transmit
Date: Sun,  9 Oct 2022 18:18:54 -0400
Message-Id: <20221009221912.1217372-29-sashal@kernel.org>
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

[ Upstream commit 0c9441c430104dcf2cd066aae74dbeefb9f9e1bf ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of ipc_wwan_link_transmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Acked-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Link: https://lore.kernel.org/r/20220912214455.929028-1-nhuck@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wwan/iosm/iosm_ipc_wwan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_wwan.c b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
index b571d9cedba4..92fb494c7a91 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_wwan.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
@@ -102,8 +102,8 @@ static int ipc_wwan_link_stop(struct net_device *netdev)
 }
 
 /* Transmit a packet */
-static int ipc_wwan_link_transmit(struct sk_buff *skb,
-				  struct net_device *netdev)
+static netdev_tx_t ipc_wwan_link_transmit(struct sk_buff *skb,
+					  struct net_device *netdev)
 {
 	struct iosm_netdev_priv *priv = wwan_netdev_drvpriv(netdev);
 	struct iosm_wwan *ipc_wwan = priv->ipc_wwan;
-- 
2.35.1

