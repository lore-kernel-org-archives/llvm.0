Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09413302741;
	Fri, 12 Dec 2025 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765569330; cv=none; b=rQtm/4MFVDRQjX+wh6F062+71x8/7ilVlsibgMF6fAIRq9drz9G5Fzka9X3XUwbjHqpY6zh1b7znNPuop847c8ytHPi7UNnWZlVRlWP6Bny8YO/6+SPkQwSF6LGTaA9MANcQR6zwd15ah2oKH/+MvOvbD0gtW7zTs5R4OAYa3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765569330; c=relaxed/simple;
	bh=aQMwPUCGOKYu5bPKUuRujBhfUt3Wx3N37gk02/0rIrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/ncqcM7KL+vPkog+XqrBRJugxWMYCO2OOHBu89gnV9gtM1vYdzHu88bN9N/7uxd+hWUc7VfihZBuP6VUb3V/kZ/acpLGp47MTiLhoU4kH0os0HV6wBwcSVx1UeG6Wf8mLECRJNCvAELcyUoJb/SlPxp7NV/Pp+lYt2WHSitFOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9Ls1Xx2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9Ls1Xx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765569328; x=1797105328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQMwPUCGOKYu5bPKUuRujBhfUt3Wx3N37gk02/0rIrk=;
  b=Z9Ls1Xx2m6ldkWp+cvzzUGZK7miwpw5L4o5+D/04pKgLwt+8gJgZIh9B
   bZ7bvDD73H/ktUhTuuJWUo4eM6lbe5tPo3G9SU4p+2eDyzHcUL+dqvWSd
   9zE00RAN/1cPDv6DLetyZ8ZVMOCDOcqNyFhqZreqAHIH/zyp1WCN2zx0S
   oLutu4DvZO4vjN+oy1sTRDNGPrR4/pc0cRqhEAUUspkp7sEfrTGHPP87V
   oP3OWkmipuxRy7HcQPKhZmNBoeO+D4gu22FM2s9ejWdur5ajyomGj7Bb5
   iNOqWP7oBGGQCSG7y3afU5OpfjuvJUIXeozo6dXUZ84wzQJhJtF7ve+gl
   g==;
X-CSE-ConnectionGUID: vYcpnvHUR1KtavRRAaD/NA==
X-CSE-MsgGUID: H/Y9NgzMRJyI+yvVjofz4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71438215"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71438215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 11:55:27 -0800
X-CSE-ConnectionGUID: e5y4xfKoSJm4v7ILPnG1Hw==
X-CSE-MsgGUID: 7GeIE+VUQzerjm+0jvn2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197663935"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 11:55:24 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9EY-000000006XZ-0jB8;
	Fri, 12 Dec 2025 19:55:22 +0000
Date: Sat, 13 Dec 2025 03:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Shaul Triebitz <shaul.triebitz@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2:
 warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than
 'union iwl_rx_mpdu_desc_v1::(anonymous at
 drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually
 du...
