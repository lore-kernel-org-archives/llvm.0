Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653098;
	b=jygM42jFxtGQuu9sT+5W/bl3VFeTM5wtnzHUnp8dHOq7ulCrI4Oexx6B8KmTFegyRgn1
	 J0mWhecIonhyZXDei/xZMKx9wPN4HKvlFEbdNV8urhgwKKa2klcxKybux/bAi1+w5jxfA
	 SZnRAYILr9spcpO+5zYduXBoSGuOsbkoDUmbVuoDBAHo7kV98AwSp6bR0eUKih4utiQCx
	 mORYxZ0LFJMfh7xkcSMwI3qL4z/Jk/gtQQg2IQC7jRJl7zyiTlfRVJR/TxcsE9m26Kvi+
	 wYZ0HqG+/cp68+6ilEkV0uiNzJw1BD2E0kZ6pmGpWoesVdDbUw3BnmUB5NIiUiLAPIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=TSkldTtv8BJFUoXwXkFBNXItXzEUq/yJFaBkQq/58SoTYW1EGBAdMTrk/x+JHuBbyJml
	 tdFuCc6owoU3lQI7Rc2EbHRztxQrUWRx4TtGzWk8J2pupyaZT8WMdYbuVFanLXLdLRbeY
	 Mk8vFl6CMKTQCzNFf6a1Wsi7ocQwTwzGj8EwXVT+7VEJ0VfszE9GydZh1BP2NzyU9c4R5
	 a4ItYQWOb8w60Yl4H7yXo63QeFhJ9YDOdW7yC/pZHGjGRl50JdY6rOIx/+FntYrmOcZM4
	 h4NH4pyypb/g/ZOV6b2Hufu2fgAu4+c4b6Od9xX6y8m6rz/Xur8/McHuz1nhMdixVCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDpy1UnC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE381606A8B0
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE381606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDpy1UnC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11622145e9.2
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653096; x=1795257896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=gDpy1UnCDecFV12547DbNVeEFY38LoEJqAQ/kJKaV6gEyhQ2DAFvJaMSzLoSoFTfuo
         7syl1Gf4DoV4+BzUf33/P9iRvEqDi1M78zznfj1uYdrjekZuzdNDlhRe/l8eMIso2oZd
         jULPlUPsyBo5h4YbFwjWKAaICYWaW0QIwgc0T8FmP2H/Yjqm3dMrqBTiirf3/+jhuT6V
         GSFMmWLEMY7O7MpldvJtszqxU7IO5m3m+viWJg33fLeSdTGzI8X1BFkEzpX1xU0VLsh0
         qKqUsDXpDjb4QYJ/p9vwwo2zFjQCB8uI/jX4cXzhEfV3v9EqoJOzmm1xAZ/ew2/fPO/1
         bWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653096; x=1795257896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=kwYeWI49mIgRb079OXD3nvK2vppUNqWylA/CFH9aZm4/YeA58nc1uEekOkl9Rkf1Z8
         Bfla9y6z1/ZO/fb5rCku9uMTP4gfZLZTzo4FxfOPcekOwwULRSQdEA0BQyegNloL0ktc
         /vNf6g8FFuurVul8pVNtKiCANVKRweVKCEBcWvO5bGfQP6qN6kWgoMExFrAIHgCuHY73
         yUtkeG9CTwHrDV6FUB1hVKLHMnes1a9+7zIQwbkqR4XutbGXWwgUIlnqV+odlqMoomiu
         VUQaWkPizPbH71I1oH55l87m+P3pAQQlMHE2PtxCFKsrc8MdcpK9dCZJg28x+SwgoFtw
         68GA==
X-Forwarded-Encrypted: i=1; AL+hErExambu5Q+Jy2dNrmxcVEnOcd8FS0OK8ZCNXAZlcvbSTz28O7csndz+55TDjLAOoMGdvfrW@lists.linux.dev
X-Gm-Message-State: APuU4Z/JdTuyIWpOCn9wan6NCtfjiwBT7Cn5uXtNIQrTotnK1d4GSN9b
	X3ycNfzvJZdsyNIsce5fCY3RAG+erRErbSbNB3tSdwMCyeKENbyAxY7Y
X-Gm-Gg: AYBFou1XWFVtoKUD3/oObiLaJBvLIZbLxKcHT04VGl5UbJ3XjC+MRvdRBeYas4qS2IA
	aYLM8HKxQZw5Jp7u040yeqgBBOWBiHTMBw4tVv7akQj0e6wsqYGkLEuXs/cK80XVZTQucWqdfHm
	XAAWTjDpt0J1q3hMIj9442Geqwz4Lx03g7M4ecWACdmOp+6NLXc9IIoLbB6npxyk0AE7ayOR1s0
	aOGjQxg2LYIkruF2twOTZ7VEvhd7sgqLxd1/wJC2ELxzQztCdMq6fykLTK8c2eGVFNdidzsX3ut
	Y7tVML0NFgfXGcj6LxD3YSWhm+TVJt9mEBcK6CG4ViYeOuT6N+/gcJZoCBgqrhNcCUHxKOBFHUt
	bB1UHcM9tLaw/odRylF6VmJ1+S1pm+ceWfWR8oDNMwa6xEn9OGZsPql8otu4B+AtcbfDv/4Ympw
	p8OMEuPP2t7LYUkDFRFhdmv7h0skThh+O/45FPsq/aodNiGJXNN7g1fJzhS/A2zRoaT5S2n7/vy
	RqdCcRTd4yMMZ0Gd00lktoqm9M6QI9VLvMS/pNcf+zJObjKq6k6x80dpfgDPtc5z+rvMwgTauRD
	2iLVJh3T691W9kkcB7puMy12zzagD/KMRKT5gGv+iQgIQNRQA8pk6x8FK3NqT8yPCAduk0zBsp7
	qWDvcXwZ/+ByfDBQ6juFQP6GWN5EMA0CLNg==
X-Received: by 2002:a05:600c:4e8e:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb55a8faffmr109717835e9.27.1794653096148;
        Sat, 14 Nov 2026 02:44:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v20 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sat, 14 Nov 2026 11:43:50 +0100
Message-ID: <20261114104426.235620-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
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

