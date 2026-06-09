Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3474D8D98
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031485; cv=none; b=knqbd6goeAJBt7ToVAXtzYoP4/NkVh8xBlznIaFTLJ5Z+DsUjKnMjfQpWdc9FST8ngf/7PcPYetP0liqKHmN4Pw9LwsjSwMU0LUXgivJg/AVfsjjhRBg+Lyg0iYe+cCJC9vCQxpQJtBJkdSoytxnfp7TAmxWHc3KuHdWyJ5cjmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031485; c=relaxed/simple;
	bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmjqVBOn9t2YZ0yf8dSdykJmuw46nC9O2gYjwFRD75ZDldUv7a0o5avr4r9xViz8UkIbwL7xihBVEsU7eQ/hIhqPoZ6V6OtkSk8nPhSjc5MrKYOwtmoCV3CsGOGvRIcZ9Q5vo/lSqdbUsaFR0TH2Dq82Cn+u6eDNlBmskS+5C7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FyN9fN1W; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FyN9fN1W"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso42370675e9.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031478; x=1781636278; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=FyN9fN1WVocuUS7YCUrrIzTaSjkLAma9itjecAqUxmzhu4c8ArMwrOLG0KoHckEecZ
         MLlCtN9CA4R2miGAI3YUw4dUxZuPTA7RRbDy3aAPVIasQ8/9YEAFE0UmWzWI+e85R/wt
         1HI47AVfe1biT4JqcCLHskIoHD7AX3ZYOfmyIsr1sVpPSO7DHMuFQUTyiG2wxz+FSFA+
         FSNIyMQBb3MC4QgMxCW3wFoL48zMAOrVVBCb7k1Ch31np9ofGI/1nd9HjHHsYXDaxk+Q
         cq70zTyqJEwhPYpbKaAdv/chdJagXx8RC+hi2ancH93q1czkVd1IFbZfSqrAg7ZfCo5p
         c5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031478; x=1781636278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=or5hxg9QL4oquMwjgBwTbjJkoZkrbs22BVQWW46tI09G7KQtXfqVMNRIhN9qUNMKMy
         bDk5sA3MvSji2EMFLeK8Nx5myUsTKEAv4hDWAYaRzGaCXspqfgxP7+n4i9HVDOyhItaJ
         n/xU0DbfwNrWbfxg2jnVqRSuaGFPkhrKZ2G3a6xbvka8SbGqhOyllPmnh1/inRosoXnY
         Y7DNRA/RRDpiR4uycNdoFTxCuEQXR6jSXGNdtKQyvkIu1ufjR7yOJEcb3xEPew/vdk40
         Es0L2Nn0z+qNUWp0LqOxliynR3bLwNm34udWs3BhZ5HCbJHdcPd4geYpJOGGkVQaTj76
         ZGpw==
X-Forwarded-Encrypted: i=1; AFNElJ+wIsDzvmGX2DNcGoy3nvC0ag/NGLN740rzcO0Y9bGMFH3PvHtT1qt30PTuErBZl/VsdImZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwNJKgSt1RARoufuxGGRoErpJpix3TYVPlGASVAWCflMWMozQrH
	0vOGjG/0cxq2MU0P2g1woWsY3exqctKNecTyPeeElO2Uev8IoEbemFgzHEqsv5SeUcc=
X-Gm-Gg: Acq92OFQdjbaT4BPR5AjFeqK6JcxPh+7NamUw3QuOZBgTTZdAE2yMhdHuLMN0Ctxcdu
	hm4izOmIZThMD985z9xh8oLHjm1IsiNzpIyl+2KY+Ai3zyoZCiej4b1NH8nW4xGB5mhsJhm9/+X
	c//e2U25Wa1mXrzBn4EKUj0AM7iIlklR5lbNmLRt5JUiPhw36xsUrJlbFUwTJuccb/qBLdiT4q+
	wR1ZUYfWY6Enm558wLIbXICsISek1qML0EW/o8rDdJtXZ2Q03XDK+7i200tEvW12IbrKq8LucY6
	aLDkLgtSxp71Q1feoKsuU2ZUe6fSlnzk+etCpxqmZQNQdMINDAopFL8G7rZZibm150Mw62CkMav
	j80oB2Q0WxdVexniu96bKHS1dJm5ICB1urktBIXKd1HxNk6eGSwcbFm6jog42yoyqz+D0kpZfIh
	bcxanFGtkSPwCO7VhOS7CuIMn8gLJXlXs=
X-Received: by 2002:a05:600c:4fcb:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-490d354d32amr103004255e9.29.1781031477905;
        Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm532638485e9.1.2026.06.09.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:21 +0200
Subject: [PATCH v6 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-9-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJMFXZ+pacm/OZbQ4f/QOa2PlGzFF428M5098WJgfd
 MGL/41IRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEzkFBvDX/FHq17fXqD568p6
 jwnZT9mV11fnz81kfN0uHt7eN1fusCgjQ4OyUO7TbT6+G+1OiPw6+/y/1Z29arqNErWz/zmmVE+
 UZQYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 682b1c9f3071ddf23044c1fde1e88f2b901ec64c..fe10d3e75ceee35f84d34b892f9925efceb7743a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d00000>;
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
 		no-map;
 		bootph-pre-ram;
 	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b60000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -78,8 +102,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
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
 	bootph-pre-ram;
 	status = "okay";
 };

-- 
2.53.0

