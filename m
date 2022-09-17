Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124F82F21
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663423743; x=1694959743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGIXuREaWoLe0WPT2nvuRiw9PSzoGU9WanFwfFa5ATk=;
  b=OjJAEOPXnWbPuCf162YEOq9IjEA5pmMBVZmo7LvEEQ3DhGteIgHP+tOm
   rOQaSWNR0BBIXDoJgwUz/g4QUnmiJk5AbjvmHTqqqkAIAnHTLP57xfzVq
   FSnDplBV0RjRS4cEa8yKzzZ1qf8SSS4iozk11J4CTbTGsZTu8f2fAxxBs
   xZ/2yU+1SL9eUMTFiF7CVQdqSaDlwgiegD5xcE/dQiM/iNHBoQ53QTKC3
   KnHSaFjSY9T9Iweb63WnLvT6j3DwhkfIrgvZOEXKEy/kki4dMB88ZyUEk
   SE2QYvUiZ+hRpr19iECX6qzQUwa9BfSBEEm+pz3GOlzr+XNOJ45vXP9JI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="279539467"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="279539467"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 07:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="569136903"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Sep 2022 07:08:59 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZYV8-0000OF-2a;
	Sat, 17 Sep 2022 14:08:58 +0000
Date: Sat, 17 Sep 2022 22:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>, vkoul@kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	trix@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lizhi Hou <lizhi.hou@amd.com>, max.zhen@amd.com,
	sonal.santan@amd.com, larry.liu@amd.com, brian.xu@amd.com
Subject: Re: [PATCH V2 XDMA 1/1] dmaengine: xilinx: xdma: add xilinx xdma
 driver
Message-ID: <202209172136.OvN8TzRL-lkp@intel.com>
References: <1663341985-65589-2-git-send-email-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663341985-65589-2-git-send-email-lizhi.hou@amd.com>

Hi Lizhi,

I love your patch! Yet something to improve:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.0-rc5 next-20220916]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Hou/xilinx-XDMA-driver/20220916-232740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: arm-randconfig-r003-20220918 (https://download.01.org/0day-ci/archive/20220917/202209172136.OvN8TzRL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/f624c2f1706209a308a17cc8799995dc478c3d00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lizhi-Hou/xilinx-XDMA-driver/20220916-232740
        git checkout f624c2f1706209a308a17cc8799995dc478c3d00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/xilinx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/dma/xilinx/xdma.c:540:7: error: incompatible pointer types assigning to 'u64 *' (aka 'unsigned long long *') from 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
                   src = &addr;
                       ^ ~~~~~
   drivers/dma/xilinx/xdma.c:545:7: error: incompatible pointer types assigning to 'u64 *' (aka 'unsigned long long *') from 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
                   dst = &addr;
                       ^ ~~~~~
   2 errors generated.


vim +540 drivers/dma/xilinx/xdma.c

   504	
   505	/**
   506	 * xdma_prep_device_sg - prepare a descriptor for a
   507	 *	DMA transaction
   508	 * @chan: DMA channel pointer
   509	 * @sgl: Transfer scatter gather list
   510	 * @sg_len: Length of scatter gather list
   511	 * @dir: Transfer direction
   512	 * @flags: transfer ack flags
   513	 * @context: APP words of the descriptor
   514	 */
   515	static struct dma_async_tx_descriptor *
   516	xdma_prep_device_sg(struct dma_chan *chan, struct scatterlist *sgl,
   517			    unsigned int sg_len, enum dma_transfer_direction dir,
   518			    unsigned long flags, void *context)
   519	{
   520		struct xdma_chan *xdma_chan = to_xdma_chan(chan);
   521		struct dma_async_tx_descriptor *tx_desc;
   522		u32 desc_num = 0, i, len, rest;
   523		struct xdma_desc_block *dblk;
   524		struct xdma_desc *sw_desc;
   525		struct scatterlist *sg;
   526		dma_addr_t addr;
   527		u64 dev_addr, *src, *dst;
   528		struct xdma_hw_desc *desc;
   529	
   530		for_each_sg(sgl, sg, sg_len, i)
   531			desc_num += DIV_ROUND_UP(sg_dma_len(sg), XDMA_DESC_BLEN_MAX);
   532	
   533		sw_desc = xdma_alloc_desc(xdma_chan, desc_num);
   534		if (!sw_desc)
   535			return NULL;
   536		sw_desc->dir = dir;
   537	
   538		if (dir == DMA_MEM_TO_DEV) {
   539			dev_addr = xdma_chan->cfg.dst_addr;
 > 540			src = &addr;
   541			dst = &dev_addr;
   542		} else {
   543			dev_addr = xdma_chan->cfg.src_addr;
   544			src = &dev_addr;
   545			dst = &addr;
   546		}
   547	
   548		dblk = sw_desc->desc_blocks;
   549		desc = dblk->virt_addr;
   550		desc_num = 1;
   551		for_each_sg(sgl, sg, sg_len, i) {
   552			addr = sg_dma_address(sg);
   553			rest = sg_dma_len(sg);
   554	
   555			do {
   556				len = min_t(u32, rest, XDMA_DESC_BLEN_MAX);
   557				/* set hardware descriptor */
   558				desc->bytes = cpu_to_le32(len);
   559				desc->src_addr = cpu_to_le64(*src);
   560				desc->dst_addr = cpu_to_le64(*dst);
   561	
   562				if (!(desc_num & XDMA_DESC_ADJACENT_MASK)) {
   563					dblk++;
   564					desc = dblk->virt_addr;
   565				} else {
   566					desc++;
   567				}
   568	
   569				desc_num++;
   570				dev_addr += len;
   571				addr += len;
   572				rest -= len;
   573			} while (rest);
   574		}
   575	
   576		tx_desc = vchan_tx_prep(&xdma_chan->vchan, &sw_desc->vdesc, flags);
   577		if (!tx_desc)
   578			goto failed;
   579	
   580		return tx_desc;
   581	
   582	failed:
   583		xdma_free_desc(&sw_desc->vdesc);
   584	
   585		return NULL;
   586	}
   587	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
