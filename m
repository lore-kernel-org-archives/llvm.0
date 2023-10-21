Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DBA32;
	Sat, 21 Oct 2023 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GB0huT1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697855325; x=1729391325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2N8FCbnpATNLD5IQsLXnVyPaQW5ZV+iV8Hc1wgFzxk=;
  b=GB0huT1vpiQbaHnpY/ZQhRu59yb2v00wA+yx/M3opjt4iiWiD+aUdzJm
   3Jp6MTipbT1XplbAptEUsrZPS8aC9Me22DcmlwbQACkCUdgSGsdDeStXl
   R4DU34SL6yNmXAXROhAShkG/YPAz8+rcbOWoJI35E9G3XBr2HMNFqQzXM
   p5b8C+iUnCE6fi7V6JvYZOxgrOSQWzuKa/vTCQAe+qQD6kuao1q8RLSs9
   cjjiZZpdb6iGpXL7+3WQfxaG8zqlcRlt7n8Q60WoS5MmlmsabJiu7WqYe
   CybWgWgLCiXs0TEmka37dRqi8EPZ5S6XusbnPp4S/ZHCjN9ao1tSwfDXo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389456320"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389456320"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 19:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="901295475"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="901295475"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2023 19:26:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu1jE-0004HO-0I;
	Sat, 21 Oct 2023 02:28:40 +0000
Date: Sat, 21 Oct 2023 10:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 13777/13906] kernel/bpf/task_iter.c:919:7: error:
 use of undeclared identifier 'CSS_TASK_ITER_PROCS'
Message-ID: <202310211011.pTzXR2o9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: 9c66dc94b62aef23300f05f63404afb8990920b4 [13777/13906] bpf: Introduce css_task open-coded iterator kfuncs
config: hexagon-randconfig-r003-20230725 (https://download.01.org/0day-ci/archive/20231021/202310211011.pTzXR2o9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211011.pTzXR2o9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211011.pTzXR2o9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/task_iter.c:9:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/bpf/task_iter.c:9:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/bpf/task_iter.c:9:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> kernel/bpf/task_iter.c:919:7: error: use of undeclared identifier 'CSS_TASK_ITER_PROCS'
           case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
                ^
>> kernel/bpf/task_iter.c:919:29: error: use of undeclared identifier 'CSS_TASK_ITER_THREADED'
           case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
                                      ^
   kernel/bpf/task_iter.c:920:7: error: use of undeclared identifier 'CSS_TASK_ITER_PROCS'
           case CSS_TASK_ITER_PROCS:
                ^
>> kernel/bpf/task_iter.c:927:46: error: invalid application of 'sizeof' to an incomplete type 'struct css_task_iter'
           kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
                                                       ^     ~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:902:9: note: forward declaration of 'struct css_task_iter'
           struct css_task_iter *css_it;
                  ^
>> kernel/bpf/task_iter.c:930:2: error: call to undeclared function 'css_task_iter_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           css_task_iter_start(css, flags, kit->css_it);
           ^
   kernel/bpf/task_iter.c:930:2: note: did you mean '__sg_page_iter_start'?
   include/linux/scatterlist.h:573:6: note: '__sg_page_iter_start' declared here
   void __sg_page_iter_start(struct sg_page_iter *piter,
        ^
>> kernel/bpf/task_iter.c:940:9: error: call to undeclared function 'css_task_iter_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return css_task_iter_next(kit->css_it);
                  ^
>> kernel/bpf/task_iter.c:940:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct task_struct *' [-Wint-conversion]
           return css_task_iter_next(kit->css_it);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:949:2: error: call to undeclared function 'css_task_iter_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           css_task_iter_end(kit->css_it);
           ^
   6 warnings and 8 errors generated.


vim +/CSS_TASK_ITER_PROCS +919 kernel/bpf/task_iter.c

   904	
   905	__diag_push();
   906	__diag_ignore_all("-Wmissing-prototypes",
   907			  "Global functions as their definitions will be in vmlinux BTF");
   908	
   909	__bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
   910			struct cgroup_subsys_state *css, unsigned int flags)
   911	{
   912		struct bpf_iter_css_task_kern *kit = (void *)it;
   913	
   914		BUILD_BUG_ON(sizeof(struct bpf_iter_css_task_kern) != sizeof(struct bpf_iter_css_task));
   915		BUILD_BUG_ON(__alignof__(struct bpf_iter_css_task_kern) !=
   916						__alignof__(struct bpf_iter_css_task));
   917		kit->css_it = NULL;
   918		switch (flags) {
 > 919		case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
 > 920		case CSS_TASK_ITER_PROCS:
   921		case 0:
   922			break;
   923		default:
   924			return -EINVAL;
   925		}
   926	
 > 927		kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
   928		if (!kit->css_it)
   929			return -ENOMEM;
 > 930		css_task_iter_start(css, flags, kit->css_it);
   931		return 0;
   932	}
   933	
   934	__bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
   935	{
   936		struct bpf_iter_css_task_kern *kit = (void *)it;
   937	
   938		if (!kit->css_it)
   939			return NULL;
 > 940		return css_task_iter_next(kit->css_it);
   941	}
   942	
   943	__bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
   944	{
   945		struct bpf_iter_css_task_kern *kit = (void *)it;
   946	
   947		if (!kit->css_it)
   948			return;
 > 949		css_task_iter_end(kit->css_it);
   950		bpf_mem_free(&bpf_global_ma, kit->css_it);
   951	}
   952	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
