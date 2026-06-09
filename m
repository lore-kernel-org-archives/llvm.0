Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BB4D90B5
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031485; cv=none; b=mupulLuNr3mxJdtqt76NfeAj2q3gzVeUqw6zjDOGbrIfTf6lUvIVPCZQzqRGO4o0Nf0mj7u/I9KleE1dCT8eKasVY6Ay1Iu3LN6HA2HiPYFBJEYdw4PCiL5bbHaD3eQAIZNU7/8EX3GNqTvYB88J7V8dlA+ETIGXr1eVS4E2Wpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031485; c=relaxed/simple;
	bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSBO127p0x8pQ2x2Wg9ouB9sK+KPyHUOcG0B2k6zEScLREEOoQHfm4qqpq6S7fBOBrXcmaG5xJc91T4cCT1xOs9YAVSMs4d2nIIhD0k7G5usgbgY+6oeFjcWDgiIO9eCVlV6kPsV52QG7xiskIpdZXnFGvpmUcXtYNW+u1ZiWTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cZy0v1i7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cZy0v1i7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eeea039ebso3141368f8f.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031480; x=1781636280; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=cZy0v1i7g9A8Q0rl1yIa8/Ol6alSLnI/c2YNdAFzVI1X7WLic1tmVvM54gjUqWQFQ4
         afvtosImESKOJIcgu0Sp3krsqJcCvSlpWYF+xEUIghZoWMEs0mg/Y2lU2kCXOmWQy8T7
         CnSsDKX8v62sGvNjDWkGJsfRicl5ANqsmpfHqU1Qd7fQaDaSK3Rb7Fr0c3NCxvnpKkm7
         SMgLnSCmR7w1aSWBSCyVvwtbsTPoChvMHsM8kdENGz51yDJYpREqeE/3YXkdft/jA4dO
         T4cN7MxFY1r0vYCTJL1oOpMwuM2cmrRlCdqDx1Tabjjazk4ke3ohOQXFyH1UzQuZ3Lb9
         XcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031480; x=1781636280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=h0zWN2zx2+LplpX7kQHy+Yrz3C8q23R+QytyGhOUf8sUXmf1TcU5mUur1D9EALWmf2
         E+SYqgf9eNRiNWnjmxm4xbcHdV4yyza0HAkv1uUg85/Ns9rIHYVAVe0fhmuQqtmYOvac
         l+g0xz/UHQ0Rri9e3tG1EnsLADBXECPZrJsYJZ4X3yaQVGe0TYzSe5MgfTnimBnMAzk/
         Z15e4tZwH/2AipTBAMifWxHzcxff9MulF7C3Em8kpJvWtqocxHJihqqv6/VsRV/ra+yM
         tbUwaQkEU6Tm54Y0c3gqb/OJ6FkY8hAD9GGzLRucqmjwiTcZPGG6tflNExSd9OhnGzpd
         Gttw==
X-Forwarded-Encrypted: i=1; AFNElJ99JPRNNUBYfB842vuk/UAi10OPMOIh8YhGXtA6MD2QUZWt3PGlQ1pnp8DMa3MfIFIGYwg5@lists.linux.dev
X-Gm-Message-State: AOJu0YyziByS5usb0F1TL1D92gOmTHJAaQ23olr01gow+qOJ51517ErM
	cF3RqiNN3uzx0X1EMh9BZ4aQ2ppaavNL3bp9pEdJxbzsiQzZdwtEkI/gO9b9bED8LNY=
X-Gm-Gg: Acq92OEemb3faNEemNlWU04bbP/RwNbBvc7FXkQWDAWhluJdnT916yA4ZXJGLYbpnmP
	X87LolqDBIV9dReoT32r5alI33g02pU+sDEduz/moLXwWGTtyrwN48sAKTKC2DPfsat8IgDX+eE
	PDT9NW4FO6djJi4v1VhHWcEHG4A9z+aaGfQWFVFXH2XP3Z1aNMDbwwS2zqLndCdWVrBQyh9vV1v
	/txwEUjNFqKwGjaK3LWMH5kQPux5IQHD6i2kGzgv5cD8h3cKGIYs0/qsA7UnmC7HzyLdJUJ26mS
	rOmDYLNbVYBkoZnTkczCepphK3BzJZyYPFaoLTnkQpYKjCutVhE+uXgi6q7U6hb2pKI9cee8ADO
	OJ+YGVLBlcFVXqunXVtD7OcZ3XPJBaIQpMugBp7ocdP8xJS6lSW7osr9qjAL05+E5UHTFT0BHBa
	XCiBZ7iHS2Nqgu71o8DMv+yTplESIX0rPZC4pwuH2/5g==
X-Received: by 2002:a5d:550f:0:b0:460:3233:f994 with SMTP id ffacd0b85a97d-4603233fa1fmr26772439f8f.43.1781031480394;
        Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm50663559f8f.14.2026.06.09.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:23 +0200
Subject: [PATCH v6 11/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-11-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJIWtC9Wd2BVK7G1VZ8l/k5HMmsA25/PcSXd6/2gZ+
 f1sXHq/o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYy/wDD/7wDn10ljz4x7v5f
 x+0qqP7Fp+UFx/bzO2//fyb2UPHTo/sMf0V3LxBvKiy/5ByoVr9u0vdfkZOXN0z6r+Hv6Wy2VuL
 0DyYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 8f7409da83392d2d1f160a9645ef4d68f7aaa1bf..04fcd5115b9d95e6e23c4e43782c06501a0fa601 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0

