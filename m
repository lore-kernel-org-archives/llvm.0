Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89A11B977
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714592237; cv=none; b=XKQjPzUomOKjMMQoynIVUeQ9TA3m367G9cSmEGOX8/lIGCfKtUWAOHtjpiW24BlfE6n/4Vk5tFTqbpcg995F0TQJ7v2NXAGfS9x4Jg1SBm7IfSghv7SDgC/bFFnmemBnNXxht6ikBgvdiEbp5cRGtdRssdMYWC5gf11G1hBTejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714592237; c=relaxed/simple;
	bh=NKsknBWYA84MMDw2XbhVDtmpzCAlaQEA3YQRvQXELjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dO50tSuXT1i/0lYCmXDtACGRw9B2oYfnpTizbUphcvMe6yBgvFjEv36f1MYyyD/xPrFhKJIIvsQs2B0GXmNyGUAEiRl6z2CbTLY4XrZ2NpfROXnenkmocfszv1V8YixLvegAMwz0xUpcsG2y/IBXQ/NZvzw4HKn/E0ZDcq35VDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J5WaLBGA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J5WaLBGA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso6308003b3a.1
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714592235; x=1715197035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvFOg5ZGNpEt6TtWRUDGWd1J8Hf8j/pvcf63R1jFypA=;
        b=J5WaLBGAa85HEp1M3S3SN4+ty41xblTBQb0FwCn5/b24YOhTCFezsnp6ORMS75CsSk
         2ejv/jKGiHzI2ESFfU0EsCsIGF0qv4iH+LX026ojKa+TJzkuZ3oEKoxptI4HlAZOZAkO
         tc0Uf+YrvyRYjFdleINNWf/Rku68mb/eHVYHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714592235; x=1715197035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvFOg5ZGNpEt6TtWRUDGWd1J8Hf8j/pvcf63R1jFypA=;
        b=Nsh/2n9Q5BxtqHSOJvtx5FOUkINHST70m1oZMuIVgBNMXrbmQajKvs9gk3rewQZNT1
         KvZGzXscpBf+/h2thMTwaaqrZ0QLQx1lO/O9KUscn0pmS5eJnKly0eQDW0Nn0Azp/MKR
         mRZzJX7GDf9VHn9ztQPEyzPQI+4wNthXSuKb0MRvLUYUXpXTyaihlZwlBJwN04yStVOA
         7MnFVgKX5FW4O8DQUko/hBhwlrMu88YLRk/aEeBk2V3Yrui36KDv/fC6/WlWo/akldk+
         sjsmpYCWbtkzyioTYmR5+KU+cS9P9Wfeh7/IRpEVrAW8NV/2i3CMjYR5B0p8Pn9A3o3L
         jPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDC1bV7yZf3be6t2Qc+E5mYIs/F/cTQ2rglOfUPRHd6jqZB3vBeyJRzAz18HOpCeMYqaKcW+Ie3FkaFMdFz9rWcwa/xw==
X-Gm-Message-State: AOJu0YyaSIQD8lmM7XJeI9A4gGDZsnTrdIJO9Gam23ZHOL0kzmZxn26y
	ZGlSN/mJPwNEtDO6v48C4iCruj1l1whZbke4a1No+GDOXgR/A83kCwwUtnv0FA==
X-Google-Smtp-Source: AGHT+IG0ymu3N2wZiVbdkxtYVjzYQ+d8l4Q6OMF22iO5uDx77xWYeuPGSymFUi9RT69ddvd9TyA68w==
X-Received: by 2002:aa7:8891:0:b0:6ec:fd67:a27e with SMTP id z17-20020aa78891000000b006ecfd67a27emr3826038pfe.1.1714592234975;
        Wed, 01 May 2024 12:37:14 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006ece85910edsm23020718pff.152.2024.05.01.12.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:37:14 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v3] hardening: Enable KCFI and some other options
