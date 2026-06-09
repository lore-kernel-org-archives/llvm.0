Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC28F43CED8
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031469; cv=none; b=Rwmf/5HPW43b+xHGu0HlSYy3YjYc14eobH9sC8OJRLRU+w/Ad1PoeQvSGeJWDEOcfpCbAvuVOXtxeKI4b2HpZhV//+74Lj6bw4q60lh0TH+v7lHJVJJgdYA0pnGtnJHf2ZaiF7Kvv1qoq3wQsikuj0V1NqXBA8L6Jw0U/0ky3kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031469; c=relaxed/simple;
	bh=x6dOPsmrjAZCqEhHcumkEhnK6rNm9ylZ2ifhx4Wqulk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y3AvmElHX02l3+gOZo5iM8ZzJ2hj2OkKKqkKwz+yVthmLrNrgiULcq0FObiuU6GtiG4bgXDIApstuJUg/l1lMQoTeqeOta9ZQyBLym4W8hidzFFkKo60KVJvrVk5/b42N/Xv0mwGzo+znlCbDztW4ZItkIn04TS4bXLp1HvuiOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pSObBEbq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pSObBEbq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso49254245e9.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031465; x=1781636265; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABTUwnN0/ycP6fItMWPZ2F954r03QSe0mQoNAie8qWs=;
        b=pSObBEbqLbMxIGSgnakUxKajtu3aVbBxJxLVeGC9xlQXKDGzNxKAqKSfgto1P7B/Fd
         nhHrSAFsmHJiksHa+pTgrisPdS33IxZtuEEh+41NjPWSMdANyzYBtpPq23VLOWxgbXeB
         hgYlFpLsJE+HvIoB3w6mas6hJTJK2hQLtEjY3p27m9hvc0yxeNZnB1O/zNbrDzMtFxlG
         7EIOm8LdTPnzRqK+n01NojmPB2SUkTUJMDkZxJB+9woHl5eNE1pK8yMbSv90fpvwowYe
         Bc0dL/pDPX3tdHtg2W0EMOb+Hic47YVQxP7TeBCHqciiDWca1EPCSETrEi2f4wm51PpL
         Vm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031465; x=1781636265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABTUwnN0/ycP6fItMWPZ2F954r03QSe0mQoNAie8qWs=;
        b=mgs7qrDdeI+Zmm1n32FwU36A4XWu3T3/ZEiqALudq6If5/4ikpgGGKMvCRRRvSEL+q
         cHmeQFvjAFUaRytVsh++0zFozhEIl11+PaAbiTlfC1+HLnG44ohrd4CwSh7M9LgPHpcV
         v5pzWDzuExQ9joEGq1DBFbVRq4b9J19OJDrXVplh2O2Zvl8JC04FksN7EvLC06DKJ1JZ
         43Y/R2Q4hyvhy5E/DkM1kPI4RauGV0CRJdMofASzIxBsFEDe/WD37nd5R+rXZ+10YhGa
         qFmEr770zrD1fRw0nLOIErWPPuv1gJ0HiIh0R6RGPRsdJ6SzsreTkAYVYqlFy6mvn3MU
         Ls8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+lYmRe/Ilibq5apVSaM/SwRMkOHCrDUNwA3s3CaQdaPxNsUOMw5lEvpWv3eDaWjtwLjrRS@lists.linux.dev
X-Gm-Message-State: AOJu0YxxThSX16aHW/MUTQjBlE+kOvWSAsKgueSAsDi/ZRRiHq2ihDsh
	EIIijw5dysbvjQ7OjUVQprQuREStKw6giI+HlxtYvH0HRSRS67CdfeN7lbv4uqgfr/U=
X-Gm-Gg: Acq92OFAi9iynzh1pTU5gEzwAmvtmmfi6+Fi3H5mDMnV517f7ITg0kENRWMePhOuydd
	pMt7P3GOV8eXDlf2xfWSqS6cKVQTRNcyL4dhk+KdT9oF2LflgPOV7E4MixWm2q0/F7wv5o3xBwH
	miUV314/xjeDRhfMFFxa1oY2h0MLeu2jGkS3EziOd92UL3kogdUdq7SMpFCyFsMiYb5HF6wPyy/
	dzDsVpKFYUr5fz9C3IGFtbnFk1AODaC28KUmf1FHT/bQxfUNt+QQ8aYden4nToeqFY3KpMiLTFt
	kMpIK1apsWcmt6lbzVr0xFAaDBdSLDqwLK8nECIZmoqvZpU/MAoHtTiLMVyYVxNOUHtW6HU6rYA
	PU4QxR8SoZJQ+iqppXorbtvdxOafTjYKCGzUocBWNo3h4/LeFZvdi1tK52fTuNZDWFopOpbIoYy
	vOuSJfgGOGv2QxOU3um/3fdRTDV6ex7zYk70ot1pIPCQ==
X-Received: by 2002:a05:600c:3111:b0:490:b55c:cec3 with SMTP id 5b1f17b1804b1-490d720129emr52607395e9.12.1781031465471;
        Tue, 09 Jun 2026 11:57:45 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm489548355e9.5.2026.06.09.11.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:44 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v6 00/11] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Tue, 09 Jun 2026 20:56:12 +0200
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxhKGoC/33QzW7DIAzA8VepOI/JmK90p73H1AMYsiKtpSIRW
 lXl3Uu6Q6sp4vj34WfZNzbFkuLEPnY3VmJNU8rnFuZtx+jozt+Rp9CaIaABFMDnfEnE3cmg4ym
 HUHiYeTVc7DkEZ61AGESwrAGXEsf0+8C/Dq2PaZpzuT52VbFO/1gJssdWwYELHKNF7xUE/PTu+
 pN8ie+UT2yVK75oArsaNk1a8pZiJKOHDU2+akNXk00jJZSV5FGS3NDUU1O472qqaSOhDcaR1ZI
 2NP3UDIiuptdLB20coHTj+P9vy7LcATQU6k3/AQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493; i=msp@baylibre.com;
 h=from:subject:message-id; bh=x6dOPsmrjAZCqEhHcumkEhnK6rNm9ylZ2ifhx4Wqulk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxHMGV8Tyn+lJ3p/PonN47a8nIcq//Kc1vonau1j4o
 /WP87c0O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiXc8YGY60lmcsbSs4wHnt
 07dMnp4nV/tX9s49Pi/gWZb1i7cNQtMZfrPslNpzwPzOk0O23my92znbbNrdlBb9NQz/oPWZMSt
 cihkA
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

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
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
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

