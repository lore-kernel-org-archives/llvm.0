Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097B446849
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457570; cv=none; b=l3PAKMYRGJV3IOrtF5JjgTcxPSuTSAaER/Nvra3T+/Ha9Vard/kIURGgGSkxFt0KisK5wz37yyfZ7IvvNB3P0f9+bYuYjT0OcNaEjmaSNWNSA7gm5mDDxyZgtKbF9vFHPCzGuOhuLdG1xXpGKxlZpMA0tdSZguBY4IJE8AUpZps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457570; c=relaxed/simple;
	bh=xWPijaXXRIkBoc/QHjewJtmMl0ZST5M/cYh7D7YQf7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B81qV89B4cOSBEtXzv00cnMvtfJmub86qiLSGCZKrshGKaLXWIC78jyF3KyFihYle+gVIHdDDX1LylCJZpdLB+RGMBO85EuOXmLSaIA6kU/SxkTTDYp5+01rIT99Pgfy+vhE39QDbi2df1peJTTt4JZ1bRyRB7xZ+lzyDTXmhKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ldv/7GQw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ldv/7GQw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1319182f8f.3
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786457567; x=1787062367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwwTg+OQL0Tw8flGAD/WL1rLA9ceEVBQqkqlLz//DPI=;
        b=Ldv/7GQwl3cTc4ZbvaCc/BHYWK6ndNcqr8ArBGRb55zvdobSgvEJUWb5AVXfF0uLUt
         1WXByf3WGQHvvqGs1NRA2tGw0Ap+jQ55Dz6NhzmCPt3tc/fYa3XaqnAwTSGHi8i7+0ls
         GntCQFFc9RjkN23K0QpIVIrT3VrhMNaRoxIReU1Lbo+DDnUfvB9qRAwKhn+JkRmVQfyy
         13qGbEDfuFhdokXbyE7JVvMDka6pH9p6O6g2JQKelCtr+CwZny9Lx7cHCR22RXIUoVw/
         K1c9Z4hRk21qqnQ3XHIbk1KgNZ4V7TMcEzXo1WGVyTmHEQgg0mBFeRcV2EW6AgHlJmzF
         HOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457567; x=1787062367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwwTg+OQL0Tw8flGAD/WL1rLA9ceEVBQqkqlLz//DPI=;
        b=atUw+wvK7s2Qtrl9dm+6TrFyXQX2ztEbQhg0UapvT3IFB/MlN9POSa70//8KLeCNSz
         i0VDAYXRoULo6E4GahgZCf1Jxu4ISdyXwA1w1+RpY5nRc6t0wT1q898uGOWk+Ts4PLA+
         MeogJd9YxG0B1rCzCw9ThV5OkXA6xDB2x1vu/fwdrnq0fncEAC1o3srLGq9ry9ikGvqc
         ODQSdRT344DrwGVv9P5KhwAQ15gsUEHmt7Xnd+5mjRC3xdVcSe3AvWpQVM4A3a0zb00Z
         xqaNTYuAk0uPskNE8A8lAP8gSg5KL2AdxgSdzZXuJFUNWGzEFzvOXVKHFMaZ+5AsRyY7
         b57w==
X-Forwarded-Encrypted: i=1; AHgh+Rowx2/pcKVWQzsdryhCrDiVsoEH112dhdW9NbeAWmBYIQhuJPBFjec4rR0QEdF00hZnt2vc@lists.linux.dev
X-Gm-Message-State: AOJu0YxfjbAhiARfq4P/ph09GAR29jJUCZpPjSXq6EIDDzbyim0uBBue
	B8noRJzhAwIuPqGjWh/e5Dhe+aB9Cxmjw9QNXkfQSXr462eWraQVFSEY
