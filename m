Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629559;
	b=j7TXEt0U77IP20CmS7EXtHfr+pwDqJawkzu9hUIR5wBNH9R8pMYOXxikqj8ES06eEYPo
	 ixx03sjlgNLuEzhK9zvQDc/MsWJdxgIpJZfLCUSybwwiJPx2FXFl6FFJzvLGmqHB/1Liw
	 sPz0/LysstFPVcKIb/nKX0QgAu1DcnujdgC0Uxkp83pdQiJxLoayYHVkqNfDtCD1yd7hz
	 j1g4h8WZFetpwTYf54oLWI954NcZtk34YAKc+/YdYU6HVJ2uoLs1fzh2s/6iO2qFbk1/C
	 azGsd/cGoIa8YO/+3661VxZ9gkdx4kzsJQxOYuhHS3L/b2s6zuevMBZjr+Tx9Xwc8Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629559;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iy5aL1ocio+77t/dXWLXVKeq77RL7RF6fKMbaIN8tko=;
	b=JhZkLekYuaQbMRUV/HCAsTDDqgBsN27nIpuQ5Lm1fctqZ3ZT2x7oN+P9ej+qdip+eD0O
	 /JA97EIhbSxRvhLxhXZO3doXys0QYq9iJw4Y9FysSB9P9CqyUbhjgFl7kfL2yy8RBkuCT
	 vOh+RlkxP2lwXlSmoY4FBINPRN/hTc6iX8mXf5/YZne5xx/M18R/pNqqdwkIq+dOg5Lq/
	 H7xUqwBshhD4KCbEDMgxiRcgvUdE/FTy0EPYXKwyLWhTY/tUp32jNBRO0M0OMIcmsw13e
	 mjICWg/WUQdO0/vDt6FEGos7VbC8V+J+sY8ai39GlIP7A0QXL/wjoSG3fpz9cfJrJzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BYBH3VHL;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13B606A32A;
	Wed, 25 Nov 2026 17:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E13B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BYBH3VHL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795629559; x=1827165559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Q0eWoH0hqjK/+AffASRnzPWdWve09RRdkIHSFgQxy4=;
  b=BYBH3VHL3NaR0CgflPQVthlryco9nH9rMy0RUtVeKIL3/0+cj6vrSgVl
   sf42Yo4iazNa2g/TyuaAa/wGnVQ2gdnXiN8jx0kiSpS9zYhMQsHs9lmcP
   2zn3Rk2v2fKwYtfTuOOOoKWG8lzCa3BT2f/K8Nes1KX7xgLEAoLlprvyK
   M54r9XDOObOAvHD8SFHUN5zWJrNfHsmeGaPUpgBZb5cpsDUIzZbsinF6q
   NqE6zLICafpY48Ahr55hIKJiDoperpMttAFpDdijbEy5lWTABD2SmadYV
   e4flVHFfaTlJNgeCjxY/QLW07vCCpZkO95OIiixmn3VEFnCgO/ehu3Kgi
   w==;
X-CSE-ConnectionGUID: 1mOCLOyzTqecK0DyrqiFOw==
X-CSE-MsgGUID: 1cpTpdNcTkKpdIjJCpPe/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462392"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4462392"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:59:19 -0800
X-CSE-ConnectionGUID: 6a6LIVAHRomgpZJMlg93nw==
X-CSE-MsgGUID: A0u+DZzIQwOjdpZxlfyO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13597397"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 25 Nov 2026 09:59:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWHGw-00000001SGM-3o5J;
	Wed, 25 Nov 2026 17:59:10 +0000
Date: Thu, 26 Nov 2026 01:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, anup@brainfault.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org, yosry@kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tan Chi <tanchi25@mails.ucas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Account G-stage page table memory
Message-ID: <20261126015340.s7bzBtEB-lkp@intel.com>
References: <20261125125024.1983082-1-tanchi25@mails.ucas.ac.cn>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125125024.1983082-1-tanchi25@mails.ucas.ac.cn>

Hi Tan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm-riscv/riscv_kvm_next]
[also build test WARNING on linus/master next-20261124]
[cannot apply to tj-cgroup/for-next kvm/queue kvm/next mst-vhost/linux-next kvm/linux-next v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tan-Chi/RISC-V-KVM-Account-G-stage-page-table-memory/20261125-205023
base:   https://github.com/kvm-riscv/linux.git riscv_kvm_next
patch link:    https://lore.kernel.org/r/20261125125024.1983082-1-tanchi25%40mails.ucas.ac.cn
patch subject: [PATCH] RISC-V: KVM: Account G-stage page table memory
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261126/20261126015340.s7bzBtEB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126015340.s7bzBtEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126015340.s7bzBtEB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/mmu.c:850:5: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551612 to -4 [-Wconstant-conversion]
     849 |                 kvm_account_pgtable_pages(pgd,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
     850 |                                 -(kvm_riscv_gstage_pgd_size >> PAGE_SHIFT));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +850 arch/riscv/kvm/mmu.c

   827	
   828	void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
   829	{
   830		struct kvm_gstage gstage;
   831		void *pgd = NULL;
   832		bool flush = false;
   833	
   834		write_lock(&kvm->mmu_lock);
   835		if (kvm->arch.pgd) {
   836			kvm_riscv_gstage_init(&gstage, kvm);
   837			flush = kvm_riscv_gstage_unmap_all(&gstage);
   838			pgd = READ_ONCE(kvm->arch.pgd);
   839			kvm->arch.pgd = NULL;
   840			kvm->arch.pgd_phys = 0;
   841			kvm->arch.pgd_levels = 0;
   842		}
   843		write_unlock(&kvm->mmu_lock);
   844	
   845		if (flush)
   846			kvm_flush_remote_tlbs(kvm);
   847	
   848		if (pgd) {
   849			kvm_account_pgtable_pages(pgd,
 > 850					-(kvm_riscv_gstage_pgd_size >> PAGE_SHIFT));
   851			free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
   852		}
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
