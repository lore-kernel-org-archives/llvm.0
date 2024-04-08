Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA24C63;
	Mon,  8 Apr 2024 04:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712548995; cv=none; b=AehWFJlC0/ZqGhKIRvtRYHFTCo/HC0rQ9k1gXCD4yeDxaMbROS8KXOC89Z+Npp7Hyj5ISpSNwAXg1+cpmH5aznYZdLn/9EdFnScB2BuUFS5mDNuoA+WBXmjRq74m+YVt52tMKoOxeu3O/OIeRdsSdMC28vPGiBuJSFy1QIa679k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712548995; c=relaxed/simple;
	bh=iIgMp7aa1q7DLeUGerNXik0hvfPuWiHn0f5Si1LjDBI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip9KffiDv/0Q56II1g+HUiR8jgF6KQTIsVfEGvo1W75pU1FoIj5jfFfDczj56x3cowhse70pDZCb2ShrQe+7lEdXQ5Glr1TW/VSbNKlh+sA+1jooW0ar099ttf45g7x7FMg64/QrfXHqYhZ4dslU3Npw3YYzhLqDm54oSuMNnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0DjanNi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0DjanNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712548993; x=1744084993;
  h=date:from:cc:subject:message-id:mime-version;
  bh=iIgMp7aa1q7DLeUGerNXik0hvfPuWiHn0f5Si1LjDBI=;
  b=m0DjanNiWIHKW45i0SvX8TzehwMTjyezMi2RTD1tPaSf1BLg9fkwlchq
   aQzie2dIVKkPkpLP8Yh9G2+jqQHg8SML2mrzf39UEsUQbo56o5sOT5lkF
   nYbW3XGx0P8IIocDql1e8NHVfuPUk+Vr2D/fUXAxnP7C3WVu+E3KgfIr3
   3wQxfDA7vUfOj/P+gsW2pwJ43VQPT0JGBBmfnxjznkFAZkXwQEZ0Ph0Q0
   uCXwQ8GsoYgEWugxtEXSxT8ooMmWP9u8jODmJAQ9Cpxg7x2G6eHVCZgxF
   hsfSU/uVD0u5DeNbE6qa8wlCpWPQ9niwI4zFAT3Uv55ytl9PgqftcgOfn
   w==;
X-CSE-ConnectionGUID: bN21iBR4RgOJwmNs8OHHeA==
X-CSE-MsgGUID: kQUDWYkeTkS8Ui1eXwQI5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11599500"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="11599500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 21:03:12 -0700
X-CSE-ConnectionGUID: 6w13jbQUSnSQgklFKvOVdw==
X-CSE-MsgGUID: /VaPkdKTSsKEyADZQE9aWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="57215027"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2024 21:03:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtgDt-0004vi-2c;
	Mon, 08 Apr 2024 04:03:09 +0000
Date: Mon, 8 Apr 2024 12:02:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: jme_check_link() falls through to next
 function jme_powersave_phy()
Message-ID: <202404081117.4wTTfL3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fec50db7033ea478773b159e0e2efb135270e3b7
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   11 months ago
config: x86_64-randconfig-004-20240408 (https://download.01.org/0day-ci/archive/20240408/202404081117.4wTTfL3Z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404081117.4wTTfL3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404081117.4wTTfL3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: jme_check_link() falls through to next function jme_powersave_phy()
   vmlinux.o: warning: objtool: vhci_coredump_hdr() falls through to next function __cfi_vhci_open_timeout()
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xe2: relocation to !ENDBR: native_write_cr4+0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
