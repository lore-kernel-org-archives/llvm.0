Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D4379989
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467867; cv=none; b=hsq2JTKKFGq+P80m6vi6T+DkiYTXu/JhRy1f/VuMhN4wMICHMkd05LzJEoV+YY1EgZD0ehshtS2b8ER/mTOqY9O7EFmHxbH6sLuHh6ScNBgu1bILK2raVCg9qZm8QFHnJZ0TjByfMaWk0wH+GggEfj5t/zk9gl7lztQXmcD9RRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467867; c=relaxed/simple;
	bh=0mPWZrRtMVPeUI6XJyCqfL68axEeDCO9y1H3650V6jM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rao0gZczEwQFPzoDiHZYhY10uGLswL5B8hYObY2qEKgWa+F5/3t5Yzydit0avTXY1l2A3pXLd7fhmw35+tmKWQyvoZPlZeAHaMXEshFvZJA/+P40XORcOVhJjjXqsUPvw3BBVsFMiyQaFBxJh3nTNLCgsxbEqXQ5FCJFsLWlMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtMUt9SR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtMUt9SR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484362f5c4aso340374f8f.3
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467851; x=1789072651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnjfNvCLnsTvxUWLkyT6RSPdRaY1HQsFa2V6exB/dnE=;
        b=KtMUt9SRqVc1mfTu2spT23g56yFXiyuvMMDWK1S+s+y6AtljTg7Dxm20PVAYuuAVGd
         efEcXHvphUzeUM0lujWM188rUVkKSIS5DbPeKQaTnH+2BtxHRMzUQOgmjiqcg20pnsDF
         rL6TVv/b68R12juxUOA2jIPeuV6+5aQrumDBByQDkeRthOVhH9SzrvuFmue7+ozh6O2V
         +gw3fALbCNjrwaWUqzgtPIEkyggiIJu+D7dvnjkFq0APpkJE5bPlE7DoEkRiWUtmlNWT
         rYN3hbNpo4qKbF7KAM2e2nidQQCsVgU4OLt2ImeUZ5j1t3TbJPyd7u6tt6L+gN8T25e3
         04Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467851; x=1789072651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TnjfNvCLnsTvxUWLkyT6RSPdRaY1HQsFa2V6exB/dnE=;
        b=Oz9gz8eYx3vg1bH5xzxHkH4YD1ULvXBig2xaWiDCR8X/XD9+HU+HhNQau4dAyXM9Q3
         FPXG+lvtT6Ne1mrZLRLJlghIVFHkxBzcX8xTckaPzDBdFwi9I1LpsFP7enFrukJOyhwE
         IR9SpGtfXgAGOEtMT53mt3NoHZ9+rrs1wGgdb3P5fJIyJfh4WAVbJ0odkp++csOFv/wp
         h5gYDyVqdarL3qNiotAjvP+kzCrMB7FUouY2OMubOl19odZ2jlHPgxytfP/fwoGdBgzV
         YblRdadnb+GU//mJclEhDexYlJHtxlazMqhVD0le1BZQ6wLQSMKrqqwmZB/Z1BOyYF9W
         JKZA==
X-Forwarded-Encrypted: i=1; AKwUvBz0nSwWlHVUlXRzc8MAeODeF3MXgqFLYdB19eAArDO7/mAJu7qnqFogbbgGjuD7uY6kuYYA@lists.linux.dev
X-Gm-Message-State: AFuF++m3MvRWGp7ehQhW9gOhD16uz3dfsqJYLbhYNs8GBPIApfy2qO+C
	NfVMDiOt5/QW20nFPsuMzVfV+O8SI0Zk+KdUIuNm/hmq+M/ge1xfLavv
X-Gm-Gg: AYBFou2E+YUz21XlhXDECQxiRisAYrmdWKSDjtzfOpazyEkuZha1wUPblztDNCCSsJY
	p3Kz4rOR4A9f41AJ/khFke12Ld5PbKqKKgRXGXFnWLJtMXDh5hj4EMYCmw3oh/YhdO02RSDYZBq
	VcyLYlMCMoAGGsyUHyYakcMNPYJIVvB6NSILQNMumqYwYX7pnK1B06h60UNAap+6ZDvCA1s/kal
	tmlt9D944JDcPKsh3M7T0EN5gakMQb0x1dg2bQIAjr9m2sSd6J9H6AVP/D4xwO3C3EDOiCjZpdD
	cJ2QP2CEdDFOmuj0aPNgRCcp7K1Da+PgWAEJK0B18zFW5rpIUNqotq4gkHdzgIAu05cM7i7dMoE
	vdTBRwCzAaMruVx9TYKwAkXOSKrL63tOt7/8EbG2norFg4Kj1TVY+7tCeuO3fbVjHTkhaIafMUt
	dmhez7epPUtTvg1iemhcvxkGaGfg17z2i1bo0dvBEgf6yh/Vp+/+AJtZ+/xDdQ9AZLxf2qNP+NP
	Tz7vNKPLU3LZX2Tt1QHM+EFshmcCPN60tYiGUSJCQQviVveiCeK8NrYAi7bRAbeyrPI0XDcA3DA
	7BRSwOJqwWSniEFUC+gi9pyVCJuWIDPbJ9E9yJmcskiedTU8qOVnrBBCZ+YTJ5eTrrSS2yhynoc
	M4fIoKy+pmlfcxWes
X-Received: by 2002:a05:6000:4b11:b0:485:8313:9f47 with SMTP id ffacd0b85a97d-48587055d09mr3572292f8f.10.1788467851379;
        Thu, 03 Sep 2026 13:37:31 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:30 -0700 (PDT)
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
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 2/5] slab: check for ZERO_SIZE_PTR by exact match
Date: Thu,  3 Sep 2026 22:37:17 +0200
Message-Id: <20260903203720.63689-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZERO_OR_NULL_PTR() returns true for every value less than or equal to
ZERO_SIZE_PTR. With the sentinel raised to ARCH_KMALLOC_MINALIGN, up
to 128 on some architectures, the helper matches additional values
that are neither NULL nor the sentinel.

Compare explicitly against NULL and ZERO_SIZE_PTR. Store the argument
in an unsigned long temporary to support both pointer and integer
address arguments while evaluating it only once.

This also changes check_bogus_address() in hardened usercopy: nonzero
addresses below ZERO_SIZE_PTR no longer cause its null-address abort.
The rejected window was incidental to the sentinel value: address 17
already passed the old check, including in s390's mapped lowcore, and a
principled first-page bound would be a separate usercopy change.

Apart from hardened usercopy, direct in-tree users apply the helper
to allocation results or explicit sentinel values.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/slab.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 563dadc16d82..458c4229b1d7 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -273,8 +273,12 @@ enum _slab_flag_bits {
 #define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
 				ARCH_KMALLOC_MINALIGN : 16))
 
-#define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
-				(unsigned long)ZERO_SIZE_PTR)
+#define ZERO_OR_NULL_PTR(x)						\
+({									\
+	unsigned long __zon_ptr = (unsigned long)(x);			\
+	__zon_ptr == 0 ||						\
+	__zon_ptr == (unsigned long)ZERO_SIZE_PTR;			\
+})
 
 #include <linux/kasan.h>
 
-- 
2.53.0

