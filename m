Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330B48A2DE
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909658; cv=none; b=ZWQ0P93xl9noBw0MCqooXnqVKFdOksV3xlAv/8pzNtTH7f/cLM053+iQhjJOuLwkcBxg+rVm6F9x60u3aQncWeCfvKZobqC4TV2iEQEBb6qOttTpwHgpWyIG89nxWLzOLGNTMpfAZ1YVFI+H3m/KrCxaHCp5Ppqb17BFWMUq/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909658; c=relaxed/simple;
	bh=Z/E+JjncGLfbHT8NI+qhLL8LEa93gDAXaV4LCMnFfqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trLGlBJYJMjWjicGNPmghpL9gAMNzyA8NLqegQzev60fGtOU/mdgTsSEvsW453xJibZzB5hNO9ngmq56uBuNseuBThSZ2bF1fBm0zBEMUvs+Hf/qUL9u7RD5MCkul29bHF1yKZO3cnhn1pOFRWjKmXNB33KFgpicnI2yPr0i/GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DwLKg7v/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DwLKg7v/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4759b4f0897so471329f8f.1
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909655; x=1783514455; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7AHJG2Hq9ySVD5y0BRLQalxY7Qaf1eozrK7BDQ19mA=;
        b=DwLKg7v/hCGVRak2yhXOTiNkPuxARXxsZK8HZmYs/dy3ac+Bn3HlECQCA1Q7yNRCi5
         kjWJ5XB0FdRDDLkqexPUDC/JivrFb72tNntZ0cI89V3BzSBiaPof4b+yZPb+5kY4iCgM
         dbo0Xrl+HBGUE1lUmnHIDT3BWDKOz+BN9p98x3hxT7cEw0y/roQdXkvFMrpktUsYKOKI
         Xc+kVFSnFYYan3sObHswhJ2Hq4qoPuUkSenaTG3WYIK77rytC16cQ3lsemN0w94aErlb
         ZNWIP3QDNUmSSArf95RFcA1oKFhu6dieBkyVI7HOM66a/wRd5tHqwPVXnvsQGNwoxRZh
         XwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909655; x=1783514455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7AHJG2Hq9ySVD5y0BRLQalxY7Qaf1eozrK7BDQ19mA=;
        b=O2kHcoe5FWJYzAjTLZjrnWxn2A5x1/vIB691WYaTdYmE5IIRJyP+HY1x1MvLaT5qdZ
         ZDqMBWrdY2QJ3/drULHMHao5NyoXIplLRsdCS8mc/l3DjPeC5xx6qDb3jYa8KQ/ALWZz
         yzd08IdyZxLZJFGrjZhPmltq/tE4tRTY6h68K7MfC/BsYjTZdXVELnV9Y1vY4ytTnUu5
         AS2sVf2oKRqxe+Q1v2r59kJLmPjACSxdqIFTClWH95tdzoG8JQyN7qjMTY3gorbKWznb
         kNtiDpXL9tU2yAF9HKs6PCdYvLUCJMv75NRh+1wcQwZo+slTlhx0ZhFOImFrF670jq5j
         7pXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmaEqQdjJ+QVJw26JwXMGiZMkm6W2FgyU93nIuQJQeCMfRJ/yYgBS6yFhIU4DaiQswPKRI@lists.linux.dev
X-Gm-Message-State: AOJu0YzrUAHNKS3coAShX/rgm03YUx01yAOpgb78GPNJcNuN+XzI7mnV
	0Sx0/t8TdQnNdeb/tESlg2uEiVnJSulPO3dPVMqaWBqjzShka5bqLgIhVlSlFmTnvkw=
X-Gm-Gg: AfdE7cmXPGuPOzHTeZJB6Mn1Z2eqo+95kIda6J4tdk2VGCwXbJv3yO31E8C1as9/WTr
	vL/PX+JByWda2Z3flRytDsNmLLVDlEzzGC9dtLpDo3Q69zecqH7aZ87kv1J9hCZAOYKfa+Mk+Uy
	Mb/j0x5GxUorIqM2soMhhtH3jg4OJ35yL0DYkbpuC8GlUUyrSKDJXUoLXNKyoNUawMRutP5XhXl
	CUcHw/abXFmImD8Yn311yF4ytSTZ3/7P9m6ra/PYkzKN7Y2OMFaePwFCT53TgyFNPHubf7jHUmt
	vndYA8UQ66IU7h4d5Qi1aEnhmDqzIdsy+SweipKPENwQYGzA9pfqcec269+NU/ovNEvXDSv+3Mb
	rcWTEdDHzTnmC0gkamyGhcF3UIt72fdWjVawVpG68q6w3yVqxdPzR5SD7s2EsMjzDQDoRsRLsFf
	4CcWS2KwvKEw==
X-Received: by 2002:a05:6000:2507:b0:473:975c:4fd1 with SMTP id ffacd0b85a97d-477b3d5c5bfmr486039f8f.25.1782909655250;
        Wed, 01 Jul 2026 05:40:55 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm14794679f8f.19.2026.07.01.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:18 +0200
Subject: [PATCH v7 06/11] arm64: dts: ti: var-som-am62p: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-6-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Z/E+JjncGLfbHT8NI+qhLL8LEa93gDAXaV4LCMnFfqk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXroVRgmVnLzRvY8sXMGdO0lLbwO+qZfAsfvffgmWO8
 v9fblzSUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPp28jI0PpYg+2PatMD3Utv
 P2k16BQyBRlFTWIr3OE1xfPv7tc3+Rj+x72LYZY8LLzzpEFkyNRGn3qffw0rpOapnJmx/6bm2yg
 +LgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
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

