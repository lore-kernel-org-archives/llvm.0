Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553B74C955E
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031475; cv=none; b=p7P+vM5aegIEHy7HCfCWAlJeGYlKeyf18H5q0OzFsxEooDe5Fj/QRaX6KgloSRnMcVLGAM1Q170HHJzki4mo83nFdyzkL620cPx+XnI+wj4M/eaZNgRBI1mbktMK+VkjCHmG4K1YltMo3ljLpHGd0MpE7SaWJChYNSmTk5pzuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031475; c=relaxed/simple;
	bh=5Vs/P1kH8W3WWMwdKGloRidpstg2eGVpPTnXJh4QYNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq+HQvjusSKj++UPVSrU7wyJGmLqzcD/67B60Sej1m0V0c2qMC7z3KTz8N2WeWrUCJ60VBhPGxzxhUn1ku5n/XZOMBVK9UaH09xfRdSQOdYad8WHnlOLMGbZyXsmpJhNkXPHPBfrdhUutnmpooNH4WMv9MFpoRoXQY3kwIS3HlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Jrfr56iN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Jrfr56iN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so38068265e9.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031472; x=1781636272; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=;
        b=Jrfr56iNnCm3lrqaeQsrqg50LuyWfmerqpCC2BvPvixadHBfvOZhm245G92T8EEDBr
         yTXN0K2ekpGcsZQCjTi5c03oYWjjq1TmpaJHpCyVBz4jPLw8KlZHDCAEno4dCoI1xQhM
         U3CfP9uqL5wmnmfqqtPqtA28nRI8voHxK074t/OXUHn9Ma26YWKlNHYU8l8a/ybOnbnG
         PUN9dGaLl9Oi8DKXAXvEOAm3NelWb7daLazAO10vzxxRyntc2+KIXdyThZvjhQVvn5gf
         hMAopdRTR2jZCgtXpPCDy5loeJb806XRZLdbxEa1tK7PpvgRSF77lRwU04A+HUeVfuSJ
         hoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031472; x=1781636272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=;
        b=Ul3AX6rMbsZ7wDo2iD+jkAJ6uNOJ63ZcwYSY+j4eFgdonQDmE2KPCzqKwDe2RuKDk4
         AsnQo0m7nOFKIcXZwivIM+ITFDMngZp53AY8yfY9Z/Qsp1Fex/coIcGWcTHhFmBONXOT
         RNyedBy9xh/DvmnnI8HjV+n6eaBH15b3/d/czv1ykBYxFF0+4RRAUDfv/DMuI3K99y9v
         s+zLwqmZzY0vYwIyrAsfOBMQGo+vaNScCAPJBgaGyvNx2BFUjwYmyuTxmZz4rO/11F+N
         Vg0YY/IvQ2asAMbb6qyVfqtaA6swK6WCZWWqmBmqi9wlWa0wRdhSy65pIfUzxQktqO91
         pkEw==
X-Forwarded-Encrypted: i=1; AFNElJ9OCho3Ff3SivqWEXQEVb0IM3bhBqd3jt2LArawcooZ4QGj4YxtoIyONL8g6XZwrLfxQfNS@lists.linux.dev
X-Gm-Message-State: AOJu0YxwvIyG4RbHfCvk1Ko470Hj5vdetlmdzM8hpoXHjRicfaIFrpca
	iVbj32INFyqSEhawEz6BDFIBWo7q/kXkgTot6e8MIJBISejE6KgXa5Wz5z/1rBb6gtA=
X-Gm-Gg: Acq92OFmRAQj+ElYY80izCZjtQ/ACbGgnT2xnTqCll+p6SioFXgArhei7w7B80sSnQb
	Er4K/+J4oOHlNXMHRqnyAsXgcczB/Cqv6jB/9i88My8uu5fsMZCvOtRYHqzJydRHul961RHb8bV
	0ELETdHITKKmzVT+WPhURdsCiydF1YexL7u1E4tW0puPmvWpSXU9nr9QU11o2HUsstvYbXIxXyx
	wQezKsrwNbkayphdW/RpKI2KIDSlNJ8Zj3w2fxgsKtB37K9m4c7KgiacZYHHBazkg67awZGz1Fj
	i8lYocA4Bt8db9o2k3Al3XR58CtlOdLwa8QSS+oUUBnZSI/yi42p6jhN2Ovxk27SrKWEw1PEVPC
	doJGBVo/cu17dYnBTh8FqH6Q1cNeVdL/n5yYj34qN0od0LNTH/q3HSFlhmOu6eslAIj9/XvecUg
	NtJanB/NPUMWoCMDmoYZdIhHASbaQCtIo=
X-Received: by 2002:a05:600c:1f90:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-490c2602971mr362579095e9.28.1781031469438;
        Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918fcsm577657565e9.3.2026.06.09.11.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:15 +0200
Subject: [PATCH v6 03/11] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-3-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=msp@baylibre.com;
 h=from:subject:message-id; bh=5Vs/P1kH8W3WWMwdKGloRidpstg2eGVpPTnXJh4QYNU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxKfSkWfNci98W+m35S9XUqn88h9NH5dqnjzMfPiH0
 vOkq2JyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9U6MDNuUpXQcnjLHvbil
 uclJfPH+7yfuzele/fhkRVtBNq+qSBvDf6+VZ41THFYzaD75ZfrBWpVz+Z0fNrumRc9sv3o8ao5
 jNwMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..63a4fb03dc0acac63bc573e290ec613617f492f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0