Message-ID: <202512130341.RfWSYXdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   9 months ago
config: arm-randconfig-001-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130341.RfWSYXdy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130341.RfWSYXdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130341.RfWSYXdy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mld/low_latency.c:5:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/low_latency.c:5:
   drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:17: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/mld.h:228:2)'
     299 |         mld->fw_status.in_d3 = false;
         |         ~~~~~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/low_latency.c:6:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/iface.h:11:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/session-protect.h:10:
   drivers/net/wireless/intel/iwlwifi/mld/hcmd.h:13:29: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/mld.h:228:2)'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                     ~~~~~~~~~~~~~~ ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mld/low_latency.c:6:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: warning: 'CONFIG_PM_SLEEP' is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^
   2 warnings and 2 errors generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/thermal.c:13:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/thermal.c:13:
   drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:17: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/mld.h:228:2)'
     299 |         mld->fw_status.in_d3 = false;
         |         ~~~~~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/thermal.c:14:
   drivers/net/wireless/intel/iwlwifi/mld/hcmd.h:13:29: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/mld.h:228:2)'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                     ~~~~~~~~~~~~~~ ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/rx.c:9:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/rx.c:9:
   drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:17: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/mld.h:228:2)'
     299 |         mld->fw_status.in_d3 = false;
         |         ~~~~~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/rx.c:13:
   drivers/net/wireless/intel/iwlwifi/mld/hcmd.h:13:29: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/mld.h:228:2)'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                     ~~~~~~~~~~~~~~ ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mld/rx.c:14:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: warning: 'CONFIG_PM_SLEEP' is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/rx.c:9:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:608:2: warning: field  within 'struct iwl_rx_mpdu_desc_v3' is less aligned than 'union iwl_rx_mpdu_desc_v3::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:608:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v3' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     608 |         union {
         |         ^
   3 warnings and 2 errors generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/rx.c:10:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/rx.c:10:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:299:17: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:228:2)'
     299 |         mld->fw_status.in_d3 = false;
         |         ~~~~~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/rx.c:10:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:608:2: warning: field  within 'struct iwl_rx_mpdu_desc_v3' is less aligned than 'union iwl_rx_mpdu_desc_v3::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:608:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v3' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     608 |         union {
         |         ^
   2 warnings and 1 error generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/link.c:10:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/link.c:10:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:299:17: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:228:2)'
     299 |         mld->fw_status.in_d3 = false;
         |         ~~~~~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/link.c:12:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:11:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/../session-protect.h:10:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../hcmd.h:13:29: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:228:2)'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                     ~~~~~~~~~~~~~~ ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/link.c:12:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:170:5: warning: 'CONFIG_PM_SLEEP' is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^
   2 warnings and 2 errors generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/hcmd.c:10:
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:21:
>> drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2: warning: field  within 'struct iwl_rx_mpdu_desc_v1' is less aligned than 'union iwl_rx_mpdu_desc_v1::(anonymous at drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h:511:2)' and is usually due to 'struct iwl_rx_mpdu_desc_v1' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     511 |         union {
         |         ^
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/hcmd.c:10:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:299:17: error: no member named 'in_d3' in 'struct iwl_mld::(unnamed at drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:228:2)'
     299 |         mld->fw_status.in_d3 = false;
         |         ~~~~~~~~~~~~~~ ^
   1 warning and 1 error generated.


vim +511 drivers/net/wireless/intel/iwlwifi/mld/../fw/api/rx.h

0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  452  
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  453  /**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  454   * struct iwl_rx_mpdu_desc_v1 - RX MPDU descriptor
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  455   */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  456  struct iwl_rx_mpdu_desc_v1 {
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  457  	/* DW7 - carries rss_hash only when rpa_en == 1 */
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  458  	union {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  459  		/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  460  		 * @rss_hash: RSS hash value
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  461  		 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  462  		__le32 rss_hash;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  463  
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  464  		/**
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  465  		 * @phy_data2: depends on info type (see @phy_data1)
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  466  		 */
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  467  		__le32 phy_data2;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  468  	};
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  469  
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  470  	/* DW8 - carries filter_match only when rpa_en == 1 */
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  471  	union {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  472  		/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  473  		 * @filter_match: filter match value
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  474  		 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  475  		__le32 filter_match;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  476  
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  477  		/**
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  478  		 * @phy_data3: depends on info type (see @phy_data1)
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  479  		 */
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  480  		__le32 phy_data3;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  481  	};
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  482  
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  483  	/* DW9 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  484  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  485  	 * @rate_n_flags: RX rate/flags encoding
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  486  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  487  	__le32 rate_n_flags;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  488  	/* DW10 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  489  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  490  	 * @energy_a: energy chain A
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  491  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  492  	u8 energy_a;
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  493  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  494  	 * @energy_b: energy chain B
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  495  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  496  	u8 energy_b;
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  497  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  498  	 * @channel: channel number
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  499  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  500  	u8 channel;
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  501  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  502  	 * @mac_context: MAC context mask
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  503  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  504  	u8 mac_context;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  505  	/* DW11 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  506  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  507  	 * @gp2_on_air_rise: GP2 timer value on air rise (INA)
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  508  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  509  	__le32 gp2_on_air_rise;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  510  	/* DW12 & DW13 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05 @511  	union {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  512  		/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  513  		 * @tsf_on_air_rise:
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  514  		 * TSF value on air rise (INA), only valid if
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  515  		 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD isn't set
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  516  		 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  517  		__le64 tsf_on_air_rise;
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  518  
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  519  		struct {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  520  			/**
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  521  			 * @phy_data0: depends on info_type, see @phy_data1
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  522  			 */
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  523  			__le32 phy_data0;
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  524  			/**
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  525  			 * @phy_data1: valid only if
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  526  			 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD is set,
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  527  			 * see &enum iwl_rx_phy_common_data1 or
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  528  			 *     &enum iwl_rx_phy_he_data1 or
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  529  			 *     &enum iwl_rx_phy_eht_data1.
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  530  			 */
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  531  			__le32 phy_data1;
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  532  		};
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  533  	};
ce712478a458fc9 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2021-10-17  534  } __packed; /* RX_MPDU_RES_START_API_S_VER_4 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  535  
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  536  /**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  537   * struct iwl_rx_mpdu_desc_v3 - RX MPDU descriptor
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  538   */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  539  struct iwl_rx_mpdu_desc_v3 {
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  540  	/* DW7 - carries filter_match only when rpa_en == 1 */
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  541  	union {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  542  		/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  543  		 * @filter_match: filter match value
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  544  		 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  545  		__le32 filter_match;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  546  
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  547  		/**
382d8296c5b5664 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-04-24  548  		 * @phy_data3: depends on info type (see @phy_data1)
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  549  		 */
382d8296c5b5664 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-04-24  550  		__le32 phy_data3;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  551  	};
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  552  
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  553  	/* DW8 - carries rss_hash only when rpa_en == 1 */
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  554  	union {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  555  		/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  556  		 * @rss_hash: RSS hash value
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  557  		 */
13555e8ba2f4309 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2015-09-02  558  		__le32 rss_hash;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  559  
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  560  		/**
382d8296c5b5664 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-04-24  561  		 * @phy_data2: depends on info type (see @phy_data1)
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  562  		 */
382d8296c5b5664 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-04-24  563  		__le32 phy_data2;
dabf9844385885e drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2018-04-26  564  	};
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  565  	/* DW9 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  566  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  567  	 * @partial_hash: 31:0 ip/tcp header hash
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  568  	 *	w/o some fields (such as IP SRC addr)
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  569  	 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  570  	__le32 partial_hash;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  571  	/* DW10 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  572  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  573  	 * @raw_xsum: raw xsum value
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  574  	 */
59ca9572dee98f6 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-09-26  575  	__be16 raw_xsum;
59ca9572dee98f6 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-09-26  576  	/**
59ca9572dee98f6 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-09-26  577  	 * @reserved_xsum: reserved high bits in the raw checksum
59ca9572dee98f6 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-09-26  578  	 */
59ca9572dee98f6 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Johannes Berg       2020-09-26  579  	__le16 reserved_xsum;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  580  	/* DW11 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  581  	/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  582  	 * @rate_n_flags: RX rate/flags encoding
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  583  	 */
13555e8ba2f4309 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2015-09-02  584  	__le32 rate_n_flags;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  585  	/* DW12 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  586  	/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  587  	 * @energy_a: energy chain A
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  588  	 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  589  	u8 energy_a;
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  590  	/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  591  	 * @energy_b: energy chain B
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  592  	 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  593  	u8 energy_b;
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  594  	/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  595  	 * @channel: channel number
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  596  	 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  597  	u8 channel;
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  598  	/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  599  	 * @mac_context: MAC context mask
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  600  	 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  601  	u8 mac_context;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  602  	/* DW13 */
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  603  	/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  604  	 * @gp2_on_air_rise: GP2 timer value on air rise (INA)
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  605  	 */
d56a7801b544d63 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Sara Sharon         2016-01-26  606  	__le32 gp2_on_air_rise;
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  607  	/* DW14 & DW15 */
8a6171a7b601e37 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2018-06-26 @608  	union {
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  609  		/**
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  610  		 * @tsf_on_air_rise:
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  611  		 * TSF value on air rise (INA), only valid if
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  612  		 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD isn't set
6857df8c10e6986 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2017-03-15  613  		 */
13555e8ba2f4309 drivers/net/wireless/intel/iwlwifi/mvm/fw-api-rx.h Johannes Berg       2015-09-02  614  		__le64 tsf_on_air_rise;
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  615  
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  616  		struct {
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  617  			/**
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  618  			 * @phy_data0: depends on info_type, see @phy_data1
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  619  			 */
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  620  			__le32 phy_data0;
8a6171a7b601e37 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2018-06-26  621  			/**
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  622  			 * @phy_data1: valid only if
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  623  			 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD is set,
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  624  			 * see &enum iwl_rx_phy_data1.
8a6171a7b601e37 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2018-06-26  625  			 */
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  626  			__le32 phy_data1;
bdf180c8d375ee7 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Shaul Triebitz      2018-07-02  627  		};
8a6171a7b601e37 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2018-06-26  628  	};
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  629  	/* DW16 */
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  630  	/**
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  631  	 * @phy_data5: valid only if
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  632  	 * %IWL_RX_MPDU_PHY_TSF_OVERLOAD is set,
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  633  	 * see &enum iwl_rx_phy_data5.
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  634  	 */
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  635  	__le32 phy_data5;
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  636  	/* DW17 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  637  	/**
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  638  	 * @reserved: reserved
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  639  	 */
0ac93c06dca70f0 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Mordechay Goodstein 2023-01-27  640  	__le32 reserved[1];
ce712478a458fc9 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2021-10-17  641  } __packed; /* RX_MPDU_RES_START_API_S_VER_3,
ce712478a458fc9 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Luca Coelho         2021-10-17  642  	       RX_MPDU_RES_START_API_S_VER_5 */
18ead597daa17a5 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     Golan Ben Ami       2018-02-05  643  

:::::: The code at line 511 was first introduced by commit
:::::: 18ead597daa17a557249cf4b2f494361d836ed52 iwlwifi: support new rx_mpdu_desc api

:::::: TO: Golan Ben Ami <golan.ben.ami@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
