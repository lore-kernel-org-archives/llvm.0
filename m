Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5553EFFDB
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526658; cv=none; b=koRm+7fjKuvSFdn8zPb/RpalCzmUv499siXfnZMXi0jXyQlqa2iBGovNynvUpXF8cSoWTMt9VBY6H1B8O9kCjlHbWAOOji2w+bSOeUTm6ArUcmMtmFRxPLjRJuiMG2YULFqY1R+0E3ivCytKZex2SlOhhQ9RLe04L0quzCgdomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526658; c=relaxed/simple;
	bh=AtNohlQ0WYu7yAy0ZDcPtcuY1C2JeuynsMtDfbhK1Oc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H970wDQy5jiPfDbz95lDwKhqPXVuh4us3WbNjv1ozgF/jKmCKVj68p3aAMH8FbiBscNCRG7k/OPr9VuGFnmm7c298NLOf7s8ZZH2QxVezpusMltNA0Ma/lX6xhL8ShPmhA43QXtVjAHd3psmpm0/rccAvs9e6j4m5Zb6ID3QW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLM13iJ7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLM13iJ7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so21353325e9.0
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526647; x=1782131447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=bLM13iJ7o2mR7DRtCrQfVJ6IL9J5gJeawYKCiKCp1LD4KiGMpgrhqJTRAtKBNlKbvt
         tr71Vx8yz6JnRVTHg1kp4gwUFjSpiFdYwXWrgGcN1znN/U7FL0Geh2+8KrlPSZHLZXXs
         Lu5OJKALUt9Gl7Qf3cg9AfjrlA4lgEiNWeeytZevJrW2uCnxHd8+sVTEkxPyM9HhWmOL
         eSNac923oMjA4L5REluZbFazSa68agPh8CtVJbX0vleKwHYYRDkDI+TnKmnkaq5gQJTB
         HCsu24QopIV/cIIfcjHDQQKHx3eEDyfr1NlvE/pUMOQa4aNqqIPPJtRg9kJK9thVNH75
         kj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526647; x=1782131447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=UuXJqHm+gev8efeQrMDHeYaRo7F5VXMZvuhzYrkNwHIZ0NJW61FZvG1TYFBu1OPutR
         0ffE9Q8oKhAKiDPtlWG3K4xUgjuwTojKJ4Q0h8WWWC030LaEX5oX5kfSt/Wg4r5FbY2g
         VWkjRQeiEuG5oSTETnJPbYmiyIvBeu4WmJlQu5QneDfHo+WEu6q/UFsgp/gwzFXCsUuW
         EnfqqmGcMd1Qqs++1uSIn9uNGdHnDxkadNEdSHevtcctjGMZE1q/OwLZCuYa6qru2JWn
         gl7bqe4LDPLihKmOpMZhAQoD5/SmlH8lB5nT/Nh0yGEwbVP58yBkUg9b+lNUs/uzvhcD
         Z8tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IWSrxKcy93C7myJr/+rD7hDkWjS1NqbQJHQfpSmtk9FYL3Q3f7HrjHLWWYxR3E4YTc9NM@lists.linux.dev
X-Gm-Message-State: AOJu0YwnbZZiGAUzein7q4w1VAq3JRklPEabCelz7w37if/KF8ta3vYe
	568yBsrET6GmLLt1XE4WidTQTCebrqjH4wu+xE0oor6VkMCebVQubhk1
X-Gm-Gg: Acq92OGLnrCXVuHISj5jQCzGU/7YpD2Oo2CbptKt8GJgeWCPJbuIaVPdyboPGA+5Y34
	tcZo4gSygui1N0mXVlGCI4lRAZWZ5yIQEAfC5wUnYUZXLtRgs7EMKabDiQAIu9GHLToOD1LYwHY
	JN5N3PCnun18GQokRFc8/moceJj893LeS5HZFuXBEGdjuQ0uUoxuuRnPhsY3IpusJAeJHVRq908
	hoP3vpm4O9OLvz6Zc5Q3+8ppiJ1ZCZGrQfgqSLbN2OmDoJAK+vKwYKJ0Kq4+wAX9jPVsP8s1yBm
	RJ6ZUGYKZv90PPrOU8r37QYbS04m+wEh6VGLzRkkNkh1AP9xrjHNWq9IUfrFNijGZXBpgpa+BQT
	fz5DLCnmRZgd398iYvHdI4Dnj5Yxfkjd64tQFLb4PDqc3nmpZfoIdlJTEz0k8MzXnTMxwDcXBwW
	Dj1Dk1MNJoKu4QV5I3dne6y9toFRFl+YnefkLK1as6zb71JpVQX9lIn4w=
X-Received: by 2002:a05:600c:800f:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-492201436f9mr121572525e9.25.1781526646890;
        Mon, 15 Jun 2026 05:30:46 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 15 Jun 2026 14:29:43 +0200
Message-ID: <20260615122950.22281-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
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
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0