Date: Wed,  1 May 2024 12:37:12 -0700
Message-Id: <20240501193709.make.982-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=keescook@chromium.org;
 h=from:subject:message-id; bh=NKsknBWYA84MMDw2XbhVDtmpzCAlaQEA3YQRvQXELjc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmMpnoXElRy5mtMZ69Kw4EZfui4YPcwQgqNohUb
 W/mTkIpghGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZjKZ6AAKCRCJcvTf3G3A
 JsBnD/0U7s7b3FztnGuIGzP9bQgbSUdqTfM2A0frprWHDhBLVtapVS6/s1+QDaHAcwUVO3Ed91O
 bhK6QgMIp/BuU8nPESGhEotQjf7KEgj7TeYy9UMR81O1N1aCfJ93m74TGRxM56tf+muQ2h8drgY
 82GaBYqsdXAzdDQdmI+wk0XRdCcKdqXhTLxLaEOOa0BGPCJ86G63q9QAqx++NR5UoKBv80qEbKZ
 OM8A3tQctaM9g2cyn8QL8pyotMmWbuEwTO2NeM6jiOda+B6XaMQq/iXwXgyvhHA5MMGt8IHu//d
 9TD5zMGencEKYjk6Ha2PFhL5eo/eWzvdw4qB2eSEQ9FVDO7BO3G7AwszmwW5UwJzn/KmS/O4yTz
 naP1eVzrFnepZQgMnfB2Q8mZcnrcVG0BjKGk+gJrYpowzFakTHlXk63H3ek1kUHU6RbSyxvsO4p
 lnG9ygU6y5uFJRPQyH/MkmRBGsCbq8JFI4g/CEaOIteLp1jQibFSuwuUM2Efy08zvnj6vsxmkRQ
 psMTQkhm3m9nqKLXtPdaxnguKOJkhsRogYcbbRHK0/0YF9K6J2qrySkn0Yat18atruBbAdHb3Bg
 I7bSpMRDjPi8aIs98dz6FoYoefGQE37GFOzXrS4G9dZTXadE6YGR2ksskT9vZnfsAAqqe+13vbk
 3C+OiPU u935fQCw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Add some stuff that got missed along the way:

- CONFIG_UNWIND_PATCH_PAC_INTO_SCS=y so SCS vs PAC is hardware
  selectable.

- CONFIG_X86_KERNEL_IBT=y while a default, just be sure.

- CONFIG_CFI_CLANG=y globally.

- CONFIG_PAGE_TABLE_CHECK=y for userspace mapping sanity.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 v3: we don't want to (and can't) turn off FINEIBT
 v2: https://lore.kernel.org/lkml/20240430173657.it.699-kees@kernel.org/
 v1: https://lore.kernel.org/lkml/20240426222940.work.884-kees@kernel.org/
---
 arch/arm64/configs/hardening.config | 1 +
 arch/x86/configs/hardening.config   | 3 +++
 kernel/configs/hardening.config     | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/configs/hardening.config b/arch/arm64/configs/hardening.config
index b0e795208998..24179722927e 100644
--- a/arch/arm64/configs/hardening.config
+++ b/arch/arm64/configs/hardening.config
@@ -5,6 +5,7 @@ CONFIG_ARM64_SW_TTBR0_PAN=y
 
 # Software Shadow Stack or PAC
 CONFIG_SHADOW_CALL_STACK=y
+CONFIG_UNWIND_PATCH_PAC_INTO_SCS=y
 
 # Pointer authentication (ARMv8.3 and later). If hardware actually supports
 # it, one can turn off CONFIG_STACKPROTECTOR_STRONG with this enabled.
diff --git a/arch/x86/configs/hardening.config b/arch/x86/configs/hardening.config
index 7b497f3b7bc3..de319852a1e9 100644
--- a/arch/x86/configs/hardening.config
+++ b/arch/x86/configs/hardening.config
@@ -10,5 +10,8 @@ CONFIG_INTEL_IOMMU_DEFAULT_ON=y
 CONFIG_INTEL_IOMMU_SVM=y
 CONFIG_AMD_IOMMU=y
 
+# Enforce CET Indirect Branch Tracking in the kernel.
+CONFIG_X86_KERNEL_IBT=y
+
 # Enable CET Shadow Stack for userspace.
 CONFIG_X86_USER_SHADOW_STACK=y
diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index 7a5bbfc024b7..47e6564129c3 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -23,6 +23,10 @@ CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
 CONFIG_RANDOM_KMALLOC_CACHES=y
 
+# Sanity check userspace page table mappings.
+CONFIG_PAGE_TABLE_CHECK=y
+CONFIG_PAGE_TABLE_CHECK_ENFORCED=y
+
 # Randomize kernel stack offset on syscall entry.
 CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
 
@@ -81,6 +85,10 @@ CONFIG_SECCOMP_FILTER=y
 # Provides some protections against SYN flooding.
 CONFIG_SYN_COOKIES=y
 
+# Enable Kernel Control Flow Integrity (currently Clang only).
+CONFIG_CFI_CLANG=y
+# CONFIG_CFI_PERMISSIVE is not set
+
 # Attack surface reduction: do not autoload TTY line disciplines.
 # CONFIG_LDISC_AUTOLOAD is not set
 
-- 
2.34.1

