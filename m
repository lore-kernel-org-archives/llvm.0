Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602949EC75
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439240; cv=none; b=lzOjwv+D/inqkx1YsT3/rUqmeSzNhytXz/u9pJz6O+QD+twy4iqH5Vb8y+nyFrFPz8IjKA+CHwqSKvWh8H9ojdHd1OaghQMMwEAUFCBj/IrlDzQAdnMrrsOnFxOBCQmUjgjN6O7BnvVUmJBNydn/GaU70c8wHpD7OvCh40eB1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439240; c=relaxed/simple;
	bh=yN8gGAydvF8dMrF0qIa8h7tvCnuX+gk98CcSM8AfETw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QwypT1d8Deqt4ovNKW/8RDLri5EUoeDvBvTZ/ga+DRlDV/gI1IkGnQP+yFL++w01k71idP3XXmvmIZthWNndbGJOzxbdTE/vrnyUyPWCs/SUZD8ZzFdxXv78cIq4xL68T1ZNvdD+AaVGvDXhkNsWrdlW0MNjmozzSdRndJFMk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FJewVCjz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FJewVCjz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1493306f8f.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439236; x=1789044036; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tHiaQ888icqV4SM1/pHe1jcHxEopUP69dKqnOSBwCIQ=;
        b=FJewVCjzIYXxSU5xu1HMDUD4zC+mqEQeFl8nF9NCXPJTqgzOvHBEPCfwdsXRi9hzIf
         YhGgB3FPXHwK61rhNG5oTTtqRqXsPxGA7ySJgmYL61NIGX9KlMctSpDTE0hSO5tNXgil
         NHOQQABwKSkw3AJ+ZyNPrZ4TYLhaHEeW1TXe2pYv9pZYUxSSLpBJQujcZ6gvkX1Wtz5+
         NVqY/Iff2CNM5KyVcYWnRdX+DjaPlI9M2FMBJOMFujehAXgHAByZqxwFH2yp4HQ2i/tM
         L0fX4N9/jdhYuQZLGTgfZNy15A5KYDJt14lfVRVZmge4tdIuHuoI6wf1bpAm5WcSY5m4
         sCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439236; x=1789044036;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tHiaQ888icqV4SM1/pHe1jcHxEopUP69dKqnOSBwCIQ=;
        b=FPj+/yqmqdM6oYTvk28Uqs7ABDqMrpkwELBf2aiM52M39iHP/+U1mBxvBCMmqA2mQc
         W4aIo9fXhNhW39mItKNVB8//TBMxF+f290qQORJJINJidL1XuPTRM0NdQAS83lqNCZl+
         rBvpUVQHNbMSs91iiNorSjkdKofniLHHeeZyZpJC36y7hoK5/8OQLjymTbC9otSNU7QK
         59hQU4c15lk/xnZsFd7YT49n6RJ497e6hZWKn22YzmuVXVTMOWOI5h9sw/MwzIPhiiXk
         3Kj5uW26un2tV2TUlFuSIzE3LdbOrSsF25f5CI4ryqNXYSx570UeYu2oaLtN8gvPO+8N
         aYKA==
X-Forwarded-Encrypted: i=1; AKwUvBz+GNdu8tTJijimCCwywUO3VUndlXMahFsgsaKyaQo/JuoKU2lnNuLGvUmiG+/SwxdMuxrQ@lists.linux.dev
X-Gm-Message-State: AFuF++mgJkdNXPU0h26vvVWak5CLlZjBXqgqUmB7/Lg+JSdPEo2NqJz/
	nuq0UcayJaDaCG8VI6EFUQY2feSEQVJvU65PK17uDit8p9S3xTWKCKw45CisNSozkeo=
