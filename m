Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA831DD9C9;
	Fri,  4 Oct 2024 19:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728071564; cv=none; b=GwZZ9P8BQGV9l3TOP5mcuVEYqJsMltgKH+yftiL/ed6n+ZCTvRbi4vqfaplb0fGJV9AJta+303KZxXFBGLKWlPDEZhDZHEgXbjWWkQbVCD02M4c6ken8GsbsivhM9mCyhsU4L6xHY73XJhN+sKSRMkQ62gyolnIrfg8y6D9+kgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728071564; c=relaxed/simple;
	bh=kl5zg+gZxvsBveSJ/daY/n9vMoJcOJpGPeErC+Fwc7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKf88OFtN/ImL094zFi7MMWAzlybuZRE0at9Ec2sc3CNj2OTFvvMsmOZmEnjpf9f9c5RyflusddscPUaxfvIUuVY/Hrccb5vxQMZxeh6Tbh1EWbn0pl+5zvGDGg+HO2iuD7Zm69HZo2ptJwf+/EwiEUWs8sIfJSbr1S0+jBMUXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3DgBxeS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3DgBxeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728071563; x=1759607563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kl5zg+gZxvsBveSJ/daY/n9vMoJcOJpGPeErC+Fwc7s=;
  b=R3DgBxeSWEA9P6D4wirHMaoXFZngto1QVH8zKX3b+iY3Xa3HTlB0j0aL
   9dHJRdFK5xA/PVPmNe9imsYhkPMQfyR5c3HkJ64N5SMMZzMtk1Q+X6vx2
   PduUPrf2i35pFks/oUo9XtQXlw3iONHrdVcPpxb01SIL8sLfN1YONq265
   hndEVG0BGyJXedWlpU/b7b4r0KKLlo97/zZED4jdz9kd7qxtkOewCxQTn
   9PMfwd75T1BO+ADd359BiJzvNT99ySNXzPF9EFo6vcz9u0M2IEP+oE9TM
   ojY0Vs/HWu0U0g4kkm6kkKjyDclQraurfkS8dv6KgvtxtRTzUOi8DKzQs
   A==;
X-CSE-ConnectionGUID: WF+FO+XnSkmk9TzYFg09qw==
X-CSE-MsgGUID: hZhRzy6aR6ShpgTr6BmXAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27451808"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27451808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 12:52:40 -0700
X-CSE-ConnectionGUID: vJX7WhDNTBSXxVxyLYIYQA==
X-CSE-MsgGUID: nXR86yquSLW8/hi5Lbykxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74810912"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2024 12:52:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swoLs-00028n-0u;
	Fri, 04 Oct 2024 19:52:36 +0000
Date: Sat, 5 Oct 2024 03:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 2050/2483] include/linux/fault-inject.h:99:9:
 error: use of undeclared identifier 'false'; did you mean 'else'?
Message-ID: <202410050346.6RA1L1hF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: 91b2c42c214f570efaff80a666e30b8f6ce4f12b [2050/2483] drm/xe: Use fault injection infrastructure to find issues at probe time
config: x86_64-randconfig-003-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050346.6RA1L1hF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050346.6RA1L1hF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050346.6RA1L1hF-lkp@intel.com/

Note: the linux-next/master HEAD 58ca61c1a866bfdaa5e19fb19a2416764f847d75 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_tile.c:6:
   include/linux/fault-inject.h:97:15: error: unknown type name 'bool'
      97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^
   include/linux/fault-inject.h:97:43: error: unknown type name 'gfp_t'
      97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |                                           ^
>> include/linux/fault-inject.h:99:9: error: use of undeclared identifier 'false'; did you mean 'else'?
      99 |         return false;
         |                ^~~~~
         |                else
>> include/linux/fault-inject.h:99:9: error: expected expression
   include/linux/fault-inject.h:106:57: error: unknown type name 'gfp_t'
     106 | static inline int should_failslab(struct kmem_cache *s, gfp_t gfpflags)
         |                                                         ^
   include/linux/fault-inject.h:108:9: error: use of undeclared identifier 'false'; did you mean 'else'?
     108 |         return false;
         |                ^~~~~
         |                else
   include/linux/fault-inject.h:108:9: error: expected expression
   In file included from drivers/gpu/drm/xe/xe_tile.c:10:
   In file included from drivers/gpu/drm/xe/xe_device.h:9:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1131:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/xe/xe_tile.c:10:
   In file included from drivers/gpu/drm/xe/xe_device.h:9:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1131:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/xe/xe_tile.c:10:
   In file included from drivers/gpu/drm/xe/xe_device.h:9:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1131:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/xe/xe_tile.c:10:
   In file included from drivers/gpu/drm/xe/xe_device.h:9:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1131:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/xe/xe_tile.c:10:
   In file included from drivers/gpu/drm/xe/xe_device.h:9:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1131:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~


vim +99 include/linux/fault-inject.h

cc689c5b352d4a Ingo Molnar     2017-02-01   93  
0866e82e40fba4 Kefeng Wang     2023-05-16   94  #ifdef CONFIG_FAIL_PAGE_ALLOC
53dabce2652fb8 Vlastimil Babka 2024-07-11   95  bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
0866e82e40fba4 Kefeng Wang     2023-05-16   96  #else
53dabce2652fb8 Vlastimil Babka 2024-07-11   97  static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
0866e82e40fba4 Kefeng Wang     2023-05-16   98  {
0866e82e40fba4 Kefeng Wang     2023-05-16  @99  	return false;
0866e82e40fba4 Kefeng Wang     2023-05-16  100  }
0866e82e40fba4 Kefeng Wang     2023-05-16  101  #endif /* CONFIG_FAIL_PAGE_ALLOC */
0866e82e40fba4 Kefeng Wang     2023-05-16  102  

:::::: The code at line 99 was first introduced by commit
:::::: 0866e82e40fba45dae07e6e8385929b574201752 mm: page_alloc: split out FAIL_PAGE_ALLOC

:::::: TO: Kefeng Wang <wangkefeng.wang@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
