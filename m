Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0335C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A98EC433C1;
	Sun,  9 Oct 2022 22:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353673;
	bh=79sX76vh9ai+k4JQ7VU0DTX+Fu1WGVzAUgZNp9U+T/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0jr3prYFsI072nPQGuM5/E/BIP0GlN00iKqaNYhz6ZSpYgkhSx55V5Yn+YXEa+ud
	 BDPYUszdZYOo1PjRs4LWBsoecwyfY2J5w/ZfY5Nx0h6/JswwjwQ+uKzPhkA+umKQhv
	 joEi69omQCZAmwFIpiTaXXmx5Tj8tNthQ3UeclXGpmsUdtJ11WcIMT5S71QHMyRjup
	 0CQziZVrn3mqfbnpugyv6/+ZSv4ra1OEErMr6hUua2crTKFQE1YXNFOKoTnsITVUf5
	 wIXrs8qMqGRHLfc6Sy4kZxZWOl2/VPqBriFYU4i8FuCuqxLj8d7BWbxPVYYiKYwc1n
	 ZcFr9Eg4v9Qkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	Dan Carpenter <error27@gmail.com>,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	ndesaulniers@google.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 76/77] net: lan966x: Fix return type of lan966x_port_xmit
Date: Sun,  9 Oct 2022 18:07:53 -0400
Message-Id: <20221009220754.1214186-76-sashal@kernel.org>
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

[ Upstream commit 450a580fc4b5e7f7fb8d9b1a0208bf0d1efc53a8 ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of lan966x_port_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20220929182704.64438-1-nhuck@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index d928b75f3780..be40c6d3ec68 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -344,7 +344,8 @@ static void lan966x_ifh_set_timestamp(void *ifh, u64 timestamp)
 		IFH_POS_TIMESTAMP, IFH_LEN * 4, PACK, 0);
 }
 
-static int lan966x_port_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
+				     struct net_device *dev)
 {
 	struct lan966x_port *port = netdev_priv(dev);
 	struct lan966x *lan966x = port->lan966x;
-- 
2.35.1

