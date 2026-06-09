Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135548C8AB
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018014; cv=none; b=KQSC+g0IliV2XUndTrdZP1v822eSz8jI6pdbzJUY4sWZyxZkUCDKKoPdCfIuNYT9K3jB4ML4OszHzjFOjklQn84MjYsiUTQGkQUQ/9bH1c1rubmFccnkyPtrnr1gwgT8Jyc9NfwSqVo5Hmn1IpcT6Z8B/XPImUCs+V8ZI0aVJyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018014; c=relaxed/simple;
	bh=22JVSQJjGwljeiZ18Gw1sbCII4IMcchJHTBgkArVf6c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BznjuLJEDvjz4p/LH3FfASRsU/0iv64PwveJLCwBwLcljY4FDFtUnBvV5xnrAMaVEU5HC3aQIW72QIVjYYOcEFVxtkgleRwreva9tAtJfh3gcNK1HPmh4OljxlmK2iilEL8MGsBFRHgEV/fgIV8OUJfbQpScX6Jmumwu3eXuqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTvbV84H; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTvbV84H"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so4608168a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018004; x=1781622804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=aTvbV84HfBEDKVSyU/RftjK+i73f2nO5QAAuyaf7/psBlziVfyTw8kNGmo1l5YWD+r
         PQWp7QWyCUiaueAxde8pD18NwDg6OiML3R/ZI5V6ZMJV1wb8CPY4yYflrgurJjwXVwr5
         0M0OZhd8TMTQUIlYAu9hSZ2TSaJOUlWfAyj9J4Yg4o6cYF71Zya/k72TYT8O4MKjMmpy
         xenBtPriFLYI3HhLUMcnSBe9m8bKAbJYVZABR7vVv8MKgb19ZA4cTEzCbuSr24qgFJjD
         DbdG3Yxqz2oCMbqgszeICGsIQ9LB0oBs0Bns4Je6pyDtdBS42B0M0OQKH0V15ikjUWcp
         hVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018004; x=1781622804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=AfUlXPj7Cp0OLRHMmhXJwFBn4yENKMLt5xqH0o/WE1bzfdDfUYt8DGUbTSwYvqvmR9
         cYyAAX3OCwCFfByPNRZLU1PPMowHSsUYFmosuNrwKsb/IWuij6pRfViFZ7fyhNel7X7P
         LKup+xvHGGtu0+TE1YEGENMymra2JmoZjY43IDC7I+BRZPVEJ7Rg+PVWw/kz3Fh7a3G/
         e5wK1Rk/VfEATBZxIevVklha3BSNZyEvoi3cVCW9c0hBlPZRnZZXUb9ByRLoQ2q20b2W
         HK4m7YAYIl+szpZRPRbh+ug0+fK3x4SWI9fyjmt4MBMDGUz0WgBKoZw6yKiAGwfYWujy
         lPzA==
X-Forwarded-Encrypted: i=1; AFNElJ9g+g5rKtaOYMoO76pDPmPcLLw7hXIk2cq7xILrymIduwENjAktoNCwMd+/g8HAbgS5LIMA@lists.linux.dev
X-Gm-Message-State: AOJu0YzWA+JpTq6InfP1i33o3iR9dMYqh1nM4cbVyj/imX5Zff9acowW
	DYZioQ74EPwbjsSf7JUBUl0ifPhfCRGo4K5a+xzsQT3q+305kbyIZc6v
X-Gm-Gg: Acq92OHesyzzPkDqSpPixVoWczrXqzXELC0HBB9Fhh4QI7xqFlcj1i1eLVtlgJfe7b6
	QLC6WWnbVSYzOatF4QzIdpLtXfUsob2++NIPHHjYHWcffWhAwShbfd4XnKvhBqhZdccFsE8bT7m
	3wSk3IysF0VihsyT69OxjymJJQmDUsrC7jNiJe11ggNbqpi47NC7eyYH7d+2SlYzD4bsspgaT8a
	7OC2+72VbsHYyi0Itj0KQtPhiaTJeFdli9m0RRcqmdsDJ/XLd0TOXkDPPvBrFPupmBtSauw8+0h
	Kkke+/K8cGo1ShNBtO81irgO9b29MpaQnHQycq7Qf0bVhIYYfKYSsE+xW2llN1INyITmytl3HqV
	dyjbeJxjkawtUcU/9oZE/eQGa27BDG9zlfZlFmpyjUYLKA6U3ptfWNf92o0/UXlKHMYkBaTgNPm
	T9/kxPpByzRyYTJb0kc7HlB8Wgrxhx64iJ
X-Received: by 2002:a17:907:724a:b0:bef:1df6:12de with SMTP id a640c23a62f3a-bf36cdcebf5mr953590666b.0.1781018003482;
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
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
Subject: [PATCH net-next v6 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  9 Jun 2026 17:12:03 +0200
Message-ID: <20260609151212.29469-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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
index eb8cdcc76324..8174f005ab43 100644
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

