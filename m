Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE414C957B
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031472; cv=none; b=E0CGApIK1E1a/DSELSR8/aaov24TvDVwJHklxZn3FU7w8ymJcQpPQ3sfyz3tZXCOPWmjpwkk6tp6rDYUoZ2tq8QqhqFbH5BFSH/IJGcRHtctYCPTcmkrjxwlwvUTX+TQoB6RMJ9Kp64cUn0YUQeQbn8leRvBB1j7s/GFZpkUxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031472; c=relaxed/simple;
	bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtb9rqRBJbyhuojoVLhtC3ENGDWq1Jn2bRUtFEatP2lKmNLADe3rNQsj+Am4U8ZRCjASJ47zzdli1SNXE2Xaq8Sb59h3c/Gk09iNObwjlvjUEOhVEQI9MwWu1v7XpEgQBtVqqPpNVHVhXnhB/hwjv7uRloq0Ljo3E6Fl0usVew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GmrNzxYA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GmrNzxYA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so75399015e9.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031468; x=1781636268; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=GmrNzxYA1gAfGNSLSoaSFPjOEHYV9hGdCzBAurB71Z4Vpr2zdrd4zjYdqPArx/BDEI
         XRfcewwa2yzBJBFqTo50zdZCW3kBz1lQi+oadMpmANojzFVBFoB346zqbbRhL2xssecr
         Z6gURMGLzFcE0JNKiAV7YUA0BlGUyUsSKdJ+lEFP76/dJGzu5+dvA/h/7hvcJq5gDdzk
         2g0I/X5PaJnmLFusXpFd6dtkkIBZcXzjj8mLMFxb3gXfzpitw/c0zWoDTatx5XhvawGA
         2dVCCQ8Yrs4gmaxl1uiIKNKV9v0EKgjZHaN5g8hf9nUf+jOU4bwaX0pHNMdaWRO8Yl1T
         4+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031468; x=1781636268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=ktZE2nuZtt46447IM3XuPzqWRG5jA4IGWaBg3o0eBR/PtUrnMfWpPF+iGA26QD4Jk5
         W/c0Vcp4XQyOKO+WwGpgX3/E0op5xM41p06KVfzGSHg2Xxo+ub1mgVg5e00R4G4CvymC
         MS7mMc6bPwRDmWdZktkFaY+82RUoi5K3OBtpOaYbWm00GhqL59M+X2kiL7QRSj/v8knC
         gFf8M+iHuw6cW3mqL8DCJLKW6KeRds91IJO+SKEHMAI32LN2tnQdA/SpL/lOC+O/2LYC
         /u4Miw/IBR5NgX1ohATNMOr2R6PF99tbIh508JmrEp+tLAt+KoBSE+2Rq6df0j6FF8w6
         rhRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v1mlnaBYVWAOPr3O7SlhC6xBZRHA2JbNC3noTA5ZNHqXzJWOTFuKDIJHCEKTKE2jY+QDs@lists.linux.dev
X-Gm-Message-State: AOJu0YyVFGisHQPm8mZSUDB3Urc2bbjLg2mJpTIUN4U0loX6PpoHqcWD
	3zsP5aWMOIVlVECsZCek5neFK6NLUfHrdnOKBB6XHbKWjGj7IUQfahMQHAiRWqX7jjc=
X-Gm-Gg: Acq92OG2pChibiqVyw+aAvnW9YU6wodJzG9ZDTo5DgxQihVZUkweSsx7qAroQsp1e1u
	Au/6LtEF3Qne+DWnTBYBIYeetV8rI7KmDusxTrqOIWt7c3t/K8JlhvZIIBwmsDkQEzH8AVDQXxh
	032VZB3eJ/rTAvVNAJttUDgiy2jDQvxRbfqkVC9bgH6PUZ5gQ+KCoAzWi8ALeiStQYPv3GQASbb
	+HXGFVM4OxkLoqWJ2F8YYuAqe53ihQII9H1Mf6mXVkN9XnTBc3IwAuZ8WKggY2Wks8+N5jrQ2qa
	KHWHvjQKkZBAClnQ53L5lEssPwjcTdmvqN3rsy52rmWkqfIIBAG+quQGwHMgTgcY6+Vf0/qC158
	88ZDibXg26CoCeVFZvetjXkEKc/pF5ylIZwWpj6atPXpelRFCIMRY29dxDO0+Te/VvyOhzxLdis
	VYy/ajol3t+FRywr1KzzuBZf9DHLmAzxU=
X-Received: by 2002:a05:600c:8708:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-490da12f2aemr34538895e9.31.1781031468127;
        Tue, 09 Jun 2026 11:57:48 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm502660835e9.11.2026.06.09.11.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:14 +0200
Subject: [PATCH v6 02/11] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-2-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxHv5rW2dX4XX/JznPuf6uSMXnxsK6LKU8go/vHbmn
 /SxEkODjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIYWWG/wGu1uI6LjrqD+0i
 d7RL/3k4teXyjqxl4S1HuJ8f/94zp42RoSXKiOHGAWPJzyJadza6pMt0L1+2+EjpNKtdC64ZOaS
 XMgMA
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
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..463a3f6130b8f2927a032137e87c01df446cffda 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.53.0

