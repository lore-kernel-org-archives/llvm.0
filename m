Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC363ACA5D
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031481; cv=none; b=qVQIrQLQfuldBbNKrMi4wu0Io89b0JOhivMymdB+ttpZ0RJ21lmFNkESxtdaxcGdqITPUKNguaa2SMLv5MHPXbQmpvHUlCKIkvUi08z+KdJK7IS2xG/YmB480oO8Wj3rVplMmlUVXGbeRVxn1JAzMImW0BYC0/9WspcZlGX/RWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031481; c=relaxed/simple;
	bh=Va2zbEz9TKLMhjd4+lKIbcWm/Y3rt8hiIFx5KPgP0CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qH5cmIsqpaw6ktRYaeDZg93KoeUlj6HKOnrOZiotTZow9Eo0nEZxm1KSVmnbHnoeMfdmBi10zkFlSQnsz7uuE4U/aEaFIEK7uNKoNtKMON6MD5/YvqY8fIZ/mWVx/cbjjKm8ejxUzRUZ5g7Y9zwvnjJnu7sf9XuXmY7uDVgALKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=au75Zqoi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="au75Zqoi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so31513085e9.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031474; x=1781636274; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIGyw55gr+o/mTTrd5VtOCBTeJy77S+WAVT74ILfpWo=;
        b=au75Zqoi+pHKh2z1MEJwM2/T9bdIeJddZ6rfmfv6stjkkuQZm6YUv5CHBggnf5T4Ph
         OHg1ZfdEC+rS1KoWnDV75loGa1yw25dzhE7aHRIWWAfRBXDQ6gcQ5U7eiqhpIrGf7x5K
         fwbt8bhPJTr90f2HzEqujndngjOoas2YV8iX/FL2rA38MmqcKnNi707aZ4Ewd1gd/dFg
         wvAXvg6Qs+Dekf6R+frsjHcVHcBe4vDn7n/Fq7gb5TR30mCUOBCl4FlQT6Mb/9aVZOAC
         t6L22DCNBWm06FvPqZHA8VPJ5r8rfG9W1eyv7zINdil5HjWzmExO+JcGTrTQ2BshlDiH
         MPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031474; x=1781636274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PIGyw55gr+o/mTTrd5VtOCBTeJy77S+WAVT74ILfpWo=;
        b=guvtZPxw8ICbzcZ78OZtdPltgsuq/4B4jjVveRj9/X7HL2+WJ9xsDNrblT0cB0eyo7
         JZ9J8UbmbBUjLRgvX0wIbjUHYqajZk/HezEqYlSAasm19CiXFC+lsy0T47aOQ36WwWyP
         Uq8Q8mUYeBu5MDGwLH7pVOP4iHvau5xhSxntK1363fhNPm5JEbYcuKvYsJB5ZEEDa3Qp
         iHtxlq2s0qFOMKLPIPOJDMoR8oe8CoexQQQ6IPcTSSKjafz/7XEB3oY8nbPkXVLjOLIL
         ELyGjhEfi+x4haRDT7WZbZqrH1E6f39AqEeYb5V1TnpEszm/C3JRku+cOibVVFEZUc9z
         jY1g==
X-Forwarded-Encrypted: i=1; AFNElJ94rVKFztMXzvknzPnUywFQiurXKVqQ5yeze3hrxjJ1Vj4ae4fk4FfcA5yH6rE9ol8KNefB@lists.linux.dev
X-Gm-Message-State: AOJu0YyAK4McEPc1uzJOMdWmVtPMUkA8HpVLe6FaYcOthMt2SjvfK5X4
	eOnJ63NyfzHuQLae9xkzvZy1aSPfp0sl1YOid/LTOb629ZAeR+o0jcFERDbDUyzCeIo=
X-Gm-Gg: Acq92OEgQ3+3t3eaG9Ygkl2Mjzd1dDuG3ceCaGH4n5KLxBFpy2xIH/o2K4+qMO/XFzj
	lMAFuEO4Z6wieZrGcXbVE919tOI1YYU03Bar+LvJZQVHDiViRidibCrQHgXlnz30jonFFYS9fBX
	gocxdPFIqVyZNYlUL9bfGhfaPpxnH2uD0GVFi/qddCgx1FNPRkxMsKRbQ+4QLnUbij6na+iVd8p
	MeYlAKn5MiSgyOLOjFJ9Yf4Y8qnLb275CI4Y4zhzEINSNVFkoLtG+GWUY0Nqi5AN89IwNK8fuVo
	U5zUx/EKF8BUHQVlmmNAO1oNgYf/JQlreajQYjJO9EkReRjsQp/DKtAiirxuO1zQjX3g5/XsXRm
	BjQpIokdcyz/yMEwZ02XSw+iVinPMWus1xM2Y3dm0v8xC4TKu/IVsrn1TtHAiBQl02wm/XSIYIv
	qwWPSm0Mkl6VweU/RrNr7YV8AClX0xclo=
X-Received: by 2002:a05:600c:1c1e:b0:490:bccf:2bd6 with SMTP id 5b1f17b1804b1-490c25f1143mr382617355e9.15.1781031474062;
        Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm115761801f8f.29.2026.06.09.11.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:53 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:18 +0200
Subject: [PATCH v6 06/11] arm64: dts: ti: var-som-am62p: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-6-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Va2zbEz9TKLMhjd4+lKIbcWm/Y3rt8hiIFx5KPgP0CI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxD+T9tTsEbg7Y6urV7CpdvWjU3Pe8W2e9Xyx5+tiu
 YyW4+WFHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRR+sZ/jsz9Z2pSSv/6Sex
 r7n7vfbaMO9nf/UPb2Zue7Zr7s1n3ssYGTb5l14W/Pf0r/JL7s5DAe8USk0tbrjtVVVXCb99u7x
 hOwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde001ce33fa295f68a3850b622cac7d..1408c970f1942e8a720c9cf071b2f49eafa9db5e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.53.0

