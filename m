Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519F4A64CB
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439247; cv=none; b=UjD0d5hzddFY1D8cwzUU1zmiPcGdJP1p4xLd35M1Se5HRKpItD1DuYk3m0GnDTAEsNcvObf3fux7lgsnzN+CEeNM7O/hOSqAYrA0YArM/N9vmOkih1NAQlAi91yInTAAWDJurVQ//Ai78AByAUtTlEK2SDyxGGQNHpLqsG8czEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439247; c=relaxed/simple;
	bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nb9zPXxjYzMGa5bJRFtCQQgEEVDQZJKaUVm1C4sPPunPsl0bF00l7QEnCMkrvLXnrRrgAR4r+2bB5EjOwsER5xgGv0aH0H+2cjSpqOe3ji14iswiUCzRxEDejhWbQExVkqTK1maCoIDvKPXL6uW5DwQ+WkY6iWQsZzLN6ZeFy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j4CDooRB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j4CDooRB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1553856f8f.2
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439243; x=1789044043; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=j4CDooRBuEQNNbiHSpxWUd29Dmsq5gYzRqggZPDHGIoP9s93wCMgtFZauu3b9biL3+
         2sY+EhiPnekayiZQ0OYdRWmAXz01ua65B+P/9Q3G/ukpNG1cuwDnctlVKM3ksHRRthQl
         s8TnPqfVi3jJgKcz9wS0/v/sckqWgeZRjDsuChwcf/p8ikM5ZADJ2270hUDzEe12hitC
         qh5fE9YIZnozisAmv9buWgET6XrfZNCM6oUOSbXvph+QPbDrzTdOipN3PBUsiWBW1g7R
         NLaZm8iXFLPawxt9dYfJnju9X0I14Md0btGYNXmdgDIitFRds+1RmDMeg2QvUpDUVSTI
         vxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439243; x=1789044043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=o+Ef5XInofWyEHeNfbm/74ufF4xH1colET1J2S9KqI+KikSDzTRp1qwIQmL/PlMvoQ
         93BHh6cTuFrZz0Mdr1VyXlHO2ADPXWEaAYVDqrMDTfTFn1BNGK5vtQe2SS7q+UZpNpgM
         bEtLmul7+2G56idB/t8KQ+BXiiS0IAN7nKZr8jNbLnCx78f+kGfM8ynvRL9EugZ5z1Jv
         oWZow3hFUjxnlbbR1BOEJQJXt8FHpcGG6KOdpBpAYucGYhmjo6dxCtVijvHzSuYEaGgH
         l9xrWcV7WGdKdIWDTN3tsiVVnOHojpzztUAREGgfoLWcerhhOBWJFtMKaDZZMk9E8us0
         heQg==
X-Forwarded-Encrypted: i=1; AKwUvBwV+G4JPOWCFD/BiStrlXFaOoTd4Bmg+hh8qxDk+cGZCVQjvpa5mHLLVffXtkRQdgeCzSlW@lists.linux.dev
X-Gm-Message-State: AFuF++n1aMddbTrmPEBlHeF5Of8e9by4YuoWVh1wGOWe6BvFyD5LJ03o
	zGH4ng+81nwN/V+8qbDFvQwCScx+hXdvhNFN0Y4U2m9po30ZgV8mNw5AGkw/6FG8ROd+UgaME94
	NbBlp
X-Gm-Gg: AYBFou0/thIsPyrXzw0YzxHTc0wdUlwSn4czp3vTXIPuqM7P71QMsMe9PeWG9u5uWF1
	D726njhx2WMgAkT0tz0UlbpRVJT4B/JWeaRVfbqaRi3VtAp2QD1gupkI6t7bC7t7eH8yQiaV0jA
	rGVGkcgqt7Ks+zoV3+fqW4N5UaXnNQsQDchYxwEJDYLHUHsVl6gfHhcHO+mo/csvq/GuBcfMd2G
	bN3+FX53YCXD3WizBPJyipjQnyOldoFIn5UvN+54uFlVVhJQTiS0YfeieWLFYww9WiVatY5fSwp
	r4lsViHY4SWRn0fHWSYfvpmtbqFRjXl9D+Ul5xLrV+TmFAWnEcgFwLpoceR69E/snB10ezPKHFo
	qcjF4ennCObDPfRCyaXSMDyCQ7t2SRBcDa+R0h2kYo5boyxmLxqG+8FdqiYiZcjqtn0brfGM4uV
	nyTuFMCtpiDq0VnFR+h+byuiXRzkgfeLvNACtbSnJI6W3rVC3RpEn1FqFWKw==
X-Received: by 2002:a05:6000:41d8:b0:484:3621:6341 with SMTP id ffacd0b85a97d-484913b97fbmr25937634f8f.15.1788439243626;
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm12989384f8f.11.2026.09.03.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:27 +0200
Subject: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWYvKTfdd5hBzeW4ieFW+qNR3z9lQ5qnZXP17jQyd5
 tzz33yjo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSU87wz/jCsTNnDzlIzmWQ
 UX7RohDwqKEkcu5ygxm3Nyx7aP8z4wDD/0Lt3VXK/InqnK/+Sy6e/ffjY/vz0WZP1qg8u5DtGfX
 TkwEA
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
index 8a8dec80cb30..3d1a2c5bc464 100644
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
2.55.0

