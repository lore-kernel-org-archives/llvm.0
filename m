Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D091481A5;
	Thu,  4 Jul 2024 20:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720123416; cv=none; b=MDududM1BprXdG8/8lh1Xf8ao55/7QwOB1qISexUB7EUcXi0uc3Q36z7sCLIbrdkUwmUOJe7etThN1415PSsl08+XH3vMiJTH9m3rY5cZWVZGi1JeTSmsR3GWxJqlsGmhAUS6bBHKDc7La1ujJBVdJVZ+uPLJOn6KKmddil0xiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720123416; c=relaxed/simple;
	bh=/bWhZMvJEvb9MFNe33mzsaypkaM51sN2aHHhqwJdQEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibWKM37V4uZ28hSY4p2IMicG6opmlmdp1g2HOHZZ3cQC2Ofi4F+YUlxAbMfXAMkIchfSPtUt/24MABL0kHcpcHWDLJzjphOVn21zl9OkKcyczaAQUSXM7psX0FU95TNq2eA9mbggpsifLAc5oNunHr4NGKfhOCV8yzzB9y9BTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TV3EyWeQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV3EyWeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720123415; x=1751659415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bWhZMvJEvb9MFNe33mzsaypkaM51sN2aHHhqwJdQEM=;
  b=TV3EyWeQk021GOH5eQ5TNKm+jOlMQNlcmXLl2qlfattiSwZyrMadWZj6
   1y9HrTKnRldtZb5F+mI+BklRx7H1UFkutWefzjpUDcsFXmuTQxVGYcq0k
   20SsBtCwiCAmcPPzY2aqucwdxcMvvcPEqRwY8/VqmqKLI18/B3V2h+xmq
   la7K/DgfbTw81CgXhS8LKajD3gV3F9/98tMkYVzOUNeDlaQ+U2Fu2Tnwn
   6r85rlzjO5nPk0pK0HLRn0JboXYjkK/DAjhF4o5JQwPivnXrkqpGCB5KZ
   7NS9tTjHzLQZkimQHPZh6oMC10xkd8V4KaJqVdlNhZEVEsYYt5+8c6M3u
   w==;
X-CSE-ConnectionGUID: 6cup1FwuRpe3IXal67w1xw==
X-CSE-MsgGUID: hC2Svu+vR3OpiOq0S7h8Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34956522"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34956522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 13:03:34 -0700
X-CSE-ConnectionGUID: JJ0zyU0wTOmiweF10Ag+2g==
X-CSE-MsgGUID: 3ygyYI6bSFi+x0gvEE+qZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46610071"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2024 13:03:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPSfy-000RP8-0m;
	Thu, 04 Jul 2024 20:03:30 +0000
Date: Fri, 5 Jul 2024 04:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 6/6] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso64.lds:358: unknown directive: //
Message-ID: <202407050325.sYF5ewIM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   0701df056a78b76d97ad9fe64c364e98f234a71c
commit: 0701df056a78b76d97ad9fe64c364e98f234a71c [6/6] todo
config: powerpc64-randconfig-002-20240705 (https://download.01.org/0day-ci/archive/20240705/202407050325.sYF5ewIM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050325.sYF5ewIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050325.sYF5ewIM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> ld.lld: error: arch/powerpc/kernel/vdso/vdso64.lds:358: unknown directive: //
   >>> // TODO CONFIG_USE_FFUNCTION_SECTIONS, etc - or just make it the default everywhere for consistency ...
   >>> ^
   clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:80: arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1 shuffle=1953872427
   make[3]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:395: vdso_prepare] Error 2 shuffle=1953872427
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=1953872427
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=1953872427
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
