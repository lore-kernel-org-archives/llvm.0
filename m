Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11864A4986
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439240; cv=none; b=JJQDCXMN7olYiCNyHV0A9/VYh8OfU5pO6lBq8UvdUOwwFCbh5gyrSQJVtqbn/+HtahnlBJ8CvhjJa6OJml/Saig05NHEY948Zq+WbnlhGv5/dlUDFGAcVqmgg3Y6vF18adEZzlVqyLid2TnoWroIACXXko0zMDPK2qkTaz9r5+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439240; c=relaxed/simple;
	bh=uvwgPyWrOw9KmR0c/X2PNXzypQy3m3KL8GwzpX2fqTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8kmtgkZz5GHI2UqPWX71P9270tzpF8YS8heBa1bT6ld3cH7xH7y1M0KnD9Oyv8ND7EMjpvV34/Q5Z2hjLbvXeFNRGnKHSHMvuGdRKPzDjB0bBLwnMidJOvi6O+IxB8BH0p+QUudwI+twrMs2TGdX2FvsgBbk0uMhdxUAjIbQ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RAxXGsoB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RAxXGsoB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48436251906so2413686f8f.0
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439237; x=1789044037; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=;
        b=RAxXGsoBj8IFtf4yF+OaLLaO2ZKk5AfuIIYItozX1NXsAC7B9qdgVb2I9IL2ex6V87
         wRHYRGMY79B/6hQVODOCKbmReDWtDzQe2AofUy5TGcmQAsdiy0Rv9KPS0UbzL9iXf9sD
         tFs8E57rHr9EGvl3oEkx/wYevpAT43slscZGcuJtnUfKPocAHL+U1gJpviM9iGch9yrC
         09gpAJ45RF7WW8WeLnWE2zK5AbZ1LYMOXeviIfb8tVwOd/4m2Vl8CoNA9Bkf5z9D3FLE
         /H+WLflghaykUSWvCXVK7kUf97/2Cbp0Nge/S2SBgKjnAFdGOXoOW+kAlBO7lS+dOT9r
         SD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439237; x=1789044037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=;
        b=aZxnQ0vTEkiaJUwd/IuUEbmz5mcpIA9+qzusptGT8myv59qgG5TI6JkVhnYmi/BGTt
         AuJ0vn44tGE/xpRQBLbBMski78exy9shEGND2h5AiLL8FsQsdJh6Bd6Ivv+BhPLFD5Fi
         UYID98/PCApeH89Zxn1Nt7LH2FFX7euy481Vr29FRSFpyEqzCeOQj0IEk0H0C5AtE7xO
         bXkZ+KHb3PBc996nsakUSIGoeR0YsNDECsNdgARHfSNc8jQQhKhuP6N6QHkD/ExRhdJe
         ltNjF1s+Pzlir5yKo2WdJF9eg2k8OAtSwxwDKd+vmf6/vSaoMLOU3LQwAhWGPaWs03I0
         qpYA==
X-Forwarded-Encrypted: i=1; AKwUvBwkpMpUFPNpfQ1O6/yff5fVc7RBBUdXvN9VtdCOy817p407PHZv7Zvu6hgHEazTU5L1u/S6@lists.linux.dev
X-Gm-Message-State: AFuF++klJW+WDh5PpChsZhDWQalNi8auWeyb6HhrtL1RLLgr2XwS6M5v
	JcGNK0EKE1RKwRPluIKgyZD6UX0gG5nodyHlLwDoevEZGvuw44iS/0Ps7+Cnfnx1jlE=
X-Gm-Gg: AYBFou1UF4mFe7JTZ5i8gNNDVe1QInkdd/20nBpzXpIWtHo0LDw5QXfaVjYlDV7h1VE
	FxqxbI2fV0PS2m0SVcr9pVhOiV4WKY8voqIW9VRry9eEORW1BPR7A8kj4dgLxV64MA/OrvlxkGW
	iFXPqH9vioAW6+itjFzB/0YYSTEz7r/p0TMPqXCad2y/UiBvLS/pxIPS1PbhJeUara+Xaau8d0R
	rTV543YGSszUuR1ysnVwxo41m6qVMxym7Z1I45yG34+88REAcgiImsBuDh40GalIF/9HO7YUQdU
	Qz+hLb1UJOTxEmywB5q6TKTiUCPD0+mMa3KsECoJjV21tbWMqUo7L71w/B6M2H2aPeeeMQCIn3x
	aUnrwOxTUMlgL189B0ctm9qj7UAqzkdtsoQOUY7WrYGlhSorb5zAkXn5EF8DkLaMKOcQNMOhSnv
	gzFC28ImJ+/N2VIvKIHNJgN2gm585nyGXSHA6iMAAL5R789O9ffwWPX4tpTA==
X-Received: by 2002:a05:6000:220b:b0:485:8313:9f47 with SMTP id ffacd0b85a97d-4858313a27emr5841765f8f.10.1788439236867;
        Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm14692339f8f.6.2026.09.03.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:22 +0200
Subject: [PATCH v8 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uvwgPyWrOw9KmR0c/X2PNXzypQy3m3KL8GwzpX2fqTE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZ3Xb3rEzHwTLcBk3zdX1pPhQcRpM8nwXSeWTNNSY
 T+Qrreno5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYisYLhD9+37a+NXBY7bmXT
 E+E2T9w1l3exxxWvf5sdZl/+nyWZfpbhf2SGeO2sNd0qNzXPbdzPy/cm95KaiKB6eNSNkyecT3Z
 uZgUA
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

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564b..53c096da68b5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

