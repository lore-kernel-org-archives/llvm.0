Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B23FA5EF
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723152; cv=none; b=FxujCslpj41Vjy++CiuFpq03DzbO5uUIs2UmsrlMcZsWwebTinKLyEqM2NzbTfCW5PLqZMmMZtgdAFNKwdjedXGFEZiC8l0PF6wVp/Pkd9vmvM65Vr6H0oPZX9LJu6vyHmCJfyecHjmukybjd/Nz4qAGbEzK+9GObNLjZgqchQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723152; c=relaxed/simple;
	bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAA626g0hXVG9ffLJO3G/ja+sxJA/1uFQAYYQ9jN+dbwwcHAurHE+YUFw1YjQCC+7ImskPVAj+sdYVtZ45LmtPOp5qS7qb2f/fLuki0yBmA/HCqv5UQwGND6AcrnDmo3U76EIuYGBWdES8SzcbrYQuygB3QVEavVzNNkgyP/ohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZUz5nbG4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZUz5nbG4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so2612935e9.1
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723147; x=1790327947; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=ZUz5nbG47ZOOve0CxRnUoAAFLYdh6OclvIoY/7Mu1c0nXSletWAPtOjaN0LofLe5dh
         +FjCYq5lWRqB6g2njcVM60AL7LGNd0ZMKM5eSb1pQNaJ3VCL0FhH5TZguodNd8pR7A+U
         l0cXCnmynCRaFNo/3zEFjmISm5pGT7qupdfNigNBYYfD+GOVZC6QHV43pjfZoq4f9IiZ
         q3BX0iOPc3App4q35yg69G3zOajpRcZcDbZa+Pn73sY0qHjzVKNaF6MepBzjHi/Uv4C9
         B2VHPJWDEITbWhpsdSBnuJ8D4eq9G2era+nJInl+p71tVxNIwGPbtLFFPxrykJQCpik6
         7r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723147; x=1790327947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=xbvdOiBDcZ0GOwhJl1r4djuq5Jecve2gSydhf+CRaIooA2twE0mZ2r4Dgwd4TYKg3O
         DVG1uIKjKr1ce8zi69LHlN+2XskA2P26KK2vxM2d5hpDX8LVILDCqDUCzYrNAkuGgFvC
         Cqre98jbNn2oYllqRra9vfXdUlRBG9QVZcMR4KQzpVYrtTt+UtUvUT6Fka0ufThbqvDm
         QFilPmS3rhDz219HcD2nXBZ1tN1ey0MBdn9NUxzUispufV/rvJ7mF3t15fAj2v/95SCp
         Ljkh5Vkt+vLZ6V450te3Apto/7G2yJaHf2N/HsR1iXiQEl44iTg4wD/0XbQX9/6qm40n
         EXdw==
X-Forwarded-Encrypted: i=1; AKwUvBx6KA3GK9E46zw+ViJET1dyzWmmMjC0aNs/9LmC0QRP6pih5hHPkyPkCgA5eIFBeYqMSIXB@lists.linux.dev
X-Gm-Message-State: AFuF++mTCKiT42zVqauO2OhcxE4dWEXcjYAVCnV1EYiJjpJdBJHtcvJB
	2ORWXpUyJ67/niT0KGNWEzAMR8XqjN/Q1lO9wuEOadXNDNquMkPfdJMAGuDPCfB/roo=
X-Gm-Gg: AYBFou0hlKK3k5eoX02YiAIlH/3u7YfG02FTfog5nYsEHtcpxvNJHmiIHtnT3ubyKZ0
	4GT+v5Bjr8MJlh/D90YVdeUdeIHILoKRqFp+idQMQde6O/btGIuw5iX0kbY+wYm0HXAsatumTO0
	mqhyjGHMeHlw8luDy4RdNsi4p3l+EeziSEGTI52fpmL9u3svXzwOlxLrQMMbh8Fci9YwK+4H90J
	VD+sDoZzxmdc++BzX4amlMhGZ6r5lPm5GUUuKIychjqncPCrK7w3obl/fsJLphP83MDD7hslEMj
	7RC74cqmzu9O3ZPR3h6I1Xx4VFt7j9b/1VRGUhsE30J/t0BsILeIwZnCcGjEufh3WFBBMo66EaX
	OroRvNkKYdIJIFpMufwhGX19+P37AXTO69wAaIfVhY2LIKDa+NcK71sGGnqxVyu2RLYSmXRSAxd
	A5qigbd3dJFoh6LT7DER5GpKtE4N2iV0VPECzAKtTG6teF+GiSMNu9RepswmqYsuwmuBM=
X-Received: by 2002:a05:600c:6305:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fc50012f7mr25323075e9.13.1789723146740;
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d46399sm49887575e9.12.2026.09.18.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:50 +0200
Subject: [PATCH v9 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-6-40972ef1f663@baylibre.com>
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
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=msp@baylibre.com;
 h=from:subject:message-id; bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jLcfHc68H/BS9uDUKBMetp0zrn/R/8SXy7XmaXuC5
 2WNhLlyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR7gZGhn2FJjelbr/xPGh+
 +ureeM5Ahw0/kw7a/Z/ytP3sT9WFOm4M/5Tm5lvG6z0//MlfVijUUbM6besjTZ0bYZ8n3vi0cNb
 SLUwA
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
Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
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

