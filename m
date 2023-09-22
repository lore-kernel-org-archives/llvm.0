Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76E42BEE
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:51:04 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-692a885f129so941643b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405064; x=1696009864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AS3G4n4TBFZWhDodrFk3+wfFKjlDza+m4CiwBMh4z08=;
        b=M70I2V+5k1d4XHon+RfjZiiT4mWjFmmI2tleLQejlPmNN5TBiZSSOe6+5T3J929h5M
         rVG/UI47YfnYXgk6sB+xr1kvppzQ2bRFPxuniGeINTc1oEok/HxG2U/5Y/Pee27KmTgn
         dqcHlopk17vsuw57n4+cLahahNdkSy74JpmKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405064; x=1696009864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS3G4n4TBFZWhDodrFk3+wfFKjlDza+m4CiwBMh4z08=;
        b=gLlyZYdtHRVXcuWCCyTWvUp6eWvdXfajecXd/toh/1yZ6KrKDLL2XHsUUAB2Yc/EgP
         jO3VkL+KfcwKP/fV2ymtFnjriyCv3BBZvNP6bam7hIgf5YeUfeF1HhfZh/RGgpczf+E9
         QZzFtG/PnFASQMtjhd2GpyfI+lert3+kH9WS5Lx4Is8hjvUSaSQV18OyRON1vhTpRm09
         MDRhL5H9KnQUIBaqx84Z5OFlHdpwOjTN7HI9rD+yyVFuMPX0LhHsoGFN0byG7L2izvvv
         dtDuqXgfjZ9gnyVLlVVTgYRYJB0f7HQq8gSTudtUDb1cRckvsSeR9noXKlcLvCl9UX5S
         n01g==
X-Gm-Message-State: AOJu0YxoBCctpfawpdy/gqhgYdAd6VdW3Ef5bigaQiSqEtJ6GefFLT3K
	WlJKgvXPRLq0VkXGmLDX26dXSg==
X-Google-Smtp-Source: AGHT+IGLDAq3MUcFFuNLeebQrEVNYfC4hyT+uym98wqR6tkiiL0SzvbhaluyWujG5by309PhCugq0g==
X-Received: by 2002:a05:6a00:b8a:b0:68f:c1e0:a2a2 with SMTP id g10-20020a056a000b8a00b0068fc1e0a2a2mr140611pfj.2.1695405064282;
        Fri, 22 Sep 2023 10:51:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c5-20020aa781c5000000b0068883728c16sm3578344pfn.144.2023.09.22.10.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:51:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Fei Li <fei1.li@intel.com>
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] virt: acrn: Annotate struct vm_memory_region_batch with __counted_by
Date: Fri, 22 Sep 2023 10:51:02 -0700
Message-Id: <20230922175102.work.020-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918; i=keescook@chromium.org;
 h=from:subject:message-id; bh=WaY2kTn1yazHmHr2C26ITAqyjQkyOX3EcAXSRAFMvEA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQGkCer3a+lUOaX41nf4FcmcDwvJGoS1PC2Z
 Iea3hnu5/OJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UBgAKCRCJcvTf3G3A
 JmrtD/9ts1iJRTn7bBnCOgTmeuo7qoznjoC5NTZ4ik9kMqawaTuBpBZ1WS8SBzYaVsI8OhxmZZc
 xtx8FWQrwBaVz/uohBSxVolrfYlB3eF7ma2LKObYd83wqZL+ZThz6qTZCl+sqMOAKge7u/sF+3p
 EoGtoBiTriiCo0zWetez0Y6CcfC17sACn59R8WwX3XMqF9Hx7/zU2nPtRnRPH1B001HUKJnRyQP
 fNjZ6HITNFGyWZNMZeybw5era6sVgjqAwpvJbRMhO6R87FF4lZ2DdWlgx5bhZppw5goxZ+wctbO
 5fAg7ymNors8GOvDWnQwKhUlXn4LUQAeqMf6+kRZz9mY4Y7XsP0QAq6V4DDdpgRa8FEL3HPW4Rq
 SAeVc4p5ZFsdUH+HeNbYcQVETfjeXCbUPrNdv7gE/uzPmROo6wBUTB+CG7YFUDudDyLm86Hus7n
 3fAgTATbG/IiEgghWm2cZ5TI4mqw0jD3x+f9KnSR1/EClerCP31Mo5zp6XhCyf+9Xr4oJ3Th4dn
 uPSG0PiTPvnM//nEhcYelWoyHfOieXsssjSmglLpV74yncScIy2fWA7UqXuxTJuqgbwS+/XKQZ2
 IklKbqDIGO2aoyPmqUhGyrUI2MtNGJshZ71rWLeQMXHQ0rwRe3D2MFerE7eOYH+eHbd2dNILfjP
 mxMYluz dDRVsfCg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct vm_memory_region_batch.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Fei Li <fei1.li@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/virt/acrn/acrn_drv.h | 2 +-
 drivers/virt/acrn/mm.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/acrn/acrn_drv.h b/drivers/virt/acrn/acrn_drv.h
index 5663c17ad37c..fb8438094f6f 100644
--- a/drivers/virt/acrn/acrn_drv.h
+++ b/drivers/virt/acrn/acrn_drv.h
@@ -60,7 +60,7 @@ struct vm_memory_region_batch {
 	u16			   reserved[3];
 	u32			   regions_num;
 	u64			   regions_gpa;
-	struct vm_memory_region_op regions_op[];
+	struct vm_memory_region_op regions_op[] __counted_by(regions_num);
 };
 
 /**
diff --git a/drivers/virt/acrn/mm.c b/drivers/virt/acrn/mm.c
index b4ad8d452e9a..fa5d9ca6be57 100644
--- a/drivers/virt/acrn/mm.c
+++ b/drivers/virt/acrn/mm.c
@@ -250,11 +250,11 @@ int acrn_vm_ram_map(struct acrn_vm *vm, struct acrn_vm_memmap *memmap)
 		ret = -ENOMEM;
 		goto unmap_kernel_map;
 	}
+	regions_info->regions_num = nr_regions;
 
 	/* Fill each vm_memory_region_op */
 	vm_region = regions_info->regions_op;
 	regions_info->vmid = vm->vmid;
-	regions_info->regions_num = nr_regions;
 	regions_info->regions_gpa = virt_to_phys(vm_region);
 	user_vm_pa = memmap->user_vm_pa;
 	i = 0;
-- 
2.34.1

