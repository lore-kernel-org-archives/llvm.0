Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035B82745E
	for <llvm@lists.linux.dev>; Sun, 21 Dec 2025 05:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766294137; cv=none; b=bhU/Jk3+rbZERt1JUoSv7piFYS7qwSwPVozCk5XGBE21Ki2asjqzAPJ7ksihkaq6DIbLJVwy4/PVOAW8vd6z4KBCLEjIpJKWJQk2ZizoXvxgJhqhpI07h9PIIg8ZGdJj5B8fpo1cRNVLJU5xMdUT8TDIYZ4kOVHLKKnO5bf1ntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766294137; c=relaxed/simple;
	bh=lqw/hboHx3ROopTDDyy9VMaHC5uPA3PcmRQKg2v2bbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFYLui9tH6dpzjZDKSQ9PwysJDSRPq0tj0ulzR9hv/ffhgiI8EI6CnTJBVaG6HEZPDpZ+0pMrf7UNpy6YeLbUUDcoSMb2UnxTfBzVNMDYRMSMs1YDz064I+v/ayyV1iW5AUxbuEYkZZ8sMYU+/99VCr6210g2mxxT3z7FRp9Yjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYTllWGt; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYTllWGt"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so2544496a91.3
        for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 21:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766294135; x=1766898935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrm+sCPHTPnZ3R2lUhrTFOXrDyXAJEp9c+N8RivifRI=;
        b=WYTllWGtB733rp93V9eYSRk6VZG6onxyFHGxOocN7WAV8+FDhMqkFPloE2p9XSFs14
         Tn9RZjyelLmRumqNlW+2YJGg3ity6LKM9LFNJX4U6aBK+v5ah/4n2ATaQAsBLF62pWkb
         BycYSl31HTAj85N9Mg44RjnrT60xSccQ7MhCE5qsPgyhKMHHiM0oYCEDSM3Bq9Rx5MBk
         BS4Abmqt+gCU62260wl+sd/NkKLEfHABoEtiGrv4pimqnwrHVXAsX8kFWV09zFk20q1O
         0C4GkD6eaEBKMJYHoB5QT7Js8N+Y4marKi2U/bJo41ncy4hkxDZgGlz29M0pJ2pz54Yd
         l6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766294135; x=1766898935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zrm+sCPHTPnZ3R2lUhrTFOXrDyXAJEp9c+N8RivifRI=;
        b=hlKaJmklqcKsC4UWgrdrLqBjsunbsR7WXvuy5ZlH1J6xoLhFFpPmMMlLjZ2sbNZzMM
         UGvgY4EO+30AItwwtbpouS1EFFr5nLT85L/kSVGJTtmEai6iP3/IR9q8r3OEN/MOSG/N
         E7BPnoUO0OXe1bjLqmaDOl4r6gjvA9yNALjMLwl+z7KJjGcJ8VKkjEhxp1VUKMFLxw6J
         95O1B2hkDTfMgUP2zbttVB03uQa5vHktrBvHM9Jfu/fuMdXlVipySKrZ1rOpGzbJdlrx
         d0H8zx7M0x6YPl2rKlUglZoanhR3YQkmmX6AJnuD9Dh3V+l6C/vuEz7o4qIDnzZvp0VJ
         9SKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAQRJqDUTR11GWlADzM4UMkyMHqNleHb5i5AL/BGioPT4BpiQS+oIRsxePBgIFpA53XdKp@lists.linux.dev
X-Gm-Message-State: AOJu0YyCCRt11yyeLtOhoPxd3tP1dvecirzrwng0JP90rG7CGwArEC+u
	qY4TkIkRDYEfus7bFLjC/s4ehNkQYNY7fBnojRXYPlWxlUztYI+xq1i4
