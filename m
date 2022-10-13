Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B17B;
	Thu, 13 Oct 2022 00:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10ADC433D7;
	Thu, 13 Oct 2022 00:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620903;
	bh=onPe5fJ7fr9bzrF4dH6UIin84lWulEOkVhLMTXM4P0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aMXmxtsXjO5nNHKqE/ABQWBl83SZh3CYwQxDnT8rWvmMOOWX5jx2UGHynAHij8eeS
	 2u2J7LRAaPAbGjkgc4S9BBlNEmOMKDotpWnhXgAGgIoa0jNO6WUD/VQQNuvWVT07eg
	 bMxywYLq2hL21Z1yxd0X18kmBG8O/LdJDbLRgxXG6tR1i+M19nnGLgKn7inGDtG8hx
	 cySYxpDNnmr5ynnAoj+T/oQokPYx1bNTKHPA/PbynL89qA4McSbjY4CmNLgnSykA84
	 9dBizUxUk/B/qkKQ1TIEYZJFgaNoCzJ2VjtjV7f14epeDPWBnPXsnGFKevmMMyFWoM
	 tOTVpJcAGR7Sg==
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
Subject: [PATCH AUTOSEL 4.9 09/10] staging: octeon: Fix return type of cvm_oct_xmit and cvm_oct_xmit_pow
Date: Wed, 12 Oct 2022 20:27:56 -0400
Message-Id: <20221013002802.1896096-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002802.1896096-1-sashal@kernel.org>
References: <20221013002802.1896096-1-sashal@kernel.org>
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
index 6b4c20872323..e773353ee579 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -137,7 +137,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
  *
  * Returns Always returns NETDEV_TX_OK
  */
-int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	cvmx_pko_command_word0_t pko_command;
 	union cvmx_buf_ptr hw_buffer;
@@ -523,7 +523,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 
  * Returns Always returns zero
  */
-int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	void *packet_buffer;
diff --git a/drivers/staging/octeon/ethernet-tx.h b/drivers/staging/octeon/ethernet-tx.h
index 84848e4c1664..65faefc87081 100644
--- a/drivers/staging/octeon/ethernet-tx.h
+++ b/drivers/staging/octeon/ethernet-tx.h
@@ -8,8 +8,8 @@
  * published by the Free Software Foundation.
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

