Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020393C9ED8
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760864; cv=none; b=uppXWXBVMWSsrr+eAJYelYu36SQZYH83to2TLsF3/H7UgRfdksQPEZdQ3ig0CflY9h9jr2czVd7ob3mZWcIQPhMX/+U3hkImnNGM/x2W2ipxFwFLm9an6rOOYDoOmO8MnccB7Mv9BQ7WnkU0hzt9wneyPvn71w1GEf/ivpzDWFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760864; c=relaxed/simple;
	bh=V0TkAqIwC1uY4UojH401/uSwLwk9fm4HWydEZTlvEmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIxXUhodkzY+ew4p/x2JwBZ+hiMfeRP6KhRetIISBdOpBSlg5k/hLwB+0IM2Kv/dgbeJVbj8POSuMCRA5razx7ZApLiXuipe7r8JaoAbnewocScXD8/9JUUeVKa+hTP+r32/LAqBYuxUX6qtoWX8bwxqNYkspbg+5+LVrXIf95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idrKrNRa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idrKrNRa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so38030625e9.1
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760861; x=1779365661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRooYCCfpJIXVfO+TbuD+FrPZ3PAKdcOterQ+HA71Ww=;
        b=idrKrNRaQ8CclqSE1neDQC4XiX3Ww4dYQHg6Hc2eSZF53xRd+IeybzWXG0+TMy86Ms
         Dg3kOVZUmJ3lSFdkJPQU3we/0qt0/hIzhQmWBLy+fbw8KD5rQeBQdE4lzx0ADM+pVoYz
         B7UCk6kX6m5ZB/iY6wbRsHw4bh3B87c4GjcqhgNSneCKEGFmM7s0Pta9XOOauyBjrvWA
         HAvwThCj9iaq+8n2T0v1LDpQIcJTLS0yuTWxIepAT7fjiPTJ09GtDZ42qq1GPO87boRX
         TYks4Wx+U8Fxqi9aVeR+jEpKCJNB1wIk5ukWL31tmrvpLOaP2hJfoz30C/8335ZMc53Y
         hGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760861; x=1779365661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRooYCCfpJIXVfO+TbuD+FrPZ3PAKdcOterQ+HA71Ww=;
        b=GxHinD90/AdBd4xmlwFvnOnuwpVIeAVHiIgpzZrY4BmGtve3BEu8jbVDKshfl+wlGB
         arQy/I6PoLqrpdUpbR1BrYgPUGIhu4wJw526TmopkxpK72ECZgKGmU9QmECQdTSmLxks
         5rvQ3u/JNkxPFsBR25eEK7rzvFiLPrbKVYU6g/hUmdL0gms/IHexsFMtkjbmo0bFr/Sz
         gIP90STM/4C4HFxwC6H09caOi/KcnQSK+5pdKLip3B+WuggnDpnlfzHWYy2rj3wjcwi2
         ZdPiJYB2KQDsa/fBUz0PczBoFDmkdR4z7h/9RZ2bXUqYCZhp0zR8HUAX6PgzyqpmPYJT
         XuSw==
X-Forwarded-Encrypted: i=1; AFNElJ+/c96kaS1tyy73+6PRwMnE+83ZHFvidK4cO2ABFmSvVsA0UYF2ZcOxMiBN6l2q20Z55Ttj@lists.linux.dev
X-Gm-Message-State: AOJu0YwB9U4g0LluShq235K7FFWjgOCXiBYOvg1QMQN0bkjsppdonUlK
	sDbscqGrN36Zrla+BbG7+Jj6n11jr56k0lDbwkbnVjYXdE807IvANTgu
X-Gm-Gg: Acq92OFxXgzMdkx0HdRK8pQmwnUnEolgPRuQhctJj7w+tHvmLB5ZC+dRo7l4wIVztWT
	ejalLhODAbvPhsPBGktfrjzg1Ml8ljgTgDDgbDhAuAx/J5m46taiOcyvtzz1doFtX4sTid1Libv
	EMc93GLUVlu0V6AIXfXH5QHSiOdMn+dl5ygaa5StUW4ddbPkRrqs3iZ/rrBiXG7pAOKCaySAhH+
	BMLUX/cC6McDZpXcYNDfewvGipW4Q0bs2lzhKbPmu6x39waCPb1K9mtKAORXbM0w0mEsmQgfKKZ
	oX030+NfFRwiMCob4Gsiy/l7I2LFupOlQUGtMN0EOW6M3CAhOWah0W3J/QPRlCV4zfOs514e+xK
	88+olSfaE6Pr4yya62fHE03O1RZ/mdlb5RopAuklGzkAb4Y7K6le0be1AHaOwAqZQp8spbNqio5
	TqJgK/k9ExwHKd7txie9J/BcinLoWlJY4dXJ0JgVgoqot5QvCBr0IoSIW3/mLs8Pw=
