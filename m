Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DC481FBF
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909655; cv=none; b=XG1xFFdeaHkXgsO/sbkNLqHI6UdiXBQ3JfTyE+kge4XXE1YlIM/oItZdHplTk/TpTtI4zE8YxwqW8Ooprtp5q1iM7rtFgsBm8X1QUHbqiEJoRb0vjaxXAb13MyOd8ltFYjGf2ZnGBCAb2u1NkYb0inZyqVGnpV29r4ssNdk4i00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909655; c=relaxed/simple;
	bh=/H8+FLcymjurbPJq5XVqqAaQz7MleqM2bK1XAD+GdZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fljJn0P03a7HOSaOSIeOy3ky9ERWdpkXVl9ly9YUu9V7pdTFqcwaIP4e2Pk5tT4bd6XQXhumfI81HymnYI9DIJoCqeM5DKDvoiA8TIQcjsskXDro8cwtPE6RbaOArhgaEbSTLyR4mmoUpUv58RxO4UdOAc5akRoA0vPh3y6zj1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Gut215aA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Gut215aA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so4552545e9.1
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909652; x=1783514452; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=;
        b=Gut215aAOOHnDAnia+KpBplpexRgdmmrGi3/6ju/3DH1571raZGrvbz1LvjzK4r+ye
         aOdvQL7+mCsj3F7VE8uW9jEIBNGPsDFSOHJmy3opBYSaQmBAIEq6uoV0t1KboUKrbR64
         1bsSOoryzOKlWo94LnIZ4QsqXU3u//WI+ktvZLAuRBRfpwpd0CeMpNm875Y2+3UCcRbl
         cQVT/HWpRDMS06lWsmcV0RHv7nVTxT2PC8MY+tt5l6Wo08VL8N6CA4Mm/ERDvqQegwjY
         vvbAPxAKXUzetOlMuRMBj48eD3hokmvqG4KbZV9Tjfi5VnfJoRLDggUMH4MGO6Eyqt7j
         f5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909652; x=1783514452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=;
        b=FdJoLdj294IGO/4LjIJGOxBkuz2/av2eF4/fQpnZ+c+zBru78qwpZDD/aXHSAREXoH
         9S29cs6q8jioy63KeUAydvPLW2fZSwfrlXNmmncmGfJAYQGLoNZk9qQlEWURhZ7EXuAc
         NHivmhrFWlCexDEGZZCc5Coi0w0HpzOLoDtx9b3jEck1uYZnWvQw6KCK0raeM+d8Ngv1
         F1q+3Y1WIgn6WPZ3xZi/lLwRkcd/7kE4s0P97i5yx1ALZNbJzdXJIL0uiaxzK580jNpI
         St8pOjfAM/nnF8gdHnB7zZAq+r98lA0F2N50g/Wht48+RP8FahCIwcV91ztX5cmBUYm3
         nAmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8P+rLvup3/Vzr8Lheofi0gQk/r/kCKU0uuNHtl3TROZinCb/nYC+cKq2yteLxUNdTy6GRi@lists.linux.dev
X-Gm-Message-State: AOJu0YwdxWcuIISbiM/korjEGHnBHRolhTFxcqxLiWul+dQ2Rg5lzVug
	uvnmc/aU0JLHVpmiKNPAnQ8y2iJ5opDmAmPs/G7P5VTkBjLpkvLSTcH848PUN2/FZmM=
X-Gm-Gg: AfdE7cml1FnV7KY1slfGsrv1Ed/ZhVs+iUBm5aYSj50iN0bOE4xWNAsJP/oseJ4I1e9
	x/9BlfIDRoXMGdwiOX7HDADpBppetAOe2nc5Bj5gkElNSy00Od1GcNVX4Xq99TG22JFD78N8wEY
	O+P79NPEBlgC+PY6hbDa16O/pmuoN61V6yNRpUqdY1d3WdGhjl8ML/woEcKRJDWtNE9TnSCI01J
	GhyrtIkoUM8KINqCleAh8MXX5YeULyIO24xGD0FChbxvXdmFtNfXe0nHMmgZHpu0+qZffKIcNeL
	5EuajH/Lval5/FBD3aRJy1cHBsZ9egHZKZXlJJJby8iP6Qf6Ar/5DDwpAVYbn67xKRcWvgoGEdO
	2m+I8Qcn0SOsyzdTJrnOsfjczZw0VZZp2cHIbLCkdYK2VjVvUqDVEsbgYglWlhhAT+yGNCqm++3
	oKTzRCjD9Evg==
X-Received: by 2002:a05:600c:8217:b0:493:bc88:ddcf with SMTP id 5b1f17b1804b1-493c2b7d9a3mr23202485e9.23.1782909652226;
        Wed, 01 Jul 2026 05:40:52 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810c02sm80288265e9.11.2026.07.01.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:51 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:16 +0200
Subject: [PATCH v7 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-4-e9db8b16821a@baylibre.com>
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
 h=from:subject:message-id; bh=/H8+FLcymjurbPJq5XVqqAaQz7MleqM2bK1XAD+GdZM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrsmaO8KOHNtu/6Oz3l9j+5fWI7q2rOo2byw4Y/+7b
 enPbVPvKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInoRDD8jz9kzMYkF3uKd+Zi
 4Y28O69bhSbumfZw4yru0KIHd+ReZzMy3NnoZu0Q9mJBwXoTR46CmMP9La3a+XXeDElHnfa3BLi
 yAgA=
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
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d235fd4b4e5c6af11 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.53.0

