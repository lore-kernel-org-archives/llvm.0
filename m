Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4984028D2
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499143; cv=none; b=SxI2HpOsv73Xd73+A1ZotEYOBuXqy1Jd6kwb0+59ir2vP+78vAt8dgjhDE8B8JcctHkRwZ1nrjCNFSfSIgDRhQ1RrcjxcjPEw/ew7CM/trF7UKw01wbq+TD43yhadi/29O+ldYaz1xoi7EJjv3K3VLRKGThAKcVJYSxvJfZVPgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499143; c=relaxed/simple;
	bh=fXIh5PA7kbCyYYosmW/TTl0n7NYNoz+MhA4tzXltjEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGibg+JVcEza+tYLSTFslbffazCCTXa7IjPLUUjoPutUkC1zJVJVP6JYXImcvGqGUK5r3raqPOmwSbRAmgwPTqJuX8NLokOrqdhH+Wv77uV9uSMOZmWI7nHWNA4vjUvnQ413a8B16/PmobwnnW4jgvhOB/0ipfZcG8wFbrtTkdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozclbIo7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozclbIo7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so4727435ad.1
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499136; x=1784103936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e/NFLIY5ko2z4Ua5YIOk54c8MAKLBSvbGyu1AtkwQs=;
        b=ozclbIo7u11S27o4MUrBqopR077ZzhkN19Mup3/T6pbTLyOE/HY9gwju79tNszthnr
         Qv+cPSEuXnF7gPdnuRGMO5IGoa+nyteDq1A9sU/JXI+T9D7OmESqSqHVKsans/P5IBoa
         b+VWWs8eno8WgITWfNWGTPmobu56w6wIladwH4QeEHOHSs4cUGSz97z7NAUhDct3t+YA
         9YkHvdLVlPjnQZPyRufsC75aVJFXOZ7iWvrISPU7Qb6ajBCWW9ThVGZycZ5tcNnyUriS
         5LXA8KmB0Rh938j1qSlyMgReNlBB3gdHRZ8gNOd3w4O1uGMWEqRI71v0c1NVqdOBcutO
         mMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499136; x=1784103936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9e/NFLIY5ko2z4Ua5YIOk54c8MAKLBSvbGyu1AtkwQs=;
        b=Udd2TADdtUSJ5ZDUn0Y8bTxiJbFV+g5vTDKOyGrTVSxjHnH21a5orF3AkjoUBMiyeT
         8W9DEu+kIc6H0AwmYVefG6ZC96WOJb5OSsZ/qo02HxGQRMZnkl00wqsZB+b6m4/lF4Jq
         /2LzgQv8UfSJhTU4OWTFcy5cMwmINcamNnGTTTm/DsbvBNZxPAileMACAfJ3ZLvEDl56
         bE0O64SS0fJMBVuGrnl91Nz77uJUrFDCvFU+9DaKEfrR/1XpOVuz6R7K4A6s7N2uJeTQ
         3ch3zZBmwv/r9S/jdaZiqZhFI8h8BBQPcVYUnRN8MaUPVjkvoPu8atKyd1rgIhmPkGyC
         WNkA==
X-Forwarded-Encrypted: i=1; AHgh+RplCBO2kn0JJyfP1Kl5wGezPGRkcMdQLKgCA4u4EZs/H6oxxN3gLVjC4HTKelWGFKuZe9If@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1QLIdUOWd6H6o+iOOsh1OtPUg6FfnINzQ7nqADNwt7IhP5mow
	HP2/btvlxI8h5MpZyWvhvc7yWezU83S58C2cZ+TGDvJ2jDrk29EDSe5e
X-Gm-Gg: AfdE7cmQUB0XZ5qchVX6s1kDss4L+Rrl+M6DHDdBtD3OvC8Ba4C+5Wj1iTAbmB1ENKJ
	dtPCWaJuBLYJLgVIHoC7LyQ3U5uUHmS0RVqhUGumdfydo8xBNzyr8Jiu0DlVtAhkCuuTAkL+sVn
	Gzi/QzTP5Hm05NNZr7PkKZiGha9B4rNp4tdC3+NlT24p7D8CHcJ3le3S3aMaHtIpJLlsywnNAax
	pmvJblRmsRwmg7O6RKEZxTYNj+fgan2Yp+mMqYYMZ93ugUrnFm8+DU9WNsTdjDocK06/9z/GaVV
	WJYRapQgPKpNHX6g558lNbvxNc1NjzlMTlmmHYXrnCS/Lvhu6JdFBGBXvvkzQYY48UtXfrgNFt0
	kFe6eFl90S7VuEDMCuvG3h+6IobeLSD4WYspCVJtDRPB9Pllsgf/H+7/0ZObXsNMxlpY998eHci
	FUdaqeKCi1nqUP1wPk7Oly+x0Rx5xaY86yVBrTL7qxKUBj+buj2LAGQZL3kquNBojUnA==
X-Received: by 2002:a05:6a21:6e8f:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c0bcea2f17mr1778731637.44.1783499135994;
        Wed, 08 Jul 2026 01:25:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:35 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V17 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Wed,  8 Jul 2026 13:54:49 +0530
Message-ID: <20260708082454.1254320-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
index 998e31052e66..4b90a1390ad5 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -58,7 +58,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"
-- 
2.55.0

