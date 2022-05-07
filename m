Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B587FF
	for <llvm@lists.linux.dev>; Sat,  7 May 2022 04:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651899005; x=1683435005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J/3K4Vwk1O/C7U6JgPB5V1dfiV3hQe4EsWkA0JGHPKQ=;
  b=azYWsdJQ98eBuG9wDClHblEOCFj/Z/FQRsccwKwCkSRiRqxIVZQ1yk9e
   09cAzC/mg51FyplAvwzGrg+PsJmTEzQuDurHAzgpiqD/igKEhFktz8MgA
   ATTgvltbgfjcGRbpou6XgsQqw7zZ4PY2WEKlvdOf+CLAsUQK4xVQL5nR0
   o+fLRcv09tq1VcDVlsPAgBT3iVdr/8L9kyzSfLA/oKqw9a3pGAajKJKsx
   tGq3ANuiQNZIjdwlwq3xYQm+S5mGmZV8/IVpBDB6iLcUPBkFtaETDIhQe
   SztqIBrVHsj6psq6AiDZtdSaAKlfe35D/Wm1AyjxyL7d3FQUpMGgGKi+V
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="293866632"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; 
   d="scan'208";a="293866632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 21:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; 
   d="scan'208";a="736067130"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2022 21:50:01 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nnCOG-000EDc-Rm;
	Sat, 07 May 2022 04:50:00 +0000
Date: Sat, 7 May 2022 12:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: cgel.zte@gmail.com, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, keescook@chromium.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, xu xin <xu.xin16@zte.com.cn>,
	Yang Yang <yang.yang29@zte.com.cn>,
	Ran Xiaokai <ran.xiaokai@zte.com.cn>,
	wangyong <wang.yong12@zte.com.cn>,
	Yunkai Zhang <zhang.yunkai@zte.com.cn>
Subject: Re: [PATCH v2] mm/ksm: introduce ksm_force for each process
Message-ID: <202205071229.7ltA0xmX-lkp@intel.com>
References: <20220507014318.642353-1-xu.xin16@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507014318.642353-1-xu.xin16@zte.com.cn>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20220506]
[cannot apply to hnaz-mm/master kees/for-next/pstore linus/master v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/cgel-zte-gmail-com/mm-ksm-introduce-ksm_force-for-each-process/20220507-094557
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r045-20220506 (https://download.01.org/0day-ci/archive/20220507/202205071229.7ltA0xmX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bc6a122b9e10290755c811e7fa23dd60d39303e2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/mm-ksm-introduce-ksm_force-for-each-process/20220507-094557
        git checkout bc6a122b9e10290755c811e7fa23dd60d39303e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/ksm.c:343:3: error: use of undeclared identifier 'turn'
                   turn false;
                   ^
   1 error generated.


vim +/turn +343 mm/ksm.c

   336	
   337	/* Check if vma is qualified for ksmd scanning */
   338	static bool ksm_vma_check(struct vm_area_struct *vma)
   339	{
   340		unsigned long vm_flags = vma->vm_flags;
   341	
   342		if (!(vma->vm_flags & VM_MERGEABLE) && !(vma->vm_mm->ksm_force))
 > 343			turn false;
   344	
   345		if (vm_flags & (VM_SHARED	| VM_MAYSHARE	|
   346				VM_PFNMAP	| VM_IO | VM_DONTEXPAND |
   347				VM_HUGETLB	| VM_MIXEDMAP))
   348			return false;       /* just ignore this vma*/
   349	
   350		if (vma_is_dax(vma))
   351			return false;
   352	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
