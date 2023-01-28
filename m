Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C253C0B;
	Sat, 28 Jan 2023 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674897567; x=1706433567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bayt/7CM9d7g5l6m+C/Xcb8lUYtfCyx5+qRYI69cGmI=;
  b=IeCtKJm5JoVRDJEtFVAptVUEvwilqeKwYvojSGpnG32tVXUWBAoY+t/K
   XE37I9iH/1zh+6NfMmP6trCEo7Xyq8ZQgsTDopKoWWHbX/HrBsLRQpFJo
   rKy1Je9xNFRm6nG7oU3gVvejY/z+NsMnl9JXf8aCl3sJxe6nMh4n6obVf
   UICuRfvtpQq1vmnl5IOiZWe/ABLjJ7U4GQ11gELTPIbVVOT7ssKiaBPWO
   2xPHm24je0k5Lo7NxduAjU/jAYyQypG8sN8CJVc8NtIegHXJBItt9is+K
   FhzMqu6RhD7o28NnD83N3FmdDKb2CFOdiwrRPN6tu+1PgiookAsY97BVj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="391831889"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="391831889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 01:19:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="806102276"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="806102276"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2023 01:19:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLhMq-0000Y7-1L;
	Sat, 28 Jan 2023 09:19:24 +0000
Date: Sat, 28 Jan 2023 17:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 35/36]
 drivers/net/wireless/mediatek/mt76/mac80211.c:1732:25: error: variable has
 incomplete type 'struct page_pool_stats'
Message-ID: <202301281736.VwsI7C8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   6d672228aa610d9b8f3d8b277f5b95b05dc2c66a
commit: aff9d1f4e5ad02de773bf800e6af49e57adf7d25 [35/36] wifi: mt76: enable page_pool stats
config: x86_64-randconfig-a011-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281736.VwsI7C8X-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/nbd168/wireless/commit/aff9d1f4e5ad02de773bf800e6af49e57adf7d25
        git remote add nbd168-wireless https://github.com/nbd168/wireless
        git fetch --no-tags nbd168-wireless mt76
        git checkout aff9d1f4e5ad02de773bf800e6af49e57adf7d25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mac80211.c:1732:25: error: variable has incomplete type 'struct page_pool_stats'
           struct page_pool_stats stats = {};
                                  ^
   drivers/net/wireless/mediatek/mt76/mac80211.c:1732:9: note: forward declaration of 'struct page_pool_stats'
           struct page_pool_stats stats = {};
                  ^
>> drivers/net/wireless/mediatek/mt76/mac80211.c:1736:3: error: implicit declaration of function 'page_pool_get_stats' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   page_pool_get_stats(dev->q_rx[i].page_pool, &stats);
                   ^
   2 errors generated.


vim +1732 drivers/net/wireless/mediatek/mt76/mac80211.c

  1729	
  1730	void mt76_ethtool_page_pool_stats(struct mt76_dev *dev, u64 *data, int *index)
  1731	{
> 1732		struct page_pool_stats stats = {};
  1733		int i;
  1734	
  1735		mt76_for_each_q_rx(dev, i)
> 1736			page_pool_get_stats(dev->q_rx[i].page_pool, &stats);
  1737	
  1738		page_pool_ethtool_stats_get(data, &stats);
  1739		*index += page_pool_ethtool_stats_get_count();
  1740	}
  1741	EXPORT_SYMBOL_GPL(mt76_ethtool_page_pool_stats);
  1742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
