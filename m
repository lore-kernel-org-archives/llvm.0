Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935799;
	b=25odPkdv7r2pMOpjboLlmpRiVTMljdFXbbSU1nhRqzPgID+roAdYmBjtSM/FTywOI6BC
	 KofYxF2uVfBaxoA1Lh9w4v6YYTr+kurf2BT/dq6hqbI+oj3YQkQ/ecClcdcM6PTbGbbjW
	 +7p5zN8zPF5C+aIuVhomIFj82alaO94qvF9Tp0upwi3Iv+eHF/R7TNoFt+CW6xkNnm79R
	 o+rFr6an3NezPIBw4tzmAoZ6OvGbYrkvwh1XI9vOwSyjsYGpHHu79ekDO8SbRl0SK1KdJ
	 hrj28vCtdb4kFVFT1F8novjGHuir69NqZZQt06EYZZRUXniOqjsCvr7QsYE6PEa/0MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
	b=lIPDwkaZZ1+kvZmFWPobesxtBNH/79PmF7GI2RYYVBcVpFobVtGpWXjRzdwZx0PYVJYC
	 2vB8zhWrEmtKJvGv9UtbrhlVZp2W1kagFYvwD/jz/55BDjPWepPrYVDol9pzdkNdHEYOR
	 MFSFtTar9zYfieCVuRmkvuwWtZr4uETtKJWz4guKPetsI3BGPmIdCCwaAdHDODUHjWdmw
	 Drb2negLrm6DFqf7SLvCrLxAZV8BWZSKtkUjB+mW8moN47nfzkAz8FR0fbxptUdYg9fxf
	 f6oj9jTSmgCu3Rm8Ak1b+owKjhYAhgxDFGm/9a3PN3YaoT4Egqf4htML7LuF7e/dUww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBj2l2Xq;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD1606A331
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 17:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAD1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBj2l2Xq
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so29052a12.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935798; x=1795540598; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=vBj2l2XqAYfO7wxBHkXYr1CnxoQa0r0tVGyEp3kU8oFex7s1CXXyRIatXfgxXI6O/D
         Q+qSLJR8/1x12VBbMTAFizNXlSOWZZdYhsELdPykvMTCRuOaFcqJti3Q+6bizlpw4nK7
         sUdZ/WSydNgr7yxNlf+g32/988MozIhX7iZkBClotj0uNR/G5gDr17PUUliK6Lmym/Y8
         DjZ3PNW7benJEzrsw86jrpf9PUp4DAeECi4RWZLPtFG9fzb5v9FirNSoLcN/rOrvUq9v
         I/OqzQynFZvKDm6d+HvfEBNyZqEtzCuPVoz67HqeQ4D00qHu56zA1GuvG0OCzJHfm9/b
         oozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935798; x=1795540598;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=Fb/5BXP/7I9kF1XIV6e0n0o3PNbiZsOnvea8dOz7ZWz47q58YQQtKofumRYD1xUgzw
         gZr2I89Ey4m/Fz6/1mdTPTr+GnxKpLuv21hUyCgKV79aq1j4XjhCpA/BjkHIR6RCKkkc
         xC+TqAM1tlgUNV08brj0nN0dsz5/WCCiQRmCw8l9n+Zeas6ydEW07aRC6wmMc3kxVI9A
         Fix7kVZ50l/jjZ3pmkYAt1JR7hrYTILSwkGYfLUsmob7kmCk588SB9JjP//t8VgSv2pN
         /UPB3W32PGPS0fxpjmgfBi7bx3vww1auItsy2MKqDE/mWuQfMvQjZETCiIW7PCzVeYUa
         0dIw==
X-Forwarded-Encrypted: i=1; AL+hErEhPrdRJEIBCjqgDF6on3TnNaH6vPTgaX8FtlZkA98tZ12VSKgO7VC4lciCAX5b5vxXOUyE@lists.linux.dev
X-Gm-Message-State: APuU4Z892Hi8s80ALTcANG6+ZnatB18cd7QA3A5W9SijFvj60AfJIuC0
	v7JRfkfALAF7V/QTPvPBW/Rj+4TF3CiZmdxZ4P+Kb1Df1SILRY2e4UoR
