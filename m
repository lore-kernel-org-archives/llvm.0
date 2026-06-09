Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F5B4CA289
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031478; cv=none; b=gKrOuymantMD4Xm8A1pdtyYNa4N7XcnGWp1NDzF4gud6PaF7hssRCGC0kBHWayEukKivumFUWN1YtCKY90a/cXrO4xkcBWbwKvD9NummxaoZUYp+NYX14ksiP2eQatQdu8d9aVAIccojG8JIt6J8FWI3JPEyfq4KT7HhGRa11SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031478; c=relaxed/simple;
	bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aye/hrfYGqE3WRALoVHSLgN5Jee4dxh2i8zsqiwupZIrxbpqzhP0CYmziVbh5wp96EYULOu7U92iaE+1dXurQUgDDMq608o3Iw2SG7F2WmxvMkPYTZE2WtK2lTCVRQq/T396LzgPw+fq8RZnMhpEooyHmM+E5hYv60dn2VMnfys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gmhSHjl+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gmhSHjl+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4249193f8f.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031473; x=1781636273; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=gmhSHjl+CaYENVN8tx5NneswZnGJwZYMhQxAyr+c1FfLM+VDftLCzzKkTow33cXA08
         jh2IY6v1FayHgtCxTSMpTKFlHOdqnnwj3FC+eXI5Tth794B3QWOUfCjWZ99XAy9snkFp
         Ewnx4ALIp2ImNSrkU7js4B4pvBgeYmaVNjcQh2pNlE9xlJILWbvT1/UBG4LpBj8YaNMS
         kbtEWG7GRc/8Z5qbN/BP1KrwnEkrtPFnQIVVo+gt327QkCuJvNXN9gTGgI8PathSTYdq
         Z06qh6Cn+AX6G5X6yhbXND/YoxFeantgRya3wzogIlL6nRZxeKgzdScJ67Orm44HbFRl
         MGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031473; x=1781636273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=m83iImJJEV3TpxU2HNsNHHohjCPWbkgzUfePzi9yHCxYzJa5EN7V9xIWRWkrOTiSUZ
         +PAgNXsNlVBe3lfpJCPKRH5kvc3niQwVbwbmkcnXZ1ec430dly8lnG8iWxNezU6biTHv
         vkHhkISU6ezVqAVGtWf+No494Uppyb6mhm0QrjZ30XBCboPeZwgGZl3eJZaKst6R9GKR
         B9Wy1VOwpzjrby1t89jM0qA2+rtA1YiZ93XGcCUIDKnPdM188hmGjf2bnBY5/UdsRBEH
         988IRJimhD1zj2SQlemKLRRdNFQSwyRkclzR14yPYFeJJA74KYkyyYjnGVrxc+FnzHRj
         LQyw==
X-Forwarded-Encrypted: i=1; AFNElJ+nT4Lu8CebNd0vk6o5unHNx81rGjpC1W1EvCdLnJz3b24N0FihCMyfOuatJtJ32bMLTQeF@lists.linux.dev
X-Gm-Message-State: AOJu0YxZbdeqFTVB/6mw8QMXUdfCUvkA1TxQN3UjXKJGqoj5Q0JQaPsI
	eKXcb4Lb3S+/JrKLS2WiMzH/q7BWmI1jpQ+83icLB4zs5fpURX57yrchSVEW/Fcosvs=
X-Gm-Gg: Acq92OHmMAqlqq+8pM3JPXBNczLMi1M3HbRvij8WfkLQnHZ9ztW0Jm1Qj6U97DP3zrZ
	aPRWlEhfu7YznsGDzMDqTBXQiexyCaLOq4grS9hfq1i3MRI1JVLloYK3Bz3nNixCY+it9+dxD71
	FHQMBslXKeKy/5/V5LxH0yikIA1u8mFW9s31JX/3HyntyJVzI2WvoPnmIXpMMMavU5isPuJZcx6
	1zaqSI7bgCuRJNa6eGcVqcOZwkRcdcMBqY3TIsJcBjKF9iRQARHf27AH2cyRreLpWerFh4nIRun
	K654ZCv+7YOIxtkhtMtOz7puuqDAk9rfUUPKTDHiMExymr3OBaKIy+a5LHM8I5dW+fZpJbQUJL/
	o74rmpFazVsbuIeW0XDFBoGWyV8IEbx5jnrqsNou1KfSNspWTA2BGNvXRVSZfjCzgtOQgtpT/tk
	Hqw3X3g0DP893gXKUF91005EsoDF/f8PA=
X-Received: by 2002:a05:600c:8183:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490c25b0a60mr321296115e9.17.1781031472834;
        Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm50662830f8f.14.2026.06.09.11.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:17 +0200
Subject: [PATCH v6 05/11] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-5-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=msp@baylibre.com;
 h=from:subject:message-id; bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxM/Kr5feqbh06nnx9l4VzWN7FQ4G+aqzzL+oKnn0w
 LbXwgnJHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRD0YM/+MvF5Sxn+A90h3y
 XGP9w618fMqeBwwFvZ/dZfDwrjriUs7I8OalbuOD2phCpV/P91hxSPAmqzNPztgY+qLyrn95jNU
 EbgA=
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

