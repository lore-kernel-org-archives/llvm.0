Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3EB4A4987
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439242; cv=none; b=hCskSVKujUIg4It89akvdHYPa5BmzmLWjkXARdeFcp8m+Ku5JgojYn2P/JIoENtBx/L3doG6/q3D/qndrMXFiGGFNB9OkTa3clq34tdL+rCkzppNVrLZP0SRnSqEi5jC7+TToAnN2q9+Q0QwKdgdWD6zRW4u7W2wVKEgiASQuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439242; c=relaxed/simple;
	bh=Fwl8ObuLky5qFvdgJbDIgRGjpmOwOd7ZlgsEnJiZjoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWS44RTPaTbBbFocSklCnylVl7IdUwGaEFhURanjlFNC/rjOoDJ6vJYukJ2jwi++FMsPzPj5yl5yyCs1mJy03VJfTjVH3F2qI16AH7hHeKb2hhlePQFFeDHZawZk7+9bFX4+b1om3HsSzdCS6BmHi6SI1NhXyYg30Phj5rA0EOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GB4hJYYS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GB4hJYYS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso24411645e9.3
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439238; x=1789044038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=;
        b=GB4hJYYS6XJVaZrrrN8lRDr4DFRuXG0olqAEnR9/LYeUNkYdvyjOLlNSOhZ0FAWVKo
         8PVtKSmySAlAdHSOWuy8fQYKPuWs6KpEI5lkv58Mi73BDkZ2ycOrpTxoRT4A5mqH/MKc
         9JaI2e99W0e0k2mqEm/gL6mwR1MsbEupimIKjIZFn6exOzskmLsQQPQeW2feV8ien7At
         RLf8+TrerQv6UFQq7bzoSlRkkYOCN5cXsqvCW4PqHhMCBUzYcmmmVy8jGoV3cuDcFZyz
         gs+hGi7reItJhlJdKtekqAN25fvdu+tkg828ixWlOLYnTKtaI/Ikb//+2aZEzTQxm4dm
         zwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439238; x=1789044038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=;
        b=nqvxgo14OhPIJyk7PkV4vJI65QJe7T6BQBBRkLa1uIdykB+p4bM615kKRl54vVwhJ0
         MFIYPq+DuZQMisUaIJ9LeaYV0giIarJREdVYmTgxosgZQXw9JGvYDrq4i2pbE9PPRgkm
         zUltq2/8W3lm2frnFQBgpWQc+Ciw0tJ8cacbRE6xH6eze93bwEmsc/LCk8xMaer6zmsg
         kpltz8wh/6TvoNRxEEMKwqkm7wOGVcmRGgygtjINila5HxBXVbdV/L+pFHzG2JXuT2ar
         0VFOsiUBKxmVvdZwLw0vtNI5SGgDBbwdvZFKa2l1F5uBePdVcaOxEkEQ5o4iERBNxTqD
         7ecg==
X-Forwarded-Encrypted: i=1; AKwUvBxr0ISa+wdCdj3TEy8uKK9PsNGnGO4f3iGd++rsOA6KSG6DY5DY74ngYL3C+07CLSANdC+0@lists.linux.dev
X-Gm-Message-State: AFuF++mwj/kY0QqeXb30EvvYLteQTsokiM7IFR7ww9UuUE8wPKhhRY5U
	Iao3ym10JgBr3nlhJusBe+UiHm8LvoejY82bOuRFS/1wqof2d0zognZn6OtuYkICKjg=
X-Gm-Gg: AYBFou31eb+HmPZ3hBV/Ik6C80UvRAAqyYvpcbEPgYK5+pL6FrnXoU+NwtGSxk4M65Q
	SzZ9UgAFq1+5iZR9gUw/Fy1d2kmlD+oubQQAjyUvwWN8L52HeVeJxcZReac6gKKRJOPjFnu1rym
	WfDKbmKBEqv5JXquwI2Wd/srg43b8LS4qoJvsSxa6UWVEDyUt/kkh+IJbEawpcTwstsGZWdObkW
	yeLMeqwnuqyAlW3PgfJG5No9LpYUuPSI3O+AeRpO47HSj7eyQsXCdifapR/2hdV0G/kSSIzozU8
	msL7b/I38XvfXeWE84zIDzmzh4S/+JgIGt4Sbrj6Ik9No/ILMJEOIydMf+8mI67kZbgm/SqAK7r
	kxdqD46Ni7RFwFqYXxgPXo9p66t+fZt+oUxBwqtqeLiPmmLm4xf6fJZov7bYjWsSlrkwhPN/4k8
	KjNCUJCp7rD3Tmgonx++LX2BFQIOqs8CyUZkha/juQW9JNXrIqmUToqbShiA==
X-Received: by 2002:a05:600c:3e0a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49ce5810b5dmr269244445e9.3.1788439238198;
        Thu, 03 Sep 2026 05:40:38 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm67325465e9.8.2026.09.03.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:37 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:23 +0200
Subject: [PATCH v8 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-2-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Fwl8ObuLky5qFvdgJbDIgRGjpmOwOd7ZlgsEnJiZjoE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWX13m38JvXyxaOLpF8sv9T1mFyhlVLg7f8/H89XW9
 6ac09Wa2VHKwiDGxSArpsjSmRia9l9+57HkRcs2w8xhZQIZwsDFKQATib3AyLB3b/u3p7cOyDzI
 PHJdzf+pusOLH1fXNLbt/3nzTpPn8yv+DP/UK7O5j8ed923TiFWVste9n/qrbPPpCy+V90SFFGq
 33GEAAA==
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
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..a8c794d07343 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.55.0

