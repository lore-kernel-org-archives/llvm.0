Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD4528F3
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994405; cv=none; b=E1FYuIRbd7OUPJw2qfxpmE2gTVOMYzPFJxy8VTBRggakalyJCB2rWxvp3Zt2UzxXJWuYdPzUk8+tz9+l75fk4u8e/8WAGFPbT2tao4NDniKHU/LRJ0+tlR46b/pjMdZSlKHSgjd+3Hfw4A0VPjFYRT+VHpobJp3cb+lwC9rM/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994405; c=relaxed/simple;
	bh=RqTCHmbF245kSlH2k5rQcAnN0ey4gGVyGdxrK0XkQNs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMMA7hSA53mAQOEmBZxKyPiUggY5HFXU8BJy+YRQSOt3l+2xUBS0mulfkkbPba8TnjSMd6r2+TIOTaZyTQ7QH9FulGPXYvvdAavW1N00Nt1pqxH6XZQAv9co2/OrgSVXwTjQ7Ic/3JfnCmG5spScoEWnE3e3LM9jw9omQKgzrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VS6su709; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS6su709"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so39349195e9.2
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994402; x=1747599202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=;
        b=VS6su709HnXFo5BiaK49HfLomelt0JiZ8IJS6PUtfnzX4sRuU9V8/fbUFjP4HdFTMI
         lmHCbP9iQ11PyUUhmybK0gnjxcM1RjCidvdinKvXzpyEXfWjLw8CL4apa6RmN7PFIc/a
         OoxnBLkjmiHpS5WYteS6VdDUqNtbtDsVj6wt3K1eFhUECcdFViq4TD4SwpeAFqbVG7Sc
         GaANs7Sl1cIB2x/tBYqOeXzV5k7nJraq7Q4xpSCpBkmGV3hCy+Tt/TRd6w+wPWwbrCUM
         4bUEq9Za/dCJc46KKABvVeem34aZhjVBmBemV67lo6/sR2eO3HjHlmrnNFMIMjCkaWHI
         w86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994402; x=1747599202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=;
        b=vnXsuwPQeF9naybufl7RljwkC1IRg91wz/h643IcTq0V19feh9WeGMZ/R4xa6KWR7W
         2P3Y8b72kjGoJNPKnOXPNbGbohn5JcW/YzVhBzmuNqw4w1WS6pEXWSL0aKN4ClOQtikh
         35qQjmFr/6FlhFgnKbnrENM1dZn4Mh0Y5LsAhoo0gZGywMg8e7fWHqNGcuUQgYPpBMQD
         aqCLMQcYuysjD21XTSaDcN2nzOi7Z2Ql0xJZx1olxxtRSwNXqpvPn62rRNP6AR+6OlZU
         sPF6ka5SyfBJM872U7PHLcLiP9DING8r02tIrydWcishEYaTf6NmEeMeFhc1/Bfu8y76
         BaGw==
X-Forwarded-Encrypted: i=1; AJvYcCXt9gi4QN7YJyTODLRRujVXlZORnWttNM1R9t/VQY92kjN3GZsjBt8hQPLNzoeKpuiDN/3l@lists.linux.dev
X-Gm-Message-State: AOJu0YxZxlRZUU4BPUgmig942mO6FGePLyUsi2QeEjyAO+6qnAo/5NvP
	hBhNK/zDGtttXI0AafZZRRz1377xESMEH9OPPLqsd4KzCCQqione
X-Gm-Gg: ASbGnctWjQpI9d/x2Ruya1ZmAyQxkQVfoa6ZidGn73i7+SULKuHnKQOGdxoXCmg7Trs
	vzGSK03pn+FmkpaYBjPNFFEfMv0kcQPCfFgYXzPpaAQDUEaD/ExcYMpuROXe/pRp8MlngeHbjxh
	P7aNzuQlKDiAUxW/PyfhJAx9uIP5jCRZLS7954FT1LsXx6k22uh/RD0BxZbNHjbU0rKWx0q6/uX
	Lb+Sgfi5wj0j2EyBC+nGEIwHjhqCRFq2fZlhQnmwoeuWEsPc3Q5q+V77qSylcXeGs6p9zQhKURn
	zmkxPfAtDpgVPsrBlrvusNzNlP4ROFUXweFNxEu3zA2rBH/0OvGKFUIbvJB3w4/wyZsFPgcbkqn
	62tzxuBnrvrwlLvUd7RQc
X-Google-Smtp-Source: AGHT+IEnQwKcdJIIC9mWyLPQ3iul9zlKmb5PJkirLZR9E9nTVzO83g3zG+H4e+2LZ3puNkjMaAX+0A==
X-Received: by 2002:a05:600c:3e0f:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442e1093222mr47153335e9.24.1746994401481;
        Sun, 11 May 2025 13:13:21 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 01/11] net: phy: introduce phy_interface_copy helper
Date: Sun, 11 May 2025 22:12:27 +0200
Message-ID: <20250511201250.3789083-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250511201250.3789083-1-ansuelsmth@gmail.com>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce phy_interface_copy helper as a shorthand to copy the PHY
interface bitmap to a different location.

This is useful if a PHY interface bitmap needs to be stored in a
different variable and needs to be reset to an original value saved in a
different bitmap.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/phy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index d62d292024bc..9f0e5fb30d63 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -173,6 +173,11 @@ static inline void phy_interface_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, PHY_INTERFACE_MODE_MAX);
 }
 
+static inline void phy_interface_copy(unsigned long *dst, const unsigned long *src)
+{
+	bitmap_copy(dst, src, PHY_INTERFACE_MODE_MAX);
+}
+
 static inline void phy_interface_set_rgmii(unsigned long *intf)
 {
 	__set_bit(PHY_INTERFACE_MODE_RGMII, intf);
-- 
2.48.1

