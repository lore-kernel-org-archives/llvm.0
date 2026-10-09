Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B14516142
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570561; cv=none; b=plI6QBn4ThtAROa4EAm8AmXZ7xtTFrmemzEGtr0DKwv955YDkwIydcHg1McqCjtn0lr328yn4VxJWVVtNsEOQAifdfsdd+xLBXv5PAfhTQ9W5pShQFntah6qB1mFMpPcAkKJMiYtM9mS+t60/rRUAQ3hZVgM54kf+aU1XDUlmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570561; c=relaxed/simple;
	bh=neO9PGuZ4G7cB5JON6/8adxHlnPNKK85h9GRwbYWdEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/nYy9InpMkDOGGrTNJQWZRstRjxrLWUQdY2euie+ckQQYQiew/sX4oCeTMM/22GPBz+E1COZumltTaqEOkUA5YVrrUnKp10cYCT1Hea9LqfUEfY2v7eZ4/ASA1HcnPK65JTRk8p4UTjRlpGV64hYQ8BL9jOIz2vdp612oUBhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYenCTDI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYenCTDI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af27fe287so100451f8f.0
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570555; x=1792175355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=fYenCTDIWnuhfTruW3NH4riKcK9UNfrZm8NHrlHT1XVzEN9XdhowOGUDP6ypeUGqJ6
         +Z/5NgCAKjq8IaJ1nN+0HhU7ZSZrXBruPw6HNhur1MJwS91Sxicf39RznyDdyWtIby9P
         Xk1W5Pa9jxCv6swvv5PcCjr6CYDGIKL8d63nbO2RSoeN9XfRsmZ3halOUenDQN7K7cMH
         QJGNnBqL/RgtHgoVL7Ops9id8g2nk0EZ6MUyKAz6OGutLSVLdHpnJQt/L/H3zpBvN8E6
         PFuozOKrqzrn9Ok9y1DLH5PPw/wKYjoCiAkMQIBh0VWmUUBIstGxW8xP+NwJG7JShep0
         RCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570555; x=1792175355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=NkoWdYVsD5O9aIwaKzf510k47gYhd+FVhj6mDQJIu26uqquzOXYDwup/NmPcQ6x06s
         C/bPharAhZBTrspis/jhIByER0vuYw0GogAfypqxg4sD4nRrR01hogNPFkGw2lzyRn3O
         0ejoB+7J2sWH0kfqI+OCFY7NADSMEzeI2JLLUMoOeuIfdMPX+aCSs1jv9jTe3+ocaa7J
         NiZK5wSbQ23txXcdWALIt6See3Pcu/AEcOlKEZMfNDaKwF+7BYFFnphzNzu2e6+xEQMw
         KovO5+kiBecq8elKxHi4qubCsXMdQ74/VNP9NV+EBbh1DE9b5NxFe+fLbCCZrcxQlL6+
         z4JQ==
X-Forwarded-Encrypted: i=1; AKwUvByGAWtL/XyGJf0L33ADEa/thIilMDre7dG1JyY+o67n0JB7heGQMf4Ux+7iMjhSM2igb0k1@lists.linux.dev
X-Gm-Message-State: AFq9FYJatdAzK+HnIiGL3/PHhRMe4YZA8OuYYJS53gAMzNQMePWAfMH/
	3fdR9JHouOeKD0sAbawikx9Qo/e3BTIguZUx1RTyekyGMgGnFqL8roMc
X-Gm-Gg: AYBFou2WqJgaLzLNiyKmmm263DKAvwz0uJm9Grtm58dwmkS24NYjrAaY2xoRr8/bqad
	RK63Vcn2oj7g/vFH/GwDABiNK4uEyhNE567MnWH1dYAhDIvtB47WUcu+38QkpGihmqa2qOJk3W0
	S0UPg9quqat+k0U0U1oibkl3CrZ5HaglfsmchzMCcctFQTx5DCSMMohPuR1feYp4fcM4Fgq51yd
	KWEGJtaqwdYVtX8Z5cLSRW4dKJhEiDI4z2xuxJjxXrdAn5yxKNmstyoYv4KfLAsLBPDi9/DQRr5
	da3axEMst6Tu9vK6ctke08F+MiFTGnGQhLeX5Nnm9u36yO/bKAVFmrtAA9YgjNM3YuQA6201QLJ
	6cLsqunTXkrcrV4hoqaKixNico99yYbrsGBhzy50qlydWPMXJ36MCMAQkvaaOVh3fKmxwC7bvNp
	xroPwC2mCO4QVCa8N9AGMYS0cstxDOrEafFE0cJ0JlBQwj+yorYEkXRMfzxzep/v8MTXtc22gO0
	xaTJCBqTGbyIs/w5PXXfxWyZdk1bnjjGi7G8mU0FDzhva/n1d/mOPP5JtqXxxlN3YLosM41R8ri
	c4DL5ezHU3Wz+ZzhFg==
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr3669370f8f.28.1791570555000;
        Fri, 09 Oct 2026 11:29:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  9 Oct 2026 20:28:04 +0200
Message-ID: <20261009182836.50631-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
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
index 509b35b5a0e7..d8533e36941c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9759,6 +9759,15 @@ F:	include/uapi/linux/if_bridge.h
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

