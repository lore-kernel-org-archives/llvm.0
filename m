Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4377C
	for <llvm@lists.linux.dev>; Sun, 28 Aug 2022 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661724998; x=1693260998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CocVa54v2hio1a8ErBXXDR0NegYDmrQDvFgX9fY3UsA=;
  b=hUDX4EMIgKC5Yxps7qUtUJ9+Po1U+l++xz8i2AgFnm70QGB7xWpsmLiU
   1Qk2dzabjaenoY/qN8A4ptndrQUqzqP7f8+37IME9Rr1f7WOqI84p/Wu9
   21dUl4hRnE0e3+Ugh0CsbxrQbsUMXMyYIRXKtxreqOvbd22m4ka6TxkZJ
   phlJdX7r/+uxHDfkqyGTrAnNJOgePIW2qLMMSlp4pV3eMp/qHOYfoqtP2
   vNGm6J8p0oX22fkyizWU94V/AD7ltehSnrIb7WWzIkDzObnJ7AVXL0E8w
   7hfu9eTkLJ+STZNgKF87ts0CXwwLczYRuPSw9Trx4Zt2WYsyYGCd/tY1h
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="356486999"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="356486999"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="679431204"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2022 15:16:35 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSQa3-0001ff-0L;
	Sun, 28 Aug 2022 22:16:35 +0000
Date: Mon, 29 Aug 2022 06:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arvid Norlander <lkml@vorpal.se>, platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Sebastian Reichel <sre@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Azael Avalos <coproscefalo@gmail.com>,
	Arvid Norlander <lkml@vorpal.se>
Subject: Re: [PATCH 2/3] platform/x86: Battery charge mode in toshiba_acpi
 (sysfs)
Message-ID: <202208290605.gE9IGbxE-lkp@intel.com>
References: <20220828192920.805253-3-lkml@vorpal.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220828192920.805253-3-lkml@vorpal.se>

Hi Arvid,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1c23f9e627a7b412978b4e852793c5e3c3efc555]

url:    https://github.com/intel-lab-lkp/linux/commits/Arvid-Norlander/platform-x86-Battery-charge-mode-in-toshiba_acpi/20220829-033110
base:   1c23f9e627a7b412978b4e852793c5e3c3efc555
config: x86_64-randconfig-a014-20220829 (https://download.01.org/0day-ci/archive/20220829/202208290605.gE9IGbxE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a85fa4a6b19ae082f6018a07da93db965fb5ba11
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arvid-Norlander/platform-x86-Battery-charge-mode-in-toshiba_acpi/20220829-033110
        git checkout a85fa4a6b19ae082f6018a07da93db965fb5ba11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/toshiba_acpi.c:2992:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
           int status;
               ^
   1 warning generated.


vim +/status +2992 drivers/platform/x86/toshiba_acpi.c

  2984	
  2985	
  2986	/* ACPI battery hooking */
  2987	static ssize_t charge_control_end_threshold_show(struct device *device,
  2988							 struct device_attribute *attr,
  2989							 char *buf)
  2990	{
  2991		int state;
> 2992		int status;
  2993	
  2994		if (toshiba_acpi == NULL) {
  2995			pr_err("Toshiba ACPI object invalid\n");
  2996			return -ENODEV;
  2997		}
  2998	
  2999		status = toshiba_battery_charge_mode_get(toshiba_acpi, &state);
  3000		if (state == 1)
  3001			return sprintf(buf, "80\n");
  3002		else
  3003			return sprintf(buf, "100\n");
  3004	}
  3005	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
