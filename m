Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08A14F104;
	Tue,  3 Dec 2024 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205888; cv=none; b=gGCjfYTLc4N1ZNBXYn5w/+z1nkpaKE3KN9S1IgI3KYlBCCJ/WDEFA05cmYrADHFP4ANyUdH6ZMZt29lZdq9iz02GEaJ4uI/hibohX1Crm8No0P6Cg2HX7jfnD+VKHgnGOo2ey4iHVt475egsKYhD3Rh6MNf4uxorsQxUtvm1/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205888; c=relaxed/simple;
	bh=vvFGtthR09aieaJyupBsEqeKO0mGkwRQsuCoBjrLR5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PD6RjVel/f47XhdKpQ1MHkWqrdWmB3O4+buq675907PwdCRBNoG5LBN0fzxexM6toi2qUlv0MwIlynxWnizUj+DhDe8ck1hRR9Twrn+Gee/tORgX01m/lAQUFGIZdp25PhYRCt/rtV0slxmhswCda1SCExiWVGVhR6W6Bpu2jXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdo6FxIq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdo6FxIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733205887; x=1764741887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvFGtthR09aieaJyupBsEqeKO0mGkwRQsuCoBjrLR5s=;
  b=fdo6FxIqLjsOZg8/k2JU3W2vBekkVl7qGRR21Rgc6fC/x1zN8jdI8Cj5
   TJNwBT1Ry1/Jmu5pzdXJ4yb0LOMsXvM5UcDgXBSj4gQvSyIqNJe7jlFPo
   fQVpUHSn5jsnXLr1ATdMRxeHcFVZfHVs2V7f8s/0p1xXmML0xZf6Gft76
   8C9+tnQp6qsO6cHyuz47JNEoZ7YQD+q2Xxvk6xD33tpUudsUSO+Ehn7Bl
   eP+CmMj3t4n9Q54JawOyp1t950VP4ywblC1ty9+KQNPB3I9rVd9iVNHdu
   VOF2swabOu3tfu0oh9I11dt+3CXJF669cz2k+QUGObhR80N163vU4yqOO
   g==;
X-CSE-ConnectionGUID: K0cSt/c3T/2y1UvoIdA2RQ==
X-CSE-MsgGUID: C8GvP5odTCGpbt2nyMTfYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33460551"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33460551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:04:47 -0800
X-CSE-ConnectionGUID: aA6oQAYYTZCXf5FxsT2cGQ==
X-CSE-MsgGUID: aCra1tNmTEmMdPQ83bTP4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93523875"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2024 22:04:45 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIM1a-0000CJ-39;
	Tue, 03 Dec 2024 06:04:42 +0000
Date: Tue, 3 Dec 2024 14:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/text_poke_early 2/2]
 arch/x86/kernel/alternative.c:1258:56: error: too few arguments to function
 call, expected 4, have 3
Message-ID: <202412031343.Jnmy0Plf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/text_poke_early
head:   04de1a34ab130ce60ea1ee66d67d02e544fd541c
commit: 04de1a34ab130ce60ea1ee66d67d02e544fd541c [2/2] x86: Push module_writable_address() into text_poke_early()
config: x86_64-buildonly-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031343.Jnmy0Plf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031343.Jnmy0Plf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031343.Jnmy0Plf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/alternative.c:6:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/alternative.c:1258:56: error: too few arguments to function call, expected 4, have 3
    1258 |                         text_poke_early(addr + fineibt_caller_hash, &hash, 4);
         |                         ~~~~~~~~~~~~~~~                                     ^
   arch/x86/include/asm/text-patching.h:18:13: note: 'text_poke_early' declared here
      18 | extern void text_poke_early(struct module *mod, void *addr, const void *opcode, size_t len);
         |             ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +1258 arch/x86/kernel/alternative.c

  1244	
  1245	static int cfi_rewrite_callers(s32 *start, s32 *end, struct module *mod)
  1246	{
  1247		s32 *s;
  1248	
  1249		for (s = start; s < end; s++) {
  1250			void *addr = (void *)s + *s;
  1251			u32 hash;
  1252	
  1253			addr -= fineibt_caller_size;
  1254			hash = decode_caller_hash(addr);
  1255			if (hash) {
  1256				text_poke_early(mod, addr, fineibt_caller_start, fineibt_caller_size);
  1257				WARN_ON(*(u32 *)(addr + fineibt_caller_hash) != 0x12345678);
> 1258				text_poke_early(addr + fineibt_caller_hash, &hash, 4);
  1259			}
  1260			/* rely on apply_retpolines() */
  1261		}
  1262	
  1263		return 0;
  1264	}
  1265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
