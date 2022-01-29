Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A42B2C9E
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643441689; x=1674977689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZjpCBsxGtkGlJQG22wfebQji6thN100WEpKIQAVvOmo=;
  b=HvXkRtr1jqdkJiJCBGJcruhkOfGkDPE3JDHbHM5pSA5B7r26RHf7/kWQ
   GdrzH38Rf20WdUMLeTIfzWsfxiSzI3naETPtFCUbRaa6dLCogOfFKwyWl
   pDhFSz0pKu9AyhRmFBch7iTISMsErqQxS8Kzn2OOjciKgd6UjtHbA4/9Q
   MgG4F0BlD/s/K8z/H9bfbak2DEmpJ4DquB6FhTUiXcs3iEJfEIcCLsFNU
   oHGIjC5PUzTQGhFXPNxwtRKwOkXeQOBMyPvPczEOFsOzQ/0uN2iiKkS9W
   LnHMAz6MJvyI3xSsqr+wOax7Ls1dRss0LAJiLyd2081IRBNWDj22C/BD7
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="247201259"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; 
   d="scan'208";a="247201259"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 23:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; 
   d="scan'208";a="629366659"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2022 23:34:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDiFz-000Ovw-8X; Sat, 29 Jan 2022 07:34:47 +0000
Date: Sat, 29 Jan 2022 15:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jane Chu <jane.chu@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 5/7] pmem: add pmem_recovery_write() dax op
Message-ID: <202201291550.PbNwGb5W-lkp@intel.com>
References: <20220128213150.1333552-6-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128213150.1333552-6-jane.chu@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jane,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on nvdimm/libnvdimm-for-next]
[also build test WARNING on linus/master v5.17-rc1 next-20220128]
[cannot apply to device-mapper-dm/for-next tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jane-Chu/DAX-poison-recovery/20220129-053412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
config: mips-randconfig-r026-20220127 (https://download.01.org/0day-ci/archive/20220129/202201291550.PbNwGb5W-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/7190481d22a37d39ed1ae4268805d6cb0335849f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jane-Chu/DAX-poison-recovery/20220129-053412
        git checkout 7190481d22a37d39ed1ae4268805d6cb0335849f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/nvdimm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvdimm/pmem.c:353:10: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                           addr, bytes);
                                 ^~~~~
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +353 drivers/nvdimm/pmem.c

   314	
   315	/*
   316	 * The recovery write thread started out as a normal pwrite thread and
   317	 * when the filesystem was told about potential media error in the
   318	 * range, filesystem turns the normal pwrite to a dax_recovery_write.
   319	 *
   320	 * The recovery write consists of clearing poison via DSM, clearing page
   321	 * HWPoison bit, reenable page-wide read-write permission, flush the
   322	 * caches and finally write.  A competing pread thread needs to be held
   323	 * off during the recovery process since data read back might not be valid.
   324	 * And that's achieved by placing the badblock records clearing after
   325	 * the completion of the recovery write.
   326	 *
   327	 * Any competing recovery write thread needs to be serialized, and this is
   328	 * done via pmem device level lock .recovery_lock.
   329	 */
   330	static size_t pmem_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
   331			void *addr, size_t bytes, struct iov_iter *i)
   332	{
   333		size_t rc, len, off;
   334		phys_addr_t pmem_off;
   335		struct pmem_device *pmem = dax_get_private(dax_dev);
   336		struct device *dev = pmem->bb.dev;
   337		sector_t sector;
   338		long cleared, cleared_blk;
   339	
   340		mutex_lock(&pmem->recovery_lock);
   341	
   342		/* If no poison found in the range, go ahead with write */
   343		off = (unsigned long)addr & ~PAGE_MASK;
   344		len = PFN_PHYS(PFN_UP(off + bytes));
   345		if (!is_bad_pmem(&pmem->bb, PFN_PHYS(pgoff) / 512, len)) {
   346			rc = _copy_from_iter_flushcache(addr, bytes, i);
   347			goto write_done;
   348		}
   349	
   350		/* Not page-aligned range cannot be recovered */
   351		if (off || !(PAGE_ALIGNED(bytes))) {
   352			dev_warn(dev, "Found poison, but addr(%p) or bytes(%#lx) not page aligned\n",
 > 353				addr, bytes);
   354			rc = (size_t) -EIO;
   355			goto write_done;
   356		}
   357	
   358		pmem_off = PFN_PHYS(pgoff) + pmem->data_offset;
   359		sector = (pmem_off - pmem->data_offset) / 512;
   360		cleared = nvdimm_clear_poison(dev, pmem->phys_addr + pmem_off, len);
   361		cleared_blk = cleared / 512;
   362		if (cleared_blk > 0) {
   363			hwpoison_clear(pmem, pmem->phys_addr + pmem_off, cleared);
   364		} else {
   365			dev_warn(dev, "pmem_recovery_write: cleared_blk: %ld\n",
   366				cleared_blk);
   367			rc = (size_t) -EIO;
   368			goto write_done;
   369		}
   370		arch_invalidate_pmem(pmem->virt_addr + pmem_off, bytes);
   371		rc = _copy_from_iter_flushcache(addr, bytes, i);
   372		pmem_clear_badblocks(pmem, sector, cleared_blk);
   373	
   374	write_done:
   375		mutex_unlock(&pmem->recovery_lock);
   376		return rc;
   377	}
   378	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
