Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240781386
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645687817; x=1677223817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tgMF2lu5e7/DNFlZ2rsoq/AtCC+HWKVz9zdYejbO2wY=;
  b=HR7a6/AMf2noaaMqr0uHqnihlPQ8ypu9jYqUR/Sm4+AAKcKqJkqjt24d
   KheQK/0DghaTuIhGtBOhwCkqwnkuwOsLAD18a9z82uN1F9RqeNDbN41SL
   HQy2AecDqR+p9H60AQx3JIqgGp/CA6FFyr6hUREaUPWCz/sEm6E4f8A7f
   PjcQ0NW2SzrDWFHcomZEzcTuAhDhl/dlPAxihcO6v9QthBoxIVZOajETi
   IKJowNQwvw4WhHhkSgJ4Enb/r/WdbA2KcdUkklq+N5rfgCgBhc+4AAZlk
   deo14RuE0JT2c9WBX6AqqnK8eKcRCr9DXKZzjmcMyXfWa/MY7qdpHK/TF
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232791574"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="232791574"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 23:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="776963328"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2022 23:30:14 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN8Zq-0002pY-7g; Thu, 24 Feb 2022 07:30:14 +0000
Date: Thu, 24 Feb 2022 15:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [linux-next:master 6797/7915] mm/mmap.c:754:6: warning: no previous
 prototype for function 'vma_store'
Message-ID: <202202241511.4YOktWCD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: e1345552730700c6b405d20acdfb92da77d0cdbf [6797/7915] kernel/fork: Use maple tree for dup_mmap() during forking
config: arm-pcm027_defconfig (https://download.01.org/0day-ci/archive/20220224/202202241511.4YOktWCD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e1345552730700c6b405d20acdfb92da77d0cdbf
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e1345552730700c6b405d20acdfb92da77d0cdbf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/mmap.c:754:6: warning: no previous prototype for function 'vma_store' [-Wmissing-prototypes]
   void vma_store(struct mm_struct *mm, struct vm_area_struct *vma)
        ^
   mm/mmap.c:754:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vma_store(struct mm_struct *mm, struct vm_area_struct *vma)
   ^
   static 
   1 warning generated.


vim +/vma_store +754 mm/mmap.c

37f4270132af31d Liam R. Howlett 2020-07-24  748  
37f4270132af31d Liam R. Howlett 2020-07-24  749  /*
37f4270132af31d Liam R. Howlett 2020-07-24  750   * vma_store() - Store a given vm_area_struct in the maple tree.
37f4270132af31d Liam R. Howlett 2020-07-24  751   * @mm: The struct_mm
37f4270132af31d Liam R. Howlett 2020-07-24  752   * @vma: The vm_area_struct to store in the maple tree.
37f4270132af31d Liam R. Howlett 2020-07-24  753   */
37f4270132af31d Liam R. Howlett 2020-07-24 @754  void vma_store(struct mm_struct *mm, struct vm_area_struct *vma)
37f4270132af31d Liam R. Howlett 2020-07-24  755  {
37f4270132af31d Liam R. Howlett 2020-07-24  756  	MA_STATE(mas, &mm->mm_mt, 0, 0);
37f4270132af31d Liam R. Howlett 2020-07-24  757  
37f4270132af31d Liam R. Howlett 2020-07-24  758  	trace_vma_store(vma->vm_mm, vma);
37f4270132af31d Liam R. Howlett 2020-07-24  759  	vma_mas_store(vma, &mas);
37f4270132af31d Liam R. Howlett 2020-07-24  760  }
37f4270132af31d Liam R. Howlett 2020-07-24  761  

:::::: The code at line 754 was first introduced by commit
:::::: 37f4270132af31dd08a209799d420f72bfddb49c mm: Start tracking VMAs with maple tree

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Liam R. Howlett <Liam.Howlett@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
