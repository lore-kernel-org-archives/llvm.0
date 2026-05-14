Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4D1F03D9;
	Thu, 14 May 2026 01:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723935; cv=none; b=B4Y6aCzJzJPq0blZcPs1EgdKFQ0SLWMdvN8pWX6tC0PthTqE8xLtPn6bNSDXE6GOFks8QkBHy9cYHAL+ZLMmqOn3t+O6VC1gGijDDLKPjJUC3m8oiPdc+iTP0UGm0/zNOwjWHkqkSK5sf02j7+JPJlymHG7LwZLxTBRzZDQ2oQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723935; c=relaxed/simple;
	bh=B2DScK+iOpbCC0mL6eoPg2zHuEaTeT2CBT7qCiWfrEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FNJgpC1rSDV/Z4BOK+S9Xbs8nH22NDr5Gf6xqLff3dvW9cdIVzR+PsB1sJ+VyK/NDj976ZjTZuMwaQIGlKKxscZ4gEvyHovFbICfy6Fxh/31CX/ZQGluVHwXKdT1nj5MJo2MAlanj6mVGBif1o3k+VwqtUQvTaunlcUcxMHcUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpynfqFQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpynfqFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778723935; x=1810259935;
  h=date:from:to:cc:subject:message-id;
  bh=B2DScK+iOpbCC0mL6eoPg2zHuEaTeT2CBT7qCiWfrEs=;
  b=SpynfqFQtFYcJLO8gp9J1aCrbYg1r8d30RdnsOmdzbowCLr5BD9UTJVY
   CcPERV8zfRA+7C2bPn+JkCAgezXyuoGu9r72JnGBcIoJToQqC5nBfb4XF
   yRVocqHZSwfYEeOg9JVkiFJLYKSMWqmqHh5sgdN8h/mkABdJQlwGgG4W/
   3bXPLlfbsDzJlgJJKb2rmqMEBtZexjiCuI4NDR4bFl/G4L4L2wGcmmgQr
   Yl7uJO04jHUyksLW8QP9cgokdCi/QTbQJARpi4Z9vfqmYzx0UQiZRjAFH
   ZYtjiKVLT063gU0oEZe6KzrHYUn0anH5ab6oe+FrFzWcDl7ZEDXUWdyrY
   A==;
X-CSE-ConnectionGUID: Un5CQ30+QIiCK1vN4sWZ2g==
X-CSE-MsgGUID: NI2V5IYTTImhxRZ8V5Hv3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79375515"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79375515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:58:54 -0700
X-CSE-ConnectionGUID: f6jEYOI7RzahMhB/j0UEag==
X-CSE-MsgGUID: sZZ+KEbtT7etGhF5in6KAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237267496"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 18:58:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNLLd-000000008ib-2tbe;
	Thu, 14 May 2026 01:58:49 +0000
Date: Thu, 14 May 2026 03:58:38 +0200
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [groeck-staging:hwmon-next 26/29]
 include/linux/hwmon.h:498:26: error: expected identifier
Message-ID: <202605140350.0bONp1Mf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   7fb80897aad0a4da2e8ce77ac54af988605aae39
commit: aa3ec1484bdd619e8fa2ce569ec653d35fbf3615 [26/29] hwmon: Support guard() and scoped_guard for subsystem locks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605140350.0bONp1Mf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140350.0bONp1Mf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140350.0bONp1Mf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thermal/thermal_hwmon.c:15:
>> include/linux/hwmon.h:498:26: error: expected identifier
     498 | DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
         |                          ^
>> include/linux/hwmon.h:498:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     498 | DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
         | ^
         | int
>> include/linux/hwmon.h:498:13: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     498 | DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
         |             ^                                                             
         |                                                                           void
>> include/linux/hwmon.h:498:76: error: expected ';' after top level declarator
     498 | DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
         |                                                                            ^
         |                                                                            ;
   4 errors generated.


vim +498 include/linux/hwmon.h

   497	
 > 498	DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
   499	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
