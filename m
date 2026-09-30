Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CB38DC4C;
	Wed, 30 Sep 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741616; cv=none; b=HqM5RPs2xMmENuuLCp95MCB2/20TqzedxEEk3gLGhWxIsyBLVrsG6THzCD/LtPlpPeFDoAvLx1PF/HueOigUqm/ICU5nqDcNy5AosWCPoNKYw1rF5Endw18sZCiaya/pF21KsvXTd3X3qrorp0zD4mAgQph8caUlOrUAEiab88I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741616; c=relaxed/simple;
	bh=OKGhc222T/6SQoBifAhYIW1HPUk01jmKVzugbVifYy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hogKOsLKTaZSy/8nZ1GcOHLqpbae+/fSLm88bhUYcWq/fbpYn8up3xGvngngcodRLYpTgkEJZLEv3/mujT83Fdpi/2YUIX4LLgtFN99IOem1OWm57mVvF0sXAWZdnVkEOIgown/F4saScgn2eKOWs277nKm+wzep38byjBPS82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/o2kcFw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/o2kcFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790741615; x=1822277615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKGhc222T/6SQoBifAhYIW1HPUk01jmKVzugbVifYy0=;
  b=l/o2kcFwlGvj2seK2nRSpN5XWumVw2sLM/TMUIrkrOsmdBJ+tsJIy5kf
   IbJorSGeN5NWJR5oQYySsFosFz1zGUmznhE/x6yxZ8Y9Q3q1FMwz3ITg/
   o5MutCPucWWp25tckvf7zokVFNUoTcjrkBrsizaujTZn5edGPadZia2Iv
   Yvi+5EFH94m8lZW/UtlM9ma0aY7d/tAM9ci+sMDkOqQmn4gQygrrb0EFA
   Fa7O2fOY29xHtzIyV/X6vN+jyms6M0BaL4MAaptyuqMaJk/IQJ+4l+dfQ
   ILJQJ65HZI6FUM8YZTUY2bdVUXP1K6xu5r9ilesQV8zMjWNZutrT6zQKP
   Q==;
X-CSE-ConnectionGUID: vzHVTG9HQjq0IPeXDMwhfA==
X-CSE-MsgGUID: Ngiuhiw6TnK6ptuGwcZIBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90236447"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90236447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:13:34 -0700
X-CSE-ConnectionGUID: W9xKD2jQQVGLAQRU7snVKg==
X-CSE-MsgGUID: sr93k6YwSWCMdi4Gy8ydPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275124506"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Sep 2026 21:13:32 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBlhB-000000001jr-1LDZ;
	Wed, 30 Sep 2026 04:13:29 +0000
Date: Wed, 30 Sep 2026 06:12:28 +0200
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8923/12096]
 =?us-ascii?Q?/usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/?=
 =?us-ascii?Q?bin/ld:./arch/um/kernel/vmlinux.lds:167:?= syntax error
Message-ID: <202609300549.Vy4VMT1M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6474fa070f2b8013b4b87350b775b8c3be6e8aac
commit: 779c65ede6800595ec620b0b10aae7d5a5469cbd [8923/12096] um: link .lbss/.ldata/.lrodata correctly
config: um-randconfig-2000-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300549.Vy4VMT1M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300549.Vy4VMT1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300549.Vy4VMT1M-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld:./arch/um/kernel/vmlinux.lds:167: ignoring invalid character `*' in script
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld:./arch/um/kernel/vmlinux.lds:167: syntax error
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
