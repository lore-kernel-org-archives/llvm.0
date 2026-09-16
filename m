Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D4A4E2F3C
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602763; cv=none; b=k7S4kCAW0JB4eKsYQcPwJlSf6kr2s2nZhYjxzpj/elZhlY7sdZdbJSSX51Z2LpZwmR2F0YD7bfr54N18KoDA4PuQqziUoXWhRaTamqgfvSYxFg6Y+8QiqRXGtMEfTkBHmNCyAaW5CObSNAWmIQotM6f0ZlrDfZl/T0qmlrSetkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602763; c=relaxed/simple;
	bh=cXFXLP+NjYWZtJpQfz+KEsHtZfam6Old8yzjXsddKto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ca/Z/aQSziCfyujO6DYwaIHR1yUXjsCzfTGrTb1ZvrNZ/1fvG0ohcRbF/cIpEcY6gHZ62G4pmJqKrH6BxEFwVBx9as5nKURgbW6ffastfCaHhavoC8vXb7XQEMyrasGgVURdqQhNPySbrDdOJIqiBJdtdR14UjTY5NaEx/qmdXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anhjLSG6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anhjLSG6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so170228f8f.3
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602755; x=1790207555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=anhjLSG6wlsqOHvE01IA+Pj91kkCkLIVRE2F+VBop/3l7Sd2nM8zRlEW8MfhSdjX2p
         igOQvF/bMg51Wef1nq9SAiNZeVxsH8sDZEmp2Dz9tio4GIsD7J4Kb5uUCsSkSqhrxrbD
         qwrBICW51nwHXNIQNShOxfIS6FXhxA2MywUsQtmVr1YA8RugRL3qSOsg5Qp9wqj0w4Gg
         wfILRd5LapBWaQpUQ9SJ4wSVpYbY7M7nwst26lCCWxXT/8U1wx7K1p1KuZNBApnT00sP
         KX1J71LKBZ/QWVCTpUMF2FbygHGPuot+5sn5i4mCw9JHk5d0CyCHNzNSFSihsc9xyUmX
         yQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602755; x=1790207555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=hThl+LiiTWYHQHdZtfJQCRxys6lrI979d1BWkNUGANdWC3hb2aTzPV4zYfCipLA10E
         WoNOXeoZMs8loMgCwn4SM+szDlY5MoV+bcOkG6OsKl58N0UyAvd2WQB+EBXx2D01I9ae
         CK7h4mSdvCOJd+ihZzGdbAgq45Uk5SUx2Xi7OpRQxIUgtLADw6pNgqBQW8DcXB22fJHD
         Jt0xMbk1GUZy6JRtNoccdUTlqFlctSsx0gtGyN57kpZLmMms44uAazJaBvss3qjrnGlE
         vOaM0EUO9sHkOMXe2cwhtUWyBve+yZ9HMr2SS243tkwuJ2e4fJS034qGTAQ3X8WqQrrc
         YBeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+xSvoEfConm2XlATBMn/1KojpkN9H1lN6zRBQ98YyO6+e6mHuN2lpbna3h6ApSWCvIjhx@lists.linux.dev
X-Gm-Message-State: AFuF++muRP+H0Ax+Br1lDh0lqejxQAnWF4xS+UD51AxN8PQD5YE4iFQq
	vLWJfGgQBmEoE7uBGs0DS5hDLIkMuYfxhPoN+Z4jOUoPWPkAEazDSoTB
X-Gm-Gg: AYBFou0UahIFYoCKKo1VOvv8qIB4fKstM40+fQ5pjXvG6IbPAxpWhUk8Wg5TDYPC5BM
	yw352/1gFh3Y+jIfSJxGoLlctlQUlno4lRoOqSUQfbo0zBBumh6dWJsY2JLormg4XdpJMdDqftq
	ikvMRqMyktO7wu1CwDNgPKgrCejUQg4XRX/wj1SYyiJ0eh12jadT1n4BzVWjlHH2HrSS3ZZ/Dy7
	mF0ba7sxgwP0WoT1YWScX/XQ3WkhlwHVvU1grJdB9/DKbUObUt2jc+Br3G+pR0iTfg1XVMxnEsb
	yAyBzmMiMKoutxcESPgEycEfdu8c6TjUrFH3UoYss4MQs4wFLOMDJfAYoaED+9A2o76RW6BKWDc
	JB4B+J5XqhIaKdEXbbqzNX4hFcykZJz/zWEUO7QBz7HiK9tw9drTlDkm2qotZoLBTLgrYjBo60G
	mMjdgSDETjhJBaa8EXtCQpVvdSS7VcRDHDwX/9n225IFWuPJWqKy9wYfypU2ck3kx8v2PLTFe3S
	BQmo7cNCTu874Wcrdw8MF+wwAWHE8huYiKJ0qiTCw0YQO04ClQSnhQrcsRTb7k=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr5407208f8f.22.1789602754931;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v16 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 17 Sep 2026 01:51:34 +0200
Message-ID: <20260916235200.20712-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e04d92d1b09..35e20ddd018b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9755,6 +9755,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

