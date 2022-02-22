Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D02581
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645565956; x=1677101956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NjI58HuoiOrJ9B8SDO7jtDycQ1HCsouS1lryYsICPOw=;
  b=eg8TZ6etkF5KRB4DvWh/bGFSx4k2Ue4sqHw4U8BocyBWBo63FTLvpfqV
   OrDq8RMDba9wbgXkqjEtL8Lj39JyZWX5ncpPTPAMNXj+M29gKC/brlqsB
   q2j1+SW6X6uNnMclYAgaJMwf9hvIUizQaH2Rf1H2429a3sxJ4fs9K8kZQ
   +VEubM09esDkOSLZesIqnGcell4tzJ6ELdg7XAFXQyGTnp7lDlTvTrt64
   HslmBiffAdxMFpDLyYNBiUVXNYvo1Gez1h5lICIklpthAX+DFHLdp036P
   oDWZKL7asK8BCDCsMsYr2BRutoDrJPeEpxJ0e3aFeI4ofNJack9ytx/PM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232442722"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="232442722"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 13:39:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="627843979"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2022 13:39:04 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMcsB-0000eB-DF; Tue, 22 Feb 2022 21:39:03 +0000
Date: Wed, 23 Feb 2022 05:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v20 2/2] dmaengine: tegra: Add tegra gpcdma driver
Message-ID: <202202230559.bLOEMEUh-lkp@intel.com>
References: <20220221153934.5226-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221153934.5226-3-akhilrajeev@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-R/Add-NVIDIA-Tegra-GPC-DMA-driver/20220221-234342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202230559.bLOEMEUh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9788a023bf1c6b2221e7246794c13f3690bf5baa
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhil-R/Add-NVIDIA-Tegra-GPC-DMA-driver/20220221-234342
        git checkout 9788a023bf1c6b2221e7246794c13f3690bf5baa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/tegra186-gpc-dma.c:898:53: warning: shift count >= width of type [-Wshift-count-overflow]
                           FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                            ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:65:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/dma/tegra186-gpc-dma.c:898:53: warning: shift count >= width of type [-Wshift-count-overflow]
                           FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                            ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:66:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/dma/tegra186-gpc-dma.c:898:53: warning: shift count >= width of type [-Wshift-count-overflow]
                           FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                            ^  ~~
   include/linux/bitfield.h:112:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:967:51: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (src >> 32));
                                                                   ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:65:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:967:51: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (src >> 32));
                                                                   ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:66:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:967:51: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (src >> 32));
                                                                   ^  ~~
   include/linux/bitfield.h:112:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:969:52: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                    ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:65:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:969:52: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                    ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:66:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:969:52: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                    ^  ~~
   include/linux/bitfield.h:112:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
--
                                                                                   ^  ~~
   include/linux/bitfield.h:112:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:1200:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:65:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1200:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:66:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1200:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:112:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:1205:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:65:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1205:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:111:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:66:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1205:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:112:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
>> drivers/dma/tegra186-gpc-dma.c:1488:21: warning: attribute declaration must precede definition [-Wignored-attributes]
   static const struct __maybe_unused dev_pm_ops tegra_dma_dev_pm_ops = {
                       ^
   include/linux/compiler_attributes.h:286:56: note: expanded from macro '__maybe_unused'
   #define __maybe_unused                  __attribute__((__unused__))
                                                          ^
   include/linux/pm.h:278:8: note: previous definition is here
   struct dev_pm_ops {
          ^
   22 warnings generated.


vim +898 drivers/dma/tegra186-gpc-dma.c

   843	
   844	static struct dma_async_tx_descriptor *
   845	tegra_dma_prep_dma_memset(struct dma_chan *dc, dma_addr_t dest, int value,
   846				  size_t len, unsigned long flags)
   847	{
   848		struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
   849		unsigned int max_dma_count = tdc->tdma->chip_data->max_dma_count;
   850		struct tegra_dma_sg_req *sg_req;
   851		struct tegra_dma_desc *dma_desc;
   852		u32 csr, mc_seq;
   853	
   854		if ((len & 3) || (dest & 3) || len > max_dma_count) {
   855			dev_err(tdc2dev(tdc),
   856				"DMA length/memory address is not supported\n");
   857			return NULL;
   858		}
   859	
   860		/* Set DMA mode to fixed pattern */
   861		csr = TEGRA_GPCDMA_CSR_DMA_FIXED_PAT;
   862		/* Enable once or continuous mode */
   863		csr |= TEGRA_GPCDMA_CSR_ONCE;
   864		/* Enable IRQ mask */
   865		csr |= TEGRA_GPCDMA_CSR_IRQ_MASK;
   866		/* Enable the DMA interrupt */
   867		if (flags & DMA_PREP_INTERRUPT)
   868			csr |= TEGRA_GPCDMA_CSR_IE_EOC;
   869		/* Configure default priority weight for the channel */
   870		csr |= FIELD_PREP(TEGRA_GPCDMA_CSR_WEIGHT, 1);
   871	
   872		mc_seq =  tdc_read(tdc, TEGRA_GPCDMA_CHAN_MCSEQ);
   873		/* retain stream-id and clean rest */
   874		mc_seq &= TEGRA_GPCDMA_MCSEQ_STREAM_ID0_MASK;
   875	
   876		/* Set the address wrapping */
   877		mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_WRAP0,
   878							TEGRA_GPCDMA_MCSEQ_WRAP_NONE);
   879		mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_WRAP1,
   880							TEGRA_GPCDMA_MCSEQ_WRAP_NONE);
   881	
   882		/* Program outstanding MC requests */
   883		mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_REQ_COUNT, 1);
   884		/* Set burst size */
   885		mc_seq |= TEGRA_GPCDMA_MCSEQ_BURST_16;
   886	
   887		dma_desc = kzalloc(struct_size(dma_desc, sg_req, 1), GFP_NOWAIT);
   888		if (!dma_desc)
   889			return NULL;
   890	
   891		dma_desc->bytes_req = len;
   892		dma_desc->sg_count = 1;
   893		sg_req = dma_desc->sg_req;
   894	
   895		sg_req[0].ch_regs.src_ptr = 0;
   896		sg_req[0].ch_regs.dst_ptr = dest;
   897		sg_req[0].ch_regs.high_addr_ptr =
 > 898				FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
   899		sg_req[0].ch_regs.fixed_pattern = value;
   900		/* Word count reg takes value as (N +1) words */
   901		sg_req[0].ch_regs.wcount = ((len - 4) >> 2);
   902		sg_req[0].ch_regs.csr = csr;
   903		sg_req[0].ch_regs.mmio_seq = 0;
   904		sg_req[0].ch_regs.mc_seq = mc_seq;
   905		sg_req[0].len = len;
   906	
   907		dma_desc->cyclic = false;
   908		return vchan_tx_prep(&tdc->vc, &dma_desc->vd, flags);
   909	}
   910	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
