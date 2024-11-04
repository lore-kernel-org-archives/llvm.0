Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD42E40B;
	Mon,  4 Nov 2024 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727197; cv=none; b=ouqPcIFFjXD4VW8yoss7+5rtoe6ASQW29NUOfdbZPTrc+5VIC83cv2o/I0ROo00weZSIPEdvLLMcI9m+TLwsuvYp9sXlQ6EatwKH/1a9uKS+kKWQT6Nf6K948CoU9n8n//deUZGkZQZphG8/daBrvFPNdStnWWL3XXh5Tyf8djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727197; c=relaxed/simple;
	bh=41iwttlQq7c+pKKSqWj7IuYE2u0IcOYiAcshgeR9LbY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFvE54buOz+7q8eNPt5qKUmq4x/G/zBd6ojeBDF7sc/7fNngcnyYRemiQqat/+wD2UrAu1ESRZY9a0kMDZa78DV97K1exbK3nIpn2wvFs+J5mIGfO85IaXVQAEF5SZ7Ib21YlCOUWU5jM8BoV02w/Cp5FsXIGzc/BFmK3KHMBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJIyWXl5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJIyWXl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730727196; x=1762263196;
  h=date:from:cc:subject:message-id:mime-version;
  bh=41iwttlQq7c+pKKSqWj7IuYE2u0IcOYiAcshgeR9LbY=;
  b=YJIyWXl5oESgtuSl3KinnrWfZV0kuYBJAbzgvID/oks0Y17dyFi9s/Bh
   OInQLFoI8LHywJ6kRSu5K5Nw19UzXQSPQuzCHDMau61UoqsaHuzAyJfKT
   1Ram+d+hAWK1mYQCF4afp9kl/sXg65aO3dfimr1AjzZ3gJUaXCGULslrE
   NIiQ/XbxTv2YlcHUcWIMkbkenMdki5w8NEsoh2NLsUHsG0ypb5vFp5YmX
   sIrCE52g0p+AnU99FRe5DgcyRQG1xESgyh29PtTKhuE9TqezJxhqlNqWF
   LoySqeUAjIGStL7jH4J+gyDZ+mSW12oQoKNgJrFjnGvuWiQUm7GN81oDr
   Q==;
X-CSE-ConnectionGUID: kxNl/RIBSM+kpdOpkhU0Lw==
X-CSE-MsgGUID: DP+NRkqMT7ueWvNz9cxT8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18039990"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="18039990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:33:15 -0800
X-CSE-ConnectionGUID: /nfH00mQTGu6yE248s4dpw==
X-CSE-MsgGUID: XN4r4C9cSrCkOywQxwzXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83587950"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2024 05:33:14 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7xCh-000kqv-25;
	Mon, 04 Nov 2024 13:33:11 +0000
Date: Mon, 4 Nov 2024 21:32:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 2/2] bpf, x86: Skip bounds checking for
 PROBE_MEM with SMAP
Message-ID: <202411041844.zn5u1S37-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20241103193512.4076710-3-memxor@gmail.com>
References: <20241103193512.4076710-3-memxor@gmail.com>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
TO: bpf@vger.kernel.org
CC: kkd@meta.com
CC: Puranjay Mohan <puranjay@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Martin KaFai Lau <martin.lau@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Andy Lutomirski <luto@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Rishabh Iyer <rishabh.iyer@berkeley.edu>
CC: Sanidhya Kashyap <sanidhya.kashyap@epfl.ch>
CC: x86@kernel.org
CC: kernel-team@fb.com

Hi Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 77017b9c46820d72596e50a3986bd0734c1340a9]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/x86-Perform-BPF-exception-fixup-in-do_user_addr_fault/20241104-033702
base:   77017b9c46820d72596e50a3986bd0734c1340a9
patch link:    https://lore.kernel.org/r/20241103193512.4076710-3-memxor%40gmail.com
patch subject: [PATCH bpf-next v3 2/2] bpf, x86: Skip bounds checking for PROBE_MEM with SMAP
config: x86_64-randconfig-014-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041844.zn5u1S37-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041844.zn5u1S37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041844.zn5u1S37-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/net/bpf_jit_comp.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
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
   4 warnings generated.
>> arch/x86/net/bpf_jit_comp.o: warning: objtool: bpf_int_jit_compile+0x3f86: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
