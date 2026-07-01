Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B5648AE1F
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909660; cv=none; b=KXPbL6qjd6eNO1wiNqVnT/SIHEfg88ndknMh1/5PH8Eylv3s/gUw2ASnpDOpcf8ToSleljis7EAaJ1umJX7uxetFCtuVglmeC0LZX0rhnDFYH3R+0ev1RohSTqkVcexSyV/YJd+Dl3tK/qCGgTCLvfN4zQ6N3dOAQnu0/a9zEY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909660; c=relaxed/simple;
	bh=hhLOVviNovSyV3jCQbGI+vZbPMnJi+hWYd14KZ/n2h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hiap4rHkuMJxKmlAF3gwBnVIb92yjEZEeYnQGzqnYC7rgB0L0dfPQ16UBh+2l1nldQb9TX6+h0z72/vi0r3UYwkVgkxtH8xlSUNMUVXJziI6nnS3Eg1fjk7vZE+XI0ukK5YOzJTV3F4IOa0dGFfxkLG0sA5YnyNwBCQGzJqtYPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CI9dUMi5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CI9dUMi5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476a130c138so623150f8f.0
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909657; x=1783514457; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=;
        b=CI9dUMi5ZicZArDEaJARgjxK5ZO1mKQrm34OTTip3Kvblm6hL4hK3K6eWRxffU6TR4
         i964Jo6zBag47GVtTTstPptEzGiTkhMTaeLL51ZST356cGjkyA200uFJJ32vQe6b+FBr
         kj8gJHNLBUpiDK4UHOgBudRAtDVGclsw1QOJGycCZf2cXrd8jpkLkWehm9/399sm6SvG
         +4sPCEv8qz0VDHL1PsPc/DBSh+cUKJqA4CJd5PNMcKHU8CUqfwCho24+qhr85iQ2j5Gj
         LW47YHi494tA4Xj9fIKpXy/FbHfSBiYhnK0AnS2iKgepKrK9IsMNhvKcMVSL0JXlaCRG
         QMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909657; x=1783514457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=;
        b=bNWhNMDJanrt+hCM103nGNo2pleTyDrE4i2dWN5Yh83XqESsI4LEO9Nrd2XPZ3l+gS
         rzA6pdleiv/c1/I5LlxQfPVZtOJrFG8OEJPHQvgZmYJF4qAon0EjUqIR2e2Z7EpRCMLG
         mwDscHQD1EWQ71lX8LHDl8C5NkvbqebbkYE8C6q4kh0ZFPFQYjYq1KLvjLizGvu1r6DB
         OIj92r1hzqtOLvNYnNl29C5Zv2KXd5+OJWkrUUr08c9OJcP0ewmBSmAe4KjFO6iYZuhw
         i9m+ekwuQufJMO6TSVLeN1GbhUOovde1g+bXwqEAm8mllhuOBHqjTSbDtQB+XyvHy0PX
         Yrbw==
X-Forwarded-Encrypted: i=1; AHgh+RpHT41SYswPc1VdzsUatt07fN0GAzlYahuYbgps46gTMMG6x2O8ZwwDkhMzJyCClpHhleV/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8tTs3fWB/ELicON7ofsha98QeHwknhBr+Si5EoYt2K4MHuaa1
	Nw9eCUbnfBYXljQ90LoeZncaZGFtmC5d4zwvv/YRwp5rSdxF5j5aGlhX508HRQyuv8k=
X-Gm-Gg: AfdE7clgPvlfCLVKOrizeWFZB1RCNU7h+RH219jmr3g757lXKweaLJK5DMluOxtP9Ju
	/ypGiCogDorIO0Xm5Ga6XteXqtcQJAFG+Rk1lH3jBSeopMpj+HjJvuONxZVN++TTJ39eGbaZ/2I
	RgH7V5ZUixEM4gGcyMT66gW3E1dJV2hToozKXTveLPyOis6nkSDQkAv8/sksXTvb61uJL0se485
	yl9eqV6FKnDYpdDEns44EpwoVaWBPVmRHfD8LTK3OdHLmvgi96Ssa9LmAQIM0/YHs9z7C4cRepb
	ZeWWdYGbjJ7TRka0I0ZArK1P1FPWTaDWuFrLMPetgkmkeo2dy3UO6NeSl8ulWY5+fBjZLdXO8bh
	cZVZcDksrEB5HSRzdk+De8OjaBuyPRSKqy9IYfPy6POX6eebohZyafSjRV45ox0zSPLj1jboakI
	JNLzKqVSgFDw==
X-Received: by 2002:a05:600c:9a3:b0:492:4723:166b with SMTP id 5b1f17b1804b1-493c3cd70e6mr5739425e9.13.1782909656935;
        Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-476792758aasm9625656f8f.11.2026.07.01.05.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:19 +0200
Subject: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480; i=msp@baylibre.com;
 h=from:subject:message-id; bh=hhLOVviNovSyV3jCQbGI+vZbPMnJi+hWYd14KZ/n2h0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrhWm1kv4d5+ckVewTliyr9Fg9vXEV3fK1xy0ZTL9l
 GK/xtOho5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyby7Df8dz2WfUzl/41pXL
 8mPfjyPqRjUnOV/xnVQPbYvnfMBWPYHhn6FlChPbfNGHPWsfJ25ZlvHw0E754+nxfk2OfkcXzTI
 6ww0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

It also moves the bootph-pre-ram flags from k3-am62d2-evm.dts into the
firmware dtsi so that all boards inherit them.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 17 -----------------
 4 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index e13da7c95a30459e7649f284689039b89a95f651..228ffa4be4be7b32e43a06d807d3fee073d203dc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,18 +59,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b1670beafb8852b76a3f6a79295ce8ca..682b1c9f3071ddf23044c1fde1e88f2b901ec64c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -29,6 +29,19 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
 		reg = <0x00 0x9b900000 0x00 0xf00000>;
 		no-map;
 	};
+
+	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c800000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c900000 0x00 0x01d00000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -67,6 +80,7 @@ &wkup_r5fss0_core0 {
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
 	memory-region-names = "dma", "firmware";
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 08c73cae26c73993a613372110bfd5611c403846..27801c22a550330b52c4424f919d80f10dc76403 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -53,18 +53,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 463a3f6130b8f2927a032137e87c01df446cffda..dd6937789a9c6b7c92ef5ad1fcc3ae94a90e2353 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -59,19 +59,6 @@ secure_tfa_ddr: tfa@80000000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-			bootph-pre-ram;
-		};
-
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
@@ -776,10 +763,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };

-- 
2.53.0

