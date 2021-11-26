Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02629CA
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 14:39:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="259576991"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="259576991"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 06:39:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="607888309"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Nov 2021 06:39:05 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqcNV-0008FZ-0D; Fri, 26 Nov 2021 14:39:05 +0000
Date: Fri, 26 Nov 2021 22:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3430/3897] drivers/dax/device.c:226:16: warning:
 variable 'fault_size' set but not used
Message-ID: <202111262232.JAaX7CBA-lkp@intel.com>
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
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: c9deaee814e738981ed06a444ccbe50b4ff1526a [3430/3897] device-dax: set mapping prior to vmf_insert_pfn{,_pmd,pud}()
config: x86_64-randconfig-a013-20211123 (https://download.01.org/0day-ci/archive/20211126/202111262232.JAaX7CBA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c9deaee814e738981ed06a444ccbe50b4ff1526a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c9deaee814e738981ed06a444ccbe50b4ff1526a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dax/device.c:226:16: warning: variable 'fault_size' set but not used [-Wunused-but-set-variable]
           unsigned long fault_size;
                         ^
   drivers/dax/device.c:396:5: warning: no previous prototype for function 'dev_dax_probe' [-Wmissing-prototypes]
   int dev_dax_probe(struct dev_dax *dev_dax)
       ^
   drivers/dax/device.c:396:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dev_dax_probe(struct dev_dax *dev_dax)
   ^
   static 
   2 warnings generated.


vim +/fault_size +226 drivers/dax/device.c

9557feee39b75ce drivers/dax/dax.c    Dave Jiang         2017-02-24  221  
226ab561075f6f8 drivers/dax/device.c Dan Williams       2018-07-13  222  static vm_fault_t dev_dax_huge_fault(struct vm_fault *vmf,
c791ace1e747371 drivers/dax/dax.c    Dave Jiang         2017-02-24  223  		enum page_entry_size pe_size)
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  224  {
f42003917b4569a drivers/dax/dax.c    Dave Jiang         2017-02-22  225  	struct file *filp = vmf->vma->vm_file;
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13 @226  	unsigned long fault_size;
36bdac1e674debd drivers/dax/device.c Souptick Joarder   2018-09-04  227  	vm_fault_t rc = VM_FAULT_SIGBUS;
36bdac1e674debd drivers/dax/device.c Souptick Joarder   2018-09-04  228  	int id;
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  229  	pfn_t pfn;
5f0694b300b9fb8 drivers/dax/dax.c    Dan Williams       2017-01-30  230  	struct dev_dax *dev_dax = filp->private_data;
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  231  
6daaca522ab464d drivers/dax/device.c Dan Williams       2018-03-05  232  	dev_dbg(&dev_dax->dev, "%s: %s (%#lx - %#lx) size = %d\n", current->comm,
6daaca522ab464d drivers/dax/device.c Dan Williams       2018-03-05  233  			(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
762026203c0b87b drivers/dax/dax.c    Oliver O'Halloran  2017-04-12  234  			vmf->vma->vm_start, vmf->vma->vm_end, pe_size);
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  235  
7b6be8444e0f0dd drivers/dax/device.c Dan Williams       2017-04-11  236  	id = dax_read_lock();
c791ace1e747371 drivers/dax/dax.c    Dave Jiang         2017-02-24  237  	switch (pe_size) {
c791ace1e747371 drivers/dax/dax.c    Dave Jiang         2017-02-24  238  	case PE_SIZE_PTE:
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  239  		fault_size = PAGE_SIZE;
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  240  		rc = __dev_dax_pte_fault(dev_dax, vmf, &pfn);
a2d581675d485eb drivers/dax/dax.c    Dave Jiang         2017-02-24  241  		break;
c791ace1e747371 drivers/dax/dax.c    Dave Jiang         2017-02-24  242  	case PE_SIZE_PMD:
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  243  		fault_size = PMD_SIZE;
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  244  		rc = __dev_dax_pmd_fault(dev_dax, vmf, &pfn);
9557feee39b75ce drivers/dax/dax.c    Dave Jiang         2017-02-24  245  		break;
c791ace1e747371 drivers/dax/dax.c    Dave Jiang         2017-02-24  246  	case PE_SIZE_PUD:
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  247  		fault_size = PUD_SIZE;
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  248  		rc = __dev_dax_pud_fault(dev_dax, vmf, &pfn);
a2d581675d485eb drivers/dax/dax.c    Dave Jiang         2017-02-24  249  		break;
a2d581675d485eb drivers/dax/dax.c    Dave Jiang         2017-02-24  250  	default:
54eafcc9e339aff drivers/dax/dax.c    Pushkar Jambhlekar 2017-04-11  251  		rc = VM_FAULT_SIGBUS;
a2d581675d485eb drivers/dax/dax.c    Dave Jiang         2017-02-24  252  	}
2232c6382a453db drivers/dax/device.c Dan Williams       2018-07-13  253  
7b6be8444e0f0dd drivers/dax/device.c Dan Williams       2017-04-11  254  	dax_read_unlock(id);
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  255  
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  256  	return rc;
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  257  }
dee410792419aaa drivers/dax/dax.c    Dan Williams       2016-05-14  258  

:::::: The code at line 226 was first introduced by commit
:::::: 2232c6382a453db73d2e723df1b52030066e135e device-dax: Enable page_mapping()

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
