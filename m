Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4D6669B
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 21:11:59 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59c09bcf078so265601367b3.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696021918; x=1696626718; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qI6+evphp8TRNLDsXrgWEBj/E5cavHWN+P8xd8/8MDM=;
        b=Oczj/ONIDPL7RwXKBv3lZDq/kmkvvfhLb3tcDRR45rflcyMUweOFYhrjAz3YYWP9IB
         9gozgjJmgTxHjqN+DHuSVGkznUCK2NhIclTmwWRFzBlYWCni08lkAW/tvxQEzIA2SvYt
         qaXA/XzpO6EGP6F7KJ+vtVHu9c2QIIr6cvPoV5RAY7Eah11jviXWS6KPwkddo4xcDrqA
         6qEZlCFelGMFuidNApy21n54UqfjzyGGAhnYDhO33Xqjj1CmD9Q2kaTUBD8uMhSCIkx7
         TWSilbdotAzRxYtUwTX8EaaDfSNZAkfIK86JAKtWi+CqLv6woiBF2OMu1+TT5SX3M5ki
         lMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021918; x=1696626718;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qI6+evphp8TRNLDsXrgWEBj/E5cavHWN+P8xd8/8MDM=;
        b=SW1lyNfMnFbh3VzjMewM3J1/SdifU78JymI4nMV6DxgHX754rk3pbRhyCCu5QOPGnx
         4+ycUnTGSmzIaBV1PkrB+Y+U6USur17HwOzbGuK/329cfTSg5h3KhqkU+2llk+fQSjBJ
         1+eNqwzbbhqVtznVsIGv4lPrLgrFXOjtNzFEK0HJ3S8g01FwtMcCDgD5HvZ+hRMYyeuZ
         lSnSuMkdnW8dh1U+1cDrpIL4KSCK1SAlERH6N1TsRFZi9zKx8uYFR0zBoTwl0BxuSQxW
         gUIPDIT9P37G7Kkg6pUuk2BukJqHGOr08O8rwMFtGAzYYV9KmfuTILEKSwgm55y53a9e
         H4Vg==
X-Gm-Message-State: AOJu0YxW5Kea+s+QxRU9dtVa//CvDftPeNVXZMi19N+5VmUs8uEMC6eG
	xYxQrai2g0ICsqPb62lQiRtYIYwuP7W6ux9A6ZY=
X-Google-Smtp-Source: AGHT+IGjD5ILJnbbyCB0lpaKNSDkrgUS5mwaokgtSD8CjgjpWZhKS+xQi/ZyvDLcSGZs4gGR5Nixr3sWaAppp9HPVPc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ad0a:0:b0:d7b:8d0c:43f0 with SMTP
 id y10-20020a25ad0a000000b00d7b8d0c43f0mr85777ybi.11.1696021918263; Fri, 29
 Sep 2023 14:11:58 -0700 (PDT)
Date: Fri, 29 Sep 2023 21:11:56 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=727; i=samitolvanen@google.com;
 h=from:subject; bh=Ko6nN36PGlYW1laUEIPPBze9YPFWfBooBOFzOjRaBRQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFz2b825e14pVS6UiwTyLbmjRM7MleUeCEvyhI
 HQ9Yi7cABWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRc9mwAKCRBMtfaEi7xW
 7p9uC/9v8/6JNqB5Fbep/hRFQKiCO/kScjQBMmlHvInQfP3gwUfbFCkkKYSVRSOR4Pxeo+/um1b
 AFvQRu8TawGoy7GtfAlC2T/3RZQcj6xNwU/+K5WHsVdfqZNa6xsNhtBstdrsW91ELm7X4wBhnPs
 9dYkZsrMXL8JtJvTDL1VQ3EjQ/tTab3SiJiqIF2J694+4vXbP83KGUAsC8z11QRsfCkb9V0cHNb
 qMaWfvoF2E3/MtrWUF/VlddoLs+4VfwsIz2eTQZm1X5Ll3CAeOMw8TmTQqQ3OT2OM1kJ1GKFGjs
 kpo/58zC+ziTSyL0rCbs4jrdHHMyEYwJ50108kvKlUuWGKE1joh0omULdtzfezNnIwzMPwuVnD+
 4eCKnZSAXhZxbKFAC20jcgErpJusDmn0lx2CNHUYsVuPL58GkYaK49lTYq09WuoCRWjrP+iv4BO 5JlmAMEmM6FrNg93Mj3ALgwQi7uUk7LHPkg8Rs7a3cO1p1MoInq21V6B5zk6DfXYcBSdA=
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230929211155.3910949-4-samitolvanen@google.com>
Subject: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
even if the hardware supports a larger virtual address space size
[1]. These two patches allow mmap_rnd_bits_max to be changed during
init, and bumps up the maximum randomness if we end up setting up
4/5-level paging at boot.

Sami

 [1] https://github.com/google/android-riscv64/issues/1


Sami Tolvanen (2):
  mm: Change mmap_rnd_bits_max to __ro_after_init
  riscv: mm: Update mmap_rnd_bits_max

 arch/riscv/mm/init.c | 6 ++++++
 include/linux/mm.h   | 2 +-
 mm/mmap.c            | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)


base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.42.0.582.g8ccd20d70d-goog

