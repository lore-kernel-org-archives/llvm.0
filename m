Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F352C8B
	for <llvm@lists.linux.dev>; Sun,  7 Nov 2021 22:53:38 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so22788507otf.2
        for <llvm@lists.linux.dev>; Sun, 07 Nov 2021 14:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=jm4HkC4WuEFuj0T0GbogyNYTH9ILCYVGsH89yM0+sVY=;
        b=un0ROogmycQPFx5MqbulloXygKairZ+6ICrLoIPL2vYLlsh789nazo6Hsv2mzEp9si
         KxsA2GvDQwJ1CyowwYEETVMYITQwhBWuAm3qQK4mf1aJAaNttM9T7LG0qRfer46RBS73
         4agnUB02PckB5CFsfjvJFJbR34Uuy1nZK8Pqn/daNB8SX5IJA/LGNmzDxi4IMbeDlyiK
         TECXtEA50ld1oexOL7TBN9Rkd/sqAN3UJjwQPu1x4ILChGrpIuyJicdLF0ScWXMNEW+v
         taJxAHI4D5Aw0ZUbUtiFlVenJMm3qLYvN3Q9ImTAHcDBa2oDSkdy0pWNwOOGrtIghQM+
         BDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=jm4HkC4WuEFuj0T0GbogyNYTH9ILCYVGsH89yM0+sVY=;
        b=DXU2jywBySWVznOA4W1f5Lzie/dvf5nURu6ZpRrEaOwhQSVeQYigx12O/51u7KSxeL
         +4L1RBr+fHFurBZ36ENjFL+AMAlD/etBef5pKj4K7D2zoM58vOkIjqdVwmu4ZU2sjh67
         5DKHvk/SUhKCWfn2YqrLq62za6hocvdWKMkRZoWzHcA2xUmXD9lNmf9bJ6+pcS7qqwVY
         LFrVX7qT524hjNFHJ0tMawVCFtQHc5/TD9DlfMxJsyByaUCl/6RPx5T4Mnf9pneXzqar
         hUpHowK4ur8wJmAd+tTJOTPCdRfU4EBIDkVTOup1VHK5w6rdJVqOeJ38Z3B/Hf9sAg2x
         kRDQ==
X-Gm-Message-State: AOAM532S/uo//meP8bZ+tgE3bSwQPZdxDK1rs9miluPiV/LOurGQCh/f
	4XUVbeBN97IoiRL+L+XNYxe3dw==
X-Google-Smtp-Source: ABdhPJysbhbn4/+ndMMNZXqbf3gQjWDNDbQttUiUK/XLCQDWvKwg4RdzkreaUtPvwYgM+hv/FRLoRw==
X-Received: by 2002:a9d:2f42:: with SMTP id h60mr10652072otb.159.1636325617800;
        Sun, 07 Nov 2021 14:53:37 -0800 (PST)
Received: from fedora ([187.64.134.142])
        by smtp.gmail.com with ESMTPSA id r22sm1841169oij.36.2021.11.07.14.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 14:53:37 -0800 (PST)
Date: Sun, 7 Nov 2021 19:53:32 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org,
	will@kernel.org, nathan@kernel.org, ndesaulniers@google.com
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] iommu/vt-d: Remove unused dma_to_mm_pfn function
Message-ID: <YYhY7GqlrcTZlzuA@fedora>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Remove dma_to_buf_pfn function, which is not used in the codebase.

This was pointed by clang with the following warning:

drivers/iommu/intel/iommu.c:136:29: warning: unused function
'dma_to_mm_pfn' [-Wunused-function]
static inline unsigned long dma_to_mm_pfn(unsigned long dma_pfn)
                            ^

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/iommu/intel/iommu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 0bde0c8b4126..35300b5b69f7 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -133,11 +133,6 @@ static inline unsigned long lvl_to_nr_pages(unsigned int lvl)
 
 /* VT-d pages must always be _smaller_ than MM pages. Otherwise things
    are never going to work. */
-static inline unsigned long dma_to_mm_pfn(unsigned long dma_pfn)
-{
-	return dma_pfn >> (PAGE_SHIFT - VTD_PAGE_SHIFT);
-}
-
 static inline unsigned long mm_to_dma_pfn(unsigned long mm_pfn)
 {
 	return mm_pfn << (PAGE_SHIFT - VTD_PAGE_SHIFT);
-- 
2.31.1

