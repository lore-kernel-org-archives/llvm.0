Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6F4A5EBF
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439246; cv=none; b=JgVVYhs6qmoRxZHRl0VXzLBsuJ5VRSaHRwJUMXOXE280BfvGYxBCaj7E2UP8t+bbMDRMAypN7+cUcsPeZkBMhshnN5lYF+0fUz3pGGoZnHdCUgpKXccFw89FrsIaWRX7VQ892QVOFzXk9V/mJP2g4ysnTh2/EerPOSNNSQtMduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439246; c=relaxed/simple;
	bh=MzLoYwkeZwxcJvYp9xUeN2jYUVgOx/RH2raq9hcPIQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZ04uexgQXZaaKHEdSAdyLFEzPECIMjVKUy0suBexDXZeDbLHGFklmgsuoDW/PGCxuVp/Q2XRcpJGQLqBMhkG8bFgus1Rz1qyU7yB4SNbmdBh77rNJPJ59BST2euX8g4YwQUqBrWT8A49sruUWbZwI4TUT0Mvt8c75Lv8bh0pXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IOF1qxvI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IOF1qxvI"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so2309420f8f.3
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439242; x=1789044042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=;
        b=IOF1qxvIcteNOMgm8IhvDZxMTD/xwND4aZMAoCgcBB6d2VmxuFL2jUrNKq4UxaF+J4
         x1tVo6bLfr6n0KYQmS6etnP9O8tNvPLb0uAoNQWjFZUYo4jU1pmgv9MEzGnWEqN/l+D/
         xuAHbeuCbyBAhesXkk5EcYqaGmVwtTF2eMR5ZyvSRoFZbvtk45wB7YxPRu1pELhbFW3H
         X08XyN0uJM8idRRYcMMt/4cbYR8SFOPfZ+gRWO2c5oNyFAvuE4H+Tt1Qzajro38H/kma
         yNpACbuBYH+NPI+uLW3StPbYqaEJRuBtfCcJt3orNexR2NJhlmtVGQ5340OOP3e8jGUh
         9oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439242; x=1789044042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=;
        b=A6eoBSXQtUnE4jGPReWKlwyj03kEgggLliIMVS0vL5sZ75oDeeUQumCwVRLZ7Opgz3
         VgLfP+6P4opvcHek0r5gU8CAt1Nz3cNw4s2zzInxtC3JVx7QnRALvUeJls6hMbFEzYMn
         4cRZd/9/FpK7Ru0h/0fvwC8rIX649dxQfENr8dFivY0Vt+Q+hn1UAh2Qin1heIQ+V6+o
         Y98kQjFubUgipTG/3mTH5W4JaEbiW7PiglJNqLWJgU9qG8dML6UWiHUOV1TCj9KSpY/V
         iItJNr3QkXXF+nGzAkWxw4ubjQlOFqwM60bkTiy/YdZa7kvDs7P4C35tzCiY60MonMRH
         Tkwg==
X-Forwarded-Encrypted: i=1; AKwUvBy6GNxsEkg900xJE3R3xyqFyhYX2UPkiV1vnt/MyBvBXyQ5vm5MUEfhHC6XUx5E6JjU6kkn@lists.linux.dev
X-Gm-Message-State: AFuF++lCa6lSyMxmZP94snqe4DvfeMdT8W7x2ml5Sxt2XibcK+8CF3uC
	Cf0XcGUYyk5sCwm+kTF4Mv7SrEYP8gVwCXvERtWYLZNhZUsNve7ncKrY/7N70H9Q1Oc=
X-Gm-Gg: AYBFou3EvkWaI+CbdL/cn4l0YP69G5Sk3UMtdwECOo8khoKw+xoCQqk/9vuhkW80KBL
	YDeV1/V+WR6DCISw8VZ951yHGuaNsh93ep9GsAFWOZc5DeJrdQa7VRQYx+3gvcj8t7zgfB3nrB9
	p9QQlF6xvIdHZMbua4lJlFzARaBE1S6Dwuzmeaktgp2BqkZqV9NRLREdrlhsbAzBIStoSi+YZiL
	8oxK5Xdv0wnmw2siAENX+x+FQrvcMcw+J6cX88UbY/UdXVp9F0HNfwx6vjZNVcXupTSB+PjoV2r
	7bYaBucVkqNaaediOShMbvi1zn/bE07GdJoy8ZUtwfnQRxOwjtppqTGgJDzTT0I+8+q+LwDskgw
	WCJcsaAApy0P20hLpTGjYUY1qI4rby1mM+eGzkN1uWpwk6NyV9L4T6Ctls7Kj7U/gV2gpyVAurS
	IzfNL6lfWLm8JF0mf8XonUBh69qa1FFXiYZTuKl9+9D4CdJfB6CwZs+Ht1GA==
X-Received: by 2002:a05:6000:2c0a:b0:482:de48:c445 with SMTP id ffacd0b85a97d-48488f07dc5mr19505275f8f.11.1788439242322;
        Thu, 03 Sep 2026 05:40:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2e9fsm13847089f8f.20.2026.09.03.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:41 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:26 +0200
Subject: [PATCH v8 5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-5-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=msp@baylibre.com;
 h=from:subject:message-id; bh=MzLoYwkeZwxcJvYp9xUeN2jYUVgOx/RH2raq9hcPIQ8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWXNnyy58wzOx8QufXPfrYMnz8S9Pd/zelbPiir+Ww
 rM57oe1O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAics8ZGZ4Eve7sexM1mfX2
 mibeSZvvttsoqpiz2Db0Zs+OWMNkOo/hn7rl4ZnStcuOXL+/7Dj7xKUTzT9cLvXv6r//t8dpwRv
 BSn4A
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

