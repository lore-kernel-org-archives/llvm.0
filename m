Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644183DC4C4
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307511; cv=none; b=Em+49ojzykd0rKKxMkWPAO7QkRwpucWE2vnCOcje0APnmGJ2Z27ohn4kKVF9anTUrjGyr/5ld451b28prxTpQ4AlktdJzvZ3R/sfWsUqAa+dhdRHLYZjaCIMAU8VbkZW8lNCX6TpNKZD2VNbKh+pMSlDrfA9K5Oo3oHQG0dZlp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307511; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2wyhJH+m2wJZuEU/aemU5P1xFFT5uPFtRZ4rqNYPLPdzAvga+bpKmoKA8lJIZ3wvwUwaWInX7UBR7MOgw1shGhJPpvxeTs50Mzc2vBdBPrsq4IlROWM0Wsea/CuTHOhcn0JO6iBiwI8folkLOnlmIddOacg7bkFRMhWyB6u0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZ2+ceEB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZ2+ceEB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso7453955e9.2
        for <llvm@lists.linux.dev>; Sun, 09 Aug 2026 13:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307506; x=1786912306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=IZ2+ceEBl/SVNR0MpW3dMZVvYcVJTHHWIrGqScoEjC7ZZy9f1Tz7WMEvL9Njz1jEWm
         FBiUF/IMz6vnI4LBXE64eVH9REa6chrOO542UItheNHsqsIsy7PwwDY+ZEe4lvpIObjL
         2YEhivwOK/IjYKg8glGFntYV0xD9S6ifSYrKM8HwiCwT2ZWxCw4dKoquo/EY9KSrGsBb
         LMbYxdTUy5U7zeKvFIHTVptR9u1dIPHImH8T+EbIHuUJlDSJ+12i8klAVYioptUoqt8j
         gwRk/UPxyt4E19wCGCS6F1gyN7YOpdeQGXhU8C3kzi0Ctm2oUzZ2EYAi2x8XVxjhUhjy
         C+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307506; x=1786912306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=NsvWQFy33TKvFyzViJ+YA6KM7nib8t2lotkACJgjNhmHMhqMSMeCppUWMliDsEycRT
         mj4EoMVr80LSricglaV6T2yD2elNm7nsXse0uzexmA6s36V2V0kdkD4PkSChF2OCqxFp
         cgvfOR/I0Tpho6rFTcRa5j8I2XPPpAOFWSMXuZrJCI+DJzhgHX9wocE39mNBlIQrhjrM
         TA2ehU78V3iJRL1rSGcOb2begOSCN/G+9f1lxRG9AL0phljVBUVUF5QXS/EcdVBdF4J8
         zEBUgNS2QqXffYhvYzvnteZtKNg6rNKBuFkdQxug5hpPUVFw7d7pchrxDoU+Zt+cckBY
         0QIA==
X-Forwarded-Encrypted: i=1; AHgh+RrFpK8y+zTMAjmdDwSXU86IM1v5yBXNFPe+fAs4xalYH792FgF4icIdgZRuoGA8PILd5XS+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5iRHrqC6FXq5aDg0L9qD1t2fjidkw2MToMOgpSRwLVmagdPCj
	Ja0F24sStjwsdm1cB55WKr1mfVoIILun/mDbGAm3hWH6ceoTtcChh0C8
X-Gm-Gg: AR+sD10KRIUJyBHQEzTzLJECrvzG3c+6aV3iwxeV7to2WRqpWG5DVb2XJuIkvBdST5S
	Xdx/qI6Mz98woL5KzmOEOMvQM8PxYSbVgS3esZPjRa2ZaRRnfmNeWb68fXSLq3NSy1FATmBnlNN
	nYwqw8TXJf/QlrOMgHr9SilnZ3MZsrUq+a8qY20gmM52dVMF1PIbZm8LaZqRSY37tMVP+TePoHT
	0F9Znho7pklFeFsPwBRS/6XqJE1oUPMwD99IBPg/9151OXe/QK7M1F6qsaKOSvI5H3Q9b5MvTIN
	09U8+WoF+kuQkKzQS7kozEADg5fwMfiWNOpurNsxpkErVXmoau85L5OlnWmOm6rLNqzvgYaSTub
	0O/cJOb/xxmnfCVf2G9SkePQdUgwsPYPww78V6YxhxBG39qMcEhe7w9BYgt85gIWx7gEt/fOIDy
	FtF0rmCR036jHDL/TYGP7n5W0JaRErAn+o1lcAVqqre8djWWrpZMDWPwH3tOu1rsHZ+mIaM4VpN
	g48fAgsf4GcRHxLC9u/7ZaBU7HVNrqnUVKbnXRYuBq235C9rKtsew9/j8Qe
X-Received: by 2002:a05:600c:5251:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-4995b04695bmr259698705e9.16.1786307506550;
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
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
Subject: [PATCH net-next v12 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sun,  9 Aug 2026 22:31:05 +0200
Message-ID: <20260809203116.640271-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
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

