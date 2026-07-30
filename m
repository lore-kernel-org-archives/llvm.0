Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E03793BF;
	Thu, 30 Jul 2026 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391380; cv=none; b=Ep7XLwQnANdBxNOYUS0EtSiGpm3z9JVUYO10/VaIxmcXtSaCpx8w0t2pxJ9aSVRkEiBYjUyBfsxa0Hnc3i6Kc03CSDfBDWoSY7bvjwNR/YJ8ZPgh6qfPReSSVxz7P4w0UTQhKAx1j6XuQ0xiwPG3dseJXw7YbRXJtFFcXGaL3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391380; c=relaxed/simple;
	bh=fbqSv+NsIT83W7UmYDLq+nolIpPVPd/c7wPpdnAGeCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JnCE2unRGNeafjV4oGNMSJnGvBELP4iFcfYoMxfsEZC7SLr32TYP0EDxmdpqGsn0GM1VvDD1c/Rr2YdIr+u/YHYkky9fIjQHX8KeHl/yAasne1Tz9JpI1YbunJMowhMiru2qSSrEkDM8u7otd48cD0SoQFOLYz92lw1dq2OIhIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwtY4ujU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwtY4ujU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785391379; x=1816927379;
  h=date:from:to:cc:subject:message-id;
  bh=fbqSv+NsIT83W7UmYDLq+nolIpPVPd/c7wPpdnAGeCs=;
  b=UwtY4ujUP2JDA480DDqHQbvXIBp6kKoRZYGA8xb5OZSdoOlPHoBoram2
   J2q7psbs/loQz5tRn7J8K+R6JPKEWyxfMtsCNmGFZbNn0SHAxVMTsMoWo
   R3v6B0LTeR/pnFQywsSCdapkn6qC2bRtSxJYTgNPXqLRyAjlrK/bsoEiw
   3l2RwIoIJnxl+y4SjqKLYTU+Xh3dsZzPsyVRokx9IFq+UJqM44MInXvUp
   HZpOS1GbBTr6Tx7FNJl2HCgip/dCRQJAiz8X/60wr7fa73/VeFd0FcROO
   o612vZBNvC51w9AKy/sGSkQiuAUPVfQKk89L6yYlHJBx4fsB30DNpxNTn
   w==;
X-CSE-ConnectionGUID: WAf9klAXS3eyIp1U9bKRXQ==
X-CSE-MsgGUID: +hVRsiajQau41WtsygbTsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89683099"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="89683099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:02:58 -0700
X-CSE-ConnectionGUID: g8JfudhVQgGcL89AK9ztWQ==
X-CSE-MsgGUID: H40uOHMwQC+Tbp/80bgryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="284777561"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2026 23:02:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpJqr-00000000g7u-0fNW;
	Thu, 30 Jul 2026 06:02:46 +0000
Date: Thu, 30 Jul 2026 14:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/16] Warning:
 drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202607301308.VCbkJoSw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   31d4737ed0c3a0ee8fa904e09fd5d1b7cfe3f5d9
commit: 99edfbfe21959856f2e33c9756f2cbcc1c765cc0 [7/16] PM: domains: Add a flag to defer power-off until all consumers probe
config: um-randconfig-001-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301308.VCbkJoSw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301308.VCbkJoSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301308.VCbkJoSw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
