Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC6823AA;
	Sat, 20 Jan 2024 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705791361; cv=none; b=u1WcD0rrU6/VbYwI86P4DiwNMMObVL9sEuWZ9OI5SUoMZF5Hh3fYxDYpkiW40n995FV1hFnu0EvyDcxsewfBSNmlZ91EW0W01NCVKchNxFCO4feli/boKIWsOPHqGBJstU0HiYfjBJj++VYy752i10m/j5sFvkf3VeQ6srd64iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705791361; c=relaxed/simple;
	bh=8uE/WQL/QoHuBFDbD4rTA/vZXsTcU7RketlVUulifrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNKDgRtlC5v0X12iMxX+u0ymNNlVGW4vSu3U4XD38XMcNlHSk0dBebZWtIWKqm/2YXWMhKqCxqefFmqcz72GTw8YXSEHcbN8vfbwEpVCYd+8oNxtYog8AtN018wMfFAtlFP9C5Jp+B8hpYzuI1zpFLq+sWYpy+DMhbcSVIr7ewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LluG64hB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LluG64hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705791359; x=1737327359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uE/WQL/QoHuBFDbD4rTA/vZXsTcU7RketlVUulifrQ=;
  b=LluG64hBDrcm176nQM8QKGJ5IMNId+rS7m2dCttUHwC6fyyjyKK9M9TM
   Sud5SRvhXbXSuLTIomVUARWasHyNyOriSRBPh39YTQLNe0KvKzk87xBWw
   SbHtpf3/OIOTtnAUrDM/W6Uo4rEaWEfJDsdZb2T1Nwy6vaMR7lHhnCZia
   DZXv9owKiNOduB+68SOs7BhK1pQH9lKMO8kVfazKKGyV3mhIQyYVL7UuX
   W30BLnvMO29tlDsFl9uRgloQ8SW4qyQSTjgYgElM8pAoU96NV/Wql/VIB
   D65zg8G2LIO7kZTuTuiNBeL41V3BeCWKthScVkHJuPw76e0ZuqBsu4Zy9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="8353967"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="8353967"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 14:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="788648469"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="788648469"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2024 14:55:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRKFl-0005VC-2o;
	Sat, 20 Jan 2024 22:55:53 +0000
Date: Sun, 21 Jan 2024 06:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-6.1.y 20/91] drivers/pwm/pwm-gpio.c:60:22: warning:
 no previous prototype for function 'gpio_pwm_timer'
Message-ID: <202401210628.5lKKsZ7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   4abe38fb1d55e2c5f10582404c5ff88505060b73
commit: 459931baf254b27d2ec9a732b41bf2bff9e1c1d2 [20/91] ODROID-COMMON: pwm: gpio: Add a generic gpio based PWM driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240121/202401210628.5lKKsZ7A-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210628.5lKKsZ7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210628.5lKKsZ7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for function 'gpio_pwm_timer' [-Wmissing-prototypes]
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         |                      ^
   drivers/pwm/pwm-gpio.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         | ^
         | static 
   drivers/pwm/pwm-gpio.c:138:3: error: field designator 'config' does not refer to any field in type 'const struct pwm_ops'
     138 |         .config = gpio_pwm_config,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:139:3: error: field designator 'set_polarity' does not refer to any field in type 'const struct pwm_ops'
     139 |         .set_polarity = gpio_pwm_set_polarity,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:140:3: error: field designator 'enable' does not refer to any field in type 'const struct pwm_ops'
     140 |         .enable = gpio_pwm_enable,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:141:3: error: field designator 'disable' does not refer to any field in type 'const struct pwm_ops'
     141 |         .disable = gpio_pwm_disable,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.


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