X-Gm-Gg: AYBFou1Ijq9Mg33ZsxyX5XMPM3cTfsZEQKG0QpQTPBdr2WbtgVvHUSr2P1BtxolXm2P
	UtACBfaA/ZS+w3DTS81iX1Q5LmLzaf88MLW+mr00F8CFr/HCdik9XbgFtEujvX9TC4nbdGbHedU
	eiEFI3sUw8utChj1zEA12bOFOaFv2USh6WL2T9XxRD/fmoUAsHodsuPy7r7njyU5sQRb8qfv/q/
	IH91SIcpQt+q7OpXIw/ZgFzKobFNvwB3mllNOy3Ul3O0f1iJIYbjChJUTCsJ9yk/5rFHV1t1W1H
	wslUGGQdPsMkmdMZzrtnKSH1fYixlqo9K8DYCoIK+5rMuQ7vlJxNeIB75IUE1n4hbXZ/Q5/Z17a
	fI832ohn84rEA2ja/6FaJS6Z8DXuOTDUkJiN3N9GE+lFi3LHczozk/g+NtpztRhXWzy8eEI8gB1
	xUcP0hIDm0HEMaYUh3TbjRo/EYqyH9f0RSI5ZpYwqFNhAynXPheQkKJ0R0VQ==
X-Received: by 2002:a05:600c:8b88:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49ce581a0a0mr258896585e9.7.1788439235569;
        Thu, 03 Sep 2026 05:40:35 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm82228145e9.12.2026.09.03.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:35 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v8 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Date: Thu, 03 Sep 2026 14:39:21 +0200
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlqmWoC/4XRS27DIBAG4KtErEsFA2ZwVr1H1QUM0CA1cYQtq
 1HkuxenC0eVRZf/LL553dkYS44jOx7urMQ5j3m41GBfDoxO7vIZeQ41MxBgBEjBp+GaibuzAcf
 zEELhYeKz4bLnIjhECcLKgKwC1xJT/n7g7x81n/I4DeX26DXLtfrLKqFa7Cy54BJSRPBeiwBv3
 t2+si/xlYYzW+UZnjQJTQ2qppA8UoxkOrujqWfNNjVVNdJSoyIPitSOpjdNQ9/UdNUSAQbjCDt
 FO1q3aUbIptatm9rOOAHKpbR3N/OstWcz6xeMS971mHwUOxpuGv4zG1Yt9sFbL40F6f5oy7L8A
 M7ah1ibAgAA
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6189; i=msp@baylibre.com;
 h=from:subject:message-id; bh=yN8gGAydvF8dMrF0qIa8h7tvCnuX+gk98CcSM8AfETw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWY3Kci+qj9679NHk+UkWru+3zl5vjdi/rmGB3bLd0
 1SKFZ1vdZSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEjgcz/FMIFw89r2CvL2Tv
 KLnRVLK66iDvPzXFyzHN78wefbHsOMvIsFnKg3eq8o7LH55f0XyRd42lqEpoQtjrlfNz2OrKJty
 wZwcA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Note that concerns about uboot fixup of memory region fixups were
discussed here:
  https://lore.kernel.org/r/DJD1Y3G9S1SP.2GHOZ5X4RYJFA@baylibre.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v8:
- Rebase to v7.3-rc1
- Increase the AM62A wkup R5F memory region to end at 0x9e700000 to
  also fit the edgeai DM firmware as requested by Paresh
- Move the memory region definitions back into the base board dts files
  of all AM62A and AM62P boards
- Added bootph-pre-ram to the memory regions are merged into the
  bootph-pre-ram at the end of the series
- Link to v7: https://lore.kernel.org/r/20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com

Changes in v7:
- Rebase to v7.1-rc1
- Fix commit messages
- Link to v6: https://lore.kernel.org/r/20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com

Changes in v6:
- Added fixes for the length of the wkup_r5fss0_core0_memory_region.
  Thanks Francesco for pointing that out. am62a firmware is shorter than
  am62p firmware. I calculated both and fixed all devicetrees using
  them. All patches have different Fixes tags so I kept them separate.
- Fixed the length of the split memory layout as well.
- Removed the double definition of memory regions for the var-som board.
- Link to v5: https://lore.kernel.org/r/20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com

Changes in v5:
- Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
- Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
  already present in k3-am62d2-evm.dts and got moved into the
  firmware.dtsi file which covers am62a as well then.
- Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com

Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
To: Andrew Davis <afd@ti.com>
To: Judith Mendez <jm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
To: Beleswar Padhi <b-padhi@ti.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: Hari Nagalla <hnagalla@ti.com>

---
Markus Schneider-Pargmann (TI) (9):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a: Split r5f memory region
      arm64: dts: ti: k3-am62p: Split r5f memory region
      arm64: dts: ti: Add wkup R5F nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 29 ++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 32 ++++++++++++++++++----
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 29 ++++++++++++++++++--
 8 files changed, 179 insertions(+), 20 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

