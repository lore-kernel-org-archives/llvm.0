Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7913A3F2;
	Fri, 27 Sep 2024 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727458839; cv=none; b=WRyPRovzUu0IXVraAG3TvEVH2PKp1FZWDD/qHQEW0mgnySDXQ1sYfYaFVlG0FpxrlT06+w0uJ5ss5PO2Ka4NGtD4wFsFY7V2R7kc43rKjPNmlTFqx9MljN17+lHkRgVB+11ogkPDFsCCGD1ZQcJj2JvbotWoFI78B3sMOSoMJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727458839; c=relaxed/simple;
	bh=qPG2iBIEoI7+kp6/lC9y3lLhIRK1qnxfUrwsjRs7ZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apMOKMKxkBP1NwjN5DvYPNQC/Lg9LaGZ+7h2ITy+s3yJsHKaGfEMra9YEafym0XLFcFqsB2p7JpmuH3dxr+wo9o+bsV5fl97Nqn/SuyF0x3X4sZ/6YMfTOCC26ETqlZxu7HVo4JW1tsxOqA5QQd+TeZTq9uZe6KiInRVLbeSE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jk++Ha5A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jk++Ha5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727458837; x=1758994837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPG2iBIEoI7+kp6/lC9y3lLhIRK1qnxfUrwsjRs7ZOc=;
  b=jk++Ha5A2JudlxulsCmdpp+MWg9L1YAfBLnRY6N1+gaBeu/fJZUXSplL
   jBNcgwFTDrAfFSy/Za/bRq4aqz2pcrS/uDIybWiDXW0fMv7hN1wpo1hE2
   KX73j8oR9E98hZ2ckETLlNCHMeSLm3kbwStQ2dxO/o8dLEznZDeUAUozx
   seIu48zyNl8djNkfY/z5r249bApwGVexyRyKchxONX9mHpOsbPwhELrUa
   9TuS7DWTANoYkxxL85OcWP0n8/1VZL4JUaAtWyDTOLHN0KLGH7cpcg22D
   CfDzS8G1lMe6N9iaO27FonwS3ST95JlPlPIYwifJDtWiSS4Vlk8JrBeWS
   w==;
X-CSE-ConnectionGUID: jcCPWn1JSgCWkGFohYtSDQ==
X-CSE-MsgGUID: 1En2S7F6R6S5hCo8abKejg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49138304"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="49138304"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 10:40:36 -0700
X-CSE-ConnectionGUID: m6ubV4+9QLqqSW2GUKTOAw==
X-CSE-MsgGUID: 75cVDv5RSM2uuAhYTVrrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72269670"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2024 10:40:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suExF-000MR3-0Z;
	Fri, 27 Sep 2024 17:40:33 +0000
Date: Sat, 28 Sep 2024 01:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v1 2/3] mm/slab_common.c:1326:1: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202409280140.V6sA6imY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v1
head:   4b00a1c2a4965bcd16815d5ec9a53bf967db5c27
commit: 2484111accb0d487ef52a4c62c6b5b25af560ee3 [2/3] mm/bpf: Add bpf_get_slab_cache() kfunc
config: arm-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280140.V6sA6imY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280140.V6sA6imY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280140.V6sA6imY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slab_common.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/slab_common.c:32:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/slab_common.c:1326:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1326 | __bpf_kfunc_start_defs();
         | ^
         | int
>> mm/slab_common.c:1326:23: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    1326 | __bpf_kfunc_start_defs();
         |                       ^
         |                        void
>> mm/slab_common.c:1328:1: error: unknown type name '__bpf_kfunc'
    1328 | __bpf_kfunc struct kmem_cache *bpf_get_slab_cache(u64 addr)
         | ^
>> mm/slab_common.c:1333:9: error: incompatible pointer types returning 'struct kmem_cache *' from a function with result type 'int *' [-Werror,-Wincompatible-pointer-types]
    1333 |         return slab ? slab->slab_cache : NULL;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1336:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1336 | __bpf_kfunc_end_defs();
         | ^
         | int
   mm/slab_common.c:1336:21: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    1336 | __bpf_kfunc_end_defs();
         |                     ^
         |                      void
   3 warnings and 6 errors generated.


vim +/int +1326 mm/slab_common.c

  1324	
  1325	#ifdef CONFIG_BPF_SYSCALL
> 1326	__bpf_kfunc_start_defs();
  1327	
> 1328	__bpf_kfunc struct kmem_cache *bpf_get_slab_cache(u64 addr)
  1329	{
  1330		struct slab *slab;
  1331	
  1332		slab = virt_to_slab((void *)(long)addr);
> 1333		return slab ? slab->slab_cache : NULL;
  1334	}
  1335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
