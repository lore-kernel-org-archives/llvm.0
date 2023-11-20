Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2D19BB6;
	Mon, 20 Nov 2023 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWTZUWSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700493086; x=1732029086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DmNtpirpP7FYaYPM29SydoZP1gej1xVLaVAOvU6FEFg=;
  b=jWTZUWSgiQeoQ1VqounISzHRUcQrfQTcB/aVg+arQVRelQAgnLoGR5Yd
   YigBeIFh8MelKIjQG8O2FtfSiMgHT9ZeJyZPoyowtFaFmSPXj6XwiwRbN
   Juvqlrgwhs8PGX6pimlHvuHnP19rYL2c8uSqFdaypx68pAqRG4kuFexCw
   0SPgyszQvpABQ5HIeUCmDx4+LImbi1TaFFM3q29r0Sdb1ApYEjVTI1HnS
   mPW0TvYqL2Woy00e6WCEk2psq+8/uyf8/I1hYRYek4anZoyJEB1GmRdSa
   o2HM4c653shgdhkI6ZJe2jC2OTyv5d7Hf1tig1pPoJO1Ig4F3xv2DO7hk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376670635"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="376670635"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 07:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="889940568"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="889940568"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2023 07:04:09 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r55oF-0006YG-1R;
	Mon, 20 Nov 2023 15:03:38 +0000
Date: Mon, 20 Nov 2023 22:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Feng <chris.feng@mediatek.com>, rafael@kernel.org, pavel@ucw.cz,
	len.brown@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org, hua.yang@mediatek.com, ting.wang@mediatek.com,
	liang.lu@mediatek.com, chetan.kumar@mediatek.com,
	Chris Feng <chris.feng@mediatek.com>
Subject: Re: [PATCH v2] PM: hibernate: Fix the bug where wake events cannot
 wake system during hibernation
Message-ID: <202311202258.eqaMpEXc-lkp@intel.com>
References: <20231120081516.55172-1-chris.feng@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120081516.55172-1-chris.feng@mediatek.com>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Feng/PM-hibernate-Fix-the-bug-where-wake-events-cannot-wake-system-during-hibernation/20231120-161752
base:   linus/master
patch link:    https://lore.kernel.org/r/20231120081516.55172-1-chris.feng%40mediatek.com
patch subject: [PATCH v2] PM: hibernate: Fix the bug where wake events cannot wake system during hibernation
config: arm-randconfig-003-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202258.eqaMpEXc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202258.eqaMpEXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202258.eqaMpEXc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/power/hibernate.c:672:4: error: call to undeclared function 'swsusp_unmark'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           swsusp_unmark();
                           ^
   1 error generated.


vim +/swsusp_unmark +672 kernel/power/hibernate.c

   664	
   665		switch (hibernation_mode) {
   666		case HIBERNATION_REBOOT:
   667			kernel_restart(NULL);
   668			break;
   669		case HIBERNATION_PLATFORM:
   670			error = hibernation_platform_enter();
   671			if (error == -EAGAIN || error == -EBUSY) {
 > 672				swsusp_unmark();
   673				events_check_enabled = false;
   674				pr_err("Hibernation Abort.\n");
   675				return;
   676			}
   677			fallthrough;
   678		case HIBERNATION_SHUTDOWN:
   679			if (kernel_can_power_off())
   680				kernel_power_off();
   681			break;
   682		}
   683		kernel_halt();
   684		/*
   685		 * Valid image is on the disk, if we continue we risk serious data
   686		 * corruption after resume.
   687		 */
   688		pr_crit("Power down manually\n");
   689		while (1)
   690			cpu_relax();
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
