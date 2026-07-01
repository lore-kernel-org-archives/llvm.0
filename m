Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1722048B396
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909664; cv=none; b=K/ViYl91BeLkQBcAPhQyTuT06mc4Tb+31Mig7f7fytqbHfhr3lQG8C2y/ffkWS0Lu3HBp245holMcujureWCF4oK9u9zRZV5YAV55Af5x2cnC6djgCo3wNr+kClE0suRI5OHuqK2JbpptOLYJR+wSzfqPRq/u1nwHfm9ntuWP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909664; c=relaxed/simple;
	bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gC9tY12qEL5NYVIcIbQQ0Ge0y3QzB8tQM2XfpP7J9/M5mi+KicxkVehTqtSx77P06VlBRhIzuU9cAATDQ9LxHedeArO0FyTRbeVbI3NtOKbSJPB2RBUZp4O3Zc3IWU4Mk1D5a7lQ5lzvOJuPtENyVcgfiSotWchEJ8FoHHdIWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jKPSuqkX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jKPSuqkX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso5493275e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909661; x=1783514461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=jKPSuqkXh+qcsDc7yuiRq4dxs5vPhklU5zzEZv6bdkv/gk4kSRWqKpzvqTdPLy8xr1
         sqqbmal7P4H52NWxiYxLZNBfU+KTOKyeViXNLvMtepYxG02I6tqTOWionR3Pe51zz3WM
         kCslb7aCgEJMoZ5Y6ZyDcmcHWkuknn4EElMrXPWJkQh2t8D8cy9QejD10XiH2qfJwXj7
         3AltsGnD/riIXejUDxCl8Iqi955mMVmT4ojwo1Q+rCNkFBBR6mCHFp7rNfnSYEQGPNk0
         +vfRpKCuhlagxYZlQ5OAFOj6rLMQFc1GXXSw3MEvdWVCLm4bgU8JhOhOnHCHamA9kzX/
         AhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909661; x=1783514461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=b0ybj6IYQqJ/mX38YEcmIuDT2cs/wTzHhBwNxWuco76Egf+JMwR+XM3tFjxdD7fmOh
         D1phqgPbzfI/EUUjj7GuMBa5p6wSIJHHi+PNu8DsHC9YITqYqaV+Ty+FfTFLVUagqPdu
         Y23pF3dN/Jv2ZyVhUFVrOz9Nku0QD4Cv7rySff1bvbQWMsFcqHADDxvRCVKepJ3gnzCh
         WIBEjtxRcQozJy2g27nvfCQS/rynb0uF3BZcjbIN6IL3Hx9ybkCm61n2++O5Lp3x3Cqc
         5EIR6DuGMv2li9l/OaocT9YMbdvrAbn4CSpSP7qkbm54gL7iRWg5n0bUCnrUh3lJEiNT
         /fzg==
X-Forwarded-Encrypted: i=1; AFNElJ8kqyrDIJ5Xn27KRM2FWwwahQco/1gaZF+Wswg5do/wOlgw+XWcmeuFTNuQm69pvMgfwaAU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1sKXrvz0xgruYRP3NzcNzGBC9FKE1ND2SQu4PUCpXjCpIMvjo
	Y4SIpT8QbWqm8GOHf7ZDidW7yTaKOKuL98pLm/hko6fa3q2gIvXyfto6nBAKAWmwQlU=
X-Gm-Gg: AfdE7cll1tKifJPSf4VVhNUrmUXitBCtFicNmMLRnwOP0dg1Nm8+FKiTCP8MMMtM+Y+
	L66UcaoBhKXteAGKA6q+MoERXjdoRlEyJG94HSXOOw9XIt8/cM3SoJ7d0dFsIS8QBMmJutS4qXL
	yJHI3jWz6P6C3JTt5hrLKZz6iLTPnh/c9BeUzYT+V/42+yu/JtLEz4EPXsS3ntTHa15OR95skzX
	7PtSYOO3EItDCp0mKg9pgm4r3TWKdLbjH6U+sYKWZwh197ayI0CbwehTFkFRPMJRdOdUCZtlqlg
	xzkLHpNK9+SYofvZUrLrgNsog+KJIVoKnBZS1H8RfNG8ko/xTzitmuuVL9/U69o6T0r28j9+RqM
	K13ONdZSTtIJX9K6H1YOiKGWnIkq1h+CPWUBzNPwoohZVy1h4QAIide+Eng21brT6zzeiS/xLOw
	MsMjVRWW4R4g==
X-Received: by 2002:a05:600c:5307:b0:493:bfea:2786 with SMTP id 5b1f17b1804b1-493c3df38b1mr7549745e9.32.1782909661423;
        Wed, 01 Jul 2026 05:41:01 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm72470595e9.6.2026.07.01.05.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:41:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:22 +0200
Subject: [PATCH v7 10/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-10-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrr3806ZIac/87yDv/G0e60K21tWLXFIly7QWGTI9u
 Kyqfre4o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACaieIThn8Hqot8VWi1HcqQ8
 N/zkFZPViGuJ/GO0OKe5K0RBnPXTTYa/ovelJjw+0aqgfTx8+VxWTb7r5eafhZmOh3JFbL+65Gg
 UGwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index f77651109564224408723b72baba93e39a82be07..8f7409da83392d2d1f160a9645ef4d68f7aaa1bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
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
 

-- 
2.53.0

