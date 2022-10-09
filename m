Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF45C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 22:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426E0C433D6;
	Sun,  9 Oct 2022 22:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665354139;
	bh=3lKufwv5aXJvVqyKXS0hAog2IxHRM1TGVbOfE4Z6JQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdgYThMypD8WGsnjKCbysw3OYX56/yLu4LnyB3VAzJxtN3IBsqJoIQ2CoUnFaoaPN
	 WH2yRP4e9yYaP3cc+tgrLM+ZoaqtDKYi45CINM7bpKJmzljTEHRgVgQQhZReJYbdm3
	 bIEZ1GNLN4se/kSoPvQAfSPMeKqGOmm5hMDLNFIu8dspQWpKm3zjSr75vC5PY/RUMj
	 n4IOUUegbgiLEhOkTNX6zQWdO/21MsLubRYtHh1Oj6kJfXs/oVsQvRy/xcmoByk0vB
	 lcAfSKC7J2H6vuyVqkf+/+ih74Q4qePfQLkf/zoUn4XDjIdhX9/uLYfu5bHH96D6a9
	 tfDIfzL9YU6QA==
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
	geoff@infradead.org,
	petrm@nvidia.com,
	shayagr@amazon.com,
	wsa+renesas@sang-engineering.com,
	dmitry.torokhov@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 16/34] net: davicom: Fix return type of dm9000_start_xmit
Date: Sun,  9 Oct 2022 18:21:10 -0400
Message-Id: <20221009222129.1218277-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009222129.1218277-1-sashal@kernel.org>
References: <20221009222129.1218277-1-sashal@kernel.org>
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
index afc4a103c508..c9ee5185e73e 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1015,7 +1015,7 @@ static void dm9000_send_packet(struct net_device *dev,
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

