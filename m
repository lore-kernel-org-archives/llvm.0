Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FBA7B;
	Thu, 13 Oct 2022 00:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF46C43470;
	Thu, 13 Oct 2022 00:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620442;
	bh=r6vSej3gjd+5Y2O1GhWUlII1RKH5uIuDL/+bhV/uJhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SPNLbkAf1sLMDepYVs1eWfsaL5NAGv0MRlQd9DxXpBTAllgLkz3RPArfDcmBmjE1J
	 LOMwALEeNaRiTEwl/N4WKmiBKu1awng3Yb0QSklDRxd7eH/usLHQ5vQbAujUmXJAGr
	 01GIA2s+23VNcTaa4M9vOBBlPy5e8pbkAiw79LTyAdtprYlVVxlyZNisVUtiPwKYsY
	 oypLmqWrhn+MBFWfl6WdqvG5oL9ARRD06rMcMKMLXsedgcvve6BJ0Br95qutgFG4p0
	 03vc/RAqSLkXm5pBqSY2wIVP9ZE2Y83RyiKN6RXJneFnKVZyzfMB0ySgcQ+gnDZswM
	 NaPHAlhZp91MQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Huckleberry <nhuck@google.com>,
	llvm@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	ndesaulniers@google.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.19 46/63] staging: octeon: Fix return type of cvm_oct_xmit and cvm_oct_xmit_pow
Date: Wed, 12 Oct 2022 20:18:20 -0400
Message-Id: <20221013001842.1893243-46-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
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

[ Upstream commit b77599043f00fce9253d0f22522c5d5b521555ce ]

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cvm_oct_xmit and cvm_oct_xmit_pow should be changed
from int to netdev_tx_t.

Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Reported-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Link: https://lore.kernel.org/r/20220914211057.423617-1-nhuck@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/octeon/ethernet-tx.c | 4 ++--
 drivers/staging/octeon/ethernet-tx.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 1ad94c5060b5..a36e36701c74 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -125,7 +125,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
  *
  * Returns Always returns NETDEV_TX_OK
  */
-int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	union cvmx_pko_command_word0 pko_command;
 	union cvmx_buf_ptr hw_buffer;
@@ -506,7 +506,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
  * @dev:    Device info structure
  * Returns Always returns zero
  */
-int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	void *packet_buffer;
diff --git a/drivers/staging/octeon/ethernet-tx.h b/drivers/staging/octeon/ethernet-tx.h
index 78936e9b33b0..6c524668f65a 100644
--- a/drivers/staging/octeon/ethernet-tx.h
+++ b/drivers/staging/octeon/ethernet-tx.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
-int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
-int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
+netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
+netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
 int cvm_oct_transmit_qos(struct net_device *dev, void *work_queue_entry,
 			 int do_free, int qos);
 void cvm_oct_tx_initialize(void);
-- 
2.35.1

