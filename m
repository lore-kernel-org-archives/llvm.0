Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529979;
	b=Zj8OpTmQplCx/xWFLZQTyKQv4uYwM9raTHmtTykxvvolzVjF+fk+xgvDcsIhoKb3+O1w
	 TLy+4yJ2cIRvZnEVXxn23ye3OTUGt6LQyI2FTR7LUJaWkIdeFFyd7/hRG6gwRhH5zDa6p
	 BA1jOCsp8GgxFsxIqOSHtcTuqHqvOAI+F4mPEmgysOx2BpBrdlTJkNVXlUpFpbiOJRLDD
	 EzlUgXjmKbNyyS77zf5D4F1QncEU0nuCpq2MDIbTuLHzBloQLaOiZFXF7r/QOZBuFmmro
	 xaUcvA+L36fQP642LSxOulrBHvP9Hlgm4/i/ZBrNDMsnD8BQ53YHt2VWeV1lYT1u4nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=bAIz+vbbKSu83G/uc79g42WkrnumYS9+aGOge+cqa1f/6B8GEX35w3rKwLVKMlRCFTpk
	 fzNpzmbzfTMY/rfYVQR6bzMIiwkNpImcOkgHghevBTAW8B//DPZd0cLT9x2i0NDPFFgwP
	 rcNjFT7xgkcwGkZQG6/Ixn02i89fhxrHz5Gm0kD9rv5RZNX9HxMZe0RJYQnBJX+B634ph
	 wGbiAE0/pa6QHTMaVup2EZ9aIIkd/Ih5yGcXZBZC4mf00p2V2kVIgCWCs3wmSWEE8Ql3G
	 BM10fdntEbVwlHKdl1ra6p8LDb50E0p5/67+1iEmpvWl5XbvCpyX+6ykHOFFRN3es5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA0ovMAZ;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614E606C25A
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6614E606C25A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA0ovMAZ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so125727f8f.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529977; x=1795134777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=iA0ovMAZToofF00dB5rJDZBH3MJLP3w1ug57D2X6N373MzCWIHfa3QO+TB8lt7nIMQ
         QfBlvhejTzdmcvTaxe/Cx94DR5wYj+TB2DGOXGDBeLBz4RrsMSes7ZetygHi4NIaRE1Y
         s/sxoBdlSfDMH2VpX4k7qNVwATho8qu1C/sWI87i/65jh0j/d++Pt9MJn9jD9Bhm3aYc
         zXcgvdwNqjf8/xb+EV7iEFNh0EORNZO6YjATtXG9EBKGjtw3QBhof3nK5EpPVJow1/kz
         PAfq6XKtWI7iUz1IqT9/lHx8O3jmRKTYGv90lPV+ttF+fqCdAeVLsPk8iMpPqMaAB+wM
         cK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529977; x=1795134777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=uuqSfZniC3ijqIvPF9NT1Z4q5Zi4dnw2xBYwz3ItNf+OiR4WZqn43dAsLbWS+FP0d+
         LY0KOTyNKSzXtszjKLBqfAwVJw4nnGYRjn7R6IZtpVDlKklRiIDiHBQGhy0XbqVMo47g
         NvucFY8JzqC16SLMqvFLv3VHGryl2Gvdk8ppL0mJHNpMzjC8aFDoFur7db22qThiCdV2
         C0hqgUQ7jQJCuL7HK3UxQ6O6SmJokN3ok/DgvSaOY/Daw+8BxoLYEgGkIPHn9hUz/ewY
         lbjK3Lo6x4uDJk+lSVjmy83jC3Yx1H/NGE/C0n1kF5Ya8o2adeo1ve2S9JXkr3CLOU6Z
         6lCQ==
X-Forwarded-Encrypted: i=1; AL+hErE7Ep7EJ1SEXLqJZ+ytSijtKbMfFBsw8VhjPGGlyK15GtNcTrypnlM58xp5VWrL778BE3Hj@lists.linux.dev
X-Gm-Message-State: APuU4Z8gT4m4RqBN1aT0wc7iYHhJVAIMa4tstQxzq8ZxEAY6PFMkEQuZ
	9Xzzhg5QTtyt6v7+UembBMtV/ehZnsQ4VAsMu0VPNy9aRIOqYJI1ACan
X-Gm-Gg: AYBFou3XtV0h9qyhIoCxj8he8uVlCpHIrQnNhm/z7pVGG+GrR8Bj7qbUPb9cbDazovt
	j/De3CyOUHTmdx04Wt8aF0yqeaMVr/YfZwJ7TgZ6FfzvURr3+Wn/KLUBpKpeJITh/N2OvleOlzM
	E4eEh4dzySr835/PaMKg5Ph3C/5ahe6I1lK41/btg/HsEx/pU4iw1KFAApyVALHOBEpG8ynCAOs
	sGtgMLq3Ssl3Q2sHd10uNDZtpxmwN36XuHGH+SzoiEilyFQRVqY1KRvFczpM3yGYbmFrk27/ctt
	IyYXse6YsdVUBwfVCVrCBzHbQhkmTX5f8X3oR19h2Sa3xAQV4lgA5WUvGwD1U9Zgv5oS36p7Jzf
	SLsdMR61NSXvFPIS3nVtGoLU2gLsO73eT6FSVOF9/hh9nXwXOzJoCDJVuwHR4bEPnKh3eMRt+vh
	4BkmRXtCGEk7OwIw6xbQqmojXzR9ePwL5++tj5VWMfzAdSwepAn/x6SNlwpFSgTQGTIzpZlaDdK
	pKz3jTqn2NgqYfrenL4DdmNBWAZCauommRz1vYRlxYVGbmqdDnFWefR25yFwkpikbCSGDW0llVJ
	5uxZpTs2tiGsYdV6S0k7YFflzsdmrPd1M5Pu78sAidy8c8k9ZH2k8j+4WmhcKZKCLxTP+j0UN8x
	9epCoazsRqsF3COKY/6ul44Qz54K0Iz+C/wTOYiu1Ecmwmlcfzm/5CA==
X-Received: by 2002:a05:6000:490a:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-49c6dc01394mr2183917f8f.7.1794529976835;
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
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
Subject: [PATCH net-next v19 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 13 Nov 2026 01:32:01 +0100
Message-ID: <20261113003217.197757-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

