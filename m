Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D73C04;
	Mon, 10 Apr 2023 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681139724; x=1712675724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IcBIRnBkkgY++2wg9UVkZojiEjodJTNWVyp8d7um//w=;
  b=hqJmrguLaEXnDJuGYHuMU/Gnf3YY9arKF9yuIqbmSM+P9dH90J09Ot5M
   xT6FXKr3sxRFroyM16Qkinw+D3vt2k2+NgCUY49P2SJyQ75MnHtQ4aJJ1
   yC0pNkhWvGHYq+oZjZDohtR2iz3gm63rYRaud/dU9wbByc9su/To2UbnK
   z3cbNJGyvwvd+lea3AclKVDlCkxkvTn/0pQ82rbZgFBm8jVBaZpxSMqoS
   IzInjsQl6CgwGa35OWIYfZ4pOJhibwAwh446d4qAhmltcSuOOIv+5bymg
   +BdoWp1kMmAGPrHY5J+8idx9sB6ymedVAlQeQ7XY5LDbhIgi7LAD0i5Wz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323008421"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="323008421"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 08:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862531578"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="862531578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 08:14:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pltDv-000VRd-1W;
	Mon, 10 Apr 2023 15:14:27 +0000
Date: Mon, 10 Apr 2023 23:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 9268/9787]
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:62: warning: wrong kernel-doc
 identifier on line:
