Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D879F2;
	Tue, 24 Jun 2025 01:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750727099; cv=none; b=W9nTWspMbK9Za/VaCsDAyikEGeGH/NB+lh1eZT3dFirqXDDFtpViCPD/RhzdIEuYQFzeSp1r9mtXX5LccN/o7MFtVPUObl2Yd4+Xq701qDTGJ50kgUDvvDP/1TGyF6op1qCR8/NmGVUQjkirQIkby1/gaAJearAoynEJKLBMW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750727099; c=relaxed/simple;
	bh=qCvd9QdqCG4oA0jrAJ2OY7+OIDbabZ3nI9zb7U78xfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xrvblncgk1LiiiYMf7I+LWpX3b9xD2CA7VvxEbS+mM+vcoFnimLfHyvn/VBvpte89veKqKEw57Gz9Dz8mTAknNZcDzzcPPNazAIsWdnUmh42N/NOhZD+ueaOw/ttkFERxTyT2WJuuWgMrgj2t1dSc0moeJw/XlMr8sYk/UbIni8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBd9KmL9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBd9KmL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750727098; x=1782263098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCvd9QdqCG4oA0jrAJ2OY7+OIDbabZ3nI9zb7U78xfM=;
  b=UBd9KmL9yA93s3afN+DEVIOy+kUQ7PyBewUgpLtBi5Cfxr8a5h7UBUNP
   gg8l/+EKIpDFfFhZsGrVNAskNwnZD0dhkZ/1h5HAn4bSJHURBDpQQlwOP
   omMTe+j98r9Gh+Zq6eteNqjzp4VR4x50PfzYmPQ/K93i5cCKD2JRg7Kvy
   12MplEQqyTHdz1AEm6SLz8LgPg5Itui6jZU/PucOYf2LPiFeOfDpeHT+6
   rfwgE/19RGPDxLuNuRyBGj+0ZzjO96CjUTAV60h/bFsjsmt3eeSdiNg2Y
   IYX8w6Z85nra7E5FXs+J9fhBQXtuimy8ecuI3LlBF7KV7Ts7KNXvcTNa1
   Q==;
X-CSE-ConnectionGUID: q/Ls34e4R62EZJ8nSfBy4Q==
X-CSE-MsgGUID: ZCQQcrFOTjKxwWX15CFDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63221212"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="63221212"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 18:04:57 -0700
X-CSE-ConnectionGUID: KFsvF1MwQ0+bSO6gZuI81Q==
X-CSE-MsgGUID: /cpDsglYTYWu/8zL9mQspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="182794519"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 18:04:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTs5k-000Ra2-2P;
	Tue, 24 Jun 2025 01:04:52 +0000
Date: Tue, 24 Jun 2025 09:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 2/57]
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c:1939:1: warning: stack
 frame size (1168) exceeds limit (1024) in
 '_rtl8723be_read_txpower_info_from_hwpg'
Message-ID: <202506240929.5ETeeobg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   45965d80ee21635e7f04e6d7fd6caa929820b219
commit: 01f706f06786b07a552e9293c9d6244c99d5741d [2/57] [SUBMITTED 20250610] wifi: rtlwifi: avoid stack size warning for _read_eeprom_info
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240929.5ETeeobg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240929.5ETeeobg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240929.5ETeeobg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c:1939:1: warning: stack frame size (1168) exceeds limit (1024) in '_rtl8723be_read_txpower_info_from_hwpg' [-Wframe-larger-than]
    1939 | _rtl8723be_read_txpower_info_from_hwpg(struct ieee80211_hw *hw,
         | ^
   1 warning generated.


vim +/_rtl8723be_read_txpower_info_from_hwpg +1939 drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c

  1937	
  1938	static noinline_for_stack void
> 1939	_rtl8723be_read_txpower_info_from_hwpg(struct ieee80211_hw *hw,
  1940					       bool autoload_fail, u8 *hwinfo)
  1941	{
  1942		struct rtl_priv *rtlpriv = rtl_priv(hw);
  1943		struct rtl_efuse *rtlefuse = rtl_efuse(rtl_priv(hw));
  1944		struct txpower_info_2g pw2g;
  1945		struct txpower_info_5g pw5g;
  1946		u8 rf_path, index;
  1947		u8 i;
  1948	
  1949		_rtl8723be_read_power_value_fromprom(hw, &pw2g, &pw5g, autoload_fail,
  1950						     hwinfo);
  1951	
  1952		for (rf_path = 0; rf_path < 2; rf_path++) {
  1953			for (i = 0; i < 14; i++) {
  1954				index = _rtl8723be_get_chnl_group(i+1);
  1955	
  1956				rtlefuse->txpwrlevel_cck[rf_path][i] =
  1957						pw2g.index_cck_base[rf_path][index];
  1958				rtlefuse->txpwrlevel_ht40_1s[rf_path][i] =
  1959						pw2g.index_bw40_base[rf_path][index];
  1960			}
  1961			for (i = 0; i < MAX_TX_COUNT; i++) {
  1962				rtlefuse->txpwr_ht20diff[rf_path][i] =
  1963							pw2g.bw20_diff[rf_path][i];
  1964				rtlefuse->txpwr_ht40diff[rf_path][i] =
  1965							pw2g.bw40_diff[rf_path][i];
  1966				rtlefuse->txpwr_legacyhtdiff[rf_path][i] =
  1967							pw2g.ofdm_diff[rf_path][i];
  1968			}
  1969	
  1970			for (i = 0; i < 14; i++) {
  1971				RTPRINT(rtlpriv, FINIT, INIT_TXPOWER,
  1972					"RF(%d)-Ch(%d) [CCK / HT40_1S ] = [0x%x / 0x%x ]\n",
  1973					rf_path, i,
  1974					rtlefuse->txpwrlevel_cck[rf_path][i],
  1975					rtlefuse->txpwrlevel_ht40_1s[rf_path][i]);
  1976			}
  1977		}
  1978	
  1979		if (!autoload_fail)
  1980			rtlefuse->eeprom_thermalmeter =
  1981						hwinfo[EEPROM_THERMAL_METER_88E];
  1982		else
  1983			rtlefuse->eeprom_thermalmeter = EEPROM_DEFAULT_THERMALMETER;
  1984	
  1985		if (rtlefuse->eeprom_thermalmeter == 0xff || autoload_fail) {
  1986			rtlefuse->apk_thermalmeterignore = true;
  1987			rtlefuse->eeprom_thermalmeter = EEPROM_DEFAULT_THERMALMETER;
  1988		}
  1989	
  1990		rtlefuse->thermalmeter[0] = rtlefuse->eeprom_thermalmeter;
  1991		RTPRINT(rtlpriv, FINIT, INIT_TXPOWER,
  1992			"thermalmeter = 0x%x\n", rtlefuse->eeprom_thermalmeter);
  1993	
  1994		if (!autoload_fail) {
  1995			rtlefuse->eeprom_regulatory =
  1996				hwinfo[EEPROM_RF_BOARD_OPTION_88E] & 0x07;/*bit0~2*/
  1997			if (hwinfo[EEPROM_RF_BOARD_OPTION_88E] == 0xFF)
  1998				rtlefuse->eeprom_regulatory = 0;
  1999		} else {
  2000			rtlefuse->eeprom_regulatory = 0;
  2001		}
  2002		RTPRINT(rtlpriv, FINIT, INIT_TXPOWER,
  2003			"eeprom_regulatory = 0x%x\n", rtlefuse->eeprom_regulatory);
  2004	}
  2005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
