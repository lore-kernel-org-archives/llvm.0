Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5996748A2B0
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909656; cv=none; b=FYQo/vEJ7J8ZGZkD8+V5hHUZNYSLLN9d8eSTVKevJysqxjenUPDIRLwPCIGz+1zwSnkuq3MtHeoK9yAcuH95on2WHBGyC7MyC6DDjJXYsXDpQz4jzcO6Ri9FcFYu2Ri0fmX6I1kzLKWfQ0DjuMCBhcWXUDBvGnWRM77Jhjsp1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909656; c=relaxed/simple;
	bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5+98P1AR5CecdDmkG/aE6EmurkyPbKtTJSMmhVx/2BNighGVhSr4Q3v1Apywdt2neeKMjo8wSu9HF1KmxiC7TdjfQfnk4Ra4eS0fBjsYs4gAWswQhnYwkg4y96aw1it6PgtjU7o3u4wmbyyjsH3pc6WK5bLQlrqAZQIhyJX4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cklgO5IM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cklgO5IM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b27c7451so17831055e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909654; x=1783514454; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=cklgO5IMyLLYDk028X3/Az39V3rKxrzrMVATS5DnOrPANtpRL968vIRIaIvaCMbK0T
         vKymQfrBDLgOc6xp8Kyfzsosgg9Q0qsbTAJqjiNEw5QxrowOz2+/WUZFCrMYqVRBQMFp
         ZjZTXfg8xlVryufkfK2q6H0zbymTs00j3ukG6AF2o37xnUK2Xrw1ESY3oZxw3vj6UiWr
         vqK82TwQTP188dq/7PT2dIQlbfjC82yjVhI/BljttRiozSW3mSIEoRb5Yi+ExxBn8VeF
         WyRALiFIXltE0lNzQrphylE5fN0ufMu0cLhQ82b8xyO1EMVP3FassN+wTkHOQ8ZnK5yx
         rKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909654; x=1783514454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=SgL9Ku+/On/4Hcu6XJPXJ7/G20M3mLFf2tya3xNHgnBVcsbvSrjhNHSIt5kPbJM1jT
         vYkQl9u4BnkjMZr+gAsVlqAFGPFiMj+Cq9rYTqs84diK4W3/KMWVKkO7XDbr62H83l/y
         uzIR/ivZmjNGmr9sfumB1fWS+oWf564kL+gbmMb+qK43z8a3o+clQSG69LrSelJBIYLk
         gOHDitCFMz7M/vjgGce87TG3zEJJCYTbl/zYuQRCKLTP4wspxvP16MauXy3YToxd9nnD
         WLpGC/xlCiqG9t/k+tAoXhNFc32RRxtGSz/AlLe53G9XR9GTH05uPDRlAWQR3NTRuplP
         TLlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KWl4nwiqWjuXnpXJR3igjXTgSx0vcClIC21E5QLrFtrhHTRBo0FJTb96UnH3krVURDWX1@lists.linux.dev
X-Gm-Message-State: AOJu0YztN4ZpnBcEvduAnGZ4relnenhPwVs9Kf5Gs0I3IxNbvpsLIzJn
	y2uisNdZaseNBjIwfbwRSrPsmxSYJN+HPITRRRD4NihDwc0s2iwPzVfID4NBqAlfATc=
X-Gm-Gg: AfdE7ckhLjXF5ss/6rvbdy4a2hhoxaoeyxUOkw6IrZpLzaXxh76aapoMz1uk749rZqQ
	i0kC15Jdy+tA3wDMu8LCqrkZqhCzhHW63Oe5PmsbmrdnUsemh/hDwnaeczdyfPnLvO9xURbtSb3
	AgZqTa1jSr87ZpqlVS68iSzSi/tQ7WqOTaTNu9jcEF5CFxURn2zjUNDcTha1Y1dnZ/NAIeIxXxt
	ij5YKad0rU6FfEGWU6Rwwl7t6Mn229NVKhEFFcJ0tgkYka1O9j6thELShcmp2n75m7RG4AbLbb2
	y3txX3YosJuX+StcpIV69GGs6+kPp+kli2vILJHR7WxV9kPNcNppl3uh7GH5gvKd3b6cqbj+DQe
	1rgJejnwAckqJlP8Vzp69YtrzYVm5PZ4IcPJ0hYvny3WYTibFsUAIKq9VEkTEa1VZB6fPMOR5do
	oCAf7SIhbdtQ==
X-Received: by 2002:a05:600c:4eca:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493c231e27dmr21122275e9.5.1782909653753;
        Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef1807asm46624255e9.1.2026.07.01.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:17 +0200
Subject: [PATCH v7 05/11] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-5-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=msp@baylibre.com;
 h=from:subject:message-id; bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
 b=kA0DAAoWhcFWaZAVSlMByyZiAGpFCpqiQjhCA1cxdGBhmgbrazRABWMA5fIDcRePwiNRXRwlp
 Ih1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmpFCpoACgkQhcFWaZAVSlMgwwD+Msqp
 XB4qN5JhJ9IMm6f8hnHrAPNQ/h0j6mdJuHPScsYA/iQK66BAPte0wbG7cAqITR2UsnmNlCTDZIr
 /QlK9T3sK
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
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..16549fd7340a556798cf5a242746c219d3168d83 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.53.0

