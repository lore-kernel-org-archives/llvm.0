Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A73A453E;
	Thu,  5 Mar 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718310; cv=none; b=nfvbsXfVh0pZIV+I/ehxqoIxeHMHZbD/sizrbXkpcv3tOS/kRQJBUdpC0vqgX4c8Pa+Sd+QKqInMFkFhyqiKrP6w5LwAFRPTYasoa/MVJkuifbc0FpKw3ho36AkJyd3bRx+B6SJIGRb67iyCfHr/WJU3SWSlQe9cJeJk7UQ4oLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718310; c=relaxed/simple;
	bh=4Gh2NcoJDAdmYkWLxN8oOm0bK5ef8GB8TLuWTWL3eXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc8wbD0XiBCMP3xesEwJBd18NyMgQS768oVhtV20b6AE+B+aY16fCHYcqOThCVM5fx1/bcHEwQJOhnncH4WRxmrtdSi1nz+YfFocUFpTs7KoD4BhBzUpE/VoVXe37ZfNdr2ENscERGDsq1p3yBj8cvPpIoGMhBe7eKCbfHanEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHbIkzqm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHbIkzqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772718306; x=1804254306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Gh2NcoJDAdmYkWLxN8oOm0bK5ef8GB8TLuWTWL3eXE=;
  b=lHbIkzqmfeW2E6ldl4YamFGUzvm5vwqQRBBkup+zE5g82NRKUukIhdWD
   MxstHsI+Yod/pSDPWoWJzLi7t75rlRNs54O6AedJTkjkKdHsh9+5SEjxX
   Bd0dBLEyrM6u6Uns906bfejRDhQSXwO+rg46f/lxPAzJp9+ZyIJmXXRQe
   AHrdttnvWPyxwTl7mHZLNB6ntTjROYv0mn1mZ7zV6BIbWRlMcVcq0iNcS
   w+w0/QCUYgGz433XdD4Tf1o8/NFf1XVJVcTzEO28Q1IKvNMM+8gJL79K+
   7ydln7ZbMpw4cCxCFupK4YpNRie/6RYyBTQ6wjLQ/Uu4Ph/9aIYnLGHh9
   A==;
X-CSE-ConnectionGUID: jElWDaH+QBuQlv3EMntQQg==
X-CSE-MsgGUID: p8PtmvhYSOuir9//Hrc4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99271037"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="99271037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:45:06 -0800
X-CSE-ConnectionGUID: WlNWW7IaR2iERV9Yw03yIA==
X-CSE-MsgGUID: Jb3UhAIkTTKgczClbrXASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216956271"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 05:45:01 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy90c-000000000g2-24iQ;
	Thu, 05 Mar 2026 13:44:58 +0000
Date: Thu, 5 Mar 2026 21:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com, jstultz@google.com,
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: Re: [PATCH v4 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
Message-ID: <202603052149.00j5uebB-lkp@intel.com>
References: <20260304081207.4030882-5-zhipeng.wang_1@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304081207.4030882-5-zhipeng.wang_1@nxp.com>

Hi Zhipeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on soc/for-next linus/master v7.0-rc2 next-20260304]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhipeng-Wang/clocksource-drivers-mmio-Export-clocksource_mmio_init/20260304-162226
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20260304081207.4030882-5-zhipeng.wang_1%40nxp.com
patch subject: [PATCH v4 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
config: arm-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052149.00j5uebB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052149.00j5uebB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052149.00j5uebB-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tpm_timer_init+0x111 (section: .text) -> register_current_timer_delay (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