X-Gm-Gg: AYBFou2tqdCQq/00qhAkx1LUIE+dHk2I2F4B7guTFm0HiftBsGt40ArGtjR7Bj7XJBe
	bqrPIOeblmLR4+VrmuJoFcRZEuP2h4ajku/iL9svA+ke8lJFnS4urLyhsZNk2CI52zVb07dmIzt
	iQJASqvzOxC6pfUaXffjq9/xdI3pzquuObgPSd2/5eUdlwYn6oT00ZbPSaM3acFgp6zF6uHqwfT
	Qy5X/cOg3cjf2k2D/Z6nh7hg9kntP9hoXMayYhJw2De2AtrCfG9yERa5X+05fLeWPQ7XGCKMtY/
	etvf4+OhgyQbwUR/GfPf2qjSqCbxcwOxICv8KJMCYW3ef6r7+pTp/mp0NmCknkobuda32nVRmYN
	tfZVrhGD5HvjhSvJ+xiZqzpSzECaoMHFWMS8qA2uFWGEWRRMfG1k4n0HgqdW+ReCzLuTHlfRYru
	YMGYPB4docEOUHRqRga8qkTVkT86vLLgmFcgK+Iq/mqad1SsPiOOO74HJwrf2n1B+tB8LISt6XB
	kmc9h1vinwEEn61mj38tY14YYt+iVuN4MnF8FelTWtgZT10vM9GnyhZFAlkMlcn9zg6eA9E1xhJ
	oypfdBltBSC3UdKqx5V0hqIdeHZhb0OFPhPk8+C7Z8R4CsWtbmkNJB9R/5uaQ0deZ/bNBK4B2a3
	WlrBFc1oVJOvO8d7dXZokXlwxP8wHf2PH+VpnQcCRlrmOhg/wrlWEogBql/sS4Nemj827YjzYXC
	kb8AVJRsQ=
X-Received: by 2002:a05:6a00:3008:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-8beb374dd2cmr12162924b3a.4.1794935797654;
        Tue, 17 Nov 2026 09:16:37 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5b38f2c39sm99770b3a.34.2026.11.17.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:16:36 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 04:04:33 +1100
Subject: [PATCH] mm/damon/paddr: avoid truncation warning in high-address
 KUnit test
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-damon-paddr-sparse-20261118-v1-1-3a0e943406d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NOw7CMAyGr1J5xiLJ0AaughicxNAgkVZ2QUhV7
 04CAxvj9z9XUJbMCsduBeFn1jyVCnbXQRypXBlzqgzOuN5a6/GSX5joPhWcKSVBnUmU8ecH4w/
 GDb1PA9SVWbhWPg+n85f1EW4clzbbEoFqPwiVODap4f7PA2zbG7eW2xe2AAAA
X-Change-ID: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
 Justin Stitt <justinstitt@google.com>, lienze@kylinos.cn, 
 linux-kernel@vger.kernel.org, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
 mm-commits@vger.kernel.org, Bill Wendling <morbo@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, oe-kbuild-all@lists.linux.dev, 
 rdunlap@infradead.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
X-Mailer: b4 0.16.0

Hi SJ, Andrew,

The kernel test robot caught this issue in my earlier addr_unit KUnit
patch. Feel free to fold this fix into that patch.

Thanks,
Aveline Noir

-- >8 --
When phys_addr_t is 32-bit, Sparse warns about truncating the u64 address
passed to damon_pa_core_addr() in damon_test_pa_addr_over_4g().  The
runtime kunit_skip() does not prevent Sparse from checking that
conversion.

Compile the high-address assertions only with CONFIG_PHYS_ADDR_T_64BIT,
and keep the test skipped otherwise.

Fixes: 7a983cc1b573 ("mm/damon/paddr: add KUnit tests for addr_unit conversion")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117170155.fEdeuuhm-lkp@intel.com/
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
The reported warning is gone with the original i386 config, Clang 22.1.8
and Sparse v0.6.5-rc1-21-g84ec0658. All executed DAMON KUnit tests passed
on x86_64 and i386 with and without PAE; the high-address case skips
without PAE.
---
 mm/damon/tests/paddr-kunit.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/damon/tests/paddr-kunit.h b/mm/damon/tests/paddr-kunit.h
index 9839cc233071..2b11f0e67a12 100644
--- a/mm/damon/tests/paddr-kunit.h
+++ b/mm/damon/tests/paddr-kunit.h
@@ -26,15 +26,16 @@ static void damon_test_pa_core_addr(struct kunit *test)
 
 static void damon_test_pa_addr_over_4g(struct kunit *test)
 {
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
 	unsigned long addr = 0xffffffffUL;
 	unsigned long addr_unit = 0x1000;
 	u64 pa = 0xffffffff000ULL;
 
-	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
-		kunit_skip(test, "phys_addr_t is 32-bit");
-
 	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(addr, addr_unit), pa);
 	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(pa, addr_unit), addr);
+#else
+	kunit_skip(test, "phys_addr_t is 32-bit");
+#endif
 }
 
 static struct kunit_case damon_paddr_test_cases[] = {

---
base-commit: 7a983cc1b57309a875a9e07a934c9944bf3d088d
change-id: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7

