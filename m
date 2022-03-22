Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB83C75
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647956691; x=1679492691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xNjDnMgEHpCF2A25uwYP+Yv48qAIEF8LeOXaCc3uCd0=;
  b=Nxdnpz1K+x0rS+FEyFGYc61YK4EUN3WnoNb4y3LFSld+bRnuChQ4oT3O
   DI4JwgdfCfGxIIBKECbNUNQejIGe8dNtgxzM6z2xm+eWEGWEB8jw+/1FH
   4ohtxcM73r2B6I5se3xik8r6vIuo5gXZbqKExRezOPGNEHvzU0QiPeqir
   fgoNk7ZmompykIw9scEa3fZgJuM3Lw0YOUxfmc8/cJ/N/vDmJbqouNQ3I
   itU1CW8iT08Y7KSwhwN8yxW65B0XRo+Uc1H4j+nbS4VB29qqfvFH8vwM7
   4ZGF4ZoDafxAC0G5Ho31TKiltTpmPNQk1rHjnoelfq58YmAEN1JVu4zUu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="238423784"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="238423784"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 06:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="518881444"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2022 06:44:49 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWeoa-000Irk-AU; Tue, 22 Mar 2022 13:44:48 +0000
Date: Tue, 22 Mar 2022 21:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 421/2335] include/linux/huge_mm.h:168:6: error:
 implicit declaration of function 'vma_is_dax'
Message-ID: <202203222155.TlSyCe5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: f7a0205170ca096c85d224726dc7f9cfc5950de3 [421/2335] headers/uninline: Uninline multi-use function: vma_is_dax() and vma_is_fsdax()
config: i386-randconfig-a016-20220314 (https://download.01.org/0day-ci/archive/20220322/202203222155.TlSyCe5J-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=f7a0205170ca096c85d224726dc7f9cfc5950de3
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout f7a0205170ca096c85d224726dc7f9cfc5950de3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/master HEAD 85293bf3fca6d85608cff1447ce3097583f15fab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/fuse/virtio_fs.c:8:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:689:
>> include/linux/huge_mm.h:168:6: error: implicit declaration of function 'vma_is_dax' [-Werror,-Wimplicit-function-declaration]
           if (vma_is_dax(vma))
               ^
   In file included from fs/fuse/virtio_fs.c:8:
   In file included from include/linux/dax.h:6:
>> include/linux/mm.h:3240:13: error: conflicting types for 'vma_is_dax'
   extern bool vma_is_dax(const struct vm_area_struct *vma);
               ^
   include/linux/huge_mm.h:168:6: note: previous implicit declaration is here
           if (vma_is_dax(vma))
               ^
   2 errors generated.


vim +/vma_is_dax +168 include/linux/huge_mm.h

bae84953815793 Aneesh Kumar K.V  2021-02-24  152  
bae84953815793 Aneesh Kumar K.V  2021-02-24  153  	/*
bae84953815793 Aneesh Kumar K.V  2021-02-24  154  	 * If the hardware/firmware marked hugepage support disabled.
bae84953815793 Aneesh Kumar K.V  2021-02-24  155  	 */
bae84953815793 Aneesh Kumar K.V  2021-02-24  156  	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_NEVER_DAX))
bae84953815793 Aneesh Kumar K.V  2021-02-24  157  		return false;
bae84953815793 Aneesh Kumar K.V  2021-02-24  158  
e6be37b2e7bddf Miaohe Lin        2021-06-30  159  	if (!transhuge_vma_enabled(vma, vma->vm_flags))
16981d763501c0 Dan Williams      2017-07-10  160  		return false;
16981d763501c0 Dan Williams      2017-07-10  161  
222100eed264ba Anshuman Khandual 2020-04-01  162  	if (vma_is_temporary_stack(vma))
16981d763501c0 Dan Williams      2017-07-10  163  		return false;
16981d763501c0 Dan Williams      2017-07-10  164  
16981d763501c0 Dan Williams      2017-07-10  165  	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_FLAG))
16981d763501c0 Dan Williams      2017-07-10  166  		return true;
bae84953815793 Aneesh Kumar K.V  2021-02-24  167  
baabda26142451 Dan Williams      2017-07-10 @168  	if (vma_is_dax(vma))
baabda26142451 Dan Williams      2017-07-10  169  		return true;
baabda26142451 Dan Williams      2017-07-10  170  
16981d763501c0 Dan Williams      2017-07-10  171  	if (transparent_hugepage_flags &
16981d763501c0 Dan Williams      2017-07-10  172  				(1 << TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG))
16981d763501c0 Dan Williams      2017-07-10  173  		return !!(vma->vm_flags & VM_HUGEPAGE);
16981d763501c0 Dan Williams      2017-07-10  174  
16981d763501c0 Dan Williams      2017-07-10  175  	return false;
16981d763501c0 Dan Williams      2017-07-10  176  }
16981d763501c0 Dan Williams      2017-07-10  177  

:::::: The code at line 168 was first introduced by commit
:::::: baabda261424517110ea98c6651f632ebf2561e3 mm: always enable thp for dax mappings

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
