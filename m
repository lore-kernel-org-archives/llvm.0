Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E50146585;
	Fri, 11 Jul 2025 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752233666; cv=none; b=SAXK14fcMQfvPGXXHBXBBXxuJY1HRxDF30ox25vPf43yzKvOMu9U02A7rWy6jcpZuo053CNgxlHW4f0YybzAMi+i/xAzSRtNPSAVI3Bh7dAav7N/WU6OBhJfRYnUoYIhE+/iRm2h6AIHohLqI8DyUQFwT0t4IQoAOIfOwEs8B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752233666; c=relaxed/simple;
	bh=aXTVGUhW1HcLpeK28p67mQY3DlIvZ++HGx1KWG7c1mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDCabkEGbrbqVVAOxzbt8dA36WzTLalSFG0Q1Hm7hyWFqTiKPWX2AALVPZa6c47lnmM8QIhesoBrT1M1LdB/Z7VZFwOOTugL903NNGavOVFFJFL3S/bixJHY0EtUxsiqMD842tyHJgq4dXFtSL+ATJuCYi0SUP6sEJ7ae6+/O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nW12yzoA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nW12yzoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752233665; x=1783769665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aXTVGUhW1HcLpeK28p67mQY3DlIvZ++HGx1KWG7c1mc=;
  b=nW12yzoAUlH/ORe+BOaYbXGKeT0GVdMUlHvJlBX8SfiJvIbtOirS5zMb
   s+etGgyAXfzxQnKYMKYrDdsGSmZWnL5BcQcXKmhaClfR01n0UMB2RUvlr
   YhaHdWDDU4yrtQcI1IuTTK3tZDJahYzTD/JEMz2KPxo54cbGFJQ0R+2pv
   MwQWscZxIJJaL/empbw5MXI+aJUvyRgHHV6wMp6XOyfkTDN2YvChJh4EZ
   ksLqzbeRVWbRRr/2y9ave+tHHmoz/ehCGxHclW+cT75EV3rlRDC6EaeyC
   GSggQuHkiXP5PdTXm/pWEowy1GFb/uWQfaOXaucPMyIPKQISUoAGnLGPi
   w==;
X-CSE-ConnectionGUID: gqslWlnuQdGYrJXgaFn3Wg==
X-CSE-MsgGUID: QGQNeCY5S3yOVcXQUSF5dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71979462"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71979462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:34:24 -0700
X-CSE-ConnectionGUID: EmxAjyUSRGiIdPaue3nG2w==
X-CSE-MsgGUID: 7ghLkjWFTYighSMIJyneQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156683228"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2025 04:34:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaC1E-0006Ip-0b;
	Fri, 11 Jul 2025 11:34:20 +0000
Date: Fri, 11 Jul 2025 19:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/sframe 21/26] vmlinux.o: error: objtool:
 sframe_find+0x54b: call to __asan_memset() with UACCESS enabled
Message-ID: <202507111950.6Kc6b21t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/sframe
head:   1f143aea4ed5e05a960788d5c6f5bfc8c53eb4ea
commit: 90b8e7010c9cbc9b793f7f2b9cdc51bdc24bcbaf [21/26] unwind_user/sframe/x86: Enable sframe unwinding on x86
config: x86_64-randconfig-075-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111950.6Kc6b21t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111950.6Kc6b21t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111950.6Kc6b21t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: sframe_find+0x54b: call to __asan_memset() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
