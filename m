Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DF23815E3
	for <llvm@lists.linux.dev>; Sun, 12 Jul 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858132; cv=none; b=FPvxSjwFWdnugtNs5snMcdkkfZQQplZX1JzYvKCTCvDIRp8X9lcdEK1dfOy7M4hF7mSaVBvE4Bpr9pPlioyeKlwtYMvQ3zIeif3FX960G1Bp+I/1G7rGEwAhSqc/rtbw1SUE2x4mgMfT3oTeA0vIyBpdjbYusrzRF5A0UmsBNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858132; c=relaxed/simple;
	bh=pDQGgOI51v7B8IxzwR27wEG6G8cVPR5Hlaz/kQw4AtY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tInQvqUDWCpD5NneAX0f7vmThNEPfZWI06SdfD5ncS0N+e5yoRng2wVlAF1CvDEJs+yh5mFDFuIZduzhwGC/5i5srJeHOSG+5jW7/x2REMk3kSamq5mHlAxLh/kOFz2duTrS3vUsuLsDwIkJgGU1REhhapMaWFobY68uRcZMS9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8RT30gI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8RT30gI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f75f7172so12129815e9.1
        for <llvm@lists.linux.dev>; Sun, 12 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783858129; x=1784462929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPDvzFIiqCdivNjWyVBd/1diSMnrRTpEbgxd7LdADq4=;
        b=c8RT30gIhWQSGqdoUVsqVR+Pxxa7n10NHxbMRoFYU+wJ2B9tGzxONPXI91F4EjqUdy
         /qNNrQjylklw4LbHPNa+xdASWc4WPa0a73R3Cq0EDsyTHhRIqFSFR5bVrKZ9ak28rQnI
         O/C06yz64Vjg0WAZBu1lEkxfCdl/zwTlGbx+bnJ2Ed8CgfPPonvH4AG/zzWZRHiVC6DI
         uOs0TQIdH48VdDSiOBzjmrd3bfyb2xtUUSPsvkL5zG7lYY4cdkg+h31BHJqE/+KG6BJI
         n321Z0d97pYtKWLxZ2sxcuzbuEIENO0VdXvKKU127L33ZK7ajYrRWCpzWfBBvwentcaO
         TBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858129; x=1784462929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPDvzFIiqCdivNjWyVBd/1diSMnrRTpEbgxd7LdADq4=;
        b=VFxjbNWJWAvEv/wjTeTpLPffVNxSH5hHQpo7QJH8Lm4WhS4nfGpa8oxfWM3gH9RuEY
         4389/EfeZ6pKF0BmyrcwokDWqiJF5rpn799cn1PX1lwkBgkApen4VPCaMv5DsjXj/UzR
         OaIU0W/Z4N9ZTHrhRSPv7K+0OiYVCp9Xn5msP6XtQZqk9z9cAcD8R1hJpnwkGqDKeYDj
         JAfrt5Da9EV0bvu7xpeLY1CjGTIl0HjdlpsAHrZ0QmkVdx2sFj1kcQn0kO3D0tx6bI7v
         slYUrlDxCyLtn7uzFFPhHQRMGFOgWW9CiyMjzb6VJkGOBBG7vRyOrLrURNgqYHk3klvc
         BAhw==
X-Forwarded-Encrypted: i=1; AHgh+RoXjunhPBPMBKDfTESNIZP9WnTy/aoJM04VORgdSTSrok9ix7YqzQZJ/XkaQI14+h7amgMu@lists.linux.dev
X-Gm-Message-State: AOJu0YzC3eNEKvCnqODnlts/YN0T6CwtNmdJgejDr2N9GaDMfRa2eD6i
	HxXAtBHn4pfQgCvwVuZh42T5HSvGs+BflrofrS+CHZ/EpRU7iVPKsquk
X-Gm-Gg: AfdE7clUmQwfX+iAFcpWfeeQsc6y4UbpQIMCpYLGnWcisb7WVymzF3Z6MSwS5g/MTYf
	coto7wf6ZO6knIYAPvRvSevKV1klPbd6nCCFMC3j0L5mYA8cIgAYgXREka9dgv67aBURCg6woto
	I4a8SzzP/TZqqNmQlK+dbM5Axp+dcJaKL68uOzbJereX1o0QRhzOV9t+DBQeYNju4kPCRx4tkIf
	flX0+Wx3t91/I7YmIXUCahU4mxDr4MUXt0NWwonV5AuwgU9sQzH4gLDCXd/VE83aS4W+gQMs8nZ
	CT3tzvcgnZK8KNiIkDDVvuZi5E/1JsQG7GLmQ6Cv5WvAjN4DE4XWXu7T9MPWVVEa0ERY3LF6SxI
	OlgW2P93KTTtdeOU/1dIGaLVzoT54WRHQIqjPDkzr+KJispVaoAwj9JnIdhDsAcW1lzksrY9tIX
	rzj0a8Ye2p8o96Kb8KkY1eKD4b/tzBxPgakqQpKdAXv77xw3ro/gaXkBdY2fqX3aksvBFXsjgPd
	sakMj9TXfpL4boRgoDCv/2LMA6xevHmxzp4HE8W2sQoVT7SGmnDN3pk
