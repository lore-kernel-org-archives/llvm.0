Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB35375F9E
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186668; cv=none; b=N8QV9y2qnN6yDMqFbXqY3QW4lEDsjoGU9XIw/xLUSkULIi4y8DkDbcb0xqgSzxBDVqqDcmNtYPty/bSM/fjXcvjY+oiMGZb9yZRZAEy4jGtSHceJO52ABMIhv8oyre3RK1kt29sqAPcOfu6xAHvvZaaUPSC2EPDDeNK0K2EAuak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186668; c=relaxed/simple;
	bh=J6KvawtO5UvDf4unv89oYzIRdqsfY2CABTLPZitSBew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ieHabT/b4ywu1FpDZfQxS+FmEfjE7l2wnE1PXra1fX1fIb+JK+rJN8LfK8vr9aNpMSkDgWbI5KeiSEctQ6btugYUNY/JKOFQ3CYNsl3/ZW4mjU/ecqYams+9CILawTStYiBzvg3WJpYERBzv73/+vrOqLWoWHytI84IShwfchlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRai1YbQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRai1YbQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-480033bdcf4so141831f8f.2
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 03:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786186665; x=1786791465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4uScLI4cpsUUGrfGmDNzyeUDMx7+1ql508c4euP1/Hk=;
        b=BRai1YbQ3lqlUlR0UE2Geh/4MEqB8SHH+hMutGPrERsQEhrf3yv6CtVeoiPDov3rYJ
         ag0AY1MBrvW19QhCKvqNfm8vM1uj+EIzRC7HkKp+BYX54YQlSD88t5i6TT/424yzIRCT
         YoAvBp7b9/l4cgb6E0zUkmIPJi08h02n6666KmZ5D62je6PTWID82yj6mVRNAEl9T9Vw
         xk6bFZad3dHZBADV3k7+8k7vjzqNbuaIVEQ1akyzE0A680Vcj6Do/guPJD3x88NfNb6l
         rTidGJcrzRNuyJUedos9zLZF8X8Q2PTbVmwugFIQasUB7YJwZYRlRe9w1CO//trFh1Kx
         zjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786186665; x=1786791465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uScLI4cpsUUGrfGmDNzyeUDMx7+1ql508c4euP1/Hk=;
        b=CHw+urXhbxFzuAYK1flt9G62NApVEtr/hF4puUY7zmTin3uFmoNTENpKj30ABTdbbJ
         Sx4/qedzal+UIIfwqw2SsvDiysBpo7Chc9Ly7EwQfYoBRTnmqwxApznUcWuRCZAFCLO/
         y47rE+AbFGjvtKKbUUpAeH61A0eJAHMn0JfB7YMNlvFVhpcmBOm2wOrwMEdMEEEk9R7P
         Oja/qiPF2q8BZXiAk4dWAqEoqUZTRcd+21aCvQt4skOIdTt0Wp1F2gjLtmXUo9QhymfZ
         f6lCRu6MVqnzcT20z2rpId5YoN0fKuDXQbyw+5GiwTh5EOuJegkadFDVH6qxyE+5DPAp
         kVEA==
X-Forwarded-Encrypted: i=1; AHgh+RovX/f2kE8Aw+81r8eiQ/h88RvyLVUUHc5PoxgCoxHCzgFu03wRzQHgJ69XN0fybryKy03G@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ4OXJIbh5eLa5h+LFXdFJNOfsBX6m/1j9WnJ3DVdmnM2tFg60
	fJVx/ytmdUP8CMZHem3LLzJmCLrf+xIdLoYhpEuy74TRJJtZDpJZ+zJn
