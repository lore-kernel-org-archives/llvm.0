Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48021C01
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660493526; x=1692029526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RR+yKkcDcQ5jgsc4fTupGoKkTSWS/SK7RNCzgva8zR0=;
  b=biu+gr8JkjqyI1D2uLffAuTXEYgMCQTN/cYaHqOnLlau6jokEPzzjcK1
   fF+rrkh3t8fDc+Mf49qLpjqWpgXd+yFJSByGkagVQoF5bxpCFL61M+uSU
   9mj1fCL+8+D93HAkQ8FYJtKOrIPsbymfxiG/BI9aHNk/h3SxRjuPxTMfM
   5yDbvOnoPyoayuEn6gIomGUd7rCfsPG68LHd+6PpvMZM4TnOcZY14ApmB
   SVZMIsmgg1P4tTWEMqHZ5p89Zk8B3UnwNqeEm8VtMH/K8YlRtlrbOJPHe
   81xptN/9Q1ZevLLiCapYg4q1NyrDL4u4Hq2xamQWDX3y8Pz2+ndbxhb9m
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="289405342"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="289405342"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 09:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="635210848"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2022 09:12:04 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNGDb-0000Hf-2S;
	Sun, 14 Aug 2022 16:12:03 +0000
Date: Mon, 15 Aug 2022 00:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCHv2 2/7] file: add ops to dma map bvec
Message-ID: <202208150051.GAu8K6Ux-lkp@intel.com>
References: <20220802193633.289796-3-kbusch@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802193633.289796-3-kbusch@fb.com>

Hi Keith,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/dma-mapping-optimisations/20220803-034125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-randconfig-r041-20220803 (https://download.01.org/0day-ci/archive/20220815/202208150051.GAu8K6Ux-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2886f07b8a39e6f8579250885c21459369995f5b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Keith-Busch/dma-mapping-optimisations/20220803-034125
        git checkout 2886f07b8a39e6f8579250885c21459369995f5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/fops.c:674:7: warning: no previous prototype for function 'blkdev_dma_map' [-Wmissing-prototypes]
   void *blkdev_dma_map(struct file *filp, struct bio_vec *bvec, int nr_vecs)
         ^
   block/fops.c:674:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *blkdev_dma_map(struct file *filp, struct bio_vec *bvec, int nr_vecs)
   ^
   static 
>> block/fops.c:681:6: warning: no previous prototype for function 'blkdev_dma_unmap' [-Wmissing-prototypes]
   void blkdev_dma_unmap(struct file *filp, void *dma_tag)
        ^
   block/fops.c:681:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void blkdev_dma_unmap(struct file *filp, void *dma_tag)
   ^
   static 
   2 warnings generated.


vim +/blkdev_dma_map +674 block/fops.c

   672	
   673	#ifdef CONFIG_HAS_DMA
 > 674	void *blkdev_dma_map(struct file *filp, struct bio_vec *bvec, int nr_vecs)
   675	{
   676		struct block_device *bdev = filp->private_data;
   677	
   678		return block_dma_map(bdev, bvec, nr_vecs);
   679	}
   680	
 > 681	void blkdev_dma_unmap(struct file *filp, void *dma_tag)
   682	{
   683		struct block_device *bdev = filp->private_data;
   684	
   685		return block_dma_unmap(bdev, dma_tag);
   686	}
   687	#endif
   688	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
