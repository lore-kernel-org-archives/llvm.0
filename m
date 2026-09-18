Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E428392C4B
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723127; cv=none; b=M/YhnnxarSUjVe93MToW+Zct8/RLi7+dHgJ3hGUEgLVH3jfKDMJ21XqQKwhVPW2gGl1uLwMz/n7U+6mLq0PUCiDO8d78AV4trCPJRlCF3S8oYaUj2dC259+53N+fAyxTfXquu+/RpzNlmHS8F3aZ2KcLgEs7gQBo1lESPiQ2a+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723127; c=relaxed/simple;
	bh=505eaWDuf/g7YFaLEG89kbctE1WjzBDcDrij4CHCfmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHQeKSmQhgozpXY7HH8GLU6vXDToZLZ+WRkg8m/qBKIOu1eKrBW3QNRcPAeASnVnRN4YzeBQyClQYheEplB32djOKDny675txNNG6dHSX8nbMDbJ/0sKEG59HeXYxmgfyI9ZJpl8rRIhwHO1XY7UA96HEoh9kvr5hP9NFPl6yRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a5WoQM5M; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a5WoQM5M"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso3697375e9.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723123; x=1790327923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=;
        b=a5WoQM5MNLmfy4e+LAv4gtrC2Z6elYrSizbUgWev+DU5w1jA13MdMXApPKXACcAbFI
         op7n/EXhobtVd5gfWvLD2gBQQQPt7w6cdfkt96Ynq6R9hy7nkfrKY6AjHjQGj+d3L1Yd
         R0UYkcR98OwDorG4jgfJ6Ihigm+hFKi7jFiHxbjBEaXLCHWm4XCXnbWY+HcQGdNTs70A
         Ft/YLVcLUKJMAJMwsV0zjUwtsVuhiNszC5znhr8EYzAzOTBxE5p9LrNtgVfcLs68lEAo
         i0TWr/qro7MmYxVpdXxXz2EX0fc5SbEXAxTq4Qe+BSsyaj48OSe3tqPYhHwZtp/MgJ4e
         UwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723123; x=1790327923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=;
        b=lDGDFFDQx1ng5I3TdY8jlcBm+2eRfepNWagQgxhWzlku9buEplvXfY7kCdTSGPOuJP
         QL/zgU8dlnExpieiZMZwEc9i+B8CmweyuWu4+IoBSemvZVcXVYZ1ARYd1snKXBwd1npD
         u6z175xQsGsBJ9WS3RHpVt3cW4FSuYZcj4D7M0y6+CvUxqmELOed5at720qK+u+BEFtF
         764EXeJitMpk9jnZCGqL7ewVzP7b1cWdCWAWwZFjMGir9i/fknYaLWoI2XtjojOT0DLF
         DKPrasxo1+8LWIm84CBp8p0CealMLfOsSPqSnN1Hu8nK/oHGFFgYQTt/uuoq1tCzECa/
         r4Ig==
X-Forwarded-Encrypted: i=1; AKwUvByqGjdx3vaj5sNsRf5iuZKSBF6XlqYfp6UYpOPE+DcBkM7ZdoaXMkQhnF7sFptg00xYaK0i@lists.linux.dev
X-Gm-Message-State: AFuF++lzlTwt3ml1LIsIfIdH8TGRA3jPI93Cic50GgM6n8elGvhMJxQ6
	tlSEuaoSSsbUrHuQ/u/uqUtp8zzFsnZxvXMYvllxEMUqVX+EIoDH81XJt36jboBYYT0=
X-Gm-Gg: AYBFou22xxKruAUgFDNHOFUiYW38pNGpIW5C60xCbCAjbHkM5h1E9CowCrCuvHkeCto
	6oDd28OZ9E/CL8CS4eEnH77Ui8ldA7C4Gs5eRqzV/iiLsQvmenFawQHdTWUnfu8X2MJnbcxNmeQ
	F6ax0VjbysFH3GUBLfA+PK6N+ErkhO0mdriPGeqAZUXkhoV96joeR8D4yToADzeCY8fG+V/Uqji
	gG1iy2JcQNxzKJbRPkC93AfWi1KakqVZ68yZuybXnvDXozfCxf7+sFvRjyZEIZei73qw2ghMK5M
	uimvvXgewA6gopXF5jd76aYC46cRxM+llAIHy9r9VRK8L1z/jA/j+e+3/z0nLBrNd3ruwr8+66V
	CIqOEA6dqx6wy83rwbHnqbCJaTA/Kd4hKLCwBH9bQU9U2XlHtogtDrugrIrbAFKk3QRMunehxEn
	qEQ6r7R4rmRhxng1RrTn83CiNtqhkwp3iNvh3Z641esIDyqzXKtexbxkF4HLc60nMSpTg=
X-Received: by 2002:a05:600c:4ecf:b0:49f:bd3c:bc27 with SMTP id 5b1f17b1804b1-49fc574f074mr21996665e9.34.1789723122119;
        Fri, 18 Sep 2026 02:18:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm140092905e9.7.2026.09.18.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:18:41 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:45 +0200
Subject: [PATCH v9 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-1-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=msp@baylibre.com;
 h=from:subject:message-id; bh=505eaWDuf/g7YFaLEG89kbctE1WjzBDcDrij4CHCfmI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jIefHdeePXM2h1BbkvYUNb/OxfyrQh7veHfY0V3Cs
 9Rva1tZRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEwks4vhD+dB569HvCuOPjYN
 tAtjeOJoZHdZv8uGVaH86nJLppwpFQz/q8vZF+9dqSUzlfnV9Z0yy76VT8rYUb1bZO0vfrmLAU/
 +sgEA
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
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
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