X-Gm-Gg: AR+sD12QfGWAS4X2P6X0ZrX1VQ0W/kzx6Zyc1KTGKoW/FBrZ1e6I+2kWLpZ0Ozqte0P
	6sPmFsjpP4vRBojyCafn22kK/MbajqmBhYksFVid4gbNhjRbKNF+regAcZhDCY5o1zoFHZe3SPb
	OMUVQROEhStWjoRUtX810LfhPnwe3TWOAWY0Edp+M8v/LAvzF1hBTMXJCNgE5iWoIRt5rFCOecI
	Z5YhGiyv5rkDJ8p1D3UQZ/jyM/FOhOfuqcpacMCI+1d4nqQ30GASVQ2ZNgHqlqOwFOopqoT2wp3
	JQiNIDx0Kq67pCBghV/cbD+4VNRzgLM8/tnke/GE8GNEhvU32EUs096UoahtYvKexNN0u09wqUU
	aX8KevjcG0Q5hJdnbOGVoyieBwddpY4auttmhN5TlsmC0Tu9pGNUFtF6H5wqfmBVv+Gtsv8yst1
	NSdrGy9CvpiQN9M6iR0LXnQGaCzyckW8rQm8o8zHHehK/vE7nqChYwZ+eZAHsuBKmKWzwjXT5Yb
	7PebfeR/hEwEUlgwpVirKnjYwkR8XVeU7tWPgBl96oFGcstdmbWau1T0SsqwSdiX+A6HEU8a87h
	fhteCSaVtNpsQQeJ8pN3x9IKSazeR9M=
X-Received: by 2002:a05:6000:2006:b0:480:c5:d635 with SMTP id ffacd0b85a97d-48000c5d6d9mr18245404f8f.0.1786186664921;
        Sat, 08 Aug 2026 03:57:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506desm13940854f8f.10.2026.08.08.03.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 03:57:44 -0700 (PDT)
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
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
Date: Sat,  8 Aug 2026 12:56:22 +0200
Message-Id: <20260808105622.62026-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

This can mislead compiler optimizations. Current compilers retain the
ZERO_OR_NULL_PTR() range check, but GCC and Clang eliminate an exact
ZERO_SIZE_PTR comparison after an annotated allocation. Clang's UBSAN
also reports the failed alignment assumption on armv5.

Set ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN when it exceeds 16 and keep
the existing value otherwise. Assert that the alignment does not exceed
128, which keeps the sentinel below PAGE_SIZE and the low pointer
poison values. Deriving the value from the architecture also avoids
changing architectures such as s390, where low absolute addresses are
valid.

Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    This version is based on the RFC discussion [1].
    
    [1] https://lore.kernel.org/r/20260712120728.96628-1-kmehltretter@gmail.com
    
    A tree-wide audit found no users depending on the numeric value of
    ZERO_SIZE_PTR.
    
    The static assertion follows the ARCH_KMALLOC_MINALIGN fallback, the
    first point where the macro is guaranteed to be defined.
    
    Tested on bcc44b6785f21:
    
      - armv5, armv7, mips64, ppc44x and sh4 with minimum alignments from
        32 to 128
      - x86_64, arm64, riscv64, s390x and m68k as unchanged controls
      - Clang 21 with CONFIG_UBSAN_ALIGNMENT on armv5 no longer shows the
        alignment assumption report
      - no text, data or bss size change on armv5 or arm64
      - the exact ZERO_SIZE_PTR comparison remains in armv5 code
        generation
    
    The sh4 test needed two unrelated workarounds, both reproduced on the
    unpatched tree: compiling tcp_output.c at -O1 because of a GCC 15.2
    hang, and disabling USB_OHCI_HCD because of an sm501-usb boot failure.

 include/linux/slab.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 32c9f8ed7ae20..0798a714da87f 100644
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
@@ -622,6 +625,12 @@ static inline bool kmem_dump_obj(void *object) { return false; }
 #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
 #endif
 
+/*
+ * Keep ZERO_SIZE_PTR below PAGE_SIZE and the low pointer poison values.
+ * 128 is the largest in-tree ARCH_KMALLOC_MINALIGN.
+ */
+static_assert(ARCH_KMALLOC_MINALIGN <= 128);
+
 /*
  * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
  * Intended for arches that get misalignment faults even for 64 bit integer
-- 
2.53.0

