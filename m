Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066948165E
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909650; cv=none; b=sIiuLwrRRsBoBddt/nMp6qrrEuopk01HiS0aCNMpfbOPZs4pllfin3An5qJ5vkfQ1wNGu+ez3rePUP+KzLj9jVVo7P/J5PoqwhYLeoLIe8eQEB7crFh1Nkk07imWGSoGQilsqfRefy2AiMeiNP3EBivYsAfPbMV8sT4LgWm2AYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909650; c=relaxed/simple;
	bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OS5ptM8VBwnhGJs6658IkR64yQXRdcsa84/+qGWspEfHtgLkamrBQQ+0XQaz+mwcf71z4mAn1Ek0LEI0ogOkDACzbVVUroStZMa/bx7XOtD3nebvkEqHcixS7Xyj5ORzmKIJl/0XIvz9K0oZfS7Lzng2u1U7V2p+9HR4blbCHHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PQMU/BtD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PQMU/BtD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c9d1so465609f8f.2
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909648; x=1783514448; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=PQMU/BtDAskIErc402+CA1ul5DhiMiDU4690LMmhSyJGJhl9nZef+t3qkKyqkk/1NA
         koVTR79QCLRFbwosbnjiPGghYZY6fZGlRVLDcLqNLWPoF2u3jeY6LqCR1AQMCVBRDWOm
         Q3TdXTZ9m4sMWdt6YPwxG1Yhd3mLIebDDRKh7g5MFGcmlrh8+YBjZ07IcuRiRnyurkU1
         dwyAXd+FvChit4BqQuGwTuHVvuZAG/mb73nYzqAPY2HOwpXsq6xuDtcBw3J64+bWG1QI
         X3wWfJ0CFXYPXOjPXu3c089/R/J1LnFC7k2I026SB8QS52izWV0QA4urjzKfFFP1M0fk
         MKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909648; x=1783514448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=effF8ovpE8M6V14W0J8FawNC3Xq1j473KXiMWolkqop8VAT0Wj5PqgNL5fwvSpNmR+
         +Vim41wXIbyqrD4RIayoO5q9xJqTF9KYvD5XJDful5fB/bExKhyZ8jsOS5sLVjN5e0pZ
         0UWdmxVlchAzwT9xCCjlFgeXNrEN9KwX+DXmY1gMXu4tV/s4BaK6rsMnUuedwwAma15Y
         bvqRV1SRXRBizKMDAIkHSgsARKRo3ZlfMqEJY9bFn/tWFD0iAuNCi/iZXYoxEIwXa5PT
         tkqY2xZ9wrR8/uWWDcEInp7UBBl/SI4C1z0iL4QBYuEQRPXOYlYbuGsl1BK/pGgUoldB
         GI5A==
X-Forwarded-Encrypted: i=1; AHgh+Roku1P8OnBo9/Idn5Y+BwMIifRZQSNfOmQr3Od/mYkjB1P9M5v9FCG91ZOH61vTYivP6mT5@lists.linux.dev
X-Gm-Message-State: AOJu0YxNQs59NETRdkFLc80DmkkWBboIJx4gp3A4WT5x8yq0OmhDO8+/
	Ymo8M8Jxt8l8wv/M+1WUaMztG0mX2OCmEzafl9INYN7+qGfVkEzwbg8Yu8kHSY+FabA=
X-Gm-Gg: AfdE7ckX/h+9cplz5Nc4VdyRLaFnfsIGLWFPsRSUV9l8vlGBlqRWF4w3X6umU0QrF+X
	JH/mus62QM354NRMh45gHIX8jCT6Wt3pqjeGfEEwTnCDeUhWY8637JijYjFhXGbNiLe7VpA6sol
	7nRoJiOPLIfTlN+PjEwMwu37Iym1KLrZV7nfLCBRO05xreqSnHl5u7no4E6wykPjS0vdL8oNbK3
	6DzwkHIP0VOBRdAgyYfJqGPK5gxcE2SV9o2KkmpJxW2R/16qNW5g8zgIwoCzbKlwUULwEmfR65v
	kLIrFnhSVXgmDZ40rHB/wrrbZQJ3otyprTkEC3F+4xtm/DpxG28tE3tWwgATwmdJYpUhf+UbuDK
	qEOEsVNMDiluU6uDfCJJgUnLSjEHNg/ltNc8Zasq64KRp1/tv7AEExIjqNng5H/x3cyrW/FxuEp
	O+9o/X7wn8Ow==
X-Received: by 2002:adf:e009:0:20b0:474:6a5b:860b with SMTP id ffacd0b85a97d-477b4fb2955mr401340f8f.37.1782909647645;
        Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566c0deacsm17848753f8f.26.2026.07.01.05.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:13 +0200
Subject: [PATCH v7 01/11] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup
 R5F memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-1-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=msp@baylibre.com;
 h=from:subject:message-id; bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
 b=kA0DAAoWhcFWaZAVSlMByyZiAGpFCnyjGaxDR9qbBVnjN/qS5E5NRZGzZonOGc1Sdrm+xQu/K
 Yh1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmpFCnwACgkQhcFWaZAVSlMRBwD/R8D5
 k4DLFbAre6LCFFxtN42qd7BzTXZEuQeC+r9vtfEBAONbUMoSrUIisHZJ7wMtgjwHi7BPgHJORi4
 RdPks5AoH
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
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bcac9558f88c94381f07db30d4f99..e13da7c95a30459e7649f284689039b89a95f651 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0

