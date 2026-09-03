Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B584A64EF
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439250; cv=none; b=aA4mZaooaorygIF2xUfs5FIiel8IWfsaGDzIeTPJEsK2CCVu3QvAVB3U4kHlCVFh63WbI1ep9grHgeL4P3eHSrbkDYMxGF6CfUIuXUJDKEFv48euWqp84+ML2ekyORTvR+lG4XvMcTIzYV0NQ3AKF4Q8IUxYqrD5IgHJSlNOWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439250; c=relaxed/simple;
	bh=DH50lV/dqbquT6Sm3x8Cg+FWHILrsd8o5PxQFy+G9AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ap2VOH2wmuT2S/ZOIChKpiNrsmxN91BmbZCs9bgKZiRwIOsgQE9cx0pVRDz+rJPQ8Omg1c3b8jtRHOmTaaOVBaIGT1cZ4+kdDIED1P20y0mQkE3RInoMB/Ulq1sPFZj4UIrrPI4tngdfQsZMVIrjtmm4K73d9gpYMtKKi+usOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MxU1VEY+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MxU1VEY+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48436251906so2413821f8f.0
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439245; x=1789044045; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=;
        b=MxU1VEY+NWsHSozijch6SX9Uo9uE+AuEPoXAoX2D/DT6NWjE4OjlFtg6VfhygmMz4p
         N7Jc6ne0lkJKsCh7W3e+6SF+zBa1Qnr6oTz2uPmXDIkuIbX6H5suNAImyh4oQixZl52e
         sgLlMMb99mOJDeav6CISayqI9QBfFeF+JYPYhi9XH9FSUUw6dqenvvxUtetmG0GlS0nU
         Ptc6ksnXV4clhyGPnOj1yLgPWQ0HowPJSfaTpKLsWMftxLm9l5CoOEi7mcrsD+vDXhBr
         u1YExg3hg8liSlJlQO+6X55gLJdi8MT/UCJmZdh6S7Tp7QV0JL+mMgctSTp4fvY/90eI
         nqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439245; x=1789044045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=;
        b=f8a9ScB8trKugkRh6QvPZSvs7fECrQopuIH9G/xajDCGnPtrNL9v4g8zfBeX4OIPah
         8SZyDdvSRbAeJy2gZrYJkS9tcL6jY7zJxDLY7Eg0bCvJryut3gLaun9KjFZg9qXwYOzd
         jPHBEjGdq/nSoOyVVM+/FiPZfmw0DNURfVGbdW8Bs6xmGmRR42COzOoRZEZqa6s2KzUK
         r9JP2HyHpqz/9EpZ+zEek8iDAMowAY3+hZN7D03n1ZiIQOFo7oROrY8JG7rxE0U1N/Jz
         oR4V028GgKoy+GP3moDb3uTLP+ZurrhjtI497P+wfcAEFdwHJQ6Nhpmbwb5TpGopfsLN
         DT5w==
X-Forwarded-Encrypted: i=1; AKwUvByxgSq/u91akquAtO6prKrqiTd2m+pCUkbz8j4LtdIezI6EZcnPJGccjivGKKWinmRdZHMl@lists.linux.dev
X-Gm-Message-State: AFuF++lTyu7iiSua2GePJVJ9OhQrzL7MZjv4UIbdsQK501yUpf+or8Tg
	eMsW9bChkodBAC0tCcdvs7ZKPRa/Y8ZZw3EruvpZ3c0nvn1UXMYFKXWh7Vj+QjzsIGI=
X-Gm-Gg: AYBFou1nhU4SZHVnzH5js8l+MA8GnTgWZVqvCc3+v1DprPjT+9cQ4WYoqLqYBJwiZLk
	PDM1GarqcvV56FWsGb5JNvucaE0w5y028hd4Zmt68w01jkye9zQ3iJYAJQL/KZLsjlBycVHOH6t
	7F48iftmamUgQVZ3IcVNGJYluCiFptTL5YEDou+CZPlh6knInfgwc93LoxnJCfbPe08Aapz0IKw
	W3OXjNJ0uP41cikLGOFwMxAmbeTOgOGqfwYoLxJCQduW0KTb4K6XtBx67NRThDWByiLZZjxHCWJ
	shw8BFRsUjsssMqAv6jzCFpwIwQMFZSOwT4o1Nrf/hcoD/11RDwCs02SYPc8NeDZ/w59ZJVmVsY
	zJ6soyDTktmDd0YreBCM0DRcGxDhrvucsEcxoZm/vdn9lsTnoI33RwxilLmaXe+WPdmCA3jGzb5
	urW1sQ9greYhPFuK/gexYx10avznXHHVWCiKmnXtojSnm6IhunLqXnRVkf5VRlzdlNrxwNjl3yS
	Gv8RZaE
X-Received: by 2002:a05:600c:5306:b0:49c:c9ac:a4f3 with SMTP id 5b1f17b1804b1-49ce5810b6amr242693105e9.1.1788439244839;
        Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7ac52c3sm92330065e9.4.2026.09.03.05.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:28 +0200
Subject: [PATCH v8 7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5457; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DH50lV/dqbquT6Sm3x8Cg+FWHILrsd8o5PxQFy+G9AY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZuc1pYm/wh9XdQbysHzl1/QI/r4LH/h9x1sETXvx
 SVnblnTUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPZ843hD+/0hS/OB+lNshTa
 /fWx0kKveLFnTjsqXzNN39Txeo2vkTrDL+b+NbMlfC2eT23h+Zl4RjG1r2iDxi2m/AOsc85+37c
 ujRUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 28 ++++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 53c096da68b5..7fa19ced1a23 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -65,9 +65,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b167..94c1d60d8d7a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -65,8 +65,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 6e5419de8e35..871ec227def9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index a8c794d07343..7cba3ff99e6a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
 			bootph-pre-ram;
 		};
 
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
+			no-map;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;

-- 
2.55.0

