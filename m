Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455712E7BCC
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469127; cv=none; b=BKu4X+Sl6BmwtuENvdMHfM2hzhHSAncNKw8YmwV5tePC3LcybEuY9JO2hP4h26V8STOc95Nws4S6QHGrVqKFNxxMHSEcLxb7Bm2TxZyTlRZqL4G+fBwCWuffsmsIUerrslQ7KheSwiQo/RlpgJgDogLGPUxRjCt1ZX8CatoSd9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469127; c=relaxed/simple;
	bh=t9jLJHWdyiSzQs+a689FPxJdopVxx51fZYgZFEcmQ5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V5CRGmjLedY/ExDvXPebOmSZ4naiJRAvWWUPozxLDP3w1+NCQn8POUv7vkHcaLBF6SZR9EjVTWfUm8B2TqACPsWOXGqquq+yZerK0dMi/ubVb3uipJdizmznxsIlejBX07tl3VybJ7jXlQgMQl3EM4cLnQ2OxnpII+yF8+fc7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GG7fqyln; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GG7fqyln"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3305c08d975so9450854a91.3
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760469124; x=1761073924; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2k6wtYt3FDVRDHH1AoubVXUFy6ND2LEU/3IEKkdm9o=;
        b=GG7fqyln0I/+VfUy5C6ZaP1mYAe2Fl9UHHtfJztlxFDEopD/+BRHglYIWWsjiBQNV5
         nzYL329ei7JNLvSnGF6uAOS/KhfSlyi58dfVRa86B9w/s/wm6t5dZl38NLYgOsTAJpsE
         2La3Uns+OPsuIlMedcNzMe3XCFWo6qskaBE1KsXJsTogSgPMIh+bIflJz0wqpR0zkB11
         yY67ryY3qtI8jB88e5gR1d8MzVtV16V/wGIkFM5zmtsRfz4hqPDfVvgKqgD1DUpaYr4N
         YTfNelwE/cItdu2F5pLowSyTrzuXud8e98o9EWGEHIp/IEj1vWvrrXYTaj5kVJ/3iNKi
         rbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469124; x=1761073924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2k6wtYt3FDVRDHH1AoubVXUFy6ND2LEU/3IEKkdm9o=;
        b=fP1Gfl/5ibyNbb66Vd7yCca+CR8wYUq4cXPzjvi7XfAWkDI2TbpSX0YMi1pyB/+JIQ
         w7mQ5vdd/N6CxYFGQo4j8TAKYteI7hsHM0w4g9XOw9fhEXp8mkAmsmSqXXKE2oHG9uvZ
         eZMYabbfM/f6+/VA6+g8KHNB+8l0ZzKIt/Rp91HIJhhFgn4yiPiTfiaEf6idOkLb3tV8
         c2AptQj7dF4UYo397wPNtjzm79kZpuPNTt2k+xQQrmA6ClTzcojFt04LB+k1F/SeDlUy
         kedFNaxxuzLiQxP99n666pFyHqwrmvgIvfeHbgloYMC9DJCuP7sgVNgVzjz39JrjuK47
         4fkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/aEWjBToIruYSKSQKswzy/ujcD+8M72C/75uSxRCuSPeSRMYrCzjm/II+PdLT54FDF6Nr@lists.linux.dev
X-Gm-Message-State: AOJu0YwBuUmLAvMVI3hUX8/N5zqVoNkvZ+vEYjFPzuhq6P0GA4l1y6YK
	AuKBxOg8JUcAmMQs3m1HqX+8sXVz1LfeDbuCMs0J8iymdRP8TalFc4DQQFBU+6NC/MFg6g==
X-Google-Smtp-Source: AGHT+IHulkYFxj6v34g0vqq41jw+L0+RXXWl3W28nXbYFSfeZcxshajXMcaq1+9j7wMsxlIF15JufAg=
X-Received: from pjto23.prod.google.com ([2002:a17:90a:c717:b0:33b:51fe:1a8b])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d10:b0:32e:d282:3672
 with SMTP id 98e67ed59e1d1-33b5138db1emr37538703a91.23.1760469124371; Tue, 14
 Oct 2025 12:12:04 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:11:55 +0000
In-Reply-To: <20251014191156.3836703-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251014191156.3836703-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <20251014191156.3836703-4-xur@google.com>
Subject: [PATCH v2 3/4] kbuild: Remove MFS flags from Propeller profile
 generate builds
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Propeller profile generation requires Machine Function Splitter (MFS)
to be disabled.

Change-Id: I12579e6f2cfaecefbed0ce85f1904f79783562a1
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.propeller | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index fa018098506b8..8c3e514dbcc04 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -13,8 +13,14 @@ else
   else
     CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
   endif
+  # Disable Machine Function Splitter for Propeller.
+  # Propeller profile generation requires Machine Function Splitter to be disabled.
+  # We use -fno-split-machine-functions to override any prior AutoFDO/PGO flags
+  #(in Makefile.lib), assuming Propeller options are applied afterward.
+  CFLAGS_PROPELLER_CLANG += -fno-split-machine-functions
 endif
 
+
 # Propeller requires debug information to embed module names in the profiles.
 # If CONFIG_DEBUG_INFO is not enabled, set -gmlt option. Skip this for AutoFDO,
 # as the option should already be set.
@@ -33,6 +39,8 @@ ifdef CONFIG_LTO_CLANG_THIN
     else
        _ldflags_propeller += --lto-basic-block-sections=labels
     endif
+    # Again, we need to disable Machine Function Splitter.
+    LDFLAGS_vmlinux := $(filter-out -plugin-opt=-split-machine-functions, $(LDFLAGS_vmlinux))
   endif
 endif
 
-- 
2.51.0.788.g6d19910ace-goog