X-Gm-Gg: AY/fxX5sP7VL9qTi1Fvd8/VJhC1crEe9Wg6+JmG56Y6QBSz8NKIoEQs9RqTpBBLyFNY
	Cd2V1WUFobSAj+TeZT7utzJ80vQJFHUDWZYwSmmpLKJmHySCEw6BviixSko7zUWvlbMXSztruQQ
	O1JOJncpHYYstHtriwZt7xzywFto5vp3pU150UIgknGIBOKTiIuReBle1Cj0tKiugTpusw5MiS5
	bWU3Ji06CKF/kyCXw1aeJWRAyjgdxprvtAycEQJCRP1H9JmBw3I61KNfhK7cj59zMVKCTmmUG7X
	2iP3LmVI8y2N1YyqcIJgm+ISR4vkTRK8fpDjUjos5Ruaf8tOhWAzLD5gpm+dvetf9kgpqstI/9b
	7D+Fbs6dhEhlB2MhBQtg1xMt9SkF7MaEOAnKKPz8Mtd9OuVnHZx1w837jfrzD2Y0XKv8DFodQrC
	Q06poEVtfL0dxTtYOAoTKCOWgm
X-Google-Smtp-Source: AGHT+IG8fgdP5DyvYQfIsi79vPvO3rvDS48h/0TZoR1EsxLyaeNxkQLWaGjIbOP2x9FZnMrWOAqXpQ==
X-Received: by 2002:a17:90b:33c9:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-34e9211d59dmr6149016a91.6.1766294135006;
        Sat, 20 Dec 2025 21:15:35 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223adf5sm6402226a91.14.2025.12.20.21.15.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 21:15:34 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: 21cnbao@gmail.com,
	ada.coupriediaz@arm.com,
	anshuman.khandual@arm.com,
	ardb@kernel.org,
	catalin.marinas@arm.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	m.szyprowski@samsung.com,
	maz@kernel.org,
	oe-kbuild-all@lists.linux.dev,
	robin.murphy@arm.com,
	ryan.roberts@arm.com,
	surenb@google.com,
	v-songbaohua@oppo.com,
	will@kernel.org,
	zhengtangquan@oppo.com
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Sun, 21 Dec 2025 13:15:23 +0800
Message-Id: <20251221051523.18557-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202512201836.f6KX6WMH-lkp@intel.com>
References: <202512201836.f6KX6WMH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>
> All errors (new ones prefixed by >>):
>
> >> kernel/dma/direct.c:456:4: error: call to undeclared function 'dma_direct_unmap_phys_batch_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      456 |                         dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
>          |                         ^
>    kernel/dma/direct.c:456:4: note: did you mean 'dma_direct_unmap_phys'?
>    kernel/dma/direct.h:188:20: note: 'dma_direct_unmap_phys' declared here
>      188 | static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
>          |                    ^
> >> kernel/dma/direct.c:484:22: error: call to undeclared function 'dma_direct_map_phys_batch_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      484 |                         sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
>          |                                           ^
>    2 errors generated.
>
>

Thanks very much for the report.
Can you please check if the below diff fix the build issue?

From 5541aa1efa19777e435c9f3cca7cd2c6a490d9f1 Mon Sep 17 00:00:00 2001
From: Barry Song <v-songbaohua@oppo.com>
Date: Sun, 21 Dec 2025 13:09:36 +0800
Subject: [PATCH] kernel/dma: Fix build errors for dma_direct_map_phys

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512201836.f6KX6WMH-lkp@intel.com/
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 kernel/dma/direct.h | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index a211bab26478..bcc398b5aa6b 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -138,8 +138,7 @@ static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
 	return DMA_MAPPING_ERROR;
 }
 
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
-static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
+static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
@@ -147,13 +146,13 @@ static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
 
 	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device_batch_add(phys, size, dir);
+		arch_sync_dma_for_device(phys, size, dir);
 
 	return dma_addr;
 }
-#endif
 
-static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
@@ -161,13 +160,20 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 
 	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
 
 	return dma_addr;
 }
+#else
+static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	return dma_direct_map_phys(dev, phys, size, dir, attrs);
+}
+#endif
 
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
-static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
+static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t phys;
@@ -178,14 +184,14 @@ static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu_batch_add(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
-#endif
 
-static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t phys;
@@ -196,9 +202,17 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu_batch_add(dev, addr, size, dir);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
+#else
+static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	dma_direct_unmap_phys(dev, addr, size, dir, attrs);
+}
+#endif
+
 #endif /* _KERNEL_DMA_DIRECT_H */
-- 
2.39.3 (Apple Git-146)

Thanks
Barry

