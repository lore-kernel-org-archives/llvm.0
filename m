Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8347ECC6;
	Wed, 23 Sep 2026 23:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204693; cv=none; b=q5fo7H1CBW8Uv7WY0ObVnBSqEOEBMkoUeJIaSJStbvRlw5F/AmKsGi41Y3xIn4Z2y+A9mQaUscZRew4S8TQUt5KgU3gYJ2IGcEwo7FcMkOb1BiPlTWgIS2iJguWQqCjbSu2FHyRKC22Z5Yezl19Bs+ITeTRgM36rlAZFaj0/B0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204693; c=relaxed/simple;
	bh=trDwimtlrF6amO6o88zS8YroabofbwkhbsSkSTxO+jM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a7XG2wsxXW5YNPvDRTnk2ttCBLlyEClmiFkwA5CDdJB2XHRJyPrZDcwbVjRPhLGI2PYd6rnVs0/0JjGgGx+br7JFGHnIlVP+9oZuwEvQ+S7D4V9grWweZLCykAVXlqLiHzkQpkCEuhc8cLmplaCjCJJechf/trHuNu+/EJJlcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnC0U7lt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnC0U7lt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790204692; x=1821740692;
  h=date:from:to:cc:subject:message-id;
  bh=trDwimtlrF6amO6o88zS8YroabofbwkhbsSkSTxO+jM=;
  b=WnC0U7ltzTBzdPRAFK7bi/HBCKX+N/buHFP4083Kxvi+w9iQ2ocY8La3
   I68PeGuBjYx3tSLcR/1FUWpgL9wtfL62ce4uC0ubyWnY/fraVEs3foNuy
   zcSMW1avvIaWfz5fPu4HbbFDBvGzOoZzYJXboj+ffJ3dZybv1h+/I5hMa
   ft814iE9MBdxwXT8I+IThDeZ31fOpQHUAUhTfhR6kQ0kxZ3juYpbNmA/x
   L2G53N8n1i9f+p1JL98Q8pQTCzka2eeLXgueuKfCVcStA9QQgGs7RE7lP
   gZSHmpY4f4+rQqtPtHq+zhcSU+ERlCiF4XsdsAUn7o60SoOmc95lM/td+
   w==;
X-CSE-ConnectionGUID: aJBDV8FeSVW95Vb95vOyLw==
X-CSE-MsgGUID: XTEKHv7BTkyPgqMpMS4jXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91061610"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91061610"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:04:51 -0700
X-CSE-ConnectionGUID: CpF3IIoKRauxDDBZROA7XQ==
X-CSE-MsgGUID: OloUwd3ETQufreIRqiFlXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273297407"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 16:04:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9W19-00000000Hvy-0kVY;
	Wed, 23 Sep 2026 23:04:47 +0000
Date: Thu, 24 Sep 2026 07:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: /bin/bash: line 1: 786241 Killed                 
 ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake
 --ibt --prefix=59 --cfi --fineibt --mcount --mnop --orc --retpoline --rethunk
 --sls --static-call --uaccess --no-unreachable --noi...
Message-ID: <202609240714.8q4l024H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: fc0bb9915bce0c333f918ca76958d804ccd79f89 objtool: Grow __cfi_* prefix symbols for all CFI+CALL_PADDING
date:   5 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609240714.8q4l024H-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240714.8q4l024H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fc0bb9915bce ("objtool: Grow __cfi_* prefix symbols for all CFI+CALL_PADDING")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240714.8q4l024H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 786241 Killed                  ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --prefix=59 --cfi --fineibt --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --noinstr --unret --link vmlinux.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
