Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72401262D00;
	Wed, 30 Apr 2025 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031542; cv=none; b=hCo+rNCqWDNUjSe4E5Qtuw4r8sR3VpMAcmlr/RFVZdB2weD4FIv7fEdXEiZFONRzhjm8tOVr6eqrrySziirNulZ1cv0kdLXezSlc6PrItCIiZHAKN5LkE7aDQofZbqlsx3+cABi6ZeXnDmA/m11x1/i7apggkASOO0xRK4IpZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031542; c=relaxed/simple;
	bh=YRFeOE2SvEpVpyHUyxI/7ubZqIxqK3KMU4XzCZOjQhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpYLYI9QDFH2w/RT8tPe4enqpoexIDV62+b6jY5Mp/jmCxYN11lS8cdIF3VZyXvMnuRncQyqZ+cwSSu+c07rdXRc1rLsiLfLR6063uQ6yXA/6IBkGNPlMFSHVaGSkLD4SX+QnEOwkiXMCgkJ9yOoUyuv0Cjrhpq6DCrSWzGn0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6TgGSw5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6TgGSw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746031540; x=1777567540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRFeOE2SvEpVpyHUyxI/7ubZqIxqK3KMU4XzCZOjQhw=;
  b=X6TgGSw5IvMRySNfuMp06XkqZJsHa2y8K1xExAN5pDeHcsTjNIa+1Q3f
   f+CQRsOE+5DLvwbqHuTUiemWPgO1lbjy3a9LRuuOGJqWUiEHy/cCcCIKq
   YhiltBkp2i3mzr3pm/TPgE29TIFXIdNQpFbUoF2VJIs67PZgmKh2CYv9a
   4vwK/8F2EMQGMis4q/4q1eo+RxdwMJliqcgqDJsfym7Nom/0ci+xXvmV8
   jKZ5h3kjewgehEL04Q9V655SbckMjIvMPrZYzqy69gg0p07pgDyRHRQir
   pXKqaWKB+FmDxsc6Ya65JWXMIGG5u2kAGpil9ipkqh3Dw0vEip4emYDwO
   Q==;
X-CSE-ConnectionGUID: A9pwEGzES8mRKSyzxSagrA==
X-CSE-MsgGUID: 1djZSq2CTiOW1+n7F2ZNrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57900352"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="57900352"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 09:45:39 -0700
X-CSE-ConnectionGUID: FRYk2KNrTwGYffzVPt4jkA==
X-CSE-MsgGUID: dXoFU1mgRlq9kWHXKov/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="134108205"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 09:45:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAAYu-0003cH-2Q;
	Wed, 30 Apr 2025 16:45:32 +0000
Date: Thu, 1 May 2025 00:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>, Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Troy Hanson <quic_thanson@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com, Carl Vanderlip <quic_carlv@quicinc.com>,
	Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH v3] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <202505010037.1PMLamw8-lkp@intel.com>
References: <20250429122351.108684-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429122351.108684-1-usama.anjum@collabora.com>

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on next-20250430]
[cannot apply to mani-mhi/mhi-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus staging/staging-testing staging/staging-next staging/staging-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/bus-mhi-host-don-t-free-bhie-tables-during-suspend-hibernation/20250429-202649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250429122351.108684-1-usama.anjum%40collabora.com
patch subject: [PATCH v3] bus: mhi: host: don't free bhie tables during suspend/hibernation
config: arm64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250501/202505010037.1PMLamw8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010037.1PMLamw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010037.1PMLamw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pm.c:1246:6: warning: no previous prototype for function 'mhi_power_down_unprepare_keep_dev' [-Wmissing-prototypes]
    1246 | void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
         |      ^
   drivers/bus/mhi/host/pm.c:1246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1246 | void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
         | ^
         | static 
   1 warning generated.


vim +/mhi_power_down_unprepare_keep_dev +1246 drivers/bus/mhi/host/pm.c

  1245	
> 1246	void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
  1247	{
  1248		mhi_cntrl->bhi = NULL;
  1249		mhi_cntrl->bhie = NULL;
  1250	
  1251		mhi_deinit_dev_ctxt(mhi_cntrl);
  1252	}
  1253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
