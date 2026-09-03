Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53ED4A5C3B
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439246; cv=none; b=HsrIzAI1O68MB1JbWeo84QQBpJkUx77Uk4FCXFk92Wb2VObtNDJTkMz4VHzlpT+WnzytngcB1zX887AYJtKhWNxt50EV4RquajowzKElzrw53Aa+vePn+MfUCjh1ShWN7QUMnX+xkBa73Wy4LP+uIh1hdTY7DqdSXWCbGH+mbks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439246; c=relaxed/simple;
	bh=QsWsNZTIkr67WF9AjDgtYRNQrYQN536HF4RLuL9T4IA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXC7Efe8x/GE0aNRa6umy0BAjlszRdcIix1WimgnQNfQ1gnamZciZYj3O24XWWFacxnPYyg0EmbI5WiCA9h18RyUJo7J0M2WnzZ497nvOWeRNuWJgTK7JTmO3uT0d8LjclpJBtPW74fB2jjctcAnr6EO/Rj38HawthNnriIj3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=puU7gXB5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="puU7gXB5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso24733475e9.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439241; x=1789044041; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=;
        b=puU7gXB5r2ghkb5NZblrc2sGSf9QdWxytXPQ8+nrwpDdL4v3Use7NAfA+CXNVZ1M2q
         VNz7EIphkXeB4Ix9cUMhuJdTHawQwSVJLiMnwyJFA+CsWcpf9cVKZ2ydztxJQKQCAfyU
         DG7hs9wR22Jl0hZk6Ajn0T2ENO8fwVxbfWfkkOTNml9zATGlrs+OwLvwi7CQVtnpQCWz
         a7SZjAJ4gO2K7Na9I6iq8y6V4l1PfWq4kcWEX0gOJIPDIsk/bHK1BeC3yG46oP5TmvmD
         z/itZgwX4+yTXNLovwOK6hPcdNZERwZVlHls5pxI0mSmmcDUgiglc8nSPjYCak/v6/lc
         UWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439241; x=1789044041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=;
        b=OXBfguVOmQHwHUGaToJG2V0XwW8oGq7e5aBx1ZpRol5k1mg8769cDQnAo6szca9eti
         20bS3kP04tZOirzcuj0HaGnYXoMgObnpxd+Ag5nj6UnKwOJ9nUXWmrVeQplIYvijGxsM
         mBFwUJSBXaloenRpioOOv/PxHsnI/86iYFVBtcNc7U73gvqVwFq7B/RZ7cuaaEC8TrXX
         aKG4lIt01jD7cBnT6o8V0/HfKtgeVPx9RGpc3Kp5FeKV8+hxwXmhyaVOWN6M4+un0xQ5
         oc2hxLHCnOzzUaqqMJZfTYIwH7xHDZjXxUT5vXHT9UgNE8L1fmIoc2dyBk69KafHYWWH
         MXtw==
X-Forwarded-Encrypted: i=1; AKwUvBxrDD0CUXjWUwvV0A+5IdcK4tpZJ3k5cAA1vHnj0LyHH5FyvfGaW+fLmPr/QaqpD+XexYsG@lists.linux.dev
X-Gm-Message-State: AFuF++n/W9IQyJ2TWlizrqVjpP5DUvI3567rIyH3L8oixzQpqF3uFT1N
	fTzAuS9UpDKNpz0Qn78dSplkeH7zSN9AjRBdOyRJTwphwijvMTj6RjyonYNM3zTXtD0=
X-Gm-Gg: AYBFou0OG6NozccwaCj2PT6/ZVZCXd3t7WvqO12DWuL0MBHbtguzSwxa42zv1tmwKST
	Skr5kvuUQNPMuRCwLLRZgNN2vWm9V8G5Rz+imF28jjzqnztZ/lhb5/+fNrCsox5YswFDQDoE2s8
	myrmfWHfGOFC5ECnPS8u0m8Q99yKC8RGmrZGZI1BY7Mp9j085TyXC6CLAQfMydOiQcpOiZNmBjT
	0GMnQDLPj3HABvdnwFcfZaYq47nRBDGetH1wqWzGhEb8ZiCIf+006L3WdqH6M0hYXEwOOguxVZT
	htWzuJ+Wo1qk/Wcf2QTIJv0912mjO0eY/OgUDeP5CjnJmcvBCdN7T6T/rGDDYymn2RGe6IdIqyJ
	7/pyrYM/Q5hi/8i69JCJ/MjdheWJcGjN86MJa4nnEg3qll36nodR9BaK3mQsdde4xz0vROC0GQk
	rqVJAqlrXlrfwhjGe95WXEodqiOx7y8g9iiGIYVYhZP5fWt6ilGWPTF4J7Cku6qYvR3CiF
X-Received: by 2002:a05:600c:34c2:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49ce581f2d9mr233935795e9.4.1788439240973;
        Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm88257445e9.0.2026.09.03.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:25 +0200
Subject: [PATCH v8 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=msp@baylibre.com;
 h=from:subject:message-id; bh=QsWsNZTIkr67WF9AjDgtYRNQrYQN536HF4RLuL9T4IA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWdNFzSayXi4SfJp8vNTrucnBI8nzJm1uVQ5mMvL0n
 bAhQ/BBRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEwkbxrDP6Wo3EkqE9Vqzuzc
 6Nd13e8hM9Omr7aTb8sznCxPLjBnEWf4p8lTm1r9T/Pw+iMtLbryr67bFlnNd3iqMX/HgYvSHel
 HGQE=
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
index 7ee894d59113..8a5ff5c45757 100644
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
2.55.0

