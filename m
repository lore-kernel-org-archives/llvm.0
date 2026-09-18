Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39C73F58E9
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723160; cv=none; b=CpG8bYMkYXr0ZvDMagtapSrMtpnTdh/gFVsbV/VGa5nDzeGFW/QLHwtmzpoVstz4if7eZTYmyyNPZ3AwvgGELMGm+3qQOFEd4sBvB2GTYYlLsiRBhLFbxY/L+D0SZV1pzHxy8iQSSV8kJrUE6SxWhBIkeKcjWnaAxPCkdrWz4hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723160; c=relaxed/simple;
	bh=ZJzy9E8PlgkB1b0i/bkQxUTFa8ZhyIY8E8Ayom+Mjrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arsQTRfKoo8dfHxthTz+eMNn3hmHj5NIUwrrM/0Ip2P2h3QqmZXwXHLgOp8WF25xyGIs/F3UAcj+orIBYtCHFcD9VqXw3nJ0eCH4MIPBDAjCMBPrtVTE1uMpNjvKQ8kiuv4Zn5B9+D8MZOuG2vDSCpmaPabZVHkzMTsXsit72iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dlirFHz3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dlirFHz3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so3780155e9.0
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723150; x=1790327950; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=;
        b=dlirFHz3PJVkYdwbavq3Vfqz27IRwUAOmeZ54Xa66soSXsciyn4foCDP3s4YaKsa8W
         DvRFnuN8h7mNOt8rTYcG4kQSZAkhjXD4f+8Z78KtMETaVyN6pSW6C4ReUbd09K8ICVao
         jOoSYXiH96OCAsjtG45CrsTW8peJ3kHYTzsUIFUFp5VowgrtW7eBduu31pr6esNm8MIx
         tJPoq6L5iHLUbcAga85DHfhO/+BaHy1X8Ix9GN3a9A5oMGLqk6ih2T4vNIbgSqw/4lFd
         nCiC97B3kPSJTAR2QlDCHAy8ldaJ4OAnDixPj+gko5drCcpg+YKbO71Fp3HaW2M8H6IW
         6kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723150; x=1790327950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=;
        b=uV9myehaV31XKivbOu6QlaY4BT6C5zLPP8mEDuw60okxb4/YtMDXDbpeetlZc407q0
         WGGhgc2MZwMSmG4ZqcBLX+8egqI//4n7Bx0dktNyGG80+RV3yRVMtI9V1f2F6TANJE8r
         Vyzc+AkCPkpSMPE1u3XW0pK7Yi88kgmpzRGI7r6snTR8uyJ8/dvd4kzEGyB+fep+t2Fs
         IWK5rG/fQ/tnGxihNhnCfcxTkKG/kqSb0apraqoSmEDpNIrnFUv1LLv37mp27WRAuK7W
         XPRl0R2K6k+X6B38XqKdWnQyaTYbgVhcKu5A8Byf2rixP4V9n5b1w+KRh/VIw71mJ2Sa
         7VpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg6lMS8+4U9kLMD2dc0+LioMxh0hXteLWty4umtaMYmpuyDxwDRUnpaIw3lxMf0qQkWWf9@lists.linux.dev
X-Gm-Message-State: AFuF++lhW7mRCVmCj5IWwsGVrwHNRAQqKNSL0D5ICmiBLRGp/XbZDA8a
	m0v/r9JQhCF+qfQGkAiRKnxHGXUvoKt2dElC46dv6LPTbmlH0msBGTt156l/jydyy9VExwenHci
	U9CBV
X-Gm-Gg: AYBFou0NnhZvkH4nnsGlP1m0Y4I4sKy/rCy6MibZkAfOHqqd52z0n+1tMZpIsUVIPhh
	VDw1F+xPo47gtnbctalu46jYORV8bIxrwW0EG9P62CDIC6SdyGIx2s81A0jXkAkS8JmJuUPATBd
	fVVc/Wj+3npFv5hwu/CNufKv+EOwFTKz9MSUJb6Kc+W30aAvRTFHuDMpsdl6yfFoJkdgDSiGYcY
	+DM6cdnajS/DhAcFhWWzvZYUNVKzVJbXHqIHP5Lc813HV8mn+kporvCNPTzJvSXNZBRrw4TDwEo
	YoecXJ9rthAygXXWvYqlWb+e2TYEf8BCmkIBfqOrMGSr/IMFIQOaNPgVGwm2n4Y9bGQNtyMzcGc
	LhRMyIV769WBOmKOhlM0K/PQMASuZ0ci0fQ9JamwFZCakTzD2jYOcRCdKpH+guqMZ9+2h/tFd5l
	Lhha6L8onTeCNIlzzhdgu0Imm7V5gSqcZEF12XkIZoih4VLTP3fqPylHoNrCrK12Jc3nA9K0vQG
	PuhCA==
X-Received: by 2002:a05:600c:6206:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fc5735339mr21824685e9.21.1789723149820;
        Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm103172735e9.4.2026.09.18.02.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:52 +0200
Subject: [PATCH v9 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5450; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZJzy9E8PlgkB1b0i/bkQxUTFa8ZhyIY8E8Ayom+Mjrg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jE9f9/s8XZ+rv7HG//mU7EOanrMe9qlkdxyq/dKct
 Ct1rej5jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjI4lBGhr6fZns44/erdF6R
 bl6uoZ0eOMEquzL8z4kKhx97/knsSWZk2Pfz9q45ZgwJXJ2GNVfv70/bKb6/ojOCWTPs9vlpR9x
 12AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2..84dfbfd1986c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -44,8 +44,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
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
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c45757..45ab9d947b3a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -168,9 +168,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b8af9ec81b0c..bb027c65eddd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1d08000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 3d1a2c5bc464..31f670fdd91d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -69,9 +69,33 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: r5f-memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 

-- 
2.55.0

