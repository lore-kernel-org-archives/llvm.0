Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78531ED70;
	Mon, 12 Jan 2026 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241687; cv=none; b=UDzEwnB7WPZmSbTskxTIseSmN2oCRIBjX9J2I6Yym5zPD71S4iuFGPhfaDjJ/0WH8n6QVOtA1Ga9qkXSfDI0RrN+UaTt+dDXPO33F9VKNNm0Vdjc5TLPhvE4kMmKmRa5LO9YElDg2Q2+FldbmHBFFqv8uo/O0XEdKriT9n7PSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241687; c=relaxed/simple;
	bh=yULqg6xbplSNoGrbWc7nRJwiu2hMeDoaNumPp/ywvE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwZaoxsvH1exyLRy5JSCtqxQca+8/92sbPQxV+oS7kFO/iXwEBgtAVRkCMkHFMYzOqVVx6uYCnntQeLkIObW/eNmL8S5iK1LRBrCv9YwT48g0shnHiowAP5l1X773rZyD/jnsylylisMib9YizwIJ2FFYxaalmeBBxT2QJ0K/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTTFdzVb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTTFdzVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768241686; x=1799777686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yULqg6xbplSNoGrbWc7nRJwiu2hMeDoaNumPp/ywvE8=;
  b=eTTFdzVbR6yVAN8w1KfDimOMkxOORIHzz89nBe+IBBYTNqPpB2hZbAT6
   ZYKnmtVP0XnplFCTyYVWzEapx+Rg+zQQBEhdWdsSSmNbOT70FACK+UvsM
   3zSj2wZO40g2ifkt4T+jNp4iRZip6bpfWItjdkdESTCIw185m6gD8dsEM
   0kkN5UiYefPQ/V9WFk414YLasmK4iZfl1vGYb5cTcIuA/KObeX4z4TPJ5
   E/yehkZsBTnYaIrdIszHR4tWUd+6KAr8KEzLuGzIEjPBVLAu8cFCH+Xwn
   2uVFYvX9TAeLdeEI7J2KQFDlCHgHnOxcDJGMu3u/Uhw4YqwuViqzarwS4
   A==;
X-CSE-ConnectionGUID: 6v++bDq1QyKoKQ88NRJALw==
X-CSE-MsgGUID: VdwMtmp/Rx2eiCD4VOpiFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68526605"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68526605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:14:46 -0800
X-CSE-ConnectionGUID: cqtdRvSXTiy3tH5HkosK3g==
X-CSE-MsgGUID: 1TiJoZbOT3+d/2xbHc+zhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="227400023"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 10:14:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfMR8-00000000Diy-09T1;
	Mon, 12 Jan 2026 18:14:42 +0000
Date: Tue, 13 Jan 2026 02:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 12/12] HID: surface: Use pm_ptr_sleep instead of #ifdef
 CONFIG_PM_SLEEP
Message-ID: <202601130224.PFFZLOhf-lkp@intel.com>
References: <20260112105500.3664834-13-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112105500.3664834-13-hadess@hadess.net>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-hid-alps-Use-pm_ptr-instead-of-ifdef-CONFIG_PM/20260112-190559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260112105500.3664834-13-hadess%40hadess.net
patch subject: [PATCH 12/12] HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130224.PFFZLOhf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130224.PFFZLOhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130224.PFFZLOhf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/surface-hid/surface_hid.c:244:9: error: call to undeclared function 'pm_ptr_sleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |                 .pm = pm_ptr_sleep(&surface_hid_pm_ops),
         |                       ^
>> drivers/hid/surface-hid/surface_hid.c:244:9: error: incompatible integer to pointer conversion initializing 'const struct dev_pm_ops *' with an expression of type 'int' [-Wint-conversion]
     244 |                 .pm = pm_ptr_sleep(&surface_hid_pm_ops),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/surface-hid/surface_hid.c:244:9: error: initializer element is not a compile-time constant
     244 |                 .pm = pm_ptr_sleep(&surface_hid_pm_ops),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/pm_ptr_sleep +244 drivers/hid/surface-hid/surface_hid.c

   237	
   238	static struct ssam_device_driver surface_hid_driver = {
   239		.probe = surface_hid_probe,
   240		.remove = surface_hid_remove,
   241		.match_table = surface_hid_match,
   242		.driver = {
   243			.name = "surface_hid",
 > 244			.pm = pm_ptr_sleep(&surface_hid_pm_ops),
   245			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
   246		},
   247	};
   248	module_ssam_device_driver(surface_hid_driver);
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
