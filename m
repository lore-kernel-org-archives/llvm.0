Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87F2F5C
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647470054; x=1679006054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h2USJVXKZTSVuP114+WJw9yggyyP5T12vioFREPBmnk=;
  b=bFDGLp2WkvXYRln2j1fWNvlZQCP8NPpRRd3cnNqsd8MD5Jh9i8PMShKE
   HRvRbp+Ae4wAYZU74paNmL2UvqMAo7YWyWTxOLiahDSVIrw3IB7gx7HyM
   EHXSVxgydCJWAJzxPhrUxmoogQq0K84kQeGcLdwLeppNtNI9rrBv1Y7tB
   Y6p3FwdDafFx1oyUvxhWQRF0pk5edhYqgl7+6yNLCduzyqEISoDcS5Qd/
   ec5i6lUdY/iEbRAqT3/IO6zsKxLjQlOII2Bkg0tuFcStnGKtcezzOwk3K
   rxRVppw/XT1ckXJZzjNqjFvsSrDdIifF2UX7i50qwfn62lPUP8U4lPwyW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="254285382"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="254285382"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 15:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="498614337"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Mar 2022 15:34:11 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUcDa-000D13-Vt; Wed, 16 Mar 2022 22:34:10 +0000
Date: Thu, 17 Mar 2022 06:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 03/11] habanalabs: change mmu_get_real_page_size to be
 ASIC-specific
Message-ID: <202203170651.S8azQIor-lkp@intel.com>
References: <20220316114129.2520107-3-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316114129.2520107-3-ogabbay@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Oded,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on next-20220316]
[cannot apply to linux/master linus/master v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oded-Gabbay/habanalabs-set-non-0-value-in-dram-default-page-size/20220316-194323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git d6cd2f85931f87dbd07c664c9c6e806db1dd7c75
config: x86_64-randconfig-a013-20220314 (https://download.01.org/0day-ci/archive/20220317/202203170651.S8azQIor-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9535025e314bc12dbdeebee7c71634699759bcfa
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Oded-Gabbay/habanalabs-set-non-0-value-in-dram-default-page-size/20220316-194323
        git checkout 9535025e314bc12dbdeebee7c71634699759bcfa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/misc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/misc/habanalabs/common/mmu/mmu.c:209:32: warning: variable 'prop' set but not used [-Wunused-but-set-variable]
           struct asic_fixed_properties *prop;
                                         ^
   drivers/misc/habanalabs/common/mmu/mmu.c:276:32: warning: variable 'prop' set but not used [-Wunused-but-set-variable]
           struct asic_fixed_properties *prop;
                                         ^
   2 warnings generated.


vim +/prop +209 drivers/misc/habanalabs/common/mmu/mmu.c

   184	
   185	/*
   186	 * hl_mmu_unmap_page - unmaps a virtual addr
   187	 *
   188	 * @ctx: pointer to the context structure
   189	 * @virt_addr: virt addr to map from
   190	 * @page_size: size of the page to unmap
   191	 * @flush_pte: whether to do a PCI flush
   192	 *
   193	 * This function does the following:
   194	 * - Check that the virt addr is mapped
   195	 * - Unmap the virt addr and frees pgts if possible
   196	 * - Returns 0 on success, -EINVAL if the given addr is not mapped
   197	 *
   198	 * Because this function changes the page tables in the device and because it
   199	 * changes the MMU hash, it must be protected by a lock.
   200	 * However, because it maps only a single page, the lock should be implemented
   201	 * in a higher level in order to protect the entire mapping of the memory area
   202	 *
   203	 * For optimization reasons PCI flush may be requested once after unmapping of
   204	 * large area.
   205	 */
   206	int hl_mmu_unmap_page(struct hl_ctx *ctx, u64 virt_addr, u32 page_size, bool flush_pte)
   207	{
   208		struct hl_device *hdev = ctx->hdev;
 > 209		struct asic_fixed_properties *prop;
   210		struct hl_mmu_properties *mmu_prop;
   211		struct hl_mmu_funcs *mmu_funcs;
   212		int i, pgt_residency, rc = 0;
   213		u32 real_page_size, npages;
   214		u64 real_virt_addr;
   215		bool is_dram_addr;
   216	
   217		if (!hdev->mmu_enable)
   218			return 0;
   219	
   220		prop = &hdev->asic_prop;
   221		is_dram_addr = hl_is_dram_va(hdev, virt_addr);
   222		mmu_prop = hl_mmu_get_prop(hdev, page_size, is_dram_addr);
   223	
   224		pgt_residency = mmu_prop->host_resident ? MMU_HR_PGT : MMU_DR_PGT;
   225		mmu_funcs = hl_mmu_get_funcs(hdev, pgt_residency, is_dram_addr);
   226	
   227		rc = hdev->asic_funcs->mmu_get_real_page_size(hdev, mmu_prop, page_size, &real_page_size,
   228								is_dram_addr);
   229		if (rc)
   230			return rc;
   231	
   232		npages = page_size / real_page_size;
   233		real_virt_addr = virt_addr;
   234	
   235		for (i = 0 ; i < npages ; i++) {
   236			rc = mmu_funcs->unmap(ctx, real_virt_addr, is_dram_addr);
   237			if (rc)
   238				break;
   239	
   240			real_virt_addr += real_page_size;
   241		}
   242	
   243		if (flush_pte)
   244			mmu_funcs->flush(ctx);
   245	
   246		return rc;
   247	}
   248	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
