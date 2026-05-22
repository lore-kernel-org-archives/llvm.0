Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BB146AEEF;
	Fri, 22 May 2026 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462859; cv=none; b=iQ//lgHRaC6gf6FlKczfsqXLtIHjzjqPtqDO3peXZlqjFhCVkV1IjV0O+HLcgzGJ+AHO8ma56ROiuXsSpvDFBqa3A/Gkt723JuhniRWCjq7kICYOnznjGUTuxcTobzr+UKuEjin61TRlU2Iq/vwBEvswNAkjbOxbtudssmpEaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462859; c=relaxed/simple;
	bh=5+l2kzjfq3kZrXhwcxA+u2dDT7cFAbuYI+6jQyKB1Sk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C7SkJoK8ujbAw0wJUuW+uXo5rIfeNoaHl3GLEyUfMPAFlSrLdHt+QpZkyXPh12sHzZpXbXyr+NvbPYpBSMDQjj4duTZC36FiUp+tCzbXKx1+9cma3akowrOojarzlfM1TT6VaRTHjdY3Zbwydb3tc3blJjNedqzR5UYlGL9YaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBdzyhRe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBdzyhRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779462855; x=1810998855;
  h=date:from:to:cc:subject:message-id;
  bh=5+l2kzjfq3kZrXhwcxA+u2dDT7cFAbuYI+6jQyKB1Sk=;
  b=XBdzyhRep6xJjCmrZg8P1ZYO8qzII+czbSuAdSp8lxuHPnJPEpwq4XLA
   t4I9l8pzzm19Sy8SbmWwGLVpjERrFxCQSw0xNq63G9l2We1pIP6mbWgih
   sHRyvyABKBuGBlp3uEnR18yyCyQo8kjToCWPOFtksn0RVh2lMAvgFGL2V
   nnQYFMloBv1F2H3TefCmeNfqosZN+ISgfsCZ3fes4G4MeE+oR6K3lqD/B
   GtNz7CegH+d4rL2bbF6IA3RtGgfVFPQdeHprArwU2bmD9eS7a3pGYerWH
   pMx1+SgIhd1ZEcpqmpw2XV+QMRV5xCO+4ipN9PKtl8LpLv1osN25ETg2d
   g==;
X-CSE-ConnectionGUID: Q8pZ6i+nSR2JjGGn3RgZsQ==
X-CSE-MsgGUID: RgbaaQoxTFm6cJfad8ZVFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80362870"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80362870"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 08:14:13 -0700
X-CSE-ConnectionGUID: fQdhFJzxQH2rYkL7RPVNDg==
X-CSE-MsgGUID: AXAZW9BIQzilBUXgN/EQ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245213792"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2026 08:14:13 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQRZh-000000002af-21SJ;
	Fri, 22 May 2026 15:14:09 +0000
Date: Fri, 22 May 2026 23:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 28/1130]
 ./usr/include/sound/compat64_asequencer.h:4:10: fatal error: 'linux/compat.h'
 file not found
Message-ID: <202605222329.vH0KHgAs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 1ef8aeaeb045b26bca033fa6c9f6c853f73ccf19 [28/1130] cheri: UAPI: Generate compat64 headers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605222329.vH0KHgAs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222329.vH0KHgAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605222329.vH0KHgAs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/sound/compat64_asequencer.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/sound/compat64_hdspm.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/sound/compat64_asound.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/sound/compat64_hdsp.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/misc/compat64_xilinx_sdfec.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_bpf.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_media.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_wireless.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_chio.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_fsverity.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_ivtv.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
