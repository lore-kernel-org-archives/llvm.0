Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD67F9;
	Sat, 20 Jul 2024 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721434196; cv=none; b=Fqc97XxHITsB64X4SkPlfslt8v8wO+hsbo7zmDIIo3SQ9MA2n58LlHWAeei3iL3SqL9Jw4LNbO0QD+HZ7qhhATWvhVjerFv/2/Kd3m5wBoq6TXF+CqIM1K14+hPGQbescDYyfKM4Vydf6RI+xIBVfSSWhoZRMJ5WfIeSaxpT6dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721434196; c=relaxed/simple;
	bh=BW4gN2rUBhU1SaQmvAfCfTL+OCwexm9obXr29f/hAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyWCLL+DpkphTCkVTOfumMQ8xWTP60zs1m49+uIRF1uq0VUz/AjKnBvZtFa3r67nvnEgXMysYUWjaX+aVndFV41ewa5fnWC9x93LoQa9xVHIEvTF/Xu/Sgc/oKbTiVoemBz7T9W6ks6PMJXPx9He/88wo/Zzqwn5Z10ZErHBFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ER7BVToP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ER7BVToP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721434195; x=1752970195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BW4gN2rUBhU1SaQmvAfCfTL+OCwexm9obXr29f/hAFo=;
  b=ER7BVToP39k+woqI7l18F6agN7A2kgd8L5fBoCJZCmdhYx59YQR3S+Fa
   lZMAyxQk9+MpDtNRBnrrGOsn1OU/yZ/2rbJijlcElH2nn5eHWHh0cyBJK
   TP89UhJYZPgAFTYTOZzBay5r6U0WPPgzxUaaaH+wU1Jr0kNkAFFulgXfM
   aJaizL5Kqv1Svp//Uwj5E+6Ui5IiLZfbNVI+nODfZxW5SG638XikXjQ9h
   8OQ1zrmUw1B1iTDhWbdPbL+SUP94+aLFjBXrLGeCk+sek4GVGFXgFxsBw
   n6tc+eo+coj+sF/b+0i+PnqRWDw8RUImzBhC9QIYlx4XICXoJ3StDM2Gb
   Q==;
X-CSE-ConnectionGUID: BrBrqhHxT1O6jSJEjKtQDw==
X-CSE-MsgGUID: gAUaYk+wSpaQrsWPpGGLNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30462262"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="30462262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 17:09:53 -0700
X-CSE-ConnectionGUID: iwMpYaE7Ssu1/ADc/lS5RQ==
X-CSE-MsgGUID: RrE8RhBGSQeDcrDvIo1yEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="55457571"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jul 2024 17:09:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUxfZ-000ih6-0n;
	Sat, 20 Jul 2024 00:09:49 +0000
Date: Sat, 20 Jul 2024 08:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/6] wifi: rtw89: 8852bt: add 8852BE-VT to Makefile
 and Kconfig
Message-ID: <202407200741.dMG9uvHU-lkp@intel.com>
References: <20240719062414.21953-7-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719062414.21953-7-pkshih@realtek.com>

Hi Ping-Ke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on linus/master next-20240719]
[cannot apply to wireless/main v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ping-Ke-Shih/wifi-rtw89-8852bt-add-set_channel_rf/20240719-161236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240719062414.21953-7-pkshih%40realtek.com
patch subject: [PATCH v2 6/6] wifi: rtw89: 8852bt: add 8852BE-VT to Makefile and Kconfig
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240720/202407200741.dMG9uvHU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200741.dMG9uvHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200741.dMG9uvHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c:1827:46: warning: operator '?:' has lower precedence than '&'; '&' will be evaluated first [-Wbitwise-conditional-parentheses]
    1827 |                     kidx, dpk->is_dpk_enable & off_reverse ? "enable" : "disable");
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c:1827:46: note: place parentheses around the '&' expression to silence this warning
    1827 |                     kidx, dpk->is_dpk_enable & off_reverse ? "enable" : "disable");
         |                                                            ^
         |                           (                               )
   drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c:1827:46: note: place parentheses around the '?:' expression to evaluate it first
    1827 |                     kidx, dpk->is_dpk_enable & off_reverse ? "enable" : "disable");
         |                                                            ^                     
         |                                                (                                 )
   1 warning generated.


vim +1827 drivers/net/wireless/realtek/rtw89/rtw8852bt_rfk.c

f77c5179bc9f6f Ping-Ke Shih 2024-06-27  1807  
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1808  static void _dpk_onoff(struct rtw89_dev *rtwdev, enum rtw89_rf_path path, bool off)
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1809  {
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1810  	struct rtw89_dpk_info *dpk = &rtwdev->dpk;
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1811  	u8 val, kidx = dpk->cur_idx[path];
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1812  	bool off_reverse;
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1813  
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1814  	val = dpk->is_dpk_enable && !off && dpk->bp[path][kidx].path_ok;
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1815  
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1816  	if (off)
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1817  		off_reverse = false;
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1818  	else
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1819  		off_reverse = true;
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1820  
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1821  	val = dpk->is_dpk_enable & off_reverse & dpk->bp[path][kidx].path_ok;
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1822  
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1823  	rtw89_phy_write32_mask(rtwdev, R_DPD_CH0A + (path << 8) + (kidx << 2),
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1824  			       BIT(24), val);
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1825  
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1826  	rtw89_debug(rtwdev, RTW89_DBG_RFK, "[DPK] S%d[%d] DPK %s !!!\n", path,
5b8c61b82eec9e Ping-Ke Shih 2024-06-21 @1827  		    kidx, dpk->is_dpk_enable & off_reverse ? "enable" : "disable");
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1828  }
5b8c61b82eec9e Ping-Ke Shih 2024-06-21  1829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
