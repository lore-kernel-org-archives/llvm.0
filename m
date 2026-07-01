Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A7481A99
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909654; cv=none; b=ITRXHwBXSCBHs2ClP3On32+BeVOXJFSn4DB1CPWPEyPnNCzN1LYjy6ND3J3HdJCp9dAAhKtg11Qh9euOfZJdSYBGQMaCaoa5giRIH5RoMGehZubnDuoHeBF9yQdc+OmnTIioD1O9hZsPPvR4MfoKTvs7Oofk9hZMfP4T0PZsp5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909654; c=relaxed/simple;
	bh=UdYuVybQFPSsAf2RKB3eRhJbIK1t6vhvF1XRjODHB+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D29fJaT3n2RssgNTSbC1jwXJ1mhxTuaY6qKhhqjK0pFZPrwXSVoMOwk1mBX+X5qNWDTQP2IvZa0G1eWtGKpTfXqbpb4lVVOFZmWa6pnKZ+w0cMyhnHdP8PPtrWIFTPqMP2KMm1hkZ4ESGXJ/PfIx+E57vMrg5qRVAdXBp5z0xNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nQTezxls; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nQTezxls"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so5452955e9.3
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909651; x=1783514451; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=;
        b=nQTezxlsVcuu3x2FZT/h2OzbvrKorc3znAKS/4198IdXqDMzeiO7XecuOaOnwzCZa+
         yJkHZpPC2/0AeWHSn81q67e+ELVTCJ4DYPHZB6RApzYiENwG1aBc2qPuk48FPCQktIN6
         7oRmWS0kxwVS5LfwyOE3yuIoKT9gniXUQ+d5KWmRSaA17e748k1dR62xRUVXk1YNPVyz
         txdul4nGp0CRtvZdryr2xNQr7BUcEpApLrhQrSf9kJ1+rS89GPWmDgvhYAI5BE1lvTb3
         Q8FHieMETry30Tqr9TCPRZhVgHTeaX/bUmmgzqGHDuJf95ec+6t8kzjapE3IIKp1JH5K
         H2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909651; x=1783514451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=;
        b=mfKlsd+0NBNUttc9YdDweZXY8XK245nI73byKRIRqMFZ/SRXCgaHpymaUKHtjEYMbo
         1tIWImO5jg8RC5lePyqKFSKJTh/zXo4y00MrKsZv1Zc0XCyEXOGmUrx7tGDSXOhkVazN
         wKLi3VzAQZ0raRmO5UuYrMYeZPPJeDmdgqGfGXmkEDlwPEIAgFbWNBF+XGbw/4XfrrQH
         9fQOxt9NB+2IHbRKhEkSj6lm8bsD21hEUvm3j3y6+2Z6Ob+8AxDk9ZKvzuHSzAYGvQ8+
         WKrE6puPmQu8xd4BGE4Mtw4VdyKaMnBq8a3RV922Q1pBeD2WcEVojoVT0tjVKKd3zEWT
         kX3w==
X-Forwarded-Encrypted: i=1; AFNElJ8jLP+P0yEkJ/olOFgAU688mzVaWRrPRJtGSTQURk/TF4UszhF4WgzPUkbnGr2aVLVHcD28@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2WdQFyehBXaMMNq7JbDJ935zYueeE1f9aCWMsXu6qwFoWI0Z2
	6tS7vA1rJfKb98Jjuj/ehoY/ZUo7mLqfj+/UJY528a9aK6Ce4dvBJWcGzgjPl9gnQsY=
X-Gm-Gg: AfdE7cmldWeYL1SsX3KZO5tPROSO5Ms+iHzo+QwvAXCgFJQrjw7FEHniyRBYhvKxAys
	/CuJaMziiFx5jSxw25d1k8/JwUB3bRPhPwu1fjx3l/o58PdRsmc4kH52GNXFsOEcvwYj8Erjg+B
	zLibWcBagT3OB3TPmIvjCan6/VlohdcIEriGOtZAM3989jgsa/+e0IJ2ZYT+9Jl5e/Am4ZrdRv1
	NKKyJ4YJTkZSZpi0cZM3jO0NKGSMLyrRPlEjJj5WWy5XDAg++DNqJ15/EqkopxlGK4RiCb7E9Na
	1iH92QApupU5E8xMerGotZoT+yenu0pePbNPznxZ3UfD2tf98CedkmMcBuHP6+v5QHCTInRh7F4
	pTf9nm+UcN+egmMw+X2JJEQ3vPtZ8dVetyXwKhlrtt/vp7b4ONDX3wy6+3VlfDy6t+UkSl1P3AQ
	6zoKseQ1OpkQ==
X-Received: by 2002:a05:600d:15a:10b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-493c3dfc883mr5371895e9.37.1782909650717;
        Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4bfd47sm101422335e9.2.2026.07.01.05.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:15 +0200
Subject: [PATCH v7 03/11] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-3-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UdYuVybQFPSsAf2RKB3eRhJbIK1t6vhvF1XRjODHB+U=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXru7duROEp2t5R1p8Wr4nxuTpxLDWRlPmwv/Rh6R6U
 pvefprfUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABN5ZMbwz9Jn6QGWbx4yFV8u
 Zu1pcPYVEXuiHLA5UO+fZfU6jn8REQz/jGskusKMXsTVVzwOm14a3nSXzSK79/avqprbT5feF09
 nBQA=
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
index 821a9705bb7d42091d4ad0e68d8769b49c115bcd..08c73cae26c73993a613372110bfd5611c403846 100644
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

