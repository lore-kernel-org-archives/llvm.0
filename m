Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F51F9EA8
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 17:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013110; cv=none; b=Pe3hQK1M+HyoYNY0W3i2el2M0NaGeGhC1maaTc3RB64xqSmxPO1xEoc4WW6VSXmFuguqlRO+7aAHZAl5Q0UErlw5ZqBGQfHSELtZzzfB4rm4G+C3d1jyFOoJzbNeYDzDok+6moknEu0o55fhzRuLAeuDYw+CAivSNcV3bK7ChOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013110; c=relaxed/simple;
	bh=I3GxsPSJ6xEG1yqrXsDlovT1d9QrEwW6pK+s5+J/rF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dV5iteb0ENocIu8D6p+FWZK23GUif9cw9SK3jTE2BbD/SjfJCx6CZYQyEvyrJ0HGL6XHwEJfnL8IAx20RByUbi/Do2QeuVSF9fxkg4iUFvajOdevTxNP2q294znpW1ooKsyWngoHAbYzNxbLkBojN2qZgWJmMSZvs6ates9Kxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZDPfHu9B; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZDPfHu9B"
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CBC03C0003E8;
	Tue, 15 Oct 2024 10:25:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CBC03C0003E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1729013100;
	bh=I3GxsPSJ6xEG1yqrXsDlovT1d9QrEwW6pK+s5+J/rF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDPfHu9BEb4bVAzL7Hz9cxfuD/FVZ8ycgA4/+XsyJsn/eu0EhSe8y/nDQKG3NqUMA
	 vcl39PwkgAp9H6MXqWUKHN+IgXIwiOv3JJ75UVZPzgvIgehyINJKZPra7f8ak+Yxic
	 9AWDaY0OMIclnq2gppQEzt7LnA+KDe8gzFE8ntvE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 6967418041CACA;
	Tue, 15 Oct 2024 10:25:00 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:)
Subject: [PATCH 1/2] net: systemport: Remove unused txchk accessors
Date: Tue, 15 Oct 2024 10:24:57 -0700
Message-ID: <20241015172458.673241-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015172458.673241-1-florian.fainelli@broadcom.com>
References: <20241015172458.673241-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vladimir reported the following warning with clang-16 and W=1:

warning: unused function 'txchk_readl' [-Wunused-function]
BCM_SYSPORT_IO_MACRO(txchk, SYS_PORT_TXCHK_OFFSET);
note: expanded from macro 'BCM_SYSPORT_IO_MACRO'

warning: unused function 'txchk_writel' [-Wunused-function]
note: expanded from macro 'BCM_SYSPORT_IO_MACRO'

warning: unused function 'tbuf_readl' [-Wunused-function]
BCM_SYSPORT_IO_MACRO(tbuf, SYS_PORT_TBUF_OFFSET);
note: expanded from macro 'BCM_SYSPORT_IO_MACRO'

warning: unused function 'tbuf_writel' [-Wunused-function]
note: expanded from macro 'BCM_SYSPORT_IO_MACRO'

The TXCHK block is not being accessed, remove the IO macros used to
access this block. No functional impact.

Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 9332a9390f0d..05c83cb3871c 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -46,7 +46,6 @@ BCM_SYSPORT_IO_MACRO(umac, SYS_PORT_UMAC_OFFSET);
 BCM_SYSPORT_IO_MACRO(gib, SYS_PORT_GIB_OFFSET);
 BCM_SYSPORT_IO_MACRO(tdma, SYS_PORT_TDMA_OFFSET);
 BCM_SYSPORT_IO_MACRO(rxchk, SYS_PORT_RXCHK_OFFSET);
-BCM_SYSPORT_IO_MACRO(txchk, SYS_PORT_TXCHK_OFFSET);
 BCM_SYSPORT_IO_MACRO(rbuf, SYS_PORT_RBUF_OFFSET);
 BCM_SYSPORT_IO_MACRO(tbuf, SYS_PORT_TBUF_OFFSET);
 BCM_SYSPORT_IO_MACRO(topctrl, SYS_PORT_TOPCTRL_OFFSET);
-- 
2.43.0

