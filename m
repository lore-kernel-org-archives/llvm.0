Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2531BF818;
	Thu, 10 Oct 2024 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557410; cv=none; b=Xzulm6ddZugfV9p83AmE8t+0ZrQTUpeOa689Wj8cCEVMe0VWLcjeR190kwKz0sFHLSaNgg1IEsPklRaX74Fgvf7hzBt/fM9tOEWW+AAUNnp7tstfH8zXcaOlRm/9KNHUTf0iuTmtz6vDiy2O2Rb0IAe57BR6dB1wyVhxcdh7lOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557410; c=relaxed/simple;
	bh=oxIZOncvF3hv1M+oWjSmbkhm52CkRE8eY08NHEIADlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jz9gSHRLfTGDyu2VsRGgrbTWc9h8wd5tcAALLDyUi8eq840jrINBB/jG8U4+Z7e+ccptODgmhWHLcZwKHtSrnNnGUkruAuG8hMNcygDu5b+GkonNvhQmVWk/YwBMsRcxj10gGO0bZRMrpzVEvI7Iq/dYLINmS8+EwU+Jn68O05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ2gHUSb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ2gHUSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728557409; x=1760093409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxIZOncvF3hv1M+oWjSmbkhm52CkRE8eY08NHEIADlQ=;
  b=OZ2gHUSbzTqCJpitrLPyTLQSuAEAcjFZQbJ1VwLVkCntXAPEzMQy8PH5
   Nu28suyXW59OJqC0TZfVZcOqsFQrzEAm/qWi7afmgBYjqoTMbV6kx0GHS
   seeSio+7AfVHZTf300mz5NjK/6RO5ozVtXTXsuk146Rrl03N0p3eVH5Mi
   vmhuy4+7Dfd7V+aivusgvOSy0SnINDudhakjlIrmnKLgMleZNfluY6b7T
   B2NgfEZfku4J67BRya8hLr27WNCy9XkYyTlsNYhV+xLV0Gk9gR1Vd5r08
   ZPlfBl24ntl9YW5sDq5487jhFpr6QRKA4x5U2hShTuTSDO3puKHRtyTBy
   A==;
X-CSE-ConnectionGUID: k4JAKEWBQ0ydkhrdzsn5Rw==
X-CSE-MsgGUID: SbTZ//igRziaB40O2i+7yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39034010"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="39034010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 03:50:08 -0700
X-CSE-ConnectionGUID: mfNyIQT0SRKlmCF2bBAchg==
X-CSE-MsgGUID: CxYADuicT0iubPklmbeSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76871627"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2024 03:50:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syqk8-000Aef-0a;
	Thu, 10 Oct 2024 10:50:04 +0000
Date: Thu, 10 Oct 2024 18:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-5.15.y 46/204] drivers/pwm/pwm-gpio.c:60:22:
 warning: no previous prototype for function 'gpio_pwm_timer'
Message-ID: <202410101837.pe8cMg2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   2402b85f3675cd92c0ba7cb5f051596e07bd3971
commit: 6b8539046586e0d420e7f310df2da69b4a13d19f [46/204] ODROID-COMMON: pwm: gpio: Add a generic gpio based PWM driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241010/202410101837.pe8cMg2V-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101837.pe8cMg2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101837.pe8cMg2V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for function 'gpio_pwm_timer' [-Wmissing-prototypes]
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         |                      ^
   drivers/pwm/pwm-gpio.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         | ^
         | static 
   1 warning generated.


vim +/gpio_pwm_timer +60 drivers/pwm/pwm-gpio.c

    59	
  > 60	enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
    61	{
    62		struct gpio_pwm_data *gpio_data = container_of(timer,
    63							      struct gpio_pwm_data,
    64							      timer);
    65		if (!gpio_data->run) {
    66			gpio_pwm_off(gpio_data);
    67			gpio_data->pin_on = false;
    68			return HRTIMER_NORESTART;
    69		}
    70	
    71		if (!gpio_data->pin_on) {
    72			hrtimer_forward_now(&gpio_data->timer,
    73					    ns_to_ktime(gpio_data->on_time));
    74			gpio_pwm_on(gpio_data);
    75			gpio_data->pin_on = true;
    76		} else {
    77			hrtimer_forward_now(&gpio_data->timer,
    78					    ns_to_ktime(gpio_data->off_time));
    79			gpio_pwm_off(gpio_data);
    80			gpio_data->pin_on = false;
    81		}
    82	
    83		return HRTIMER_RESTART;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
