Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3D27874F;
	Sat, 30 May 2026 05:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118059; cv=none; b=i3jN8DNLANPLAVV9Xsj8ByhQv2ita47eiydWjoiSVkS86F7o1GsCbMqtEAn6CMDqk+fhN+eAhMXFBmabYP1nWZp2V9gT5Z9mLEx2wIKmWjhTc7/x+B2jyvqLJUd9kI0Zg+gMgKj+fcVng7zM10B0igNJX4i1aMVw+voe2B3VmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118059; c=relaxed/simple;
	bh=t4/cdKJNOf3A9BLLznOTjqbPPkKxd20wd/p7CeiFcDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=juAAsORDqKXOGWJP2nRf+7FvTFEuAe/KMCcZkVJoumpc9EzxKesUbW0vFbbEskVCrTffDv8lHkyH1hDv73AGSA94FW8Gk1BaecS5/R3SHWN6PpARjb8vZAo5KqPDS6eYkLLdzmgdSwipaJaviXl237dm3NSauzmQLqCYH1ADrcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=in/rrOCt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="in/rrOCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780118058; x=1811654058;
  h=date:from:to:cc:subject:message-id;
  bh=t4/cdKJNOf3A9BLLznOTjqbPPkKxd20wd/p7CeiFcDM=;
  b=in/rrOCtJpBSIeqwhKv9ItLjrnG0PZoYuBLy2zX/xiYJ6oqWI+PYcWi9
   Um9ywbVP3nK75+dRXMYOccpsoJeKXOSYg/w83arbWiqfaiDCybg3haO50
   UPhi0eIQhIf2JgDDPspRaAmZYO4LzSzI5y9PGsuzIHuFEFm/ZJ/8Lbm9s
   Eev2oc6ecFdsUJamyVJiDACu/rsPKBoDwgVb41Op/823PsnAuIvxQBWXg
   Ud6kT1gEHKrkRQkqESNi+UNqziwZaAAfiEu++efsAYT6/Vx0O2P4QmWSb
   CFkt8p39lo4j0d5epr9YYPYsqHUH4YmYLtddeYM7WpX2hNyHmc6D7ebGY
   w==;
X-CSE-ConnectionGUID: l8cOOxV+RYy718ZTm+DTyA==
X-CSE-MsgGUID: IFMBlxP4SOGLDRC3FPTMJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91649013"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91649013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 22:14:17 -0700
X-CSE-ConnectionGUID: YbdUi40XQu24pbClOSNZMw==
X-CSE-MsgGUID: s05aILloQEiGq8rV/twDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="238853065"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2026 22:14:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTC1V-0000000088A-1Ek8;
	Sat, 30 May 2026 05:14:13 +0000
Date: Sat, 30 May 2026 13:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 11/11] kernel/time/ntp.c:366:5: warning: no
 previous prototype for function 'ntp_get_time_offset_ns'
Message-ID: <202605301352.GnSjNxcU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   70c32e7a9e128f2579034276c19d34bcf79f4b0c
commit: 70c32e7a9e128f2579034276c19d34bcf79f4b0c [11/11] kernel/time: Add /dev/vmclock_host miscdev
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260530/202605301352.GnSjNxcU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301352.GnSjNxcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301352.GnSjNxcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/ntp.c:366:5: warning: no previous prototype for function 'ntp_get_time_offset_ns' [-Wmissing-prototypes]
     366 | s64 ntp_get_time_offset_ns(unsigned int tkid)
         |     ^
   kernel/time/ntp.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     366 | s64 ntp_get_time_offset_ns(unsigned int tkid)
         | ^
         | static 
   1 warning generated.


vim +/ntp_get_time_offset_ns +366 kernel/time/ntp.c

   365	
 > 366	s64 ntp_get_time_offset_ns(unsigned int tkid)
   367	{
   368		return shift_right(tk_ntp_data[tkid].time_offset * NTP_INTERVAL_FREQ,
   369				   NTP_SCALE_SHIFT);
   370	}
   371	EXPORT_SYMBOL_GPL(ntp_get_time_offset_ns);
   372	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
