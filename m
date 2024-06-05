Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7600C200CD
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 03:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717559297; cv=none; b=EueodDKxPgi9A2d8Ka2q9ivnoEU8Mt2+0NFeA0j9MEbv5uFaUhj2wtFc9JSgzUxROZLUy3LtcL86LONeBYBk1A+m/9dE9dzTTQkIJtp1QF6Cmq1+utgH0ILNiZ+mrlHMkmtfcfsxJZu2ShNvIC0vF2jsFL7xfD7FsYfTbUaPRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717559297; c=relaxed/simple;
	bh=j9OA7Ub6TkUxBfDMSbmGIFCbyIPwZ6CydduLEsssUFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5s3fMdOUwR0n/EJFNMnjl0uT9w52O5GbJaIE1dCGy9aBaabkQjbP4366WAcTODrseQoiWRdNeXuEjw4Q/7u1uWAoq+tHsyv58tNHJYHriZZsslwlI4io405nPIhwlbbgoLB9Uimxn+Uf1o+va9g/bBbDNDrFLHdTAo2juNVtEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id F1F5360189A89;
	Wed,  5 Jun 2024 11:47:46 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	andrew@lunn.ch,
	ahmed.zaki@intel.com,
	hkallweit1@gmail.com,
	justin.chen@broadcom.com,
	jdamato@fastly.com,
	gerhard@engleder-embedded.com,
	d-tatianin@yandex-team.ru,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ethtool: fix the error condition in ethtool_get_phy_stats_ethtool()
Date: Wed,  5 Jun 2024 11:47:43 +0800
Message-Id: <20240605034742.921751-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
net/ethtool/ioctl.c:line 2233, column 2
Called function pointer is null (null dereference).

Return '-EOPNOTSUPP' when 'ops->get_ethtool_phy_stats' is NULL to fix
this typo error.

Fixes: 201ed315f967 ("net/ethtool/ioctl: split ethtool_get_phy_stats into multiple helpers")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 net/ethtool/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 5a55270aa86e..e645d751a5e8 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -2220,7 +2220,7 @@ static int ethtool_get_phy_stats_ethtool(struct net_device *dev,
 	const struct ethtool_ops *ops = dev->ethtool_ops;
 	int n_stats, ret;
 
-	if (!ops || !ops->get_sset_count || ops->get_ethtool_phy_stats)
+	if (!ops || !ops->get_sset_count || !ops->get_ethtool_phy_stats)
 		return -EOPNOTSUPP;
 
 	n_stats = ops->get_sset_count(dev, ETH_SS_PHY_STATS);
-- 
2.30.2

