Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15421107;
	Fri,  3 Mar 2023 01:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677806627; x=1709342627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhFnAyGOEPNCGokajyLATz9LtEgwAdEJvRDzv+maSYM=;
  b=nknhu5GkVF/xXFLvlyUgrqGvW7S1ohak7NJkyT6NbmkX1G6pcHB1kSRx
   kdT2n8KVPBbxrcqUTDw/96SQuFADJceiAnANHGn6GM2QS4pC+OoBuRSRy
   koHh1S8MoDtS+thjJnWFQFkjUD7VLqspCjc/ZTzD21O4I928hJhEyS3Zf
   7o5QGKkRm67WLR/FExjBG3tpIyJybW3Vtq26HYUTxs8vJM6n6215+svos
   QsSSTc49A9hM1WEPFpAq4SXCGy++BKbFcETNnPGk39j4MMDV5C+FEaJiV
   EkO9SF9sVrIyvXiBTY9AE1Pa2NKscOw0eQT/9Hn11B1idOFHUvtMCghjL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="333639675"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="333639675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 17:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="675185739"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="675185739"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Mar 2023 17:23:44 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXu99-00014A-28;
	Fri, 03 Mar 2023 01:23:43 +0000
Date: Fri, 3 Mar 2023 09:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Brett Creeley <brett.creeley@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH net-next v9 3/5] ice: add ability to
 set FW log configuration
Message-ID: <202303030943.vv0bsyRo-lkp@intel.com>
References: <20230302215109.124-4-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302215109.124-4-paul.m.stillwell.jr@intel.com>

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on linus/master next-20230302]
[cannot apply to net-next/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230303-055305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230302215109.124-4-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v9 3/5] ice: add ability to set FW log configuration
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230303/202303030943.vv0bsyRo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/57ec67cfb978253912effb7408aa33e880c479c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230303-055305
        git checkout 57ec67cfb978253912effb7408aa33e880c479c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030943.vv0bsyRo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_main.c:4574:16: warning: shift count >= width of type [-Wshift-count-overflow]
           if (events >= BIT(ICE_AQC_FW_LOG_ID_MAX)) {
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:4576:12: warning: shift count >= width of type [-Wshift-count-overflow]
                           events, BIT(ICE_AQC_FW_LOG_ID_MAX));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   2 warnings generated.


vim +4574 drivers/net/ethernet/intel/ice/ice_main.c

  4554	
  4555	/**
  4556	 * ice_pf_fwlog_update_modules - update 1 or more modules via debugfs
  4557	 * @pf: pointer to the PF struct
  4558	 * @log_level: log_level to use for the @events
  4559	 * @events: events to update
  4560	 */
  4561	int ice_pf_fwlog_update_modules(struct ice_pf *pf, u8 log_level,
  4562					unsigned long events)
  4563	{
  4564		struct ice_fwlog_module_entry *entries;
  4565		u16 module_id, max_bits;
  4566		struct ice_hw *hw = &pf->hw;
  4567	
  4568		if (log_level >= ICE_FWLOG_LEVEL_INVALID) {
  4569			dev_err(ice_pf_to_dev(pf), "Invalid FW log level %u, all level(s) >= %u are invalid\n",
  4570				log_level, ICE_FWLOG_LEVEL_INVALID);
  4571			return -EINVAL;
  4572		}
  4573	
> 4574		if (events >= BIT(ICE_AQC_FW_LOG_ID_MAX)) {
  4575			dev_err(ice_pf_to_dev(pf), "Invalid FW log events 0x%lx, all FW log event bits >= 0x%lx are invalid\n",
  4576				events, BIT(ICE_AQC_FW_LOG_ID_MAX));
  4577			return -EINVAL;
  4578		}
  4579	
  4580		entries = (struct ice_fwlog_module_entry *)hw->fwlog_cfg.module_entries;
  4581	
  4582		max_bits = min_t(u16, BITS_PER_TYPE(unsigned long),
  4583				 ICE_AQC_FW_LOG_ID_MAX);
  4584	
  4585		for_each_set_bit(module_id, &events, max_bits) {
  4586			entries[module_id].log_level = log_level;
  4587		}
  4588	
  4589		return 0;
  4590	}
  4591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
