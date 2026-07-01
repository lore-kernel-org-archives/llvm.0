Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD42481656
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909650; cv=none; b=BVM4SA9mf3h4SgEPbm8NCm11R7iHGJY5/zcZlxD8/7+WwcMBG2mcXpuvyUIMIm/Cf4/pAhftIq4NkmhA364ggp0ZH7roDC+ASoAP2/Et8pP0mERgpDknzLBsakvMQNg5d/q2pjfyk9JnMvK424mjqEzXxHdzB+YJssWAHCw0JUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909650; c=relaxed/simple;
	bh=/QSNh/oJUk3K36diT3vAhwVzwhYSE2dQVz87cYlXnkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cRe8YPkOEFcMVBwN9A/bW/fpAQuh+udNSr0tIS2NpH/oiTDx7IkpGCIE9Ewnbu2ep8tk5Ndm9j+TKS1nNWMrSJeDxrVkevB4ZLRc6smM5JtQnUOg+YOWGZq+r/N8sIGmAen2HWfqTA+VpXdFh9bm9+1QP5++EAf6eTbqApmVCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LhkS0G4f; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LhkS0G4f"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758bd3731bso504955f8f.0
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909646; x=1783514446; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gvfiWDDw2ES6TPPr+xJ5WsqSsdwN2ZrtYiQL2rjqRE=;
        b=LhkS0G4f0w8EvQz32UVWjxKTKhBUvgHJC+1zTmO+IXfqUy+VEWWjlzvRsIt3g8zqOe
         hZuFhRBXBJoiii9mbBhTxFTkqtuCwnSHskAuCFxSPfRi0pDLysmkCKzTmxgomx+7YKg+
         4fgyqnL8BCn/qz6ELOweLGzvo92nodfR9v5NPB1z2w/Nk5SHOC9aRLxxqRPFRUXetGot
         m78EdL7c9DL2WtZ+QXD4Lm9EgvtBqY7XwPkFFKIZRrlYJ43pkjiCAApdQV99UL6uucB4
         vFw5FNhFAKXpS4gNBmNBb0HqawST7S11veuSxspfaLwLkF2IHvWbVDur1+SnWGBQTavA
         QKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909646; x=1783514446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gvfiWDDw2ES6TPPr+xJ5WsqSsdwN2ZrtYiQL2rjqRE=;
        b=o9uDokSI2rtUYs5t5Jh9eHnpO+96O8meHrB9G86c0mlY/joEwm5IbASwLNPqTA8k3q
         7njvnglvgMQZH3wFUEfbhJnvwNV+d3JJa161DfsL3FPnrKNGfTfz3E+h6Ub2+0PAWuAR
         n8IoX1Mix4V7ug62vO4tn2u/uJQ/Nvsu432bCqPLYnxeAGSOqXwrTLI6U71Vxq+hzcbs
         P0AsYNhI2O3YcNzFLTNvAXdR8um0Mw/7QxVgCWRI45O5xWx3qIW3V8ljLJDw0ehYJyDO
         CweMgENYP6tiD12Bw3ZgeAmyqpLTYTNGKH5VVLxwytZKZeEoJx0THFMdmFkUctLNJkfK
         Kc3w==
X-Forwarded-Encrypted: i=1; AHgh+RpbBNYuoL0BdIh803ue4wUAxeZr96yY5r+XY8mwiNNmzELHRcrbLzqIMd6i/cvbiTqiBhU9@lists.linux.dev
X-Gm-Message-State: AOJu0YzUCfzs+1objJcvbMPrvggK6cRc+MUfI7hag16JEoHiOtGXCTWX
	M21u8Zq6Fd5HU0RZmIMSIKDxnJ+IFFrTSSkKs5TMv9ta/3oRLbg14i5Rpa/v39Cav+U=
X-Gm-Gg: AfdE7cmV0Rsk3Tv26zQ3ybpEj1pW8ZKXI7oJrD7rJgqqo8hizdmjk7CBpqSLya2u+CB
	es+iwh/aVXrnt1anC0XOGXApSadowolg+VF1k+jLOyNfds4v3ohPswe1hIRNImheBEdvJqvU6jc
	DZopnkAeUg9GLkb1RuVfcw4nTy8IlV5XYBC30yY2b30++5URT6UbgoC+me3sa7GFwH2j9I1XVoZ
	REN52+dqOyejyqC18ziG0QfPx/L7BJjfgH9U3Iz0GSPyGrbGIjl5ncFqa8ZZuksf7ECY3f1YY6C
	U5xdvEHlfxRtk7rwpgSXI85fpihmcCrqqdFarWcTXncPzq3JkHxu9oABrNP4zbJRE4yurQnKh9V
	6DAHFu82q1Re7Z/w2xr2qHpXIjuQ8vlvV1ZQ1s4me+xumgWkvP3+dereXourRu9M6x8thBVAk/q
	4Bn8Ny9LrI0Ow6koGqr/ee
X-Received: by 2002:a05:6000:4811:b0:473:e954:6abd with SMTP id ffacd0b85a97d-475e005362emr8734001f8f.21.1782909646117;
        Wed, 01 Jul 2026 05:40:46 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475643cd85dsm15966447f8f.15.2026.07.01.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:45 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v7 00/11] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Wed, 01 Jul 2026 14:39:12 +0200
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAKRWoC/33RS27DIBAG4KtErEs1DJhxuuo9qi5ggAapiSNsW
 Y0i3704XcSqLJb/LL553cUYS46jeDvcRYlzHvNwqYFeDoJP7vIVZQ41CwS0gArkNFwzS3e26GQ
 eQigyTHK2Uh0lBEekEHoVSFTgWmLKPw/847PmUx6nodwevWa1Vv9YDbrFzkqCVJgiofcGAr57d
 /vOvsRXHs5ilWfcaAqbGlZNE3viGNl2/Y6mt1rf1HTV2ChDmj1q1juaeWoGj03NVC0xUrCOqdO
 8o3VPzYJqat26ad9ZB6hdSnt3s1utPZtdv2Bd8u5IyUf4py3L8gvTFO/LTQIAAA==
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4819; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/QSNh/oJUk3K36diT3vAhwVzwhYSE2dQVz87cYlXnkA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXriLrF8leJpEiuTrS/5YqiSx0XXVpXjOn8Otp4a8+x
 KZum13SUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABNxO8nwh3fq5unzOIvL032b
 J221mBZ4/kSQ6mlXuU2vgoWary9zWsvwPytA7kLNvtXeLsvM17Sw1MayXsz6wfnKitn2f9PUvZI
 N7AA=
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

---
Markus Schneider-Pargmann (TI) (11):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 12 ------
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 17 --------
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 12 ------
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 12 ------
 8 files changed, 92 insertions(+), 81 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

