Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24014746D6
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108421; cv=none; b=iyjW0shncSn3W4g94Gpmx/iBaYtFj6947RrLuBm/L5l7gv9dt4ZkprfZIkR2UCkJtz1YdpmXSw+BcPbOiwMyIqf1xQur/kHq3C3hDsBfHXwmTNOjBNukCZqhxolEhkrT72IrqYyCN2EBqG88ntCPItZ9yB1iFvDUI9pqSjr7Pkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108421; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKPKUIE8ASHDEmQIMsoCXqx+6FrKsduNsgSnd+v7+zMl4Oua2nZ5kkA6U06URbYpgMDHu245chZFzHaQseAxtjtcAlo98Mxx1FsJpaH92zY5bO9lylgFMOBLrOSitFgVqGCa2glIyRNuUIvrnm3NKMO3DJSBVsM8fIsdObDkXJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8rv2NKQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8rv2NKQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2204684f8f.0
        for <llvm@lists.linux.dev>; Fri, 07 Aug 2026 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108409; x=1786713209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=W8rv2NKQIbya1kJCx4nEk+JlZsGa7kcJkm6wVz8b3Tc9omWnmiBJ/RuqE9fPQgJwze
         wyCZb68pANTlcd5dmR1ve20MaFfhGZOngKbydGp6Qem5Rl6EKeL7UOpyWka+u8d274jY
         emdjw8KVgwfbwbeAk5rwFCv1YT7qp405P4RPNDUGyBkQkAYoEBGFAz3N33L65jrMVjMP
         X14sgkzNcysOE8kNpv7pFNBMe3jXFKjgby9Lyryca80JuKkvw4YrzXh43F8JeYFgXshC
         1MyVsd27Im2eBR77mZ051JX0bLmSGCKgirls59a6WWe6O4MQL5H9RHQb3gIQxmklzqGk
         /bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108409; x=1786713209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=GwWtBjyVRPFj7U2fTjgMLste39ZF6O7CrvyfmdC5mEGSM0RPRIg8Z/je3ncxAWge+/
         RYQ6kTzUIKoH5No9IldWL0Y9nk0n6ZGy7+0j/2EZlURqv38rxR+5Pl4RIvHlN055KniI
         hb6+gyqqHk9snhw8v4mDGH8ZPzmd/jATR1PWATFs0W7t7N6Hw0cFbqX2Ba5EDBeiw8Cc
         el6JfVB5Ktc3NCEZ1E6RgJ7tvW9fRQ2wz6CB2JDC0BT5Rmc5lpPl2S+uDC4cvzsFrROS
         1NzBuVlSe5XtjmBgU6y/wOF2PMnbt1ff0zNTKNtLGc+/sRd2VDmivlGjQad29GI2lS8Z
         vypA==
X-Forwarded-Encrypted: i=1; AHgh+Rrq1awJCbfoAgyNVNTtvpI75OSdgrmBoVjJrVJ/dqSLN3i19ztPDRKTLIkYJ2n+TNK2gTcE@lists.linux.dev
X-Gm-Message-State: AOJu0YyCltKp/NMOu+EdzPcrbhTmBKNB2ws9yMJEc4DZtbwPU5jlfVXJ
	Dta0QK0eV0y7zAO5HG3uyEpBn8Z8f2sBFwqfcUAviC/JZU7USbcrchV2
X-Gm-Gg: AR+sD13TM90qXF8WKRgvRneb6t1u0YhcZQKeGWeAeWqxppAJQWJlR6poQQMyeDC95b+
	Lgz7HPEeHhLFGldm34W9zZD2oo8A5unRIq00wnBK7wWwAtSCN42Jf0NnZG/G+NWxGmkRYOgr6XT
	kbPO+XNBW4AKP05xM1PRvOjWVLMtO0/pZ/0/y7dgqc7Mty8Gk1kZPtSMyRkie5/24FjrteeZ89U
	fNWAiZnnidGNMKqL/0Q3YvwVBDguOamxcIf9vW+HENoSyU95QVG2a9NIJCL2DRDkcKGUlYCuxur
	V0Et7Jb0j4ar/1fNflijqga7Jhmg8kcnty1mYk82AsIFuGB0u1Y7kgT4PzRnuRCL0/vNnzVdnr6
	Tnc8fQD6WLoMqoAJ9tdlUcKWw8wlL9O9uAyDkrWZwX44e9lBTmd0pS2A+IhmJJdlRzybKU7HULp
	hoojk0x2K3xbIbChKOc3KdZdJq9nOJv4HPBGeQsw8WXc6HusexwzHG0ob7IsAAKueuRrfLYoxm4
	Xg1ikuVi2PqsKhMpYmc13IHzNQrA/bgfWRtuItxtSl7zVnAu/eGFQ==
X-Received: by 2002:a05:600c:46cc:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4995e085347mr52863935e9.6.1786108408434;
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
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
Subject: [PATCH net-next v11 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  7 Aug 2026 15:12:50 +0200
Message-ID: <20260807131301.192060-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
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

