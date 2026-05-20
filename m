Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC036492C
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259635; cv=none; b=B1JT+tQH2ygK4yEMvwzVtoPaR54TLIV/z3H25T9LnXaBrMW4hPLGeNuNFX1f/iWb7QMw+Jp2F8uK3bZQs6ZKxQ8pxuxVEkIm3RuwlXeFqJFOOv/4oB2xqEG7pRpeEzF8ezNpyJgTBnwiHm99pRJq6ZK+HupVw8h3xK70QtrikoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259635; c=relaxed/simple;
	bh=QR4QWT8k+mmoz6qnrdIi5qqyh1l+8z06HXGD6HWzkqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrN5kHXqWTglH2PVt2V1r/abvqdHsHmAZJsFBZHSzJV23i2o7EGyiia1tVfpsV6hJWxcWp8q4O7t32Ol+IYqmBglxJKG2DirPXdaJEiwBhEDOI9uK0xoTZ/5UXyFAENdgNr5SqGmGAAOLZ/UcuBFkk2MX7t55boF3vxNoh3ULXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqxJCBgV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqxJCBgV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso2039385a91.3
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 23:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259634; x=1779864434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwRmNG2JwhRhCrdTLWtC2EcRcfoo02ZJ1Bao6+rpdQ0=;
        b=YqxJCBgVsx/8sbK6U3pDSkD027rjtRNrfTZk7em4fE/Cc5mdqV+GsbQnyDVuPk+Qo3
         MiN6jWMw3buHSaLSWrCkj3Mj5tL28NggpOpzNGMXoW5qOcQeS2tdSOGvx1LO8dp4e/ai
         tRANZqdHob6o2iopLRQmXEri2xVFloxprgznibND4lLh2LoRwIqNDmzeCbSxUCNWx02e
         doQhQHwgdXB151tMJIerzDXxkRdoklauL4u9LwXF6iAoainc785B0fRuoiEZH/yOLuHF
         5CqirJYkyYJz/RnnM+VSJvGpWBcpBPnlah5BbcnQNI2zwkEMsU5MUGn0ywWwBX38vGHw
         3DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259634; x=1779864434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwRmNG2JwhRhCrdTLWtC2EcRcfoo02ZJ1Bao6+rpdQ0=;
        b=sSzDQNIuicOlGNvoTsBprdLET5wGRUUbKdFiZWLQNCSlB819u602DAYT1QKEZC5+QN
         MRINBCvAv7Foy2qFUeVuLZ4PIWlAVX8gVPGYE5LB9XOgXmxob08K/ernen1gHpQwjY8/
         WEXRtChhsvAA7o1zCb6A2ZWtmnKHo49m5S4D7W39iv7jq0jij7TZ1aG3QIFBcjCyAw++
         rK+ISih1/SUvf2jKC5do/BnIXPPWpfrp2n1/93Axxdk8Yfrlpk5PxBXk1doUvpEfAgil
         AEwfn8e/UjJ64Lzvnmf8+DQhLOgmC/MRiVW+WwH4xBgARJDPl2YBlcW3bo1G1nTcPZ+A
         gbVw==
X-Forwarded-Encrypted: i=1; AFNElJ+antJJNkbJSF57DTVs6EejNHtWfdW7WC38XP56920tsxJD+1RETrBQWRpnyYAYog6YWZtk@lists.linux.dev
X-Gm-Message-State: AOJu0YzEvfh+kL4tBBjnwWj4uhdkxW0GzXQ+kcBDPT0zWYKSEEoDJgYh
	qRUUdXEYPl8j85QF6jGxNXZgnZOZ7S0OAgMz5uaaCsuqJ7bwRWU6RBb9
X-Gm-Gg: Acq92OEOlG123PrzMNDLSKZ+xUIyKyCJxK1w+/00jTg/jDvAfg7trU0XlN+5fJ3dUvl
	11tb8c9SCjRflZpy3uiZh5vtZ43jS5S23T1ZJHwQu1GJDjj9lNdn6EsTrCQEHAZxMjqcvkoZfef
	HfvD3LszZrigPsS16fH3JjzLdK4ucMnxSJ4u73z388WC6tq26lcqEiGu0xwyd7qaXTGTON/WB0n
	uaCvsh+vf5wrCJSCCWrT4CZnS4daxdOy1XAhsgEbr5nw5Hb5S3FKePDSTLjKxXoDbbXVMVrucLC
	1HVRMIjqIkwJhV0LGYwHQtOddOBwV9YOibz2ET+JrjEKjk2fEh475JYtR42O4M2xFQwbaS5QY53
	XqRv5Ww4HTf+hzbOW7i93lKJmc4l2tgPqkKzkEILG3+x+U0tp2q1fULjgPdmc6arWUTIZo3N6Nb
	5CyFbPP1Pheh/9ns4Kc8CDC0y98N+NFoHxfBjBe6pprePaugjxnjoKgFJMBWk//9EETAfVMJkND
	ZTrUnNvcVZcrCM=
X-Received: by 2002:a17:90b:4a03:b0:369:7003:4e30 with SMTP id 98e67ed59e1d1-36970035860mr17374050a91.15.1779259633583;
        Tue, 19 May 2026 23:47:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:13 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V16 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Wed, 20 May 2026 12:16:24 +0530
Message-ID: <20260520064630.1785283-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with LLVM=1 for architectures like powerpc where
CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:

  ld.lld: error: undefined symbol: dma_resv_reset_max_fences
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)

The issue occurs because:
1. CONFIG_DEBUG_MUTEXES=y is enabled
2. CONFIG_DMA_SHARED_BUFFER is not enabled
3. dma_resv_reset_max_fences() is declared in the header when
   CONFIG_DEBUG_MUTEXES is set
4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
   which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
5. Rust helpers call dma_resv_unlock() which calls
   dma_resv_reset_max_fences(), causing an undefined symbol

Fix this by compiling `dma-resv.c` file only when CONFIG_DMA_SHARED_BUFFER
is enabled.

Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_lock")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/helpers/helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..09ee5cac600d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,7 +57,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
-- 
2.54.0

