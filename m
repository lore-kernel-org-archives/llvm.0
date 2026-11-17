Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919232;
	b=D9M0xIm5mXke3K5NWprSF5GwloW4bZtXqTH7I3JfplxS0jEjRkoXIaaffWqUxgxxm24m
	 YQIl+ReXeaIIWCqDOaKdrn32beFbfmSRtdtDAPBv2Gg5qo9If+7c52ab4QBE/ftJStJN8
	 kTjIm3gSSSaa0fqamjeKoVOgHGtJIPVo1zGgdwkCYQ1GIHGTLaIjLpSQWEI6f4gnoS2p6
	 I1K7fbcQqDr0o+F2DWZ72ffvdEdxHa1T1+heiL4JJFCpONIDSMfqtAmQE1hSvP5Bc2dfR
	 +hU/8O08yy9NZfcDntsLjFFEG1qMfQwYYFoBmVNlCEjzkcsXdmVSdyDneEyZxT402YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
	b=Cn+vV60KfzJPlme8YSbTQOYykhu3n8o23bKKQWHdRoTPc2G3IabtCPhH1oKsX6dv8GbP
	 +rPd2gjbv33iEV9GUTUw6URiYBF7A3Q/8KGQPH/qCtq+xYk13AO+E/25V1tTl8T4UAkJh
	 4pF++p0qukW5ecbrFsf47WjeQLAF0hX+4oauAD7n84wW5aC8d5lJDyCB91uOI1tYH8MtM
	 +b8dgCUout8NJA3jtKonld6WJ7PMQs8kAMzrI4bLI3fx3llL1t/pV1xQZrpauWK5tEcpA
	 qjiKHMLULesTBn30AFNOipSkS3OB9CfQ8vNpc8j0aVdKR6VZHWtQuzM89Su8O95Yr6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N9ER/XYM";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7860A262F
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A7860A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9ER/XYM
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48050465e9.2
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=N9ER/XYMJxDSrUMp+Bhz9JS/lgXJo6E/Z0gurZt6T4U9tSOzu9XZzG9sD1Pa5pf+Gs
         OZs1i+ETjaOtcYKzkZLNFMgjzX+uM33UzcZBm50f0iEfmRYMBFJ4aoH7ThnUO0RWWbHN
         iKKFISA6/fp5+Vv4XPTfWff/bxSSZ16YgsNDfKqefHT5BTOTH1+2CWzNnFjZ3+uu+L7m
         9rVxWOuVLWj4NtQXPymbMmUTW6v8TaN/mtN+3KLfALTsJheHpPd/fAKb39SMtxsrPbmM
         FaJeMQnv1m3wJlb1AF+khA2+r6tas2ioLMVGoLyWPRKub4N/A2ya7DEYSex7yNFzEdYF
         3ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=WsUsUeswGujN3n6jpZW7URvDn0IrJHNHv+smogdyphrJhF0DI2RdBmEPTufEH70HNN
         Ymvr9YkU8MzjLL0IrN7mPlAK53HaVodXkSXaL/Uv5HMeIaFlJICbOpDWRgGvZjVPWl2x
         OrSAQJRwXEXYfTEsDSoid8UYZQVWwwQC1Lxo9jzVjErwfdfkKUAT70EPCbq86oPxrV2O
         8yplgwL2YjIg9RCvEPZm6D66YYzW0eincMDFO965Z+qGB2kwh1rrRzXGhTYhcFt71ISX
         EYF1szpL9+9UQrUNI0JSDXkMg1Y0AtyZzotpPRoSqvSu2+UhWDcEuXxA47TdfsUUe5rb
         mduA==
X-Forwarded-Encrypted: i=1; AL+hErG/a4ZVhgjPdcaDYOuJRANgagv03yXD44dechOp8OjzgWh6q0e7CYLDXl40Ehe6uT3mVWJD@lists.linux.dev
X-Gm-Message-State: APuU4Z84JIBCqvLrReLWrIE/OYqwiZTzzKe71EPsCA5GTiG6wsmS9yk8
	ZLn+AoaFQmCceK5uW5GjH2CRjj4ufB+1UuRdU7EOqFb4rHnk0qdl2o1x
X-Gm-Gg: AYBFou06bFbGd5sc0f2/kJte4r9Rn5jGjjmOp6oR+X52NXWzVvHG+J9BQc9GJwfkmZL
	vkRIkkFj4P/OBIUphv+pURHgFmEq6FjOY99OmESoq/cQ4fGHVquriT8PHrkD44hId+dd31WPGYY
	6Lsu75RH8/GfRQOL3NbSiymTGEAcucTf1FcnPT4Y1x5nk03YlnfQI2PoFAaWmNaLPVmsw9EuO++
	Ss1o/2buVcn6hxYbEMli1usiEnlQYEEhYk/uDTGtHHquZrNdPRhAGl6DkFJoERddWj7ZbZH48Cj
	YkI2xSFTNWSNzOIMdyAkCSuzAbF3btBGJzz+xbos789C9fA85nsAYIDHx3QZp7kcwc5bBYlyTBx
	+yjGKbLHIPHaE9SX2/CKTd8fp1i77Kn53xhXEK68G+ZLymwsCIzK/tUio0+bq8NiX/xB8gI7cUq
	AVRzT5aVsKMpkQHjUAM5K/MRjtA7reWiG0K+HMM7+g5vNRI6KCPLVtQ1FE6O6nn2OwdDmpoDqk1
	17BpzmBoTK6tlXdrYjgK1TORw6yrhscspwc0KEAuPTsf78ZCJNaOetJis9pyzVybl2CEGi8nIZh
	CZ0u9HNmCX81WQTUARA4J7JJjXJ515c4qVEwdrzlXIN9ustmbYHwU0EhxaCUjLDE8X7cHpbXsZh
	Ivnv1ZPq/W12+dn4RTCqaydTQL3J5gNgQNQ==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
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

