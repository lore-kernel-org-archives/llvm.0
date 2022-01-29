Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699302CA2
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643484210; x=1675020210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BxvwA4Q8kF6eo6L9LwXYwJeQJ7G4zibMZodYtej0y6U=;
  b=W8Fvt00u+V4EHPBtmRUKj1GKUPFjWTRtkvauSe+3jNwiSDFhxrWwWHgI
   22PA8dwpek0sCjqXSG02k25yaAvYb+nPNoGjOkSBmGbg9JivEq5EjdG2I
   balNYK4JVcehqeJmR6E1f2obcFTAWn0AEY1IgL8fb2Ha9v81rOSYJu4pm
   hLDs4nRcXSY+M2Ql6VWn/ZXHYpTlrGm8x0Ka8BUwPNsC+IAQBCvQfMiRD
   EQK08ADpR9Pp4/3WD69PT9oaStqn5g8OAeGR4/xuBb8cxaFmkM9Oh4cAu
   PPoorCBqyC9oEnRPqX5zpEgiYEYwo/VMkrzzYS3sVTObOeG8MbnYm2eZO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="244889827"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="244889827"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 11:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="533816204"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2022 11:23:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDtJn-000PYJ-JE; Sat, 29 Jan 2022 19:23:27 +0000
Date: Sun, 30 Jan 2022 03:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v17 2/4] dmaengine: tegra: Add tegra gpcdma driver
Message-ID: <202201300351.7Qdca3M3-lkp@intel.com>
References: <1643474453-32619-3-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643474453-32619-3-git-send-email-akhilrajeev@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next arm64/for-next/core v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-R/Add-NVIDIA-Tegra-GPC-DMA-driver/20220130-004416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: hexagon-randconfig-r022-20220130 (https://download.01.org/0day-ci/archive/20220130/202201300351.7Qdca3M3-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6e1492836cbc56394256bd76f57ddb3d12cc65e6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhil-R/Add-NVIDIA-Tegra-GPC-DMA-driver/20220130-004416
        git checkout 6e1492836cbc56394256bd76f57ddb3d12cc65e6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/tegra186-gpc-dma.c:885:53: warning: shift count >= width of type [-Wshift-count-overflow]
                           FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                            ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:49:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/dma/tegra186-gpc-dma.c:885:53: warning: shift count >= width of type [-Wshift-count-overflow]
                           FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                            ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:50:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/dma/tegra186-gpc-dma.c:885:53: warning: shift count >= width of type [-Wshift-count-overflow]
                           FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                            ^  ~~
   include/linux/bitfield.h:95:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:953:51: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (src >> 32));
                                                                   ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:49:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:953:51: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (src >> 32));
                                                                   ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:50:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:953:51: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (src >> 32));
                                                                   ^  ~~
   include/linux/bitfield.h:95:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:955:52: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                    ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:49:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:955:52: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                    ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:50:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:955:52: warning: shift count >= width of type [-Wshift-count-overflow]
                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
                                                                    ^  ~~
   include/linux/bitfield.h:95:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
--
                                                                                   ^  ~~
   include/linux/bitfield.h:95:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:1186:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:49:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1186:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:50:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1186:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:95:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/dma/tegra186-gpc-dma.c:1191:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:49:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1191:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:50:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/dma/tegra186-gpc-dma.c:1191:53: warning: shift count >= width of type [-Wshift-count-overflow]
                                   FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
                                                                                   ^  ~~
   include/linux/bitfield.h:95:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
>> drivers/dma/tegra186-gpc-dma.c:1183:4: warning: variable 'sg_req' is uninitialized when used here [-Wuninitialized]
                           sg_req[i].ch_regs.src_ptr = mem;
                           ^~~~~~
   drivers/dma/tegra186-gpc-dma.c:1095:33: note: initialize the variable 'sg_req' to silence this warning
           struct tegra_dma_sg_req *sg_req;
                                          ^
                                           = NULL
