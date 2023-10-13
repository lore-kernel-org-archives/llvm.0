Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C01BDD0;
	Fri, 13 Oct 2023 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUhJArcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697211833; x=1728747833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DzEEbiGTrFq9bOnUL3/9iUPblV7WbMl91Pg8leLraYQ=;
  b=nUhJArczNXXwXiv66QmCeoBm4UKWH3RMi7e48HfkkI16C3lBo0YuR+I4
   T8fftm0q61jJ0yjdAILd7blcBgqZ6rPTn4duspUw03uL37gcb4pArabQo
   Diir7rJ73IV64T8Z52izdOLN6771o90r3NvOi+za9mGyrzynyYjZ3bjlP
   IMtUbusYJTzu2kJhIZFuRsQVlbMWVqy2D+04lAVu2ukP0Kx9/3iow9U8h
   zB6w5QYP4cMbguVs+w/2ymBb9t9N0e+AhNLMEJp4l3Y4SX1/7y+BIX07Z
   SkXnV5uDTXP5TvwokWnHosAYsNpUlgzbfi8YEwcC5KdLyvYhXt5YUzPlM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370274682"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370274682"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 08:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928461804"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="928461804"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 08:43:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrKKE-00052X-1g;
	Fri, 13 Oct 2023 15:43:42 +0000
Date: Fri, 13 Oct 2023 23:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Kernel Team <kernel-team@fb.com>,
	Dave Marchevsky <davemarchevsky@fb.com>,
	Nathan Slingerland <slinger@meta.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: Introduce task_vma open-coded
 iterator kfuncs
Message-ID: <202310132300.wnnctWmF-lkp@intel.com>
References: <20231010185944.3888849-4-davemarchevsky@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010185944.3888849-4-davemarchevsky@fb.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/bpf-Don-t-explicitly-emit-BTF-for-struct-btf_iter_num/20231011-030202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231010185944.3888849-4-davemarchevsky%40fb.com
patch subject: [PATCH v6 bpf-next 3/4] bpf: Introduce task_vma open-coded iterator kfuncs
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231013/202310132300.wnnctWmF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132300.wnnctWmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132300.wnnctWmF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/task_iter.c:827:17: warning: no previous prototype for function 'bpf_iter_task_vma_new' [-Wmissing-prototypes]
   __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
                   ^
   kernel/bpf/task_iter.c:827:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
               ^
               static 
>> kernel/bpf/task_iter.c:871:36: warning: no previous prototype for function 'bpf_iter_task_vma_next' [-Wmissing-prototypes]
   __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
                                      ^
   kernel/bpf/task_iter.c:871:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
               ^
               static 
>> kernel/bpf/task_iter.c:880:18: warning: no previous prototype for function 'bpf_iter_task_vma_destroy' [-Wmissing-prototypes]
   __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
                    ^
   kernel/bpf/task_iter.c:880:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
               ^
               static 
   3 warnings generated.


vim +/bpf_iter_task_vma_new +827 kernel/bpf/task_iter.c

   826	
 > 827	__bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
   828					      struct task_struct *task, u64 addr)
   829	{
   830		struct bpf_iter_task_vma_kern *kit = (void *)it;
   831		bool irq_work_busy = false;
   832		int err;
   833	
   834		BUILD_BUG_ON(sizeof(struct bpf_iter_task_vma_kern) != sizeof(struct bpf_iter_task_vma));
   835		BUILD_BUG_ON(__alignof__(struct bpf_iter_task_vma_kern) != __alignof__(struct bpf_iter_task_vma));
   836	
   837		/* is_iter_reg_valid_uninit guarantees that kit hasn't been initialized
   838		 * before, so non-NULL kit->data doesn't point to previously
   839		 * bpf_mem_alloc'd bpf_iter_task_vma_kern_data
   840		 */
   841		kit->data = bpf_mem_alloc(&bpf_global_ma, sizeof(struct bpf_iter_task_vma_kern_data));
   842		if (!kit->data)
   843			return -ENOMEM;
   844	
   845		kit->data->task = get_task_struct(task);
   846		kit->data->mm = task->mm;
   847		if (!kit->data->mm) {
   848			err = -ENOENT;
   849			goto err_cleanup_iter;
   850		}
   851	
   852		/* kit->data->work == NULL is valid after bpf_mmap_unlock_get_irq_work */
   853		irq_work_busy = bpf_mmap_unlock_get_irq_work(&kit->data->work);
   854		if (irq_work_busy || !mmap_read_trylock(kit->data->mm)) {
   855			err = -EBUSY;
   856			goto err_cleanup_iter;
   857		}
   858	
   859		vma_iter_init(&kit->data->vmi, kit->data->mm, addr);
   860		return 0;
   861	
   862	err_cleanup_iter:
   863		if (kit->data->task)
   864			put_task_struct(kit->data->task);
   865		bpf_mem_free(&bpf_global_ma, kit->data);
   866		/* NULL kit->data signals failed bpf_iter_task_vma initialization */
   867		kit->data = NULL;
   868		return err;
   869	}
   870	
 > 871	__bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
   872	{
   873		struct bpf_iter_task_vma_kern *kit = (void *)it;
   874	
   875		if (!kit->data) /* bpf_iter_task_vma_new failed */
   876			return NULL;
   877		return vma_next(&kit->data->vmi);
   878	}
   879	
 > 880	__bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
   881	{
   882		struct bpf_iter_task_vma_kern *kit = (void *)it;
   883	
   884		if (kit->data) {
   885			bpf_mmap_unlock_mm(kit->data->work, kit->data->mm);
   886			put_task_struct(kit->data->task);
   887			bpf_mem_free(&bpf_global_ma, kit->data);
   888		}
   889	}
   890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