X-Received: by 2002:a05:600c:45c8:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-48fcea151fbmr104364665e9.28.1778760861344;
        Thu, 14 May 2026 05:14:21 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm6285630f8f.2.2026.05.14.05.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:14:20 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Thu, 14 May 2026 14:13:58 +0200
Message-ID: <20260514121359.931999-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514121359.931999-1-milant2002@gmail.com>
References: <20260514121359.931999-1-milant2002@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Extend the string benchmarking suite to include memcmp().
Extend the string unit test to include memcmp().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605140827.Qg1DZpcB-lkp@intel.com/
Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 lib/tests/string_kunit.c | 106 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b027..d0bad40a719a 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,110 @@ static void string_bench_strrchr(struct kunit *test)
 	STRING_BENCH_BUF(test, buf, len, strrchr, buf, '\0');
 }
 
+static void string_test_memcmp(struct kunit *test)
+{
+	const int max_offset = 16;
+	const int max_len = 32;
+	const int buf_size = max_offset + max_len + 32;
+	u8 *buf1, *buf2;
+	int i, j, len, k;
+
+	buf1 = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	buf2 = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf2);
+
+	for (i = 0; i < max_offset; i++) {
+		for (j = 0; j < max_offset; j++) {
+			for (len = 0; len <= max_len; len++) {
+				memset(buf1, 'A', buf_size);
+				memset(buf2, 'A', buf_size);
+				KUNIT_EXPECT_EQ_MSG(test, memcmp(buf1 + i, buf2 + j, len), 0,
+						    "Should be equal: i:%d j:%d len:%d", i, j, len);
+				for (k = 0; k < len; k++) {
+					memset(buf1, 'A', buf_size);
+					memset(buf2, 'A', buf_size);
+					buf2[j + k] = 'B';
+					int res = memcmp(buf1 + i, buf2 + j, len);
+
+					KUNIT_EXPECT_NE_MSG(test, res, 0,
+							    "Should detect difference at k:%d (i:%d j:%d len:%d)",
+						k, i, j, len);
+
+					if (buf1[i + k] < buf2[j + k])
+						KUNIT_EXPECT_LT(test, res, 0);
+					else
+						KUNIT_EXPECT_GT(test, res, 0);
+				}
+			}
+		}
+	}
+}
+
+#if IS_ENABLED(CONFIG_STRING_KUNIT_BENCH)
+static void string_bench_memcmp(struct kunit *test)
+{
+	char *buf1, *buf2;
+	size_t lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096};
+	int offsets[] = {0, 1, 3, 7};
+	const size_t max_len = 4096 + 64;
+
+	buf1 = vmalloc(max_len);
+	buf2 = vmalloc(max_len);
+
+	if (!buf1 || !buf2) {
+		vfree(buf1);
+		vfree(buf2);
+		kunit_err(test, "vmalloc failed\n");
+		return;
+	}
+
+	memset(buf1, 'A', max_len);
+	memset(buf2, 'A', max_len);
+
+	for (int i = 0; i < 100000; i++)
+		(void)memcmp(buf1, buf2, 4096);
+
+	for (int o = 0; o < ARRAY_SIZE(offsets); o++) {
+		int off = offsets[o];
+
+		for (int i = 0; i < ARRAY_SIZE(lengths); i++) {
+			size_t len = lengths[i];
+			char *p1 = buf1;
+			char *p2 = buf2 + off;
+
+			u32 iterations = (len < 512) ? 100000 : 10000;
+
+			for (u32 j = 0; j < iterations; j++) {
+				(void)memcmp(p1, p2, len);
+				barrier();
+			}
+
+			u64 elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
+			u64 ns_per_call = div_u64(elapsed, iterations);
+			u64 mbps = len ? div_u64((u64)len * iterations * 1000,
+									 elapsed) : 0;
+
+			if (off == 0) {
+				kunit_info(test, "bench_memcmp_aligned: len=%-4zu: %llu MB/s (%llu ns/call)\n",
+					   len, mbps, ns_per_call);
+			} else {
+				kunit_info(test, "bench_memcmp_unaligned(off=%d): len=%-4zu: %llu MB/s (%llu ns/call)\n",
+					   off, len, mbps, ns_per_call);
+			}
+		}
+	}
+
+	vfree(buf1);
+	vfree(buf2);
+}
+#else
+static void string_bench_memcmp(struct kunit *test)
+{
+	kunit_skip(test, "not enabled");
+}
+#endif
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -910,6 +1014,8 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_bench_strnlen),
 	KUNIT_CASE(string_bench_strchr),
 	KUNIT_CASE(string_bench_strrchr),
+	KUNIT_CASE(string_test_memcmp),
+	KUNIT_CASE_SLOW(string_bench_memcmp),
 	{}
 };
 
-- 
2.43.0

