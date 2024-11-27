Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDF1DFD1;
	Wed, 27 Nov 2024 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718980; cv=none; b=ES5ecAhaOGSIFs8tAqEaRLUUfm8RAjWRjBtdkYy54B5H0aQtTh3EzupHP3spo4CoFW80+fANi41yThJ+xqYgWd6Chby8+HlJR2oh7u6HlxmuVAr5PIGWpftE9aIzmTHqtPEnJtyXSby6yZgpfn+OwuYPTng2qX8DQH/Oj0tP6nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718980; c=relaxed/simple;
	bh=4yLMKs6Cg9hqLm+tmM+afaty7BYf2o+JP9la1lt40fk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emO4iz2vNRsCG3JFy84pilnGxLwZlBh5+hJoBCim1Q9BZLibJsg3DQdRbTIFDmJ9sySFLeN2DHIt8FpP31VS01AI9Hyvdg+Jqpp5E94ECJACkaL6hU+y0vVvyN/0pV0SOkXg8waj57VgJ3gQnc7hwBcDUfeOX/hL+pGvU4cdFGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkYJVd+2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkYJVd+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732718979; x=1764254979;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4yLMKs6Cg9hqLm+tmM+afaty7BYf2o+JP9la1lt40fk=;
  b=RkYJVd+2RlGS03ZY0PTzcDsTphIQcUqGSWbMNzaEtkW1I+77e742gcbC
   45Am6PNZcXWq7BPadJVAjedWJf4FdFcjymUWxgXVr1sKcxRaPxBnkD7tc
   6Tace8Mco8CJnfWvrmALU0p2gf1c+4XDkdohkhHjh/BhdvXyST/YsD/br
   QB1sguIUvQzQFW5KxZzV2iEGwkEdyMP8mAnJjDFTzB20vW366pXqHHXjK
   7svbQwaUQf+HRh7sWUzZrUWTqzKY5Q7wNwpHC9qid0baigxCDwjGsQZuE
   ry+r+/ZrIeGucZudF6KwS638kGIl03vjn6t6igdUKZCSR8bs6qu9umAEA
   A==;
X-CSE-ConnectionGUID: vz/H0yoyRjiJV/Lt3wdSfw==
X-CSE-MsgGUID: wYqIg+bUQdSEGhcxK8jKMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33079805"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="33079805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 06:49:38 -0800
X-CSE-ConnectionGUID: BFEJkbv0TxqU08N+c3wK5A==
X-CSE-MsgGUID: K3G92LReThWO7TBa2S5dsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92800347"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 06:49:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGJME-00084R-2E;
	Wed, 27 Nov 2024 14:49:34 +0000
Date: Wed, 27 Nov 2024 22:49:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 7/7] vmlinux.o: warning: objtool:
 sched_clock_noinstr+0x4: pv_sched_clock: non-RO static call usage in noinstr
Message-ID: <202411272259.HS8m13wQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-noinstr
head:   51fd13276df848dcb320bf7ff423f73364b06266
commit: 51fd13276df848dcb320bf7ff423f73364b06266 [7/7] objtool: Add noinstr validation for static branches/calls
config: x86_64-buildonly-randconfig-005-20241127 (https://download.01.org/0day-ci/archive/20241127/202411272259.HS8m13wQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411272259.HS8m13wQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411272259.HS8m13wQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sched_clock_noinstr+0x4: pv_sched_clock: non-RO static call usage in noinstr
>> vmlinux.o: warning: objtool: local_clock_noinstr+0x5: __sched_clock_stable: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: default_idle+0x4: mds_idle_clear: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: arch_cpu_idle+0x4: x86_idle: non-RO static call usage in noinstr
>> vmlinux.o: warning: objtool: mwait_idle+0x43: mds_idle_clear: non-RO static key usage in noinstr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