>> drivers/dma/tegra186-gpc-dma.c:1469:21: warning: attribute declaration must precede definition [-Wignored-attributes]
   static const struct __maybe_unused dev_pm_ops tegra_dma_dev_pm_ops = {
                       ^
   include/linux/compiler_attributes.h:286:56: note: expanded from macro '__maybe_unused'
   #define __maybe_unused                  __attribute__((__unused__))
                                                          ^
   include/linux/pm.h:277:8: note: previous definition is here
   struct dev_pm_ops {
          ^
   23 warnings generated.


vim +885 drivers/dma/tegra186-gpc-dma.c

   830	
   831	static struct dma_async_tx_descriptor *
   832	tegra_dma_prep_dma_memset(struct dma_chan *dc, dma_addr_t dest, int value,
   833				  size_t len, unsigned long flags)
   834	{
   835		struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
   836		unsigned int max_dma_count = tdc->tdma->chip_data->max_dma_count;
   837		struct tegra_dma_sg_req *sg_req;
   838		struct tegra_dma_desc *dma_desc;
   839		unsigned long csr, mc_seq;
   840	
   841		if ((len & 3) || (dest & 3) || len > max_dma_count) {
   842			dev_err(tdc2dev(tdc),
   843				"DMA length/memory address is not supported\n");
   844			return NULL;
   845		}
   846	
   847		/* Set dma mode to fixed pattern */
   848		csr = TEGRA_GPCDMA_CSR_DMA_FIXED_PAT;
   849		/* Enable once or continuous mode */
   850		csr |= TEGRA_GPCDMA_CSR_ONCE;
   851		/* Enable IRQ mask */
   852		csr |= TEGRA_GPCDMA_CSR_IRQ_MASK;
   853		/* Enable the dma interrupt */
   854		if (flags & DMA_PREP_INTERRUPT)
   855			csr |= TEGRA_GPCDMA_CSR_IE_EOC;
   856		/* Configure default priority weight for the channel */
   857		csr |= FIELD_PREP(TEGRA_GPCDMA_CSR_WEIGHT, 1);
   858	
   859		mc_seq =  tdc_read(tdc, TEGRA_GPCDMA_CHAN_MCSEQ);
   860		/* retain stream-id and clean rest */
   861		mc_seq &= TEGRA_GPCDMA_MCSEQ_STREAM_ID0_MASK;
   862	
   863		/* Set the address wrapping */
   864		mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_WRAP0,
   865							TEGRA_GPCDMA_MCSEQ_WRAP_NONE);
   866		mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_WRAP1,
   867							TEGRA_GPCDMA_MCSEQ_WRAP_NONE);
   868	
   869		/* Program outstanding MC requests */
   870		mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_REQ_COUNT, 1);
   871		/* Set burst size */
   872		mc_seq |= TEGRA_GPCDMA_MCSEQ_BURST_16;
   873	
   874		dma_desc = kzalloc(struct_size(dma_desc, sg_req, 1), GFP_NOWAIT);
   875		if (!dma_desc)
   876			return NULL;
   877	
   878		dma_desc->bytes_req = len;
   879		dma_desc->sg_count = 1;
   880		sg_req = dma_desc->sg_req;
   881	
   882		sg_req[0].ch_regs.src_ptr = 0;
   883		sg_req[0].ch_regs.dst_ptr = dest;
   884		sg_req[0].ch_regs.high_addr_ptr =
 > 885				FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (dest >> 32));
   886		sg_req[0].ch_regs.fixed_pattern = value;
   887		/* Word count reg takes value as (N +1) words */
   888		sg_req[0].ch_regs.wcount = ((len - 4) >> 2);
   889		sg_req[0].ch_regs.csr = csr;
   890		sg_req[0].ch_regs.mmio_seq = 0;
   891		sg_req[0].ch_regs.mc_seq = mc_seq;
   892		sg_req[0].len = len;
   893	
   894		dma_desc->cyclic = false;
   895		return vchan_tx_prep(&tdc->vc, &dma_desc->vd, flags);
   896	}
   897	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
