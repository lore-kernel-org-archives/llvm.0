Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF503FC5AA
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723162; cv=none; b=eIBzzYvhmREO1yLzQsXrk/sVlEi0FHnU2aLrKrpvYWrIdJKB/54oFXGjZGVTB6PfxgH0ByHD+ZDlLqvsDEYpuUy+BDt+rLiphBuaqk2iahPNBqUmFq8D5JobRmK8PpQUmSVVX6pt1L1vgD3mMBPVWmlSfbU8Xy/y7GErap4Kga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723162; c=relaxed/simple;
	bh=JMttWZLJBxNJg22BrePdNzNZmWTgkc5WUsraEC2+rhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hj0IgOcK4px7dvlymrA0PE8XWi5u3HzdpMoBL/8vHKuuHAj5HGXDbm5QLpleHqEovH0xZlEa+fkI7AUTfbT6bu5GtapEG/0zwRpvrePWXnKz0SZc4lq2KNcx+YD8o73uTS1kw1Zy4SxpxCTJb4P49qRHAJVAD1DnipvXB1dbFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bxSOL456; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bxSOL456"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so2695405e9.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723151; x=1790327951; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46OVOvm52EGzniG08o+lzXCszJzLBf6CXcWqmTIxVyA=;
        b=bxSOL456W/65j+9y13R5XxuRaWjxZN7hGJB3OL+rBtx9RCP9F1z++G97qnXLCrIK/F
         PkZLyejZjZWHswL4CyKAbIegHW2U1Mu1jaGEXi45COboDmTWPkIM7FVDwXrpKpVxRwCk
         44YsPIQYeHZgDzA+/z9fyt5bPx+d6O/uZHEWf5E3bvlA5K51StSKwfx13B33Gjb8GmI3
         v/WpgUVnHPj66R7lPzNDJqAkwfrQ1gNr2NPMjw8m/pFbGSYPXWD98WN7LSvwPIB6vffY
         9BOJpsSZx+xz0MzysCwJ1NSU+GpXaDfNNMZxeykypPWW2Sx7dZoS6HDTOwEpMA/bXlCY
         04KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723151; x=1790327951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46OVOvm52EGzniG08o+lzXCszJzLBf6CXcWqmTIxVyA=;
        b=IBdhkOoosAJwREINHJJ5hyM74U6b/vL64sI0mdiAsk6Xbi+KCf90HZJrg8KArOIjLq
         gg6HojQpzV7y+w4n5ugy2CzUiKaWFJr5rzmraSp9C9kzBujSfjBinIRcdyqs0sSBNQkp
         djJC6o/B5o5h+DSJZvt28w+YJeLAF/AwCDV5nCxEBQKXtrq6ge5MQ9RiTAXDcHrKKE7e
         OSMdMIzZlSSxCD/c4m5myrE4HBhHT+i/S5GVCm0yr9DraFOijSFVdUxBfOMQscPZYStq
         ONYn7t/opnJgY3UES7m3hbN98L/uiEyJqdkfuc4CntBbI+ibLv4bFj8nmBTf/SaVcy/b
         R/RA==
X-Forwarded-Encrypted: i=1; AKwUvByFfkTmnUag8IdA2wAAIx6bvErzg2JY8ipRsLR/r5RQ/O5gtYaw7Ry2zeUGKCqbOjAeUFPE@lists.linux.dev
X-Gm-Message-State: AFuF++lxtlsdrazroiG+g4DXB3B+bveeqBva7t8aPy9BGCAlIyfuVcoo
	jm9nZZ0SPqSBpexR+8iDEx4Udzy1wx/JfuTcnSR3VpR59vaDDEg/NL2V4tzNiguEDj4=
X-Gm-Gg: AYBFou0OBRI+Gr0lX5u8PZfE5Xj7pmvMFQ5ZCzqFR99TZ4UJCQAI0NARaI5yKnRU0Ee
	Sb4inwmBGWZTMEIXtxwsClNkry7mRLbW/8gd9zygkVkiBOvQBEX8waou1XDX3Nk/64FGmnlDYUy
	lQZw1QmNLwm26njQaaWD+zCMniMTIxYs4IGo++309zu/Bb3dsjSQByq9r5r223hWwFV1X0TlzWg
	UE7S+WpLCgBgUgg3ShsvI0CiQbWiQJB4A1lHyHFBuMSy8kVxtCzDtKtuiUt1UoqMS4idVfK8YIc
	GifJPh4EDnUtoOBTTAUwyrt0Q7qKtAOYRbYGOuh5YIiEdClS/le6MzXDWIZBL+XjihbCOYFKlYc
	B6foe0X0XgvnrhzPnkLUa9SeD8mgmWX+Pkjw7fBCOZ7uxbDOCe8wUxIzzQVr9qm9xijTUAp7VPR
	nUYVeRYXpqFlf7QfLpcO/xYPeEhlGSNNsAXlxk9utDnSp2Znr/p4WGUCaxIp+cvPYOOyE=
X-Received: by 2002:a05:600c:a0a:b0:49e:84bf:6110 with SMTP id 5b1f17b1804b1-49fc56dbb49mr23707885e9.6.1789723151224;
        Fri, 18 Sep 2026 02:19:11 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm141690505e9.13.2026.09.18.02.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:10 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:53 +0200
Subject: [PATCH v9 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-9-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5163; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JMttWZLJBxNJg22BrePdNzNZmWTgkc5WUsraEC2+rhQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jK82L3y4Me74v9D7pxcVs69t52vj02hK7FDhyDq/p
 qJq972ajlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIiq0M/4NOCW3h0743xVih
 eveOJX8PuvzfWuI1dV9u5peSJX8yOA4xMhy0WR8fcuyoYESsstkRx6j/XGkXuX5q/Hcx37xt63I
 LVyYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in
which data is stored to resume. This needs to be done before RAM is
in use to avoid overwriting data.

Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
ipc-firmware dtsi files and to the lpm metadata region nodes of the
AM62A and AM62P boards.

The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
redundant with the dtsi-wide flag and is dropped.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 4 ----
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 1 +
 8 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 7fa19ced1a23..12be777a35ca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -80,6 +80,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 94c1d60d8d7a..7beca54e75ee 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -63,6 +63,7 @@ &wkup_r5fss0 {
 };
 
 &wkup_r5fss0_core0 {
+	bootph-pre-ram;
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_ipc_region>,
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 871ec227def9..fe75f6b6b50b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -74,6 +74,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 7cba3ff99e6a..f87d6d515e2b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -800,10 +800,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 84dfbfd1986c..277d7e268cfe 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -42,6 +42,7 @@ &wkup_r5fss0 {
 };
 
 &wkup_r5fss0_core0 {
+	bootph-pre-ram;
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_ipc_region>,
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 45ab9d947b3a..62a518dbbdbe 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -183,6 +183,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index bb027c65eddd..39af098e4db2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -70,6 +70,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 31f670fdd91d..2eefbd8d47a4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -84,6 +84,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 

-- 
2.55.0

