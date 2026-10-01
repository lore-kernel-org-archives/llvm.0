Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E8386568;
	Thu,  1 Oct 2026 04:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790828265; cv=none; b=nWy3z2nlElIp+j5iKb9RTXaXW1d3p84vDO9iOXq98JaAg6s1vQrjyljOsI5nLNGJCeD3VevsCurPxA+tbgmHHBWIBp4bmu0206MqScLbjO19TgIUudclHwwXftsuQRuO+hnCrupQVET88Xl9AQ0MK5sxrM+g1H/i7yp0eLZjg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790828265; c=relaxed/simple;
	bh=c0l5bASEFBCSvyX+R6uc7HIWQlCgDmVnjysmFEiKLVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5PIdIIFojeDZEZM+3RukTmyXfLAvL40tvBgid66NL/5GLkLCORS3j5fI7WA2dKEE1sEQ4A7KlWJnyG7x4VY6eB7yrqXKqvKXFiFFmzoX0qBsHQaMLljk3Gk52844bA+Jgrde4lXvG0Uzi2QtgiaRa8vHOs/AIu2lJyvO/h3/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFXvKA+m; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFXvKA+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790828263; x=1822364263;
  h=date:from:to:cc:subject:message-id;
  bh=c0l5bASEFBCSvyX+R6uc7HIWQlCgDmVnjysmFEiKLVg=;
  b=eFXvKA+mu7uy4/elZXITzULVvwBJrIpfP8lf51VLjsNVvjYpjCTC90Uj
   HImBKOSkItwTQQRAcbwJEUjeH0RaBT1O5rr+5q0KyKK2lajXyLWBXxDsQ
   iX2AaHw3c2EUnhJJm8Be39bxdI7RRTlQ8ULnJsywl4UBmm/pi9bGfHumr
   BsgwctIMqCajXTIqIpiyf0B42eDnSH91n1z07UKLWI+DaSqWDx6JKkWOH
   KFl1B4F7oj4U5HQK6MLHun+J6U4lrHta3UIypyxtmM2iPbODIy9wUE0ZW
   sSKYLjwDgTw6YwyWXkZ+2IAedJuoq5F8HDf5DC9VFE79K9VAYe4f4rvXc
   g==;
X-CSE-ConnectionGUID: BAjUf73+SEeOIatfKT6AgQ==
X-CSE-MsgGUID: Mssb7DA1Q76w4QTWuYxT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="109059202"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="109059202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 21:17:42 -0700
X-CSE-ConnectionGUID: injziqaGRPS1ttMvyoTksw==
X-CSE-MsgGUID: KEE03gbeQkWhC7uLwbvXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="279097123"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Sep 2026 21:17:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC8Ek-00000000RUZ-3owK;
	Thu, 01 Oct 2026 04:17:38 +0000
Date: Thu, 01 Oct 2026 12:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 13/26] clang:
 warning: no such include directory: 'kbuild/src/drivers/ctlv/tests'
Message-ID: <202610011213.U0mDcSyt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 7a94cd6833db466aa5cf2896495ef3692cd75429 [13/26] ctlv: Add the KUnit tests as their own module
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261001/202610011213.U0mDcSyt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011213.U0mDcSyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011213.U0mDcSyt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: no such include directory: 'kbuild/src/drivers/ctlv/tests' [-Wmissing-include-dirs]
--
>> clang: warning: no such include directory: 'kbuild/src/drivers/ctlv/tests' [-Wmissing-include-dirs]
   drivers/ctlv/tests/event_kunit.c:18:10: error: 'linux/ctlv_fixture_gen.h' file not found with <angled> include; use "quotes" instead
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_gen.h"
   1 error generated.
--
>> clang: warning: no such include directory: 'kbuild/src/drivers/ctlv/tests' [-Wmissing-include-dirs]
   drivers/ctlv/tests/message_kunit.c:18:10: error: 'linux/ctlv_fixture_gen.h' file not found with <angled> include; use "quotes" instead
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_gen.h"
   1 error generated.
--
>> clang: warning: no such include directory: 'kbuild/src/drivers/ctlv/tests' [-Wmissing-include-dirs]
   drivers/ctlv/tests/metadata_kunit.c:17:10: error: 'linux/ctlv_fixture_child_gen.h' file not found with <angled> include; use "quotes" instead
      17 | #include <linux/ctlv_fixture_child_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_child_gen.h"
   In file included from drivers/ctlv/tests/metadata_kunit.c:17:
   drivers/ctlv/tests/linux/ctlv_fixture_child_gen.h:18:10: fatal error: 'linux/ctlv_fixture_gen.h' file not found
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> clang: warning: no such include directory: 'kbuild/src/drivers/ctlv/tests' [-Wmissing-include-dirs]
   drivers/ctlv/tests/registration_kunit.c:25:10: error: 'linux/ctlv_fixture_child_gen.h' file not found with <angled> include; use "quotes" instead
      25 | #include <linux/ctlv_fixture_child_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_child_gen.h"
   In file included from drivers/ctlv/tests/registration_kunit.c:25:
   drivers/ctlv/tests/linux/ctlv_fixture_child_gen.h:18:10: fatal error: 'linux/ctlv_fixture_gen.h' file not found
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
