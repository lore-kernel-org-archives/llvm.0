Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A658C28726E;
	Tue, 13 Jan 2026 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325916; cv=none; b=QGND+7ZC9BZOPwDG39qE8sOF4YD/znD/0MOhg0kHrct7B4NPW45CXJDd1694UhIflSNpX/SSFc+9roEzAQYJb+WNlbxFhiolLnU6HijahhnaWdvTjSLsjj9dcAhKJCyaeh6iLhrF0KagzSoYz6o2M5+ZEIhe4JnanCIvFNNUUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325916; c=relaxed/simple;
	bh=sszUYqvh01nu4Eid8QPas45VhqwkdR3+wRrLcb7xHFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cwGUufGvopr2GixfGk9ob3dxzZQF/RIcaiClZUW5y/nnHW2k0iiBF/OxaYvfOy+j5/87G6Fd0USSMM2LOnLUTjCuJNhcQpogV7IThh4Iez8+JcR0Nn+HHq4xpwq7gNVPywYvPbRhTuDBfcyIjzG0xDtGdTLS8+GIpc2XXeKFL0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cc//ObOS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc//ObOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768325915; x=1799861915;
  h=date:from:to:cc:subject:message-id;
  bh=sszUYqvh01nu4Eid8QPas45VhqwkdR3+wRrLcb7xHFg=;
  b=cc//ObOSOFQRzGkVyBHjJeZELp4As1GeOhb3VV09BD0/uq9iGFrRpFSa
   FkBa+NvAQvrADLWbL76VRbLZue3fPpWRYLzof0keme+oE5u1eyYnmPqhd
   Xqaz2ZwjuGzGM4bkqKMRU1z4xDMQKv5So90lsC46ELnzVrDrt+3DVnS/y
   sannkjOELCYMyHjZBb1LitbepJjyZ+rjuUdEzXj/Zg86nGM1kGTIjLzGn
   aJK5Kq51lMvCh01jC6WKhSrp5i34TJACbZGvToqQSNf3mdYrGLmYgfRI0
   wYyga3LRWs9P/dsWCDjqBEXNf9tk6fpLvcyksdbDQLKeTvyEFLkHORvwi
   Q==;
X-CSE-ConnectionGUID: Wc46hhWfTriG4KNuQz6JaQ==
X-CSE-MsgGUID: bF7MrV/dR6u2vofSEMyQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73474762"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73474762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:38:34 -0800
X-CSE-ConnectionGUID: tB59I1d5QkuSTknXxDUGoQ==
X-CSE-MsgGUID: wLzOGHoFTKeip81Czu1gmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204335546"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 09:38:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfiLd-00000000FBC-2uLy;
	Tue, 13 Jan 2026 17:38:29 +0000
Date: Wed, 14 Jan 2026 01:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 77/129]
 arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function
 '__bpf_address_lookup'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601140159.I4b0kwpE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   01c8de771f4a779caac5d841b1cb2207ac23330a
commit: 0f1766dc93f077061bf42cc6222bb2ade96422a4 [77/129] kallsyms/bpf: rename __bpf_address_lookup() to bpf_address_lookup()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260114/202601140159.I4b0kwpE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140159.I4b0kwpE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140159.I4b0kwpE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function '__bpf_address_lookup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1322 |         if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
         |              ^
   arch/loongarch/net/bpf_jit.c:1322:7: note: did you mean 'bpf_address_lookup'?
   include/linux/filter.h:1378:5: note: 'bpf_address_lookup' declared here
    1378 | int bpf_address_lookup(unsigned long addr, unsigned long *size,
         |     ^
   1 error generated.


vim +/__bpf_address_lookup +1322 arch/loongarch/net/bpf_jit.c

9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1305  
ae4a3160d19cd16 Menglong Dong 2025-11-18  1306  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
ae4a3160d19cd16 Menglong Dong 2025-11-18  1307  		       enum bpf_text_poke_type new_t, void *old_addr,
ae4a3160d19cd16 Menglong Dong 2025-11-18  1308  		       void *new_addr)
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1309  {
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1310  	int ret;
ae4a3160d19cd16 Menglong Dong 2025-11-18  1311  	bool is_call;
73721d8676771c6 Chenghao Duan 2025-12-31  1312  	unsigned long size = 0;
73721d8676771c6 Chenghao Duan 2025-12-31  1313  	unsigned long offset = 0;
73721d8676771c6 Chenghao Duan 2025-12-31  1314  	void *image = NULL;
73721d8676771c6 Chenghao Duan 2025-12-31  1315  	char namebuf[KSYM_NAME_LEN];
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1316  	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1317  	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1318  
3d770bd11b94306 Hengqi Chen   2025-10-02  1319  	/* Only poking bpf text is supported. Since kernel function entry
3d770bd11b94306 Hengqi Chen   2025-10-02  1320  	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
3d770bd11b94306 Hengqi Chen   2025-10-02  1321  	 */
73721d8676771c6 Chenghao Duan 2025-12-31 @1322  	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1323  		return -ENOTSUPP;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1324  
73721d8676771c6 Chenghao Duan 2025-12-31  1325  	image = ip - offset;
73721d8676771c6 Chenghao Duan 2025-12-31  1326  
73721d8676771c6 Chenghao Duan 2025-12-31  1327  	/* zero offset means we're poking bpf prog entry */
73721d8676771c6 Chenghao Duan 2025-12-31  1328  	if (offset == 0) {
73721d8676771c6 Chenghao Duan 2025-12-31  1329  		/* skip to the nop instruction in bpf prog entry:
73721d8676771c6 Chenghao Duan 2025-12-31  1330  		 * move t0, ra
73721d8676771c6 Chenghao Duan 2025-12-31  1331  		 * nop
73721d8676771c6 Chenghao Duan 2025-12-31  1332  		 */
73721d8676771c6 Chenghao Duan 2025-12-31  1333  		ip = image + LOONGARCH_INSN_SIZE;
73721d8676771c6 Chenghao Duan 2025-12-31  1334  	}
73721d8676771c6 Chenghao Duan 2025-12-31  1335  
ae4a3160d19cd16 Menglong Dong 2025-11-18  1336  	is_call = old_t == BPF_MOD_CALL;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1337  	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1338  	if (ret)
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1339  		return ret;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1340  
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1341  	if (memcmp(ip, old_insns, LOONGARCH_LONG_JUMP_NBYTES))
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1342  		return -EFAULT;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1343  
ae4a3160d19cd16 Menglong Dong 2025-11-18  1344  	is_call = new_t == BPF_MOD_CALL;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1345  	ret = emit_jump_or_nops(new_addr, ip, new_insns, is_call);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1346  	if (ret)
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1347  		return ret;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1348  
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1349  	mutex_lock(&text_mutex);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1350  	if (memcmp(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES))
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1351  		ret = larch_insn_text_copy(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1352  	mutex_unlock(&text_mutex);
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1353  
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1354  	return ret;
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1355  }
9fbd18cf4c69f51 Chenghao Duan 2025-08-05  1356  

:::::: The code at line 1322 was first introduced by commit
:::::: 73721d8676771c6c7b06d4e636cc053fc76afefd LoongArch: BPF: Enhance the bpf_arch_text_poke() function

:::::: TO: Chenghao Duan <duanchenghao@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
