Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4929F7C;
	Sat, 29 Jul 2023 01:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690593055; x=1722129055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzv2DGYsKbOYbLPt0TVO3KWubHCvzAMQu7xqNYXbC1s=;
  b=T2JQXNx16v+AXzkL+jl2D/HT8UY+egRw317G+FItn2SQx5I6fjA1z1Hd
   UqjOqsqiITWWkSvyknjj18UHXaLMAt0Bz3x1OHLmBmFi1UHn2ueKvwgj/
   J36W+z/gUs9SROmSR91NeQZjdGphZowLWjyTch/xovpe0EKuqDzwBiOjN
   3DjcLvtf57f8wyj4Yoy3KZq4nxzVHJSoZUbT6r52cnh4OgWz7hO9cMIfi
   eJ3M+zcvqa52ZCfTeezsO0qr3XxVQRcYp3u78MO308rCwEiS4ZXhZshj6
   qo3wxAIgs1ycHCpAC256GlkvObukNdycOfU3I0e9ik/6hBl8kVuRm7R8w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348321379"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="348321379"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 18:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="841517173"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="841517173"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2023 18:10:52 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPYTQ-0003j1-11;
	Sat, 29 Jul 2023 01:10:32 +0000
Date: Sat, 29 Jul 2023 09:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v5 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202307290828.WNBmhbTA-lkp@intel.com>
References: <20230728164754.460767-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728164754.460767-2-vdonnefort@google.com>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[cannot apply to rostedt-trace/for-next rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230729-005300
base:   linus/master
patch link:    https://lore.kernel.org/r/20230728164754.460767-2-vdonnefort%40google.com
patch subject: [PATCH v5 1/2] ring-buffer: Introducing ring-buffer mapping functions
config: arm-randconfig-r033-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290828.WNBmhbTA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290828.WNBmhbTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290828.WNBmhbTA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:5946:16: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
    5946 |                 virt_to_page(cpu_buffer->page_ids[i])->mapping = NULL;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/memory.h:390:53: note: expanded from macro 'virt_to_page'
     390 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:18:41: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/arm/include/asm/memory.h:296:53: note: passing argument to parameter 'p' here
     296 | static inline unsigned long virt_to_pfn(const void *p)
         |                                                     ^
   kernel/trace/ring_buffer.c:5968:15: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
    5968 |         virt_to_page(addr)->mapping = NULL;
         |                      ^~~~
   arch/arm/include/asm/memory.h:390:53: note: expanded from macro 'virt_to_page'
     390 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:18:41: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/arm/include/asm/memory.h:296:53: note: passing argument to parameter 'p' here
     296 | static inline unsigned long virt_to_pfn(const void *p)
         |                                                     ^
   kernel/trace/ring_buffer.c:6156:22: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
    6156 |         return virt_to_page(cpu_buffer->page_ids[pgoff]);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/memory.h:390:53: note: expanded from macro 'virt_to_page'
     390 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:18:41: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/arm/include/asm/memory.h:296:53: note: passing argument to parameter 'p' here
     296 | static inline unsigned long virt_to_pfn(const void *p)
         |                                                     ^
   3 errors generated.


vim +5946 kernel/trace/ring_buffer.c

  5940	
  5941	static void rb_free_page_ids(struct ring_buffer_per_cpu *cpu_buffer)
  5942	{
  5943		int i;
  5944	
  5945		for (i = 0; i < cpu_buffer->nr_pages + 1; i++)
> 5946			virt_to_page(cpu_buffer->page_ids[i])->mapping = NULL;
  5947	
  5948		kfree(cpu_buffer->page_ids);
  5949		cpu_buffer->page_ids = NULL;
  5950	}
  5951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
