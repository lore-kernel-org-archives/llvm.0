Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FCE3FFAC6
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407116; cv=none; b=nsEgNEGI7dQ87H7NO+j4ghr00OVsIQzD6rUm+nw1xm+g87BwJn7qs62uyFxvQHqvncfkmwNN+DKxjXHWcejOYezd6muHn6vSV/StqrkhyHCthn7otTJeD0dA0ixoAIvWQw+knpttPrbRF5QE2uP6fiBqb7rrAmFtboETs1hdqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407116; c=relaxed/simple;
	bh=cGQiwLSUELO0BNhj/eBwOu4S6pqC+JNa5ROeFabH6JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5izP7sa+bnta3cjyNgKRrPC/x10Z9IbcyHqh1IZbM1kQGrpHByF9QmCV6ZpCCkYbzcagRxmuTN84N1Ew6qeMrpnExrrTbogDxzFWd9Fb4SJhi5j9U0NEhPxl3ARmrlXMEaiQtIYVEHnbgTnUqk6NTe3S1feR8t/nGbv8V6B3SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAZX8csP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAZX8csP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso23423395e9.1
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407111; x=1786011911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=oAZX8csPS2Gyy4ZQP4/vBPxKCWPCnl/zwSqsPP+5mUWgnyONC0p+MdH4jLU//MkB1W
         genI44TBCu2PbR2RAC9A/Wy82+8N/ZQUiI8fGoJCREcdLi1lnFuWmvOowGA1AcVuKyLU
         0N1IxpCN1FtjAv09RWBjbKOuj62EMdsIDNkKki6mWDx1Z1cQzZsFf/c1aV6nAoE3aLIR
         V8fX0Khp3CKPqXL4vQOYfJlYN/TGgvA54sTVQ2do1SoIwDPrdDckmmo/vwmGb05Hbo4S
         NAA2T+tDGgipGOUEvhRjNcNOm8LOIOC5E8KPY6dcfV0AGOLi8UHK4ZBy8s2cusV1ZxFW
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407111; x=1786011911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=JrQt/x7RH00W2+e/hnEGkBf3THFJlA7tJLQBwXMIhXBVBIteu0J48KTiRo8l7lu1Yn
         nXy0SAi6DbuQQ1tmcOz+IfLOd5DmSxcKSQprUX5A2E37e0myhc7nrUSgqi5DXztwGu+C
         vdtjR/Xc3VWw/Atte/eOrovywTuROAnTlEWF1wei5y+/4Om0rwVnzQe9USgrisfSHMQc
         NC42f5pzNRyixcRuwIlYGyrKErNmIHpkh46AyNS6dNTwKaF415UZwDmGrg70gif8oc0e
         dJtWdg4pvo+mNsF5a5HeolSu+Jqnqth3KonnK5Z/u66yJ03gOA8im6mwwH7kIk/4MS4U
         EBSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6OYF5VbW6Pd4GvG92ik3ViSytdc1KbW1tcKmWhko9gufYCTyxaQnUD/lekxIuN32MOjNr@lists.linux.dev
X-Gm-Message-State: AOJu0YzXe6aC8U1NNBMccB3yK4sqWY1UhoTsGlJ2aDrftcEpvaJKcA5I
	krJdXdi2GxIjC7jW9PolJz02gkeFE5TuL8NeSSSn9pvm5yTw4rW/QXJg
X-Gm-Gg: AR+sD13aowa4ASJmhY6zMNf8UBuddrnxcl5eHcuNFN8L5uCxpR4A/QR2DAN1nesPGhs
	EhWFdJMs9yRNAUUei3QA5ZnaZ0MxGzyEQD46b8a4pUa+/54b0acfzmBfHtug72wau/wAuOWUdoA
	b3MGOnLllufibvoI20vee3fSmTXtjpW/LopcziK/+sxixo7OpP3izqDdYlrRT5SYEOKD6xEeTVP
	P9/bEkUMrj/1G2CDhofgls0xLp9gI9jBzc+rz6EssJVSWsOgWOEynakWsM3vLp34o7B7031Vxvj
	Abg47RabXF64RU+ovYlvCZ70LjmxSczKkC47oqAde69u5f6iOo2ZqgCUCoLBJxji5s0iCA9CU7M
	0Msndnl0f6AAcxSyINnglN4QMGXROl2fzvmOU8Be+5KTSDJqYENJ0Bg4ftbhpiPYT5WIe00zEM+
	7qhHelKVzMHZHtWf35uBlO7/SCA8PonFmk/jXTOqiaUezraF9AHk3NTi2kXmG3CebDuFQw1TEbA
	aUpns2EbD7PWcPTwssn6X4TqAjDCh2t7RoZa5K/NwnY9+/Pe4KJMg==
X-Received: by 2002:a05:600c:4fcc:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-49800ea1af7mr28621295e9.22.1785407110623;
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
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
Subject: [PATCH net-next v10 07/11] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 30 Jul 2026 12:24:18 +0200
Message-ID: <20260730102444.1967900-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
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
index 3d17b7b143c4..3ea995241522 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9697,6 +9697,15 @@ F:	include/uapi/linux/if_bridge.h
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

