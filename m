Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E424B5A;
	Wed, 22 Nov 2023 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itE5hsi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700674490; x=1732210490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvbayhWYhgcvsYqkMk5dr/Pph08UkMS89wKHvaM6NIA=;
  b=itE5hsi0mJbjasPMH2jaR4wLVpVaggez1Cq6Z65LkWPuZlPKElmbVtcN
   usXFnLhVk+F33dG/zOR6cXOdBlfQ7bj20W2Ct2DODWHKTyyk+p9ttDEci
   Ql7HwhPUG3/qFgxoOw7/cwrKPk4MZnTV1NFcY+0aba0/CSzTUlBvjozIs
   lwugGJZl74DqZPZIZCn/cvaI+kRNMnabahMr3wo0T3QAUKHzKBeflgqcI
   Oa84ksw/wpFaPsnpJ5a7m26AnK44lAWrl09Nn0VeaVGX/Btib068FN3AO
   W8NPM/RT/OqFNSkHPbCN91zp6gcZpfqZo1tzNHYab8+IfpqKmBBR57x6o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13650944"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13650944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8565768"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 09:34:47 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5r7c-0000jR-1H;
	Wed, 22 Nov 2023 17:34:44 +0000
Date: Thu, 23 Nov 2023 01:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 3/8] riscv: Avoid TLB flush loops when affected by
 SiFive CIP-1200
Message-ID: <202311222306.siw2cvCj-lkp@intel.com>
References: <20231122010815.3545294-4-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122010815.3545294-4-samuel.holland@sifive.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-mm-Combine-the-SMP-and-UP-TLB-flush-code/20231122-091249
base:   linus/master
patch link:    https://lore.kernel.org/r/20231122010815.3545294-4-samuel.holland%40sifive.com
patch subject: [PATCH v3 3/8] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
config: riscv-randconfig-001-20231122 (https://download.01.org/0day-ci/archive/20231122/202311222306.siw2cvCj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222306.siw2cvCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222306.siw2cvCj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/errata/sifive/errata.c:46:2: error: use of undeclared identifier 'tlb_flush_all_threshold'
           tlb_flush_all_threshold = 0;
           ^
   1 error generated.


vim +/tlb_flush_all_threshold +46 arch/riscv/errata/sifive/errata.c

    33	
    34	static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long impid)
    35	{
    36		/*
    37		 * Affected cores:
    38		 * Architecture ID: 0x8000000000000007 or 0x1
    39		 * Implement ID: mimpid[23:0] <= 0x200630 and mimpid != 0x01200626
    40		 */
    41		if (arch_id != 0x8000000000000007 && arch_id != 0x1)
    42			return false;
    43		if ((impid & 0xffffff) > 0x200630 || impid == 0x1200626)
    44			return false;
    45	
  > 46		tlb_flush_all_threshold = 0;
    47	
    48		return true;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
