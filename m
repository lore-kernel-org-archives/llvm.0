Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDFA23
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660488962; x=1692024962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czZNwNyF44q4MpFyYozZIShlWN8EghQWPau8SuEK2XY=;
  b=OzqQus0XXSr/ORodWE+J9UMFSSuH9w1e51IUbUSs3jGS1OPGcfEVrMs1
   3EbfRk272NjLhPTsxepdaytp/bMC10TOazUJisMf5WT/Nr9ozT5MNCcYI
   RSPEWeyV2TUn6WIAXtLTcCAHE5HdhfpRhIOSttX0If/AQAVKC72jsWAkJ
   FEYrdk5KXn+TVSugD/Knfdq7gxd83XdlHWzlkaWEC+/uF+EklMIxVmAfz
   Var8yGI1ZvZxQVxaKcIY0kWXttbQ3PlYm6iHtqFiumhGArLjNk6abhv1L
   iorgWlwhgqqiVKotZJKRYHhrob3GtSwmoaYLyZdsC5PQ5Lzn+sOGOGoVD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="293100893"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="293100893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 07:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="934228661"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2022 07:56:00 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNF1z-0000Bz-29;
	Sun, 14 Aug 2022 14:55:59 +0000
Date: Sun, 14 Aug 2022 22:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCHv2 7/7] nvme-pci: implement dma_map support
Message-ID: <202208142218.6F204p6b-lkp@intel.com>
References: <20220802193633.289796-8-kbusch@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802193633.289796-8-kbusch@fb.com>

Hi Keith,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[cannot apply to linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/dma-mapping-optimisations/20220803-034125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220814/202208142218.6F204p6b-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fa76dbaaa42ba2c354d69638edefd09550d5fb38
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Keith-Busch/dma-mapping-optimisations/20220803-034125
        git checkout fa76dbaaa42ba2c354d69638edefd09550d5fb38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/nvme/host/pci.c:964:7: warning: variable 'nprps_left' is uninitialized when used here [-Wuninitialized]
                   if (nprps_left <= last_prp + 1) {
                       ^~~~~~~~~~
   drivers/nvme/host/pci.c:894:45: note: initialize the variable 'nprps_left' to silence this warning
           int i, offset, j, length, nprps, nprps_left;
                                                      ^
                                                       = 0
>> drivers/nvme/host/pci.c:1994:9: warning: variable 'ppv' set but not used [-Wunused-but-set-variable]
           int i, ppv;
                  ^
   2 warnings generated.


vim +/ppv +1994 drivers/nvme/host/pci.c

  1987	
  1988	static void nvme_pci_dma_unmap(struct request_queue *q, void *dma_tag)
  1989	{
  1990		const int nvme_pages = 1 << (PAGE_SIZE - NVME_CTRL_PAGE_SIZE);
  1991		struct nvme_ns *ns = q->queuedata;
  1992		struct nvme_dev *dev = to_nvme_dev(ns->ctrl);
  1993		struct nvme_dma_mapping *mapping = dma_tag;
> 1994		int i, ppv;
  1995	
  1996		for (i = 0; i < mapping->nr_pages; i += nvme_pages) {
  1997			__u64 dma_addr = le64_to_cpu(mapping->prps[i]);
  1998			ppv = nvme_pages;
  1999	
  2000			if (i == 0)
  2001				ppv -= mapping->offset >> NVME_CTRL_PAGE_SHIFT;
  2002			dma_unmap_page(dev->dev, dma_addr,
  2003				       PAGE_SIZE - offset_in_page(dma_addr), 0);
  2004		}
  2005	
  2006		dma_free_coherent(dev->dev, mapping->nr_pages * sizeof(*mapping->prps),
  2007				  (void *)mapping->prps, mapping->prp_dma_addr);
  2008		kfree(mapping);
  2009		put_device(dev->dev);
  2010	}
  2011	#endif
  2012	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
