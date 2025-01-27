Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FE19066D;
	Mon, 27 Jan 2025 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738006966; cv=none; b=Ustmtip2zcaODuDUNLPBIXdx39VkRW+U8iNK/pmtv+dhl1Ffb6mJje0UHb0TjPnP2ccGK2hOE9ZinrK0FabaqwcUWaLzWRLYi7s+P/ssswV60qZvaGGx2I3o8DOnjTiL8rD1CqQgLWPGMLrS9UcutHMR65i34jCw/ZgO5/QKhuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738006966; c=relaxed/simple;
	bh=sc0INDQPjOZC+fi8GJ99iinD73q7hXoo8r7sHWInbIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rtz4/H6gbkBH36PZBA96ltvzQfn6T180dWxofEADHcamXXpQZvH03w7IkV0jeTNAsw3WBU/PdGYn8sAhUwZ/kNjP/D18OoldEiRL/ZBiA8mx5Y7WP6jtrS5GzsTzh2Lfj7R3z0vGUcT0XOET/cCM/LBCxIezcQNEnZDGWBZRP2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjFWX1zK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjFWX1zK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738006964; x=1769542964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sc0INDQPjOZC+fi8GJ99iinD73q7hXoo8r7sHWInbIA=;
  b=EjFWX1zKrdJKunEttelSubIkAC5x+ZQ8ByRYL5lLSejEL/DPTW6NFRxb
   RYacGEf7vhuz7hx/HJQ3Kka+va/BszjilhOxRBQIV/BIX3xXaTko44VyQ
   QvgvlXxaNLCJAd/Z4Ox+hmIlKj3HvlqEe4ssHETkWGwx39q355ysYVmCQ
   Xivua07v2DBBJXerLooH/u9Rpd8VrWaXX/2qE+j/OWWpnC1FBOsW01xpn
   Q1j4wv/e+QtrgY3C4nMXWGavPrDYxorj/KvWww/p9tCpOSvCQLhxMM062
   4tO5kMVLRA5MbLelJe0ghwAieLtz/hgES9MK6919K7OB2bZEO3H9q3ty8
   A==;
X-CSE-ConnectionGUID: gleGLtjKTHu22ZrvzofKRQ==
X-CSE-MsgGUID: gr7ya5oXRkiPPCjdsG3ZcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49139597"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="49139597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 11:42:43 -0800
X-CSE-ConnectionGUID: t8HStpnUTU6HkNR2WXMOvw==
X-CSE-MsgGUID: koErNDuETxSH4LhGWfh/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="139411175"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jan 2025 11:42:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcV0I-000h5z-1a;
	Mon, 27 Jan 2025 19:42:38 +0000
Date: Tue, 28 Jan 2025 03:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 6/15]
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2163:2: error: call to
 '__compiletime_assert_1138' declared with 'error' attribute: BUILD_BUG_ON
 failed: conf->keylen < WLAN_KEY_LEN_GCMP_256
Message-ID: <202501280314.duK3nD3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   86b653e4edef7b0f7b7afe5dd8e0241fc1165238
commit: e37f7001ef33528ce10e3821fc5c07b84fc4fca7 [6/15] wifi: iwlwifi: mvm: Use __counted_by() and avoid -Wfamnae warnings
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250128/202501280314.duK3nD3Q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280314.duK3nD3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280314.duK3nD3Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mvm/d3.c:7:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2163:2: error: call to '__compiletime_assert_1138' declared with 'error' attribute: BUILD_BUG_ON failed: conf->keylen < WLAN_KEY_LEN_GCMP_256
    2163 |         BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_GCMP_256);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:167:1: note: expanded from here
     167 | __compiletime_assert_1138
         | ^
>> drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2162:2: error: call to '__compiletime_assert_1137' declared with 'error' attribute: BUILD_BUG_ON failed: conf->keylen < WLAN_KEY_LEN_CCMP
    2162 |         BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_CCMP);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:163:1: note: expanded from here
     163 | __compiletime_assert_1137
         | ^
   3 warnings and 2 errors generated.


vim +2163 drivers/net/wireless/intel/iwlwifi/mvm/d3.c

  2148	
  2149	static bool iwl_mvm_gtk_rekey(struct iwl_wowlan_status_data *status,
  2150				      struct ieee80211_vif *vif,
  2151				      struct iwl_mvm *mvm, u32 gtk_cipher)
  2152	{
  2153		int i, j;
  2154		struct ieee80211_key_conf *key;
  2155		DEFINE_FLEX(struct ieee80211_key_conf, conf, key, keylen,
  2156			    WOWLAN_KEY_MAX_SIZE);
  2157		int link_id = vif->active_links ? __ffs(vif->active_links) : -1;
  2158	
  2159		conf->cipher = gtk_cipher;
  2160	
  2161		BUILD_BUG_ON(WLAN_KEY_LEN_CCMP != WLAN_KEY_LEN_GCMP);
> 2162		BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_CCMP);
> 2163		BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_GCMP_256);
  2164		BUILD_BUG_ON(conf->keylen < WLAN_KEY_LEN_TKIP);
  2165		BUILD_BUG_ON(conf->keylen < sizeof(status->gtk[0].key));
  2166	
  2167		switch (gtk_cipher) {
  2168		case WLAN_CIPHER_SUITE_CCMP:
  2169		case WLAN_CIPHER_SUITE_GCMP:
  2170			conf->keylen = WLAN_KEY_LEN_CCMP;
  2171			break;
  2172		case WLAN_CIPHER_SUITE_GCMP_256:
  2173			conf->keylen = WLAN_KEY_LEN_GCMP_256;
  2174			break;
  2175		case WLAN_CIPHER_SUITE_TKIP:
  2176			conf->keylen = WLAN_KEY_LEN_TKIP;
  2177			break;
  2178		default:
  2179			WARN_ON(1);
  2180		}
  2181	
  2182		for (i = 0; i < ARRAY_SIZE(status->gtk); i++) {
  2183			if (!status->gtk[i].len)
  2184				continue;
  2185	
  2186			conf->keyidx = status->gtk[i].id;
  2187			IWL_DEBUG_WOWLAN(mvm,
  2188					 "Received from FW GTK cipher %d, key index %d\n",
  2189					 conf->cipher, conf->keyidx);
  2190			memcpy(conf->key, status->gtk[i].key,
  2191			       sizeof(status->gtk[i].key));
  2192	
  2193			key = ieee80211_gtk_rekey_add(vif, conf, link_id);
  2194			if (IS_ERR(key))
  2195				return false;
  2196	
  2197			for (j = 0; j < ARRAY_SIZE(status->gtk_seq); j++) {
  2198				if (!status->gtk_seq[j].valid ||
  2199				    status->gtk_seq[j].key_id != key->keyidx)
  2200					continue;
  2201				iwl_mvm_set_key_rx_seq_idx(key, status, j);
  2202				break;
  2203			}
  2204			WARN_ON(j == ARRAY_SIZE(status->gtk_seq));
  2205		}
  2206	
  2207		return true;
  2208	}
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
