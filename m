Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EA8185B6F;
	Mon,  2 Sep 2024 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264051; cv=none; b=ZsEESUSK6oFoOGdBx3wpxwTBme06HqzG4lly4NlXl2piI1JEFUTn/4sABiRyj5cfwPpjS3vwpAIpmacLonQhjkE1lD0VxERUSAoqhiGmhfVUssyDyzsyGiJNAWo10kLXR2IaW0RevpuJuZ8URhD45Vd/07W8d3m3lIvzO2LehMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264051; c=relaxed/simple;
	bh=+0cwXOARQAfSWdlMnKzlCZpzGylM95v54OuXqaMD1lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9Y9/ztAVBJoeOhhakI+VvFpRa+sG/53sbJXXKAucKrsDOhd8ry9YReuarLswPS+VXdYEe/cYH5r35YKB6rFInpWcpd6yFxC9Uu9Ax38nBd1tFmVi1u0tn0M3+2LewOfFJWrN8QjPSa3B6zzTlSPaPcHfWk5o6KYv2gk9lIfYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekIbSsYK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekIbSsYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725264049; x=1756800049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+0cwXOARQAfSWdlMnKzlCZpzGylM95v54OuXqaMD1lI=;
  b=ekIbSsYKOcExcs7NzR+j8jWGprezfC1ejR0VpzqBeLx2V9/dn+kFuztB
   F3YlP6xUFUjhqliJ7XRSkDK2pGy2nDA4LuvojpVqni4Tdq6TMoP8vJyEV
   dmJQoTCTCuEL+BV2kBiklMPsv6oygYm/JcLl7n8BVBT3d6F4SpIxRrvsN
   U5bhM2/0LQp7t4uCZrGGuVuV+N3R9YGh6iTmepY9c+iqXwwxL33/zykRi
   tR6/URJaSJ2m1LmSTe8hC38dfLCFOzqLKP5GJ8EB71Igi0FAXqAiI15yl
   pg4oaI0UppMBuXF190Y1fgWSXM2lTBt3xjW4gRM6x8PD1zp9CO+3NF3sx
   g==;
X-CSE-ConnectionGUID: 8DHhiVijSU2DN1bbhzo3RA==
X-CSE-MsgGUID: +PcoD0qVRgOLHEXs6kmRTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23993240"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23993240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 01:00:49 -0700
X-CSE-ConnectionGUID: 91sBEGDmTzyr1OBCXfYQeA==
X-CSE-MsgGUID: p8ks9yvKT1KwsJxonHcQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69344743"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2024 01:00:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl1zR-0005H8-1n;
	Mon, 02 Sep 2024 08:00:45 +0000
Date: Mon, 2 Sep 2024 16:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yuesong Li <liyuesong@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] reset: Provide new devm_reset helpers for get and
 deassert reset control
Message-ID: <202409021514.2tmkFIei-lkp@intel.com>
References: <20240830033351.233263-1-liyuesong@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830033351.233263-1-liyuesong@vivo.com>

Hi Yuesong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pza/reset/next]
[also build test ERROR on pza/imx-drm/next linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuesong-Li/reset-Provide-new-devm_reset-helpers-for-get-and-deassert-reset-control/20240830-113607
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20240830033351.233263-1-liyuesong%40vivo.com
patch subject: [PATCH RFC] reset: Provide new devm_reset helpers for get and deassert reset control
config: i386-buildonly-randconfig-003-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021514.2tmkFIei-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021514.2tmkFIei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021514.2tmkFIei-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/ipu-v3/ipu-common.c:9:
>> include/linux/reset.h:831:8: error: call to undeclared function 'devm_add_action_or_reset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     831 |         ret = devm_add_action_or_reset(dev, (void *)reset_control_assert, (void *)reset);
         |               ^
   In file included from drivers/gpu/ipu-v3/ipu-common.c:26:
   In file included from include/video/imx-ipu-v3.h:18:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/ipu-v3/ipu-common.c:26:
   In file included from include/video/imx-ipu-v3.h:18:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/ipu-v3/ipu-common.c:26:
   In file included from include/video/imx-ipu-v3.h:18:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/ipu-v3/ipu-common.c:26:
   In file included from include/video/imx-ipu-v3.h:18:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/ipu-v3/ipu-common.c:26:
   In file included from include/video/imx-ipu-v3.h:18:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here


vim +/devm_add_action_or_reset +831 include/linux/reset.h

   808	
   809	/**
   810	 * devm_reset_control_get_deassert - resource managed
   811	 * @dev: device to be reset by the controller
   812	 * @index: index of the reset controller
   813	 *
   814	 * A helper function to automatically handle return value of
   815	 * devm_reset_control_get_exclusive() and reset_control_deassert().
   816	 */
   817	static struct reset_control *devm_reset_control_get_deassert(
   818				  struct device *dev, const char *id)
   819	{
   820		int ret;
   821		struct reset_control *reset;
   822	
   823		reset = devm_reset_control_get_exclusive(dev, id);
   824		if (IS_ERR(reset))
   825			return reset;
   826	
   827		ret = reset_control_deassert(reset);
   828		if (ret)
   829			return ERR_PTR(ret);
   830	
 > 831		ret = devm_add_action_or_reset(dev, (void *)reset_control_assert, (void *)reset);
   832		if (ret)
   833			return ERR_PTR(ret);
   834	
   835		return reset;
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
