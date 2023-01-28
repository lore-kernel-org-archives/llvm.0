Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F1257E;
	Sat, 28 Jan 2023 06:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674887604; x=1706423604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3bOk/+vAei6G4NhqDvCGjRaMjR+K38CyvYmGEGEsfs=;
  b=RwRL6Nij6Oyhy3fwjKzF0n8jWRNYWg+Zkj+qGWorpqNmTfigkb+PpN9q
   OkGrAhgNnJcrOKuVHZfrSgr+SXg4jwYVB4qSzac8FkL9F4YJW1hqA3+qQ
   vB1K0uZfDqeZhHjANbHVfahBf8FujauCepR67g8l0ZOL5FVUrvW4WyR9q
   XBlL54yBDiVzgnJp8elJu0V005Q1RMqpL/JKBIHWx5ZtFv9u6iszTnr8j
   gx146PQi0A3Z1Mg4ug9oCVxYaEHdPD1BDKz2hiAk02mzCrmSu7EhySUhj
   LPWyHTqRFj9RNB5hpeNzid0Iz20UlxaAIWV84qB0FW3VgJuWjwv+rxtWd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="325941038"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="325941038"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 22:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="806072351"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="806072351"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2023 22:33:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLem7-0000SJ-1v;
	Sat, 28 Jan 2023 06:33:19 +0000
Date: Sat, 28 Jan 2023 14:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/intel/iwlwifi/fw/error-dump.h:297:2: warning:
 field  within 'struct iwl_fw_ini_error_dump_range' is less aligned than
 'union iwl_fw_ini_error_dump_range::(anonymous at
 drivers/net/wireless/intel/iwlwifi/fw/error-dump.h:297:2)' and is ...
Message-ID: <202301281407.duiIr0zu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5af6ce7049365952f7f023155234fe091693ead1
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   9 months ago
config: arm-randconfig-r026-20230128 (https://download.01.org/0day-ci/archive/20230128/202301281407.duiIr0zu-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=250c1a694ff304e5d69e74ab32755eddcc2b8f65
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 250c1a694ff304e5d69e74ab32755eddcc2b8f65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/intel/iwlwifi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/fw/dbg.c:9:
   In file included from drivers/net/wireless/intel/iwlwifi/fw/runtime.h:10:
   In file included from drivers/net/wireless/intel/iwlwifi/iwl-trans.h:17:
   In file included from drivers/net/wireless/intel/iwlwifi/fw/img.h:14:
>> drivers/net/wireless/intel/iwlwifi/fw/error-dump.h:297:2: warning: field  within 'struct iwl_fw_ini_error_dump_range' is less aligned than 'union iwl_fw_ini_error_dump_range::(anonymous at drivers/net/wireless/intel/iwlwifi/fw/error-dump.h:297:2)' and is usually due to 'struct iwl_fw_ini_error_dump_range' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/fw/init.c:13:
>> drivers/net/wireless/intel/iwlwifi/fw/api/rx.h:427:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/fw/api/rx.h:427:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/fw.c:19:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:27:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/sta.h:15:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/fw-api.h:32:
>> drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/ops.c:19:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:27:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/sta.h:15:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/fw-api.h:32:
>> drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
>> drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:522:2: warning: field  within 'struct iwl_rx_mpdu_desc_v3' is less aligned than 'union iwl_rx_mpdu_desc_v3::(anonymous at drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:522:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v3' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   2 warnings generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:9:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:27:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/sta.h:15:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/fw-api.h:32:
>> drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1108:47: warning: format specifies type 'unsigned char' but the argument has type 's16' (aka 'short') [-Wformat]
           IWL_DEBUG_INFO(mvm, "\tburst index: %hhu\n", res->ftm.burst_index);
                                               ~~~~     ^~~~~~~~~~~~~~~~~~~~
                                               %hd
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:175:68: note: expanded from macro 'IWL_DEBUG_INFO'
   #define IWL_DEBUG_INFO(p, f, a...)      IWL_DEBUG(p, IWL_DL_INFO, f, ## a)
                                                                     ~     ^
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:94:49: note: expanded from macro 'IWL_DEBUG'
           __IWL_DEBUG_DEV((m)->dev, level, false, fmt, ##args)
                                                   ~~~    ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:91:49: note: expanded from macro '__IWL_DEBUG_DEV'
                   __iwl_dbg(dev, level, limit, __func__, fmt, ##args);    \
                                                          ~~~    ^~~~
   2 warnings generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c:7:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:27:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/sta.h:15:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/fw-api.h:32:
>> drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/rx.h:427:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c:441:21: warning: unused function 'iwl_dbgfs_is_match' [-Wunused-function]
   static inline char *iwl_dbgfs_is_match(char *name, char *buf)
                       ^
   2 warnings generated.


vim +297 drivers/net/wireless/intel/iwlwifi/fw/error-dump.h

990ffe3e81962f Shahar S Matityahu 2019-02-17  284  
8d534e96b5000a Shahar S Matityahu 2018-12-03  285  /**
8d534e96b5000a Shahar S Matityahu 2018-12-03  286   * struct iwl_fw_ini_error_dump_range - range of memory
8d534e96b5000a Shahar S Matityahu 2018-12-03  287   * @range_data_size: the size of this range, in bytes
4828f462b5eb32 Shahar S Matityahu 2019-07-10  288   * @internal_base_addr: base address of internal memory range
4828f462b5eb32 Shahar S Matityahu 2019-07-10  289   * @dram_base_addr: base address of dram monitor range
4828f462b5eb32 Shahar S Matityahu 2019-07-10  290   * @page_num: page number of memory range
4828f462b5eb32 Shahar S Matityahu 2019-07-10  291   * @fifo_hdr: fifo header of memory range
3ed34fbf9d3bfc Shahar S Matityahu 2019-07-23  292   * @fw_pkt: FW packet header of memory range
8d534e96b5000a Shahar S Matityahu 2018-12-03  293   * @data: the actual memory
8d534e96b5000a Shahar S Matityahu 2018-12-03  294   */
8d534e96b5000a Shahar S Matityahu 2018-12-03  295  struct iwl_fw_ini_error_dump_range {
8d534e96b5000a Shahar S Matityahu 2018-12-03  296  	__le32 range_data_size;
973193554cae6b Shahar S Matityahu 2019-04-08 @297  	union {
973193554cae6b Shahar S Matityahu 2019-04-08  298  		__le32 internal_base_addr;
973193554cae6b Shahar S Matityahu 2019-04-08  299  		__le64 dram_base_addr;
973193554cae6b Shahar S Matityahu 2019-04-08  300  		__le32 page_num;
973193554cae6b Shahar S Matityahu 2019-04-08  301  		struct iwl_fw_ini_fifo_hdr fifo_hdr;
3ed34fbf9d3bfc Shahar S Matityahu 2019-07-23  302  		struct iwl_cmd_header fw_pkt_hdr;
973193554cae6b Shahar S Matityahu 2019-04-08  303  	};
8d534e96b5000a Shahar S Matityahu 2018-12-03  304  	__le32 data[];
8d534e96b5000a Shahar S Matityahu 2018-12-03  305  } __packed;
8d534e96b5000a Shahar S Matityahu 2018-12-03  306  

:::::: The code at line 297 was first introduced by commit
:::::: 973193554cae6b055474964f995e36c42d195137 iwlwifi: dbg_ini: dump headers cleanup

:::::: TO: Shahar S Matityahu <shahar.s.matityahu@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
