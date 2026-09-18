Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E93F4108
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723147; cv=none; b=C7XfRP310kum00080fljS+dyVAutmW3APSnIsRE99T9lzaapmJHQeg0x4DGVpqubpolFy3/c1xA54R5iMGEK9LQq/94Ll5+CmtJrJTmQZ+GWJNRiDdXgvYDjjw0DPioLJOLhRo3hNqmXknKIEoWCwg4d+g+RxAXSiRhCpY94U0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723147; c=relaxed/simple;
	bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5fhOBTe/3VtrnjWXwkGNP0sOS6OubuZoaJ7AirfNi53vmeRS/i+OUEiJtUnGXvyPuj6ooz/OucIHXSghHJy9fyU7YzvVCcd2BR0wirriv6pOfrJnI1HkWtlZCWUIcShUzB8rrA+L3n76HuQHyzkh/4mdmDvfQVfS17TeKAXyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RbQ3jUIo; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RbQ3jUIo"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so361025f8f.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723143; x=1790327943; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=RbQ3jUIokD1Zi433/caA5KJDcPctBofLjHGnib1aiFtwlN1S8jdlkv/nROxBgR93e7
         6EwXZyLLivIisqgvrV4grSeRgbjXiLFsKRadsJRgTNX2mFYjWd0AhpX8CsJFXq0wBbWt
         RbFesLnwsi//+qgcbFQzkatW1E548J6oVcdm8OMt2XTC8FrLELj0LFTgmg/V7TL/hgTA
         /eXsA7SGQ8stsFc+scCyY0c7AgYttSKYi5GHQKH2LOZ+D/n7ziNcW3qaQCjCpPfDOIO2
         bk9sbb2WbE5QI7Y+O9bFkCxVyi3msUHAWBhcgLBAxaCVEqse36jE20P7nUNHwJUrkvZ8
         OBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723143; x=1790327943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=W1diGh5apKd+0bgqsJYNElu6Dvep+8gpiVPj+/BpgjqKBH1g/xGRRiV8oNyJP5R3IN
         CRa6N0jYSJTEmikd/ZID4dc24wq6TOyesF3wWMmZAHp2GPwj4fPwpwb5/Yn5YNm7Pof6
         2u2l/N+sH9n/LuEgsdYH0AU2273zO1ZnIO0dKWXSSkmp1v6iVUKUEcwQ1S+sjChjQ7ni
         lCjceLRLdmMFFhtG4kyn277e2MQxmyJkyVdWdleaLrFeqp/kA1QK1ojGPDncBnbzUuaP
         7u8FmoXRN3Tg4IsUK/2Z2HsOrRCY2NO+ojFOHNGr+rjwXxxGi9UQMOAooRh3hNo70oPU
         Sk2A==
X-Forwarded-Encrypted: i=1; AKwUvBw5ZG3NeHecJpFmtFS3UF9U604ldgS0LpsMx+B9fXGbqFKff1/kd9CWYNprzKT3jaMUplV1@lists.linux.dev
X-Gm-Message-State: AFuF++n9ExtiVjOiwf3BemKC+OLsxrgPLqYyq2g5SkmLNMLltdSkf8pB
	LVBPj1YkPXfng6BJJbCSCuygK7t2F0ld1NInrqk7t3MaqtrvtI0Si8DKa1J2UiqX3Xo=
X-Gm-Gg: AYBFou2X12oiAuiaP8yo3rtHf5/AvU6PLYKF5yNtFuLaKwgiD3pvosRMCjHNuuouUbd
	oPb6eu5Nt5z1KEmruiahTZ9/ul8EfPXaRMhgh4jlfny+qYIDAlralI0l4DBmabFWWPlNina0RVn
	JhVx33Xcq3RPYQK6rGYu5QEZYBurT4LX987RFkLVdFtlH/GXe7Fe4tM1Ps+hfmVTHQorRXo+u1n
	MD6Goph3W87ei+qWyGA/SgzbuyHzxMZFqAtKa+sdliSPrVxV0fdzx9AZwpZ01omrevcruL2WZM+
	JjfOSCv03m+BvuiFbc59J0UitMIF9RbTupbXwut5LgEUs906Z2X31TpNkYscO7N2M1SZSyH+fRn
	+LLsFp8exH/4hlBzg/ht8GVvWhB2JHn75WkJ5oriHrGpyKOzSdU2nGkh76wxMjc/xv5jTi3lZpI
	fgsg9zVv300qF2o+vLcb0iYz7Vj4bWHk7Rai7oWUuj+5fvDLqNGJOgKN3lAPkwc3Q8zEAKdwPyr
	9IyBA==
X-Received: by 2002:a05:6000:41cd:b0:487:62d:37d1 with SMTP id ffacd0b85a97d-4871e2664b7mr2229141f8f.29.1789723142835;
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2803599f8f.24.2026.09.18.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:47 +0200
Subject: [PATCH v9 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-3-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jGde7z50ZbrNtpLSXMfzj92kE7sTYy6czFqz5F0Q9
 /ayiNrejlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIdxrDX4mVN+9HCl4p37CT
 1cdwS5rU+s87Ff+FpVeF/RbY/yytr4vhf+rj/+992Q45/wq+sjk440BG4z0D17dT+J7u9kyc4v5
 LmAkA
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
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..6e5419de8e35 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

