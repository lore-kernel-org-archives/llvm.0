Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72233DA7F8
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723144; cv=none; b=ZwNzyR5BOhL7pAdS3FMBLqMVBCbegmYbM3BVl69FKZHQWReOcbtq1xQMJC0ibc4V6Num6gtGUCkVpt8fsw8a6dql7HnuLJY5NnvXrE9cOpMwyuvXztYKmLS4wE8oYY/cdiFfDoB9m2w7sfQjdAThy5S1ekrRjpWCGJtr4x//Jlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723144; c=relaxed/simple;
	bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilxT0783tlpBKdrowOO4l0tdiD8QVwrr6gxdmSDrcAScGr0660kzT7Wqy8je/7+sMTI2J9g6pyS5pTbYYMISRUWyfDUVPgoYqvOMbI2yRl6aONs3CA8aMkxijmXtiw3sZ4L6fmfaOuigeCr4Kuvg0HsJD/6u1AzZv6lNTjUtYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bLoPLDoA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bLoPLDoA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so2842385e9.1
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723141; x=1790327941; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=bLoPLDoAzsxw/D0Lf+din20x8mznVqB5pSB262s6z8o48a+6ReAZd/ujEJwsFqpa7C
         CmaLzjOUqJ0pZoXwPIxYdIWv76iNzpHYUXSsaDk63Vn237poZP9Kg7a9Agg13lHGeE4/
         gVmJ7rKIk9VYW9QPw2h75KdyB5KB6E6gFq0ZUt1e+FwTBDQBYTLMCgwisnekYdgndzjt
         QlfdHJB1Mcc0EJnsuF1e1SxsYTeWoYRi4nhp0AT6+ZZgQ6D2vzml725eCkflT9XuQq+V
         /8VxBzjARN/vGiOucRvWOIZuUueZ7QmqhyHsTWTup9mx8eQ5MzcFn8ua9bX7BenXoC6Z
         FQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723141; x=1790327941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=C7zHClwFR7rqzafkDjD8KfWVQcO1qOxX1sbFGVYiK+DFQlQAblcCqlH1jSfwnXjqeb
         Wb7B1xyB/W98kVjj0CHO0PjhP+C1QOzf9wDMDgQ4F4UaMEPuuRXUNgNM/eUSAkocluff
         XBNVkt2Wc6YDP9caHLXtlPAB3lX8D5yx1rX9PcWCDSO+l/kZAeMSnUQfhLI+9e9K9roj
         mlTS554aEhZ+eJzBZUccfcT5O+DJUaDkqVzamZRECEAaVOTtMykaLYRalmEoxknvaFh6
         Gy1aGndY3OYoZDDljiNZh5l1c96+Uha+o+8oJjx4xjcuwxQKcWcwuPXvPmF8ZmJKxDeb
         QLrA==
X-Forwarded-Encrypted: i=1; AKwUvBxikZpgwl78UVCAyK2ecN/1lIaDplt6gEed4sF4Key6KNaZHI8eDFpj9PqOECAupggMJiCp@lists.linux.dev
X-Gm-Message-State: AFuF++kBxdc/NPJ8vgyYZgyYb0UoSncWO5UGwyqrbkgkLRSQ2fjV24Jo
	ZRIzjxrD+Y6qEfDkgtRrkaifyphXrf9S7Nr2zB+WPjTIu7w275ZyLf5qtT3Y69Wub2NXFg4Xqj9
	Og2ph
X-Gm-Gg: AYBFou24qjOWTBq4g9AxA0I/JIWu8Lst6ORoc5fTXzfzxxMBRrU0rTAGL2z1dybKrN/
	7uO33aSOVvW5o8u2S8SJOuvp7E14dlde8ifhDCmUyZvzz97+fE8oruEksWXJ1Bhq4p8nSu4ibb9
	MFrkl1OxopDYpo7/AKy7Gs9KUpSzehTMmxJzxCjILJImyUxVMv/0kH/XpPe3NDt5VAWjqPhooHS
	++Xt9GG65qubC66whNJs0WrpC79QcJeBHJA8SbxbZOvAoEAGFYGh8FnkfeXoU7Z6l/03wxQ6kjb
	HYv/nQy1QwHRblQbiZHb9O9k6x0PA1ts6l8YmjGaqgVB9bOeUP1jxon9jMvUb2aqt+0wB7x3DDe
	aMmoiXqlDhUP0SKtfiOiKQZipkrEa45SuUx6Pmbm1NB6L3dxWP6AmSRcDHzq0etqc0hNm/Knekp
	81HMmEJtbizemHBMLzE8VdTU8u2UR7up3xCm8W9r4RD4+4qPXRu5rc6wh4npAsu0DWTjk=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr19681525e9.23.1789723141196;
        Fri, 18 Sep 2026 02:19:01 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm25502155e9.1.2026.09.18.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:46 +0200
Subject: [PATCH v9 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-2-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jCeOn7obHnw1gNGifKrQxqei1jUut4QKDn02OHdju
 2fjVY1HHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9RcY/vAqT7E8mCMnqOon
 6pknWNIaVq5RoGoYoRy1TKp0ZYlZOsN/f1m1A2FaU87eWTuFS8S8T/Z3Zpcwi+qRFfE2cwv6k36
 yAAA=
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
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..a8c794d07343 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.55.0

