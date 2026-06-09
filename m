Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31D4D2EEB
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031480; cv=none; b=iLDzn41kHikRGobbq1+dHdK+/RnoaFzpdu5S7coGkhVuCgjjr6pyKTr0NHqJywuRGxjTVdlSUEp980OgFlVQ8FdZKd8VMMKQzeNme29Go+a3msOPK3dkob7zjehs7D5hYH2bbzwYTTx5IwGocM+Sz4EZaP/1notI86FjzQw52ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031480; c=relaxed/simple;
	bh=4xo0fn2TK5jkPi/2917g98xkU+Bs/Sy82TdJFYV28F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7S+M2J4gLWEJM3NZv1cMh6ID/uTybz9X+hBKD7o5knY4jXqEGVRr8/Qlm3CnvHmW/K1gw0F2teCOgTXXWftgb7hsrs72H+MR5st9YFGuSf8zsK9DndyqULVwk+caJgBEC9QCR4z8P07LS3VupC6i97zJnGM9NcDNkNKkgwfxXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tg56MLYH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tg56MLYH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd45e596cso2936504f8f.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031477; x=1781636277; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=Tg56MLYHoUkNsg4WTIseO2GD/SiKphAAZFwZ6xoYARTGK6lMPFhvwkh2j0/j3hqigQ
         B8yMqjxlg1bOK/jfmm5PgBRirVj5xW8eWeCqcIc+HpEamVzOAcCQQIcR5cuN59SgV1Rx
         oTPYpJwRSbgHV08DDiDAViI7Fpeseh+ysXGAV05fB00AUCreBsvCb++Zs15M1EONitBw
         MqURpuKYbuNQLFxw3STfGoFMN0YImHC58lonbZcw3OgDmtW0IsYJAUinmMfbkA65JwRc
         TvovWhBFqhFVdDGHSvRjSUBME8/AFPQGwW99vpGI/LgizGh8gHyJ8tknEw5K6qlME6ls
         1d3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031477; x=1781636277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=QGQziuphBm/amMuAV17tN+/Ny2ujkvhu43R+aCRhw4jUEc6CjeuZ770ZkIpGeJ0SpD
         h7Kg8KsqHvdRLShu46jvPCJpgPTImzg7hfdR/L56NMqM4r3dSBWkHFGhSSuMXPT+IMqP
         0bYAXdwgOpfWrPnp3PJrLQ+c8y6IaO0j5zDw1bGR/Fd1GKBBPO0jkj/4593GJkHH84GO
         rRg8Z1g3mAv0AQitH0jhNBEXbe49ysn6JMNUPIgJQ/RBhD+89pZL2odCeoHjIRzUoObS
         J5qy3vzDj1b7p+bi1Nv8Q6Mm2qPAa5PX1I71mESL9RIHym50A/3U+gwQYL7gaRMM9B5S
         00yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W/Nm07CKzSZ33M+8MPXSNkh7QbwZCxfBIu72RXyOhX9G394Jx+40Uwkas6q8/yACM/let@lists.linux.dev
X-Gm-Message-State: AOJu0YwkpAef9MwmHHDh9D689ZrDZlVZ2jGmOy4PcyytGa/5wg3PNCqE
	l9wKbO+a6abLAZuYA2YVPY7P3NAW5wu9dZE1HR+Gnzr+VxttOvc7zdCXe0qJLx1wYVg=
X-Gm-Gg: Acq92OE7dIfILiE5/8fDOEZxETrDg7dLA1Y20oO1IIKAPVAX8SwHHM9nrGtVhShyhat
	w+ytJbUTS3E0jqrn0OIXSQBI7XLGsd8j5QnQaXWjVQI/KKsxOHHFxAWzsZ9C3IOQCInFgXi8Eah
	Ytwj81IMKDjdfvzZTiWDmRc0zjPMoMFeRAt48LReXbLVU6flFMq5K9/OGyJQWteJJVZprQYv4Mx
	rOHQ497GjNLlmHfxYTgEOcIvHfKuq+f0Pk5kbgyidf80PJJWEOFyAXhTfrZAcIks9hHAyRsGLgj
	AZsOW3tqCYimM09XKNoiThWasQWgbLORuRbMkLow0pTKzxHmhB+3Q6StCQCvnnsXcnDSXIXTBeh
	zOVCsw3AW/nrlE6UgGDqziYKzo3M7B8I4c6RtkkZBul/zc1fk54IhmGieNOlXTS88fJPWNxzWlz
	woNUnbeYMvUK5rMo7LZxJ8hrmU2l7U3tY=
X-Received: by 2002:a05:6000:2889:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-460566bef00mr5308637f8f.24.1781031476604;
        Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm65167368f8f.33.2026.06.09.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:20 +0200
Subject: [PATCH v6 08/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-8-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4xo0fn2TK5jkPi/2917g98xkU+Bs/Sy82TdJFYV28F0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJK611UFRM0x/bFNb+lb7EWeUXvok/sYN24//Cxben
 nT42aujHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjARvvmMDD/lH5yOLgmR9V8o
 pPXCMOfNiveOhi/EQwuaWnUlG/Msahn+6f9p5QlwkJXh3XP9YIdL2gsx06ByMQOdT4zCu71XpOt
 wAwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 12 ------------
 4 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d8308b637f3064c560e485ed85f2..f77651109564224408723b72baba93e39a82be07 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -17,6 +17,18 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
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
+		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c457579c7b1be7157d235fd4b4e5c6af11..49c78b6b8b2b43fe381c761823bbd93725f331aa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -161,18 +161,6 @@ secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
 		};
-
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 16549fd7340a556798cf5a242746c219d3168d83..6444aa0c106197eb44088ec99d7c7dba7f8f854d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -49,18 +49,6 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 1408c970f1942e8a720c9cf071b2f49eafa9db5e..76295e47eca9d6373a89430355330c9a4ac9be32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -63,18 +63,6 @@ rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x00100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;

-- 
2.53.0

