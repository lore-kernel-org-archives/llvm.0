Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD553537ED;
	Sat, 16 May 2026 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778910690; cv=none; b=FZJ1jqmdpQp+vbP4v7iEaVwAT2zFtMahzJFMBWqUuP5R6vMLBBWeDW3goOcNxxmoyv3D/uTv2XrtkYiDuB7owO+nV3MQpTpWGyJya3SovV2ifBMpYxeHgWBgHQHrjQuL0BhJsBik3FKzZBEyg1ED3DIiBTJeeGPDATnantwHLPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778910690; c=relaxed/simple;
	bh=YruztoJ4JnKbmHHdTXEO4c0lqX0b/HiPPKmTeVe1w9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k6DYDY710c38WL9xxpoE0ycTUUL9wsZXThdBwty/k++hVjjdr8vfd9yje8bcSvazcNdI4D/5er9pj/ER/2SyykhxRm6Ko4aPRnyVWk3pVBILObuZdLjffiEY3Aux7+qD14Wmiqy/DUFANO+9NUe2qPh6JtISCUeKzDGjaPsvc1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fc+nw/S5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fc+nw/S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778910687; x=1810446687;
  h=date:from:to:cc:subject:message-id;
  bh=YruztoJ4JnKbmHHdTXEO4c0lqX0b/HiPPKmTeVe1w9A=;
  b=Fc+nw/S5FKlxmeWFtsPRb5Syrmv5k13OQEbjF7VYoGZ0896NFMAMBB1+
   8H/N3SDDIUoYZziBBH3A2nRaYeMfzgn8hMbQ1Wo2HKdNmTNy2e/dsKSYg
   D4ePyTLX35DSRyHDnZyDyuamx6AfHqNgaBFB+WPbzu6hpJVdCtYSF/OLI
   vOhKc7t9tmKDWh1nE5YBUZjsrqlZkb+1Bw+wpSZwWiFJc5FGMRhj+c0JP
   gIQH2vO0KXMtvByd7MHrRe0ROetK8RgYgzZdmaOeCRVDXBYlrvuy0sZ+w
   6EOVtCieh5jbmGLSzV2ulBbsb5gzL38RRu/CNOjbtg7WBSDMQoDKv0xKi
   A==;
X-CSE-ConnectionGUID: KPUyrmlAQrCYd/jtLZ5oJA==
X-CSE-MsgGUID: HLPkpTBQRuGNLOb521PPhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78884151"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="78884151"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 22:51:26 -0700
X-CSE-ConnectionGUID: flvrIg8lQc2C5onF5DTaWg==
X-CSE-MsgGUID: dBXtJQF+SYO1oNifPryUPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="239009320"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2026 22:51:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO7vm-000000009F3-0be1;
	Sat, 16 May 2026 05:51:22 +0000
Date: Sat, 16 May 2026 07:50:32 +0200
From: kernel test robot <lkp@intel.com>
To: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: lib/tests/string_kunit.c:971:14: error: call to undeclared
 function 'STRING_BENCH'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605160742.mVHeO3tK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Milan-Tripkovic/riscv-lib-add-memcmp-implementation/20260515-232425
head:   cc47ab1edeaa33a740769c02047c4c601941ae9c
commit: cc47ab1edeaa33a740769c02047c4c601941ae9c lib/string_kunit: extend benchmarks and unit test to memcmp()
date:   14 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260516/202605160742.mVHeO3tK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160742.mVHeO3tK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160742.mVHeO3tK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/string_kunit.c:971:14: error: call to undeclared function 'STRING_BENCH'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     971 |                         elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
         |                                   ^
   1 error generated.


vim +/STRING_BENCH +971 lib/tests/string_kunit.c

   922	
   923	static void do_string_bench_memcmp(struct kunit *test)
   924	{
   925		char *buf1 = NULL;
   926		char *buf2 = NULL;
   927		const u64 lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096 };
   928		const int offsets[] = { 0, 1, 3, 7 };
   929		const u64 max_len = 4096 + 64;
   930		unsigned int w, o, i;
   931		unsigned int off;
   932		u64 len;
   933		char *p1;
   934		char *p2;
   935		u64 iterations;
   936		u64 elapsed;
   937		u64 ns_per_call;
   938		u64 mbps;
   939		u64 j;
   940	
   941		buf1 = vmalloc(max_len);
   942		buf2 = vmalloc(max_len);
   943	
   944		if (!buf1 || !buf2) {
   945			vfree(buf1);
   946			vfree(buf2);
   947			kunit_err(test, "vmalloc failed\n");
   948			return;
   949		}
   950	
   951		memset(buf1, 'A', max_len);
   952		memset(buf2, 'A', max_len);
   953	
   954		for (w = 0; w < 100000U; w++)
   955			(void)memcmp(buf1, buf2, 4096);
   956	
   957		for (o = 0; o < ARRAY_SIZE(offsets); o++) {
   958			off = offsets[o];
   959	
   960			for (i = 0; i < ARRAY_SIZE(lengths); i++) {
   961				len = lengths[i];
   962				p1 = buf1;
   963				p2 = buf2 + off;
   964				iterations = (len < 512) ? 100000ULL : 10000ULL;
   965	
   966				for (j = 0; j < iterations; j++) {
   967					(void)memcmp(p1, p2, len);
   968					barrier();
   969				}
   970	
 > 971				elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
   972				ns_per_call = div_u64(elapsed, iterations);
   973				mbps = len ? div_u64(iterations * len * (NSEC_PER_SEC / MEGA), elapsed) : 0;
   974	
   975				if (off == 0) {
   976					kunit_info(test, "bench_memcmp_aligned: len=%-4llu: %llu MB/s (%llu ns/call)\n",
   977						   len, mbps, ns_per_call);
   978				} else {
   979					kunit_info(test, "bench_memcmp_unaligned(off=%u): len=%-4llu: %llu MB/s (%llu ns/call)\n",
   980						   off, len, mbps, ns_per_call);
   981				}
   982			}
   983		}
   984	
   985		vfree(buf1);
   986		vfree(buf2);
   987	}
   988	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
