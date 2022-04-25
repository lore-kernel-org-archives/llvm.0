Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD9A29AA
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 19:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650913590; x=1682449590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hMavWVX/mwCV1CHKoDtErsRb6ZkqH80fwJ8nCjOCW8=;
  b=PJrMEXkOMcCHK0Vb1PsxdfPxWC7CiC0lV5CPsKnq317RQgLgxmdDKOq5
   EQTI0jvSWRAqDaM4EivNbQxteY2T+kLOYgJ+nxFaRGltchjo+6U35JccK
   JWgmmp6sF1r8+LQDV8/OJE28RmrJWBV6znLSrQHDpAaYtpCwz1ZjQH6lP
   COyA6plLeNquZzFDyj5tAUqX6Wyxc/cQImTot1Z8bnC7JV+0wyYxiRw8u
   GNMYwm1qH/r1rXR/buOvohql6sDfey60FQAGqkQtD1sXzxeBmQ9mESqmA
   2KwD7OoO5Hd0KSCsO7qPE/t/GvYbYoaXeIbwVu53lcQsipIfppaCsOQ0T
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="328279064"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="328279064"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 12:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="704696431"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2022 12:06:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nj42V-0002nO-MQ;
	Mon, 25 Apr 2022 19:06:27 +0000
Date: Tue, 26 Apr 2022 03:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.de
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ALSA: memalloc: Add fallback SG-buffer free if fallback
 is used for noncontig
Message-ID: <202204260255.k5hl4BYG-lkp@intel.com>
References: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>

Hi Peter,

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: riscv-randconfig-r035-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260255.k5hl4BYG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
        git checkout bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/core/memalloc.c:540:24: error: use of undeclared identifier 'SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK'
           if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
                                 ^
>> sound/core/memalloc.c:541:24: error: use of undeclared identifier 'SNDRV_DMA_TYPE_DEV_SG_FALLBACK'
               dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
                                 ^
>> sound/core/memalloc.c:543:3: error: call to undeclared function 'snd_dma_sg_fallback_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   snd_dma_sg_fallback_free(dmab);
                   ^
   sound/core/memalloc.c:543:3: note: did you mean 'snd_dma_vmalloc_free'?
   sound/core/memalloc.c:312:13: note: 'snd_dma_vmalloc_free' declared here
   static void snd_dma_vmalloc_free(struct snd_dma_buffer *dmab)
               ^
   3 errors generated.


vim +/SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK +540 sound/core/memalloc.c

   537	
   538	static void snd_dma_noncontig_free(struct snd_dma_buffer *dmab)
   539	{
 > 540		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
 > 541		    dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
   542			/* The allocation is done with a fallback, use the matching free */
 > 543			snd_dma_sg_fallback_free(dmab);
   544			return;
   545		}
   546	
   547		dma_vunmap_noncontiguous(dmab->dev.dev, dmab->area);
   548		dma_free_noncontiguous(dmab->dev.dev, dmab->bytes, dmab->private_data,
   549				       dmab->dev.dir);
   550	}
   551	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
