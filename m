Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4A2CA8
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643316079; x=1674852079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LG+hS2VdrRD35YyOdC7esEnbEaYkmVRKyYKMmjYwd/4=;
  b=Gktkd+bYHtCY7KnBwHPynTRR8scPTO861HTi56Llcpa50BZvOuq8KZCH
   ZKBm/5iYhXX8itdqR4PyGAK5NAs0k6Xs44Ao3+tENgpztIV0/YJhbz13/
   tzHCLq9EaM2JEm+yzrl6zZhkmc9zI+waUGOK/lS3Ec83MFU5s/FM8IwH+
   S39jBy4pmbtDLNSmjHnioB69GvHiGW20tKtg1UD4lqRKOLToEHw9Qw3Yi
   GRJGwLI4nwueCcv0WtsURT5jJArH3yDMelS1nAG5wezfRzziCqkPipJ0o
   jwyLYY9JHYjwYNCbJ4tNs9A0tms/CCdPKm5DyooGNr7vWGSLga4HFN2nC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245800443"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="245800443"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 12:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="628838017"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2022 12:41:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDBa0-000N1X-D4; Thu, 27 Jan 2022 20:41:16 +0000
Date: Fri, 28 Jan 2022 04:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within
 'struct htt_tx_fetch_ind' is less aligned than 'union
 htt_tx_fetch_ind::(anonymous at
 drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct
 htt_tx_fetch_ind' being...
Message-ID: <202201280415.ofyFUB4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   626b2dda7651a7c766108db4cdc0825db05b980d
commit: fa7845cfd53f3b1d3f60efa55db89805595bc045 treewide: Replace open-coded flex arrays in unions
date:   3 months ago
config: arm-buildonly-randconfig-r002-20220127 (https://download.01.org/0day-ci/archive/20220128/202201280415.ofyFUB4M-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa7845cfd53f3b1d3f60efa55db89805595bc045
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fa7845cfd53f3b1d3f60efa55db89805595bc045
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/ath/ath10k/ drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath10k/mac.c:8:
   In file included from drivers/net/wireless/ath/ath10k/mac.h:11:
   In file included from drivers/net/wireless/ath/ath10k/core.h:18:
   drivers/net/wireless/ath/ath10k/htt.h:721:34: warning: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct htt_rx_indication_prefix prefix;
                                           ^
   drivers/net/wireless/ath/ath10k/htt.h:742:34: warning: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct htt_rx_indication_prefix prefix;
                                           ^
>> drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/ath/ath10k/htt.h:1815:2: warning: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1815:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/ath/ath10k/mac.c:5942:22: warning: parameter 'changed_flags' set but not used [-Wunused-but-set-parameter]
                                       unsigned int changed_flags,
                                                    ^
   5 warnings generated.
--
   In file included from drivers/net/wireless/ath/ath10k/debug.c:14:
   In file included from drivers/net/wireless/ath/ath10k/core.h:18:
   drivers/net/wireless/ath/ath10k/htt.h:721:34: warning: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct htt_rx_indication_prefix prefix;
                                           ^
   drivers/net/wireless/ath/ath10k/htt.h:742:34: warning: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct htt_rx_indication_prefix prefix;
                                           ^
>> drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/ath/ath10k/htt.h:1815:2: warning: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1815:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   4 warnings generated.
--
   In file included from drivers/net/wireless/ath/ath10k/ce.c:8:
   In file included from drivers/net/wireless/ath/ath10k/hif.h:11:
   In file included from drivers/net/wireless/ath/ath10k/core.h:18:
   drivers/net/wireless/ath/ath10k/htt.h:721:34: warning: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct htt_rx_indication_prefix prefix;
                                           ^
   drivers/net/wireless/ath/ath10k/htt.h:742:34: warning: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct htt_rx_indication_prefix prefix;
                                           ^
>> drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/ath/ath10k/htt.h:1815:2: warning: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1815:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   drivers/net/wireless/ath/ath10k/ce.c:127:1: warning: unused function 'ath10k_get_ring_byte' [-Wunused-function]
   ath10k_get_ring_byte(unsigned int offset,
   ^
   drivers/net/wireless/ath/ath10k/ce.c:212:1: warning: unused function 'ath10k_ce_shadow_dest_ring_write_index_set' [-Wunused-function]
   ath10k_ce_shadow_dest_ring_write_index_set(struct ath10k *ar,
   ^
   drivers/net/wireless/ath/ath10k/ce.c:449:20: warning: unused function 'ath10k_ce_error_intr_enable' [-Wunused-function]
   static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
                      ^
   7 warnings generated.


vim +1677 drivers/net/wireless/ath/ath10k/htt.h

  1670	
  1671	struct htt_tx_fetch_ind {
  1672		u8 pad0;
  1673		__le16 fetch_seq_num;
  1674		__le32 token;
  1675		__le16 num_resp_ids;
  1676		__le16 num_records;
> 1677		union {
  1678			/* ath10k_htt_get_tx_fetch_ind_resp_ids() */
  1679			DECLARE_FLEX_ARRAY(__le32, resp_ids);
  1680			DECLARE_FLEX_ARRAY(struct htt_tx_fetch_record, records);
  1681		};
  1682	} __packed;
  1683	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
