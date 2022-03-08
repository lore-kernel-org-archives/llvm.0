Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D627A
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646728100; x=1678264100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/04Oyey+zXsXV5WWEAkTS8/1tqfuKIZP3r4RrEqe4OE=;
  b=UU6E17X8Uiw/0eZeA2cijN9fnCtclgpTiFCw6UbbG11vTNIaRs5AU/o/
   2gImdn4ujnag3o+gSHBmC2z4+JV8Ny5fEY/bAh5l8kvEC/fcU2I9f9/YK
   b+eH6q+BewYVKkXwwedhwQfJWbc/JpCKWcPrTc56Wx3buteD2IGrwWasg
   UxBXziJ9QfvOQFodTCUl4jVnAakiLuhXWEhJeZkd/vzxO7g/55F9jtUrs
   3cRLN4m1Fq87VTHeXbNI76gOENMw5SdP/qNsN5Dr97RceDJXsCKTrdZXI
   60uLImlJV/xLV87JCunOUS3DNewXebJBS43prCdoNT4QJ270aNcfZrPJA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="235237170"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="235237170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 00:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="553531211"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2022 00:28:16 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRVCa-00019A-7y; Tue, 08 Mar 2022 08:28:16 +0000
Date: Tue, 8 Mar 2022 16:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-ID: <202203081636.B87sz0BM-lkp@intel.com>
References: <20220306032655.97863-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220306032655.97863-1-jarkko@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jarkko,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/0day-ci/linux/commits/Jarkko-Sakkinen/mm-Add-f_ops-populate/20220307-150639
base:   https://github.com/hnaz/linux-mm master
config: riscv-randconfig-r042-20220307 (https://download.01.org/0day-ci/archive/20220308/202203081636.B87sz0BM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a051c250930ed53847224b09aaa43927a25e6c63
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jarkko-Sakkinen/mm-Add-f_ops-populate/20220307-150639
        git checkout a051c250930ed53847224b09aaa43927a25e6c63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> ipc/shm.c:590:34: error: use of undeclared identifier 'do_populate'; did you mean 'mm_populate'?
           ret = call_mmap(sfd->file, vma, do_populate);
                                           ^~~~~~~~~~~
                                           mm_populate
   include/linux/mm.h:2698:20: note: 'mm_populate' declared here
   static inline void mm_populate(unsigned long addr, unsigned long len)
                      ^
>> ipc/shm.c:590:34: warning: address of function 'mm_populate' will always evaluate to 'true' [-Wpointer-bool-conversion]
           ret = call_mmap(sfd->file, vma, do_populate);
                 ~~~~~~~~~                 ^~~~~~~~~~~
   ipc/shm.c:590:34: note: prefix with the address-of operator to silence this warning
           ret = call_mmap(sfd->file, vma, do_populate);
                                           ^
                                           &
   1 warning and 1 error generated.


vim +590 ipc/shm.c

   575	
   576	static int shm_mmap(struct file *file, struct vm_area_struct *vma)
   577	{
   578		struct shm_file_data *sfd = shm_file_data(file);
   579		int ret;
   580	
   581		/*
   582		 * In case of remap_file_pages() emulation, the file can represent an
   583		 * IPC ID that was removed, and possibly even reused by another shm
   584		 * segment already.  Propagate this case as an error to caller.
   585		 */
   586		ret = __shm_open(vma);
   587		if (ret)
   588			return ret;
   589	
 > 590		ret = call_mmap(sfd->file, vma, do_populate);
   591		if (ret) {
   592			shm_close(vma);
   593			return ret;
   594		}
   595		sfd->vm_ops = vma->vm_ops;
   596	#ifdef CONFIG_MMU
   597		WARN_ON(!sfd->vm_ops->fault);
   598	#endif
   599		vma->vm_ops = &shm_vm_ops;
   600		return 0;
   601	}
   602	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