Message-ID: <202304102354.Q4VOXGTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: 899ff790d1a94dda9bd09a4a6bde01fb7ff0bec8 [9268/9787] drm/i915: run kernel-doc on headers as part of HDRTEST
config: x86_64-randconfig-a005-20230410 (https://download.01.org/0day-ci/archive/20230410/202304102354.Q4VOXGTE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=899ff790d1a94dda9bd09a4a6bde01fb7ff0bec8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 899ff790d1a94dda9bd09a4a6bde01fb7ff0bec8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304102354.Q4VOXGTE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'size' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'data' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'rd' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'wr' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'link' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'is_partial' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'eng_class' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'eng_inst' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'guc_id' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'lrca' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'reginfo' not described in '__guc_capture_parsed_output'
>> drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:62: warning: wrong kernel-doc identifier on line:
    * struct guc_debug_capture_list_header / struct guc_debug_capture_list
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:80: warning: wrong kernel-doc identifier on line:
    * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:105: warning: wrong kernel-doc identifier on line:
    * struct guc_state_capture_header_t / struct guc_state_capture_t /
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'is_valid' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'ptr' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'size' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'status' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:216: warning: Function parameter or member 'ads_null_cache' not described in 'intel_guc_state_capture'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:216: warning: Function parameter or member 'max_mmio_per_node' not described in 'intel_guc_state_capture'
--
   drivers/gpu/drm/i915/i915_pmu.h:21: warning: cannot understand function prototype: 'enum i915_pmu_tracked_events '
   drivers/gpu/drm/i915/i915_pmu.h:32: warning: cannot understand function prototype: 'enum '
>> drivers/gpu/drm/i915/i915_pmu.h:41: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * How many different events we track in the global PMU mask.
--
>> drivers/gpu/drm/i915/i915_request.h:176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Request queue structure.
   drivers/gpu/drm/i915/i915_request.h:477: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Returns true if seq1 is later than seq2.
--
>> drivers/gpu/drm/i915/i915_vma.h:145: warning: expecting prototype for i915_vma_offset(). Prototype was for i915_vma_size() instead
--
>> drivers/gpu/drm/i915/intel_wakeref.h:118: warning: expecting prototype for intel_wakeref_get_if_in_use(). Prototype was for intel_wakeref_get_if_active() instead


vim +62 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h

24492514ccbd571 Alan Previn 2022-03-21  14  
f5718a7265a6f56 Alan Previn 2022-03-21  15  /**
f5718a7265a6f56 Alan Previn 2022-03-21  16   * struct __guc_capture_bufstate
f5718a7265a6f56 Alan Previn 2022-03-21  17   *
f5718a7265a6f56 Alan Previn 2022-03-21  18   * Book-keeping structure used to track read and write pointers
f5718a7265a6f56 Alan Previn 2022-03-21  19   * as we extract error capture data from the GuC-log-buffer's
f5718a7265a6f56 Alan Previn 2022-03-21  20   * error-capture region as a stream of dwords.
f5718a7265a6f56 Alan Previn 2022-03-21  21   */
f5718a7265a6f56 Alan Previn 2022-03-21  22  struct __guc_capture_bufstate {
f5718a7265a6f56 Alan Previn 2022-03-21  23  	u32 size;
f5718a7265a6f56 Alan Previn 2022-03-21  24  	void *data;
f5718a7265a6f56 Alan Previn 2022-03-21  25  	u32 rd;
f5718a7265a6f56 Alan Previn 2022-03-21  26  	u32 wr;
f5718a7265a6f56 Alan Previn 2022-03-21 @27  };
f5718a7265a6f56 Alan Previn 2022-03-21  28  
f5718a7265a6f56 Alan Previn 2022-03-21  29  /**
f5718a7265a6f56 Alan Previn 2022-03-21  30   * struct __guc_capture_parsed_output - extracted error capture node
f5718a7265a6f56 Alan Previn 2022-03-21  31   *
f5718a7265a6f56 Alan Previn 2022-03-21  32   * A single unit of extracted error-capture output data grouped together
f5718a7265a6f56 Alan Previn 2022-03-21  33   * at an engine-instance level. We keep these nodes in a linked list.
247f8071d589333 Alan Previn 2022-03-21  34   * See cachelist and outlist below.
f5718a7265a6f56 Alan Previn 2022-03-21  35   */
f5718a7265a6f56 Alan Previn 2022-03-21  36  struct __guc_capture_parsed_output {
f5718a7265a6f56 Alan Previn 2022-03-21  37  	/*
f5718a7265a6f56 Alan Previn 2022-03-21  38  	 * A single set of 3 capture lists: a global-list
f5718a7265a6f56 Alan Previn 2022-03-21  39  	 * an engine-class-list and an engine-instance list.
f5718a7265a6f56 Alan Previn 2022-03-21  40  	 * outlist in __guc_capture_parsed_output will keep
f5718a7265a6f56 Alan Previn 2022-03-21  41  	 * a linked list of these nodes that will eventually
f5718a7265a6f56 Alan Previn 2022-03-21  42  	 * be detached from outlist and attached into to
f5718a7265a6f56 Alan Previn 2022-03-21  43  	 * i915_gpu_codedump in response to a context reset
f5718a7265a6f56 Alan Previn 2022-03-21  44  	 */
f5718a7265a6f56 Alan Previn 2022-03-21  45  	struct list_head link;
f5718a7265a6f56 Alan Previn 2022-03-21  46  	bool is_partial;
f5718a7265a6f56 Alan Previn 2022-03-21  47  	u32 eng_class;
f5718a7265a6f56 Alan Previn 2022-03-21  48  	u32 eng_inst;
f5718a7265a6f56 Alan Previn 2022-03-21  49  	u32 guc_id;
f5718a7265a6f56 Alan Previn 2022-03-21  50  	u32 lrca;
f5718a7265a6f56 Alan Previn 2022-03-21  51  	struct gcap_reg_list_info {
f5718a7265a6f56 Alan Previn 2022-03-21  52  		u32 vfid;
f5718a7265a6f56 Alan Previn 2022-03-21  53  		u32 num_regs;
f5718a7265a6f56 Alan Previn 2022-03-21  54  		struct guc_mmio_reg *regs;
f5718a7265a6f56 Alan Previn 2022-03-21  55  	} reginfo[GUC_CAPTURE_LIST_TYPE_MAX];
f5718a7265a6f56 Alan Previn 2022-03-21  56  #define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_CAPTURE_LIST_TYPE_GLOBAL)
f5718a7265a6f56 Alan Previn 2022-03-21  57  #define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS)
f5718a7265a6f56 Alan Previn 2022-03-21  58  #define GCAP_PARSED_REGLIST_INDEX_ENGINST  BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE)
f5718a7265a6f56 Alan Previn 2022-03-21  59  };
f5718a7265a6f56 Alan Previn 2022-03-21  60  
24492514ccbd571 Alan Previn 2022-03-21  61  /**
24492514ccbd571 Alan Previn 2022-03-21 @62   * struct guc_debug_capture_list_header / struct guc_debug_capture_list
24492514ccbd571 Alan Previn 2022-03-21  63   *
24492514ccbd571 Alan Previn 2022-03-21  64   * As part of ADS registration, these header structures (followed by
24492514ccbd571 Alan Previn 2022-03-21  65   * an array of 'struct guc_mmio_reg' entries) are used to register with
24492514ccbd571 Alan Previn 2022-03-21  66   * GuC microkernel the list of registers we want it to dump out prior
24492514ccbd571 Alan Previn 2022-03-21  67   * to a engine reset.
24492514ccbd571 Alan Previn 2022-03-21  68   */
24492514ccbd571 Alan Previn 2022-03-21  69  struct guc_debug_capture_list_header {
24492514ccbd571 Alan Previn 2022-03-21  70  	u32 info;
24492514ccbd571 Alan Previn 2022-03-21  71  #define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
24492514ccbd571 Alan Previn 2022-03-21  72  } __packed;
24492514ccbd571 Alan Previn 2022-03-21  73  

:::::: The code at line 62 was first introduced by commit
:::::: 24492514ccbd57121f168bb14939f32d8905d579 drm/i915/guc: Update GuC ADS size for error capture lists

:::::: TO: Alan Previn <alan.previn.teres.alexis@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