X-Gm-Gg: AR+sD12oLKQkFeB+S00EysfIGEBEazDGYlIn1s5BGMMxjggTWCbAKwidNBaxm6zwxI2
	jUEnxm3AIKAtuIhPYihiu/Lniyg/R3e0Mli2F6M4VNbyMT/cJ6kaeO2LlO6S3jb5uCjmRX8dzhT
	j1IX3JOasB5A8DrNxI9vI6ZvV0vN1RjYlvqmQqNv84Ly8R+BRmRSimOMbv2tgnCs5pK8yOwtWZs
	CTsuE6K1GVObhrWg1bjJWNS2yj00ftml+2tkYA86wA/jX1D4ZSCavGr17rB8BmOj7W+wRwbD1tE
	Y0uwAoz5gG1ajBeKGtAxM0GD0ecFuhVF2PovAxRh1v2EzgeajtJSBamML3HGOCJK3h1aecSuWjS
	ENqBxLO+kdNfHvdfI46xo+qPqIfu96naqWlYREYBMwZ/dm2pgpwzVwqdbsnz3EySbYkG4ThD9DN
	zL/ML2vVQ27renTntInKqPX5GiLb5kNXl6GlGMUtFVGiL2ECmPQrfV9ss59B+YYhlDFNl8O4eCt
	v9LFzbn32DraH1CHLTAPBYIuudaQHzCsaBToN7mRI1b3fVXpwV4gIUthI/dYmX72/jKEDSAt6YF
	K+VmprvWpjoyfwz0lxUrMOag5izi+EFz23FR8sADCNhv+qJzgQsoE/L4QjnkE/qNuN3w
X-Received: by 2002:a05:6000:240c:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-4814aee3ef2mr5025916f8f.29.1786457566359;
        Tue, 11 Aug 2026 07:12:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be29fsm4464099f8f.12.2026.08.11.07.12.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 07:12:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/3] slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
Date: Tue, 11 Aug 2026 16:12:38 +0200
Message-Id: <20260811141240.62519-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811141240.62519-1-kmehltretter@gmail.com>
References: <20260811141240.62519-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc entry points are annotated with __assume_kmalloc_alignment
but return ZERO_SIZE_PTR, currently (void *)16, for zero-size requests.
This violates the annotation when ARCH_KMALLOC_MINALIGN exceeds 16.

Clang's UBSAN_ALIGNMENT detects the violation on armv5. GCC and Clang
retain the ZERO_OR_NULL_PTR() range check but eliminate an exact
ZERO_SIZE_PTR comparison after an annotated allocation.

Define ZERO_SIZE_PTR as the greater of 16 and ARCH_KMALLOC_MINALIGN,
retaining the existing value where it is already aligned. Assert that
ARCH_KMALLOC_MINALIGN remains below 0x100, the value of LIST_POISON1
when POISON_POINTER_DELTA is zero, so the sentinel remains distinct
from that poison pointer.

Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/slab.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 32c9f8ed7ae20..3e012cc4f001e 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -259,13 +259,16 @@ enum _slab_flag_bits {
 
 /*
  * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
+ * It satisfies the alignment promised by __assume_kmalloc_alignment
+ * and keeps the historic value 16 where that is already aligned.
  *
  * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
  *
  * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
  * Both make kfree a no-op.
  */
-#define ZERO_SIZE_PTR ((void *)16)
+#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
+				ARCH_KMALLOC_MINALIGN : 16))
 
 #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
 				(unsigned long)ZERO_SIZE_PTR)
@@ -622,6 +625,13 @@ static inline bool kmem_dump_obj(void *object) { return false; }
 #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
 #endif
 
+/*
+ * Keep ZERO_SIZE_PTR at most 128, i.e. below 0x100: LIST_POISON1 is
+ * 0x100 when POISON_POINTER_DELTA is 0, and no architecture currently
+ * has an ARCH_KMALLOC_MINALIGN above 128.
+ */
+static_assert(ARCH_KMALLOC_MINALIGN < 0x100);
+
 /*
  * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
  * Intended for arches that get misalignment faults even for 64 bit integer
-- 
2.53.0

