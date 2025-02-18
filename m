Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75E4315A;
	Tue, 18 Feb 2025 02:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739845357; cv=none; b=ctiSQXLluQtNVikU7M2s1X0KKZHBoi2ZULpjZMvUkVrvb2iNgA6MfQvAWmHn2jXsQCj3NbCIE4S4mLh90ykdp96sRl5x58lPfSWsAThw8jJX0i5aLn0rpOADXFPOq7zKZjqBFczKS8CliYl7V4nwmRt0vtcwnHFhNTD7/S5tmEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739845357; c=relaxed/simple;
	bh=U+bzBB98DYhp+ItmTdYP09QyfqhELe4qeuRZxGelQY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYihoXsbBUfNMlN2z0q9DrhVWQbzcXDlarThTpfERiYXuhSt3SNbebwNBsjxcRwvLmCEmV5DSZJLJq1dbOkuGJMakUyTgtI7+6gALUWZvp5v0WuIGQkKBNDnNmJz1KKA4979ghmDzdTA1Fhgc0J/T+AA1da2O9oUcvhWOj3bF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djmeW+mC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djmeW+mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739845355; x=1771381355;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=U+bzBB98DYhp+ItmTdYP09QyfqhELe4qeuRZxGelQY4=;
  b=djmeW+mCPr8+wS48ty0+PJehSGEc1VBr2gFoYCkYOUcIpebWaH4SssmL
   MVsUo0au5Qo1/ckh6QtX6eDYKDnrXENnmQAZWsQ43vzOlDrSg/jOo8yfJ
   lgI85EPjSl8EaPVIOn4ZbHKn9rkhgVd8ZraD6nX63wQ8A/ozNf+PxH71Y
   Fg02cwC7BteZX9mxPMdDAU+bRpUBfdobteaGHY1yvV7FivipwwKkH7LIa
   RbUP2v49h1U+txuQT7/sjMIPj3QU1Ng2/VtH4lFC/ooVLsv/0OM3CbIAD
   +cIhyRmV8tu5WTkD+wS8DPrnO7AwfTWfvOEfTHQ6FD1LvUGp+F67BVYmN
   g==;
X-CSE-ConnectionGUID: WMqXuuHdSkCbxWgMP1cRjQ==
X-CSE-MsgGUID: h7CMSpP+Q9+5oVOvyZ6Tpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40651621"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40651621"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 18:22:34 -0800
X-CSE-ConnectionGUID: hnCPlp25S2irdyRDu3ludw==
X-CSE-MsgGUID: vgJTsaUaT2KiOqrYntjPSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114728657"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Feb 2025 18:22:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkDFT-00003r-3B;
	Tue, 18 Feb 2025 02:22:25 +0000
Date: Tue, 18 Feb 2025 10:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-final 29/29]
 drivers/s390/cio/chp.c:221:1: error: field designator 'bin_attrs_new' does
 not refer to any field in type 'const struct attribute_group'; did you mean
 'bin_attrs'?
Message-ID: <202502181058.pWAeJOFp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-final
head:   cdb55c2d6c381787e77159486c9d41a86906b2df
commit: cdb55c2d6c381787e77159486c9d41a86906b2df [29/29] sysfs: remove attribute_group::bin_attrs_new
config: s390-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181058.pWAeJOFp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181058.pWAeJOFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181058.pWAeJOFp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/chp.c:221:1: error: field designator 'bin_attrs_new' does not refer to any field in type 'const struct attribute_group'; did you mean 'bin_attrs'?
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         | ^
   include/linux/sysfs.h:293:3: note: expanded from macro 'BIN_ATTRIBUTE_GROUPS'
     293 |         .bin_attrs_new = _name##_attrs,                         \
         |          ^
   include/linux/sysfs.h:109:37: note: 'bin_attrs' declared here
     109 |         const struct bin_attribute      *const *bin_attrs;
         |                                                 ^
   1 error generated.


vim +221 drivers/s390/cio/chp.c

2dc8903af775ec Peter Oberparleiter 2024-03-26  213  
92d6254f581200 Thomas Weiﬂschuh    2024-12-05  214  static const struct bin_attribute *measurement_attrs[] = {
b4691baaeef07b Peter Oberparleiter 2024-03-26  215  	&bin_attr_measurement_chars,
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  216  	&bin_attr_measurement_chars_full,
b4691baaeef07b Peter Oberparleiter 2024-03-26  217  	&bin_attr_measurement,
2dc8903af775ec Peter Oberparleiter 2024-03-26  218  	&bin_attr_ext_measurement,
b4691baaeef07b Peter Oberparleiter 2024-03-26  219  	NULL,
e6b6e10ac1de11 Peter Oberparleiter 2007-04-27  220  };
b4691baaeef07b Peter Oberparleiter 2024-03-26 @221  BIN_ATTRIBUTE_GROUPS(measurement);
e6b6e10ac1de11 Peter Oberparleiter 2007-04-27  222  

:::::: The code at line 221 was first introduced by commit
:::::: b4691baaeef07bdc4c3524a0702d7dd6899610b4 s390/cio: simplify measurement attribute registration

:::::: TO: Peter Oberparleiter <oberpar@linux.ibm.com>
:::::: CC: Alexander Gordeev <agordeev@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
