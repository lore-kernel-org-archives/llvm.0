Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD41A3B14C3
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723154; cv=none; b=RE8jew8PxpagqE+g357kQ2RdbS1DdlxiDp7/Wl2N0sGIcXU+AZIHNpneu6XI5W9GsafyKhYr0YqGqVLMDqW+puBvBI9mEyZEt69SFeVuc2yMTAa3uIz9RUqyeGH0Uai9bJ5+2V+balVJ++FpOhICVwUhpiLb/qNfJ0Mqa5kFtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723154; c=relaxed/simple;
	bh=nlg2Vo5gJVuqTy6ZSc5mAEsVYdjtMTLDz7lCiJOX1tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8T14jDxxDziCZxVFCB36HUYyWwqxY5EJUVoImzd+cPdUC5jeAt0BsLYPoM87qFic+nK8zc6Hf/tBvFDn0K5riwUfRmpTXpo66wW+Tt7qInOsu14ThXVuBPFwAj9Q9S/6PNDcYI7g09VRBD259m9eDPl4txSCMyF0ex2OKaXC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=chZau92u; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="chZau92u"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so4251885e9.0
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723145; x=1790327945; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=;
        b=chZau92ut4FlRSGk/RArCuIkaoyu2B89H4f4XDMDEioqewfbDI0Wvx650yVJVoBlsD
         Np5TeJdFHn19siIpBSiqGm6uh1qUUKA33f7AZjcAindVvstVKwvwKCxRzxH0zZjASVJo
         dRu72A+CcQqIysMf8XdeORdpiaRG/uCzZ9ZWpyWzIUUJmkPJEGeof4m0DGf2NjYLn/aR
         SJo6xMlnBgwgdrdO+6/kNDDRqIgRYoQccE3bg7YgngTm9+XRZZhRfM7uc+RHizBtYoG/
         dbpmNIFpJ0+P+JNfU+e3z0iQqjm9WX6lvZGK/9ofFMRZAUsuNr2losHcQQ1ktC88HeS5
         lkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723145; x=1790327945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=;
        b=GbW5E1USY7wumv2Om6sqO/AppAfS937SFSWxX0nSDQMWJwEZdqAp3XZTDJd5/6Vcm4
         g3RbcCpRjyZxXTC+44oCEyev1MkPfML6ve3RmW2tX/71hSOJgW25HmBK/5DNIc47guxS
         VC/MRMcWYjLh5fnV8tImVBRl9svZAz2lFqRVrgHzAvDha0V0bCDUnv76TMMvGZqkpSBN
         p60OXcJfl57raiDh5Tuyr4xZiw91yue2pS5QEYLxnPq8uRA582Ms2/NKjBTehzANSnbl
         g567lJ4V1/xCKxRhnGOuHViaXKv1Mxi41bC3t/Rr+WD1q2Z4ZnEnmNBvLKH1hx3yxRt1
         vY7A==
X-Forwarded-Encrypted: i=1; AKwUvByRysXyPuIEn6oPWo6IqGc/BiAgd6LGHrMWNLf1VsP2mfb6f0wxdzaEWYMKuKO9MTviGYP3@lists.linux.dev
X-Gm-Message-State: AFuF++nIgJB54tmxDfFnV/RdimYa/Wb5ExCCkKUgVKa/zRcJdvh9BqDL
	WPNDCskBo1KNo88/AEjvYUZ+AOBTwaF0u4RK3cTWVM1B0vKBTHJvi5ggT/KtDM131C8=
X-Gm-Gg: AYBFou2Fo22EH3XHjkeHMd/dwF5d/x1kYNKxSkWfUWzyF8pzvNNAhnhisABZ1yHYZmw
	Mi2WI8cVfXqUHQuHIAimljF52SD2MgXZ4D7qLxWed35vgNs3GPQ+RHoLoOy5mVurbt7McvWmt93
	C9KVMOYxtqLTD7nm/juXXFmoMg/iqID9W29TKrf0dxBeOxKy8tP0piV6lm6AbRVB9NjA0m3qL72
	ZjvL7jeGMfEjV3xxXbV7tqNpovNR+nYLrOM/nEoWvc8SzH3usIU60vK2SrBI5t15oaWvZNQCumx
	WG+3GskidIxKKODHu91fJEPB4UuH2vxe3aHtwXPV7VszgxS/LQMh0PhZwgXPPH6cNI2paFajteT
	7TNF30ZF8Bx1sIDVdio70W2VMkl666BJ99bayvujXU23WWTyJi9SAr3MOXpdiLUiLUxm72RGY2o
	H8GziDXyiZFM+PKGnqBMwRYtc6kKR1mpIb8jPc4R5p8LAT7/z3+cio54KKDNyoz5IHHLA=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr23520765e9.10.1789723145444;
        Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23a815sm156485815e9.14.2026.09.18.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:49 +0200
Subject: [PATCH v9 5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-5-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=msp@baylibre.com;
 h=from:subject:message-id; bh=nlg2Vo5gJVuqTy6ZSc5mAEsVYdjtMTLDz7lCiJOX1tU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jNd4ntTwXnTU3m4lvFOgSprp1PNUmYmXfgX1nVK59
 mvHikNTOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAihcaMDO92LIo81Cr9+Mnp
 c5FTQv55fjQ8dmTz9lsTN+x+Uq9y/sczhv+pKyvuPpicXLPodmlO0eTUAJdLPNtePzRtaDznpfU
 yOIUVAA==
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
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d..b8af9ec81b0c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1d08000>;
 			no-map;
 		};
 

-- 
2.55.0

