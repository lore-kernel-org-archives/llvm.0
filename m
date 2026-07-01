Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C248B396
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909662; cv=none; b=PkX3ivcAZWYrV9O6x6XD/HYgPeMIcESTRyPTHgKBMLkIhN1F12Hl5DWX0AD5vRCyq4/0tIoF+YsxVT2gwVoKoDy+CfT5z9+zRI/pVwpwoMlEgVLw7lssAeC/UbEqckvHbvj9DcizmGICehARJsm4mNj4H/Zg06VIkg1+oImVlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909662; c=relaxed/simple;
	bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpcTU6P/JO/8L9Kb8Lqp53X5zDgRlUgGw4d4PI7lGbTdoVkOvRYcuzTffyUDf3Di887h3cxluD8Mh/ZbZXf/gKYRiA6uEGVltzYo8Ud/mt5d0UTuS855m4W3YC0oZ5D9ERXp2Cbuyr+WB9qhcBhVlgWmshXMj9zN9xyKVp33ZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AcO4xZKz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AcO4xZKz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so3256615e9.1
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909660; x=1783514460; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=AcO4xZKzqT6PfUP5ARu9ZkSHJ50EQaLHDPv4xCh8CR5AmPTge1HS+M5UmL2TmJ19yF
         3qtyRILiAnhUZtDkrfhsgK/UVisRHWtz5kM/UHEIACzoOJv7FcBC0UCNwQk6QKUgI7Qj
         DFGq2RR9cYNO2kjQ1GhFky7cRXmnTb8RPRSzFQEqD8ntR6/KrUhSfVHuYUjvb5GGKrfM
         qCt9qhR+bM2ggL/gEDgMaBXKWrtFl0nUDY8/ZtWIdu8T1mBmO1Kdl7JgIVGxdQ+IlusE
         Cd9fFsOEV9QG5vtSKHrhN4T4PEx7b5JAVRuONDas22NraCNjJC1c9aaU5MXRqBPSnsA+
         p0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909660; x=1783514460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=cI4qKBtxumdG/31jeKuz/QI3s7XBWwbrCpGfW4Tx+MN3w5aN3bVGC8oxcImsceJY8N
         rQ2hYl6CJfV0KL5gjqLFXZtlv/LC++dsviz7QXnnCRCe0GQXiMqYGKz2GBTbo0wMn7SW
         dlFBUJuy4VRJY61VzGGHA2iz5DtiAtX83jRYtuvVqvPjay+rkWziUjgPkN+mIOK33y7Y
         hyFyR6AtS0DlgP4uuEjoBo+TcfeCFw4ipt73etvl0aT+wDrmXXaoult0g/3judXdx33X
         FJIqzx70B+JPHtoZq+Dt6QE3VD0rZmIt6qn3T+LQN7t94bXUQ1V1iN+matDWVjvRUtLD
         szrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wMedhbMVeNEDnF2WqgneikIUV2xVPV1B7DCFQCRM+nbBGnBoZtHxV8f9gX0VvLtElAgrP@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6nHcLVa+uKOt0tq27cIhyMy9EwA4vwMZ1s1EHla4B7gEsLbix
	V96mpxNsWraLF+YTLX5YeC7o4dkBEaVRtf+OwxCyhutUwKJv1zM+g2KQqQMks0+jO0U=
X-Gm-Gg: AfdE7cnB95a1gVnKMpHX9O8iCngU91iH6JruRx3oPE+2cd1wltYazrG29qb5UDf+rZE
	gkO5XurR1cwAB7XZIgjSZjjvPoQ329TMcb+1O4yktmgUgrfIf2CydREZml7W2EFY6hJxXAgiGNk
	juvkde+BU6ubPKDMGnLf88jzamsQzLUFNgaOrx3lQS4T3kfyHRCCAVmK65N47plgFuEn5laBLXj
	Y/1sBn5cUfJjqSyh8nf/oewvOnEDvvxois+SQWyOmtsaiYtSRHA6LV9aHohWApCosu6Ov9RGEZL
	D483fuNdqdoipFMSvbAaGVLqRljKg4iC9WUI1G7wY+ZRTm0J7IqoFjtoAPXwaeP/uNuWIbakJ9W
	4tg0gfR8pAf96l0v1F8BZzeJZT4LK/YgbbVueKqPSB3njqDRt+8GfC2E3opC7aLe0k3wE7Sx0Rs
	YKE21S93ZBaw==
X-Received: by 2002:a05:600c:64c5:b0:493:c3e0:99ab with SMTP id 5b1f17b1804b1-493c3e099bbmr6525025e9.25.1782909659880;
        Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm16706618f8f.7.2026.07.01.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:21 +0200
Subject: [PATCH v7 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrm2V9Rw2Z3rP77/8pCBdKe/tOcddbSVHbPe5CB/+v
 l5159/zHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRJ7sZGa7/n+/tk6GguC0o
 ZvLfCWzPV95U3Jofu2fT7BsbamzaOK0Y/lee19j38anq1PbuTLeM/QyrpLwC5na7+u2/p266gu/
 5KR4A
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

