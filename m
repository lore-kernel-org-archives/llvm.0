Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8C24468B
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400234; cv=none; b=lJ4+9hs7PC1ISNCzi0S5VuvsddUEIM/s0TJssw58kZ2D+hlUpnal1RxQoLm78RROSAh3eVnwcFesBLmqWIjnj1erv1v2m7/divgmzBhJyimoA5uvMW7eUnhvZaBhRTTaczEFgzo3NAonoTowsyYmE+4xh380aNpOvu6kq/sv67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400234; c=relaxed/simple;
	bh=TX7QOESfiwCfuH+ZcQKgbvec7xRD+j3+tnkSFJsy5gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gonGLoycTQBNf7Nd1uMWwsNZue0KAosmKdiAOws51fVV38MHTpkC/v0cnNMZVvCUSycUaxDQbMZ5XR73I1pEhHPX/I7gGGjZ0Zf3NaVCUrtPbBvRVfmTutJDdhHQl8MadvK3xrhhUV6W2EGm5da6SSTSFqXhPpxY6GxVc1LRDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2v95/Uwb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2v95/Uwb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23c703c471dso27067095ad.0
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400232; x=1754005032; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvHRga/2x06e/3IXRCXpOvSv81ZyfpTLSHYXhuUCgAU=;
        b=2v95/UwbDGwev8lTaJgievbGl4a83DZ8GPVgOuzEe4kCwUBee3o7jOOzZ1Lznf8n9t
         ASBZMjPytnIvsoAzqoF1K1CZ2En2w04hiGNwAQ59vscboXQ9/zmbzawqCNzt9Klu7+q5
         iNJ2L/AzaL7jy/pIXOpOEg5IVd/bqWuluS1DWUdJEx9uDM8ERC2+kDIEsl6+ztwMhmad
         jSLPbyVk9i+DkqWzVrLILyU4ooNykMvWuRL4ACsYzarEtlVKOkyImZ38kIDCNjUM5MzY
         I2o5e+GvYw8z89GDpylZmDjpODiHkpQCxyE3VHeWMsZiMZ64CeDfJcC+IeGozRyCkW9c
         nnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400232; x=1754005032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvHRga/2x06e/3IXRCXpOvSv81ZyfpTLSHYXhuUCgAU=;
        b=l6uTFp4VIErPFdP9+53OSvZcX9LWCaQkjRKPqeQyPWbguDAvi2KU00D2iv/i+RC6of
         C4Sh2gQHHdgrlM/PawGla5naFSXWGbTs/wFnSlhfv2qMMUC5ftxUjH9r4ut2gKQ+jldD
         zJZ9rg4xuk7C/DSX4IdhGtZK+sXRbcor4MbCSX31sRm+2Rd+TUMGOZsaBorz04EowIDv
         48s+yHe2pbnbBJbLh6BJTUGd6pg7Q5CUuyTQ5leRhUidij+kPFMMkpT6LKNTxtWqxi3P
         TxQ96mMK5NwOI+mTjceRn2hfSE5NeQCKMv5W7iVHEcpqbYxpBZuKUIdYAiFqT+uTnBO9
         M6og==
X-Forwarded-Encrypted: i=1; AJvYcCVi2hGDMu73GLqN/Jc1UFuUF4Hqnrw3juB2hFD50QqMNCI01WUlhJyXSat89PugreXH5Mvu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0AXOGPCCK99/DFYsBY9R4DcKanRZMj/uRXrE0z4yihCBWaY1v
	9+WFQLv1XZfbB+Z4MauDvP9wmnz550MT4dYSWRWohFLGsOEiqKR2HSba8R58oLRZsXI=
X-Gm-Gg: ASbGnctAlK0iQEO1plXeQU3OGpngfA54JHjz75kixVyCAx2V0ubD4cD1eo247ET5IZl
	yKvfeb5ZUb/zeHk8ZEwsmohKdFjj3qFzNqra/oFxjXTIXugsWHi7HDUUKkiCNV78XkXVGngfeD7
	AWYfqJ71XtIX6OLoiJkn0rMFv/A08V+fnW1rjhwyMGKXWs77oHTOiHwAVclVzr7HTow8Eqodfdl
	xBe+J2JWosAzXSaSo1/gCqE5VM//JrHtWUZ59xa4ZBj/Qk0yROri3L6KeTtcpfNSRZne/npjI0V
	IU79PQjgcPpWcuWJW0RcJLLpj7BWPS3+3rKPOSjPmyq4ohuH4TGIj/tfulBQeH53kKm831hZUaU
	T9ZLTTMbZXp4X3jTO5Pq41lfP1ETQ0//1
X-Google-Smtp-Source: AGHT+IHlehaeba0g7zvJWooWl20RVESgD35SdGjk7uZPTtlJW4lACDouf6PruSCC8hJSgeGX0h9FOQ==
X-Received: by 2002:a17:903:28d:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23fa5d12ce3mr54400555ad.9.1753400231958;
        Thu, 24 Jul 2025 16:37:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:56 -0700
Subject: [PATCH 03/11] riscv: indirect jmp in asm that's static in nature
 to use sw guarded jump
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Handwritten `__memset` asm routine perform static jumps within
function and uses `a5` to do that. This would require a landing pad
instruction at the target. Since its static jump and no memory load is
involved, use `t2` instead which is exempt from requiring a landing pad.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/lib/memset.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index da23b8347e2d..c4a318d8eef3 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la t2, 3f
 #ifdef CONFIG_64BIT
 	srli a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add t2, t2, a4
+	jr t2
 3:
 	REG_S a1,        0(t0)
 	REG_S a1,    SZREG(t0)

-- 
2.43.0

