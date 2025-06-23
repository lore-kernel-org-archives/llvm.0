Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34F205AB8;
	Mon, 23 Jun 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670912; cv=none; b=SfVA3vFjS2ptfHNGdV4QxL8qqHVPN5lqg3wFO2yu5dYXqp25UVixiSvd7ldEMOpQt5AZbs/cDHfarZHTNHYkqT1eZNNv4yYm3FjQ0+3CHPZnR/jMMOdweIEBltNfAWXIDOVj6EXu9Om3v4jw04ko89VtzswUK1Vg9W3IYWoitR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670912; c=relaxed/simple;
	bh=K6sxdbPsaBzoFez5ISOCdOemAgkkBYrEapOkzYmhgxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPgsMge3/W1bTS1PphHCfW9b8AppxT/0eiRije3HeA+C12Fk6MWQ2Xk2P8/60CkZQJIsJcC86OaW6+6n/+h7C5x5Hc0Lv9kWpWSeXHK3vU7F0ym+9NJyTE/pmLEy383KqxjoB3t5PtKvbZCUEwPbPeetm66l3RsEaAVg1LLyRxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+dQDshx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+dQDshx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750670910; x=1782206910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K6sxdbPsaBzoFez5ISOCdOemAgkkBYrEapOkzYmhgxI=;
  b=C+dQDshxLJKvcTGkQd8QN6mSAPYLRZMNR0VdQdH3e2VRF5Ha8MrCqX5K
   QMVe5SjAqcSNgzAdJH/we/mUjs9uYE1nixDRgI3ZLVfFrjPNE4HrJZGh4
   z4PSFVgcJOy/DE6ULbMnCdzddo0WAlTzdhpOwhzroM4QblUBHZ14815VB
   wxvPjfNIyugbpeSGfnLVDUDKAb41UNAavWJkUnm2EWeguVjBYas7wS/L3
   gnGbBzbwKHeaZIdrSvIbGF/gxCuE2skQoO7z+M/Z4BSnWg6EMBwHMzS8G
   HEaZ568jBuCBB8o3G25hm/7KYYTl/u/kwdehEJ9Y0YqwCUj5brovmzwhB
   Q==;
X-CSE-ConnectionGUID: d/Eb6IaJTlqwXUHeYwddOw==
X-CSE-MsgGUID: He/voPO/QdCwzfGMJMV3kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52800669"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52800669"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:28:29 -0700
X-CSE-ConnectionGUID: UEJTWx8LQ32N8WnP5WWtdg==
X-CSE-MsgGUID: hHpqbDnuR5WMUIvaVf9lCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155556678"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2025 02:28:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdTW-000Nu2-06;
	Mon, 23 Jun 2025 09:28:26 +0000
Date: Mon, 23 Jun 2025 17:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry
 chardev/ioctls API
Message-ID: <202506231727.3ZUlxZQr-lkp@intel.com>
References: <20250620192813.2463367-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-6-cristian.marussi@arm.com>

Hi Cristian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on trace/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20250621-033227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250620192813.2463367-6-cristian.marussi%40arm.com
patch subject: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry chardev/ioctls API
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250623/202506231727.3ZUlxZQr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231727.3ZUlxZQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231727.3ZUlxZQr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:921:44: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     921 | static __poll_t scmi_tlm_poll(struct file *, struct poll_table_struct *)
         |                                            ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:921:72: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     921 | static __poll_t scmi_tlm_poll(struct file *, struct poll_table_struct *)
         |                                                                        ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1180:48: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1180 | static long scmi_tlm_compat_ioctl(struct file *, unsigned int, unsigned long)
         |                                                ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1180:62: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1180 | static long scmi_tlm_compat_ioctl(struct file *, unsigned int, unsigned long)
         |                                                              ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1180:77: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1180 | static long scmi_tlm_compat_ioctl(struct file *, unsigned int, unsigned long)
         |                                                                             ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1185:39: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1185 | static int scmi_tlm_mmap(struct file *, struct vm_area_struct *)
         |                                       ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1185:64: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1185 | static int scmi_tlm_mmap(struct file *, struct vm_area_struct *)
         |                                                                ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:361:16: warning: stack frame size (1064) exceeds limit (1024) in 'available_update_intervals_ms_show' [-Wframe-larger-than]
     361 | static ssize_t available_update_intervals_ms_show(struct device *dev,
         |                ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:681:16: warning: stack frame size (1064) exceeds limit (1024) in 'grp_available_intervals_show' [-Wframe-larger-than]
     681 | static ssize_t grp_available_intervals_show(struct device *dev,
         |                ^
   9 warnings generated.


vim +921 drivers/firmware/arm_scmi/scmi_system_telemetry.c

   920	
 > 921	static __poll_t scmi_tlm_poll(struct file *, struct poll_table_struct *)
   922	{
   923		return 0;
   924	}
   925	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
