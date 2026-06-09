Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8BB4D2EF3
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031482; cv=none; b=Bzpg9DfIwLF+zlRtSywteWgb1LTtx0EvQ59dy2yVneS1NUOf4RfUq+OocCFWiYhyHtld5GJACnbU6VvULmW7FoaUWC6XSsDYNVDxKchECeoDG5PcCBzlxQn6Zqvf2e5nRTHJHUUg//IGh99Pjc5efN/YQslXsxdF3iai2itKk5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031482; c=relaxed/simple;
	bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EJlm1dge4YNILp4SGrwUyRR9zBZ0sl+cKkbny+7FkapRuvmNRysciHFXzCFKEYRZ0TpqcfjZDSDfSRNM2ewa+L4RGp7oGjz1wayh87PPvf2lfDvUJslBzYdNwTd6M+MvSasNTtFt+s0SQakGZ1tsr11XbtqUPvZGntd3HexIwuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=C9MRU0kV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="C9MRU0kV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490af320e2aso64543265e9.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031479; x=1781636279; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=C9MRU0kVpBhZHFplWbV3FZvvyhOAqJCE1YZw8NfGUt8jnG+8KsrR96zFqWgvRGKjqY
         faRj3myZSsxuGrl8TOORaphLUw6Xfih/04fLqH57BvB6/q6ZYtfi6JYmampQv5uxEt5x
         XbOm5BMVhZl5iE+HbGGJGmsb8PLimaCH6IDFJvaINGh6tG0SZByxigU+Rk3s4e0kMqQE
         RU35VSsfTPPhyKe5lOATLsDHt0fV1pan30tkf1vTLMteO582Jl+1A/A0HeBJrngvOe9L
         U1L5DZ0Rkqj6Y65mTGOlKAQ+1+C4VghiuMnNKxbJ81zKfx+CoKTAPisLkEJDFuauF4dw
         KWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031479; x=1781636279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=I2y8dEpjMEpAsXIyFhgXR3kt23EEVBSKLQju89b4KZTRgXCC+oT2krYvO6gtThQltb
         uB5AX23v/bjJTih5vGkyj1SUpozw3P8bfV42i5q5p0N2G5JUSFiMjmqFpUGfYtijMHW/
         AVST5aDFIueXLAyCCpsbUEhEGe/8BrmvXSdJ9K4qGsCIxtSJfandGK+pEPBh0aFlpZdn
         J6j4Qi3V+3K0/Pm7cBhYz/wDyxQMw9kRVMsPyb+ugxnj5CiAj/DznyiSEsYC/fBefStj
         imCXMId1+rSe5OKES+kCll39hYZluX+U3xkzcDsrMR8MY0zL/aesWWyTZSbeIFL9yrIB
         qSSA==
X-Forwarded-Encrypted: i=1; AFNElJ/zNAH5xc7Vg1ngmqyWJOQYTNJbniTbXacD+SYMKa9Oo7V91dR7wprh5R/zpa+WIpR42kJm@lists.linux.dev
X-Gm-Message-State: AOJu0YxjP+ScgqVZoq9Thl5K7kl5xaDwvEpzF85XpwiLMBVOhmHHl335
	air0rxxcIXgXFwWtIk0QtBC9yE/ZEryYjTML0P7p8+stB3A1VgxGV8eCy0R9QcMR8zM=
X-Gm-Gg: Acq92OGGyGISMsP0mS9FcGWlkPLP22648LD5hK3jYL1JyIYJfWWV0ffE/3v0wthI28q
	PH9qjVF3S1On9Cih7LOv3c1fZbQVlAXRbpuDNhH5pbBBJziNL4o0oYAZ67Y5hOqt7jNpzyjNSkm
	IdP/Ia+nsqgCameLYEFp5SeQQ/6mcI2J4LY2m0oXRRqHuuMgXtQBs/Jvq2ct8KLNqa10LeYXFaK
	pVhlS8ZcWlststpy544iJp2OaM1sGG/mgUWXd5y5euE1ytn4U3Abd0FYlvMRQJptwe9+XtrRlZi
	EQbH7EIk12nGMsl1hdtmOHDBETAfXCvoSqXhlcEZjc6SJNsrLmlY+lm/ghnSzqn6Oug3rSgIPlY
	zELT3gGDavqY2SzPBqJrPQnV8duVDxxzuSK5gDOg6IFailD9WvbnUiDDxtdhZBUz2gHdtLP0lUJ
	ii464vmWTQTwtT/hRUbxVibFq9zHVKD7DdfiEzTVpuNQ==
X-Received: by 2002:a05:600c:34cf:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490c25b1243mr373855055e9.12.1781031479156;
        Tue, 09 Jun 2026 11:57:59 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm669863455e9.4.2026.06.09.11.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:58 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:22 +0200
Subject: [PATCH v6 10/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-10-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJAnPkzlmVYsqN07JvzNbrfPpv2PhmhF5y5eu6Y2vl
 tKZ/K+xo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYS3MzwT2nPj5Mbis2maiv9
 +Joq7ndj+pynL49abZCNi+vj9P3Y4sbI8H/fe+1nU255qK0Xe6T3cXn0tsUdH498uye+eve7l1q
 3dnEAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index f77651109564224408723b72baba93e39a82be07..8f7409da83392d2d1f160a9645ef4d68f7aaa1bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 

-- 
2.53.0

