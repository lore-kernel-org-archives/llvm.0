Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0638422E;
	Fri,  3 Apr 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205906; cv=none; b=rv7YVP0l09+JbuCKlYmWhr6XDjuoC+wWexnHRRDvOrAPLculFWWr+Jvvjb+yM7yLJAZlUwgbw4foogcKT6KOgrecDho7PEUeCKE1VBu25fnsiFGZ6VUCnsOmi3AZv25IezSPB8bl2WMeFHMGDXcKs1JBIUI/mt2NcSiOp9pGg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205906; c=relaxed/simple;
	bh=febfQLXmh+nQMWG1GJHBPbuuqFCM+WJS0KfyI9ltrC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UgMKUsxLfUv1CoeLN8lu4iCCypIZD/0Xxox+iaHaA1qSPqO9ULp5cVgVx2/t64qLlFaXvsrK5Y3OhSadtGpmDbv2zeHKwvdT4/ZF65jna3cnAXmaDzY9QVumMxHJkDe4easmm7cGRddtj3WJicAdNum6MJ36M7NjHrCrCcZuyZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJ8RmOXY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJ8RmOXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205905; x=1806741905;
  h=date:from:to:cc:subject:message-id;
  bh=febfQLXmh+nQMWG1GJHBPbuuqFCM+WJS0KfyI9ltrC4=;
  b=fJ8RmOXYlUeJqGtriREP6kqRNV3F2F2bavPgcrxVpELJYeiw+KikvHhp
   sLrfNf7CCELtuNtaYFSWQptu0c12OyBALBpg3cF8UwPXhb5hWoxmxsYNA
   kl2M3xMX6r4tK5un4hnTFwOOsdSK/SDbdifL61O4sgg7Aenxzy59hIlKG
   oJMlRPhHG1UxPKiHffjir4QJD7q5GsehJth1Ej0T89U1kXFxh99LflwX2
   Q+8x8I4xWK8MdvBIap5FcKbSApkQWa/LOG5+ZAacbekyNvOaZHHB6Lp+o
   txLD754/P0R2XAsW9Qq0//ODaWrGolEgRswk4GBqFQhXjhfad+EiPZ1YW
   Q==;
X-CSE-ConnectionGUID: XI575u6lQ5mulCwsohneuw==
X-CSE-MsgGUID: WbUUrZDwTnW1ED4evfaX6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888905"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:01 -0700
X-CSE-ConnectionGUID: Ba7KJuE7Sr2HKyd4ym+H1w==
X-CSE-MsgGUID: zEfMfREtQHSC5EY+oui82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368674"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015a-1cMO;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: include/linux/ucopysize.h:45:4: error: call to
 '__bad_copy_from' declared with 'error' attribute: copy source size is too
 small
Message-ID: <202604030531.O6FveVgn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: 808aac63e2bdf9bae08485e072bf3d317a18acbf uaccess: Introduce ucopysize.h
date:   1 year, 1 month ago
config: um-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030531.O6FveVgn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030531.O6FveVgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 808aac63e2bd ("uaccess: Introduce ucopysize.h")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030531.O6FveVgn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sctp/socket.c:45:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:10:
>> include/linux/ucopysize.h:45:4: error: call to '__bad_copy_from' declared with 'error' attribute: copy source size is too small
      45 |                         __bad_copy_from();
         |                         ^
   1 error generated.


vim +45 include/linux/ucopysize.h

    36	
    37	static __always_inline __must_check bool
    38	check_copy_size(const void *addr, size_t bytes, bool is_source)
    39	{
    40		int sz = __builtin_object_size(addr, 0);
    41		if (unlikely(sz >= 0 && sz < bytes)) {
    42			if (!__builtin_constant_p(bytes))
    43				copy_overflow(sz, bytes);
    44			else if (is_source)
  > 45				__bad_copy_from();
    46			else
    47				__bad_copy_to();
    48			return false;
    49		}
    50		if (WARN_ON_ONCE(bytes > INT_MAX))
    51			return false;
    52		check_object_size(addr, bytes, is_source);
    53		return true;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
