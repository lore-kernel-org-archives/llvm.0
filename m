Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC340446823
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610177; cv=none; b=XmweIt1lIhTBO6Pwh2Vmlb+1ZkasC+Cd9ffoEChgx7WDKYADHKyUqxSniK76bmnVRVQmaGKZQgO1AsH1it5L6vxspHcIExXXuQR7v56fXm5vRz4BRP6yaj1My5cNoJBsk/Y9dJcnSLjC3faNl+fejRVEYuprUZNgLyQeDwc42OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610177; c=relaxed/simple;
	bh=ToC+qrojIElPVEor8Dd5gyGiOeRrIzNZay5S5+a5o+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnDZTSnLWqCCJUC6q+CoOyCB1UzbxIW8d2DDcXWv9mJunMtbYLxsBwkLxQ4DVD1KvphmNpG7fRbPUuyEN7lAFWSWEwAeSAXDq8BWDiTWchsPUSPDWtcwtLE50A63hrZ+nip/BdjyGIx+eR1FlHIn8vL5sMPRaRNj9Th2zBTYyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjGe8O8/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjGe8O8/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so4197425e9.1
        for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610166; x=1787214966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=RjGe8O8/8h3e8l+DoLORF2tAgi+aHPfCzEgr82WNiJ+anEed0FSE70fHiOkby41OWE
         0VqJhfe2k0rn2/kGDdZ/W3IDe26WdJ74FNWHEIPvYcbTVqwtwgr5k+Uk38NPBC4dF+Dz
         IhOjqKGKGPMAKGmZPk5RwFcQFy8y/NyHicTQkBxPi49/mTI+Gx7sfDoOv9jT9qFZUJWh
         I9S5/O88/R3W/om3wQuO+toZ7iOCimAgW0eEiCPk64f6/1ZmzJeNREf7Gh0JUN2e56o/
         vnXjjMfLD2lkdKCwy0TbLvrL0n0KayV41F/wdnri4RHW34XiNVCFOy2DT+1PW+5ZDWVT
         PRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610166; x=1787214966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=pO9PNIEVpBu8O04csQFGNveoDrPYau4D+ETJo8pR6BJp+pHtTG3v9+ph9ZRz/g9NKN
         sMyP9vxSWJgh9jKf3G9kNTb69vnUY79jmNZ+x+Ypc8i7W1Nc5od8yigdBTGrE+2Uu0qq
         LxpU+LmWPOyj215GXzEEz5VEbdkO36Yzoe33maX/7aA+FZjI8QnOQxY+QlYZ/Ks0lUKK
         VLA0KFA1JdxJv8o5vZfcHdRQy22XxjK5RIbiveg1TkjyBg1S+e3xqhXQqxc95msv0LER
         YajcNGXqePlCMewsttxBlhbu5z5tu6FYwmo5ZkWSg0sU/ec5gklZLWsaqqQpyTIa68U0
         AOVw==
X-Forwarded-Encrypted: i=1; AHgh+RrVXGUNckV5nwIOW5LXrWdr30foP2LjJuK62Gfr7yybsYmauJhXri6nKZmslSHlONwyMBIp@lists.linux.dev
X-Gm-Message-State: AOJu0YzSJK/fvwXtoN/HE+SihyA7B5hU+b0LVc2acnys8v2Upgc5pZ1W
	Na6Psay+7zzgW+e/BoKXWhywVDl7L0OTeEDySNAMUvAuiQc1ehxuLqdV
X-Gm-Gg: AR+sD114qN4BulWc6DbdLq96jy+0uSwngFtP26nbG2qrOrc5owso4INATf93/LJiTsr
	wfEXccNt5OsQazjIcbFWhRJW4PXmFGw1lwlYASpkvRK7beSuwNrafmXu+ow+iDwvi2LzivtJOQI
	K3zF9I7k20lVJ84TYtbtls2KCGv4EIsANZjToMRZMVyrQa/MqxflP1j/NcC6ziHFINxftkNJY1k
	31IKK7xNdaN9RG3j5ebYiX6LTX9vC/RK15JqZlfpcQ+kAK1aXiVXNJgCLCH/jaoD1jaOFAHnvEG
	/vJvwvGeaQJSbr453zCq8SpZrACyMdde32dloUA+Il61ZW0YgSlyN6FhaE8BNj9ZRC+59V3VLOY
	kBofpUhdWGyfjtjXFIw4Xco8yFMdU7bzmspbUB6bUjDfKzl23z6Aso+i2mJVxQQ/EsdayOkUOVJ
	KFOcTTjmKY0MnG7fyGP4L3xgGiMMmgifHnyi4RnVgFuY/gQZVaGjs2fKP4UlmQtNaEZqHjI7a3T
	F+RCDrYcI//+fXbWbt9ecfLYrRWlSksetAyfTC++bPj9kmX
X-Received: by 2002:a05:600c:474a:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-499821bcff7mr43640125e9.4.1786610165898;
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
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
Subject: [PATCH v14 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 13 Aug 2026 10:35:13 +0200
Message-ID: <20260813083536.970196-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index e0e7fae5b92f..04db742696ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,6 +9690,15 @@ F:	include/uapi/linux/if_bridge.h
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

