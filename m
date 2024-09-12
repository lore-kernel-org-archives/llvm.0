Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4521618FDD7
	for <llvm@lists.linux.dev>; Thu, 12 Sep 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138906; cv=none; b=IPh1WxG0RjXdt/1qBZb6NTQOaLZhRS/9d8d/npRWmNizkGBLJclFPjbrbP84R/9tCtrUuHQARbkucdjs+JZ7WLqMtBhN79JelQBhbOIFczLZcjacn0NfTdbTgksI6PKDdezDW3gfy0SXEYOeqL0hkFy9BpcSSqIhbooYwPVMVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138906; c=relaxed/simple;
	bh=DOwjT7TF12kMcyCuBjmBn894pvmkAHrK1vHq8KlIlTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ly/ry/qqhW4I7aWaP3mlrLyIZT0iWPnlQyrB3XfdMoSJix2jSzR6i7+aXFewHiTdhB1LRXEiG2NOu7FbnLcKRjeqoHvxOQFddzpX4RUMVvRFYGnNeJsaNvOyfRT3gIYtsU/jqsNyOKoMSAi9KUJOv5IWPuC4xSo3kRf4Sfv8H2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id EB8F7609E6C40;
	Thu, 12 Sep 2024 19:01:27 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jmaloy@redhat.com,
	ying.xue@windriver.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	tuong.t.lien@dektech.com.au,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: tipc: avoid possible garbage value
Date: Thu, 12 Sep 2024 19:01:20 +0800
Message-Id: <20240912110119.2025503-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
net/tipc/bcast.c:305:4:
The expression is an uninitialized value. The computed value will also
be garbage [core.uninitialized.Assign]
  305 |                         (*cong_link_cnt)++;
      |                         ^~~~~~~~~~~~~~~~~~

tipc_rcast_xmit() will increase cong_link_cnt's value, but cong_link_cnt
is uninitialized. Although it won't really cause a problem, it's better
to fix it.

Fixes: dca4a17d24ee ("tipc: fix potential hanging after b/rcast changing")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 net/tipc/bcast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/bcast.c b/net/tipc/bcast.c
index 593846d25214..a3699be6a634 100644
--- a/net/tipc/bcast.c
+++ b/net/tipc/bcast.c
@@ -321,7 +321,7 @@ static int tipc_mcast_send_sync(struct net *net, struct sk_buff *skb,
 	struct tipc_msg *hdr, *_hdr;
 	struct sk_buff_head tmpq;
 	struct sk_buff *_skb;
-	u16 cong_link_cnt;
+	u16 cong_link_cnt = 0;
 	int rc = 0;
 
 	/* Is a cluster supporting with new capabilities ? */
-- 
2.30.2

