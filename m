Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634B260A3F;
	Thu, 13 Mar 2025 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854528; cv=none; b=mEwFJFk8OvdJwB/sCO7XOC5HoHKesgzVtmtYscLdp1VQ1vsUeMhAUkdBmfbO2+ZhY9JC03JFtCgMkxrohqWB2beaZCyo7Rgsh0KZP858k31GxF45fEyFbAi0JI7cmlNKic8Nsb9wobePHpHZeX5HBvSEW1cOaTMkJmraUzIIYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854528; c=relaxed/simple;
	bh=Bk3FbBVYQ1wn2QsrtgqJxqyiCYeL8frvbyRTVhmpG7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtmH5Odn9Frcb4uxlHNnhwPEmD3CJPEjpv3UgTtzmwKMSFY0U/mIagfReR1IeeRltLDJthMqV5CvSFb+1SEmapprKYnfKJjFqbeJwPQTLJosnZidSuMsAwd27hUrxlrTdi/AAVRT+bd6fnCGqFPTPA3rqQ4RouIr94h1EM7NHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdK4zh8J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdK4zh8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741854526; x=1773390526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bk3FbBVYQ1wn2QsrtgqJxqyiCYeL8frvbyRTVhmpG7c=;
  b=GdK4zh8JBXqZPIDXfMfXIHmUh1U5ePg7rxZIL3e7ufvJyG+yvJ/swu5o
   rGHpk/79iLRP7GfhnThTnt2fs5XDgCDdDtuxIJ1bkEfsGrq3FUgSz/s+z
   7Tbv/YMAutItTAp5Xn5oLLm4I44YkkrvOtuApN3h0sIuHVNv0VF5GBrIx
   YnZYL4/wYW+Of+EeV4Min2SkSXopFydfZlFNvK6hecoRxKR+peU9pab4/
   a8QefxTzCAg58vUsjEY2vEE3GsLEWcZg6IOENm79XvEr5r7Jn1QDufJbQ
   GXATV8E4msW2bvoEq7wlPFyMde0UjCmOE7OM59SE4TSQ/zB5vaqUNPfEy
   g==;
X-CSE-ConnectionGUID: cw81R7+iTgmhRnbmQiZZLQ==
X-CSE-MsgGUID: zm+5uA2CQCKh8lR32VSaAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30548520"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="30548520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 01:28:43 -0700
X-CSE-ConnectionGUID: Cz6Yh2F/S9WuIIF7rwcznA==
X-CSE-MsgGUID: LBi6iwGcTmKuMzg7OvbIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="120944667"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2025 01:28:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsdvj-0009Ef-2j;
	Thu, 13 Mar 2025 08:28:39 +0000
Date: Thu, 13 Mar 2025 16:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christopher S M Hall <christopher.s.hall@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tglx-devel:timers/ptp/tkntp 30/30] ERROR: modpost:
 "timekeeping_put_ptp_clock" [drivers/ptp/ptp.ko] undefined!
Message-ID: <202503131602.0aoJ0SZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/tkntp
head:   6d854257fc06d461325c3fe67f8cae7d7e4483c7
commit: 6d854257fc06d461325c3fe67f8cae7d7e4483c7 [30/30] ptp: Support PTP POSIX clock IDs
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250313/202503131602.0aoJ0SZa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131602.0aoJ0SZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131602.0aoJ0SZa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "timekeeping_put_ptp_clock" [drivers/ptp/ptp.ko] undefined!
>> ERROR: modpost: "timekeeping_get_ptp_clock" [drivers/ptp/ptp.ko] undefined!
>> ERROR: modpost: "timekeeping_assign_ptp_clock" [drivers/ptp/ptp.ko] undefined!
ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