X-Received: by 2002:a05:600c:4fca:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-493f8826c59mr54375365e9.26.1783858128965;
        Sun, 12 Jul 2026 05:08:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-112-249.95.117.pool.telefonica.de. [95.117.112.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742d0esm287633135e9.13.2026.07.12.05.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jul 2026 05:08:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [RFC PATCH] slab: don't assume alignment on allocators that may return ZERO_SIZE_PTR
Date: Sun, 12 Jul 2026 14:07:28 +0200
Message-Id: <20260712120728.96628-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__kmalloc_noprof(), __kmalloc_node_noprof(), and __kmalloc_flags_noprof()
are annotated with __assume_kmalloc_alignment, which expands to
__assume_aligned(ARCH_KMALLOC_MINALIGN). All three can return
ZERO_SIZE_PTR, currently (void *)16, for zero-sized requests. When
ARCH_KMALLOC_MINALIGN exceeds 16, this contradicts the annotation.

Compilers may use this false assumption to reduce ZERO_OR_NULL_PTR() to a
NULL check, losing recognition of ZERO_SIZE_PTR. Current GCC and Clang
retain the existing range check through kmalloc's inline wrapper, so no
functional miscompile was reproduced with the current source form. However,
both eliminate an exact ZERO_SIZE_PTR comparison on the same return value.
With Clang, UBSAN also reports the invalid alignment assumption at boot.

Changing ZERO_SIZE_PTR to satisfy the annotation would make its value and
the range accepted by ZERO_OR_NULL_PTR() architecture-dependent. Avoid that
semantic change by dropping the annotation from the general kmalloc entry
points. Retain it on the cache helpers, which cannot return the sentinel.
Allocation behavior is unchanged.

Kernels before v7.2 do not have __kmalloc_flags_noprof().
Backports to those kernels only need the include/linux/slab.h change.

Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
Fixes: f6d50ab29afd ("mm/slab: introduce kmalloc_flags()")
Cc: <stable@vger.kernel.org> # needs adjustment before v7.2
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    This is RFC because the alignment contract can be corrected in three ways:
    
      1. Remove the annotation from entry points that can return ZERO_SIZE_PTR
         (this patch). On armv5 this increases .text by 1120 bytes (0.02%);
         no measurable change was seen on arm64.
    
      2. Cap the assumed alignment at 16. This preserves some alignment
         information but couples the annotation to the current sentinel value.
    
      3. Change ZERO_SIZE_PTR to satisfy ARCH_KMALLOC_MINALIGN. This makes the
         long-standing sentinel architecture-dependent and either expands the
         range accepted by ZERO_OR_NULL_PTR() or requires changing that macro.
    
    On armv5, Clang UBSAN reports the invalid alignment assumption during boot;
    the report disappears with this patch.
    
    Clang 22 and GCC 13 retain ZERO_OR_NULL_PTR()'s existing range check through
    _kmalloc_noprof(), so no functional miscompile was reproduced in current
    code. This is an optimizer limitation, not a guarantee. For a kmalloc return
    value, writing the check as "!p || p == ZERO_SIZE_PTR" causes both compilers
    to remove the ZERO_SIZE_PTR comparison. Built into an armv5 kernel with that
    form, a zero-size allocation is then no longer recognised and is dereferenced:
    
      Unable to handle kernel NULL pointer dereference at virtual address 00000010
      Internal error: Oops: 805 [#1] ARM
      PC is at __fc_init+0x3c/0x60
      Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
    
    Without the annotation the comparison is retained and the kernel boots.
    
    Would the slab maintainers prefer removing the annotation or retaining a
    weaker, valid alignment guarantee?

 include/linux/slab.h | 12 ++++++++----
 mm/slab.h            |  3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 51f03f18c9a7..1c63048f6467 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -632,8 +632,12 @@ static inline unsigned int arch_slab_minalign(void)
 
 /*
  * kmem_cache_alloc and friends return pointers aligned to ARCH_SLAB_MINALIGN.
- * kmalloc and friends return pointers aligned to both ARCH_KMALLOC_MINALIGN
- * and ARCH_SLAB_MINALIGN, but here we only assume the former alignment.
+ * Objects allocated by kmalloc and friends are aligned to both
+ * ARCH_KMALLOC_MINALIGN and ARCH_SLAB_MINALIGN, but here we only assume the
+ * former alignment.
+ *
+ * This guarantee does not apply to ZERO_SIZE_PTR, which is not an allocated
+ * object.
  */
 #define __assume_kmalloc_alignment __assume_aligned(ARCH_KMALLOC_MINALIGN)
 #define __assume_slab_alignment __assume_aligned(ARCH_SLAB_MINALIGN)
@@ -939,10 +943,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
  */
 
 void *__kmalloc_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags)
-				__assume_kmalloc_alignment __alloc_size(1);
+				__alloc_size(1);
 
 void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
-				__assume_kmalloc_alignment __alloc_size(1);
+				__alloc_size(1);
 
 void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t size)
 				__assume_kmalloc_alignment __alloc_size(3);
diff --git a/mm/slab.h b/mm/slab.h
index 281a65233795..aea1373c7f83 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -28,9 +28,10 @@ static inline bool alloc_flags_allow_spinning(const unsigned int alloc_flags)
 	return !(alloc_flags & SLAB_ALLOC_NOLOCK);
 }
 
+/* Can return ZERO_SIZE_PTR, so not tagged __assume_kmalloc_alignment. */
 void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
 				  unsigned int alloc_flags, int node)
-				  __assume_kmalloc_alignment __alloc_size(1);
+				  __alloc_size(1);
 
 static __always_inline __alloc_size(1) void *_kmalloc_flags_noprof(size_t size,
 		gfp_t flags, unsigned int alloc_flags, int node, kmalloc_token_t token)
-- 
2.39.5 (Apple Git-154)

