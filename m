Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088E1DEFE8;
	Mon,  2 Dec 2024 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733173602; cv=none; b=u6teY3glDRWJFTYbkKt59DpuNix596OuFhTpmBOraiY+or5Fd+mQlBxpkGZJNnD1w9ImweMlwCh3UMPSY+F8XHxcReTHcciLREhAU2M1+N/2KseJZUcb13vhwKmtiOewlX8w+yuvMaHzAgdH6z2kdTA3QAIOMsoncl9WDASF5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733173602; c=relaxed/simple;
	bh=CLSWtztxCjJbX6UsFLXgfBWP468xROSiEGjA4bqeIaA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alErJvyfRMxcKJ2BfFa7xTTdLuMon+XWB8YTvwGkl6NJYR0GnMoeTy2wL8Ya4WxjT8gzLYroKIPl6KSwnBWBpe6c87bnEtKLZ2rI5H1oYPib848Q/BfZCVO44CYYyAeUL9kkABM4QYzj80zXCQc44QQESce/uvTCYihY8uvhIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SW99h7yt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SW99h7yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733173600; x=1764709600;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CLSWtztxCjJbX6UsFLXgfBWP468xROSiEGjA4bqeIaA=;
  b=SW99h7yt+eqAEnSB5IwPkTjlBqO40bgNcG7Ba6R8KquxNj+Z+2hbS4X0
   py3NhkncYB2NlaBKI5IkurN1MMWy9762hqcYCGuwt4vhlFycpP6MttFBL
   bMur8BJXhvabCrUw8awX9vodh8WqK0ZZuNFZt2aY3ec2a0SkeYIYAtjVE
   aMlEalNzqIlJ9J2/hE8fhp93aMhyuF5eOpMrOjV5JrUoAruimycUPNP4g
   3ovZvhc2c6IBJ09go/mTWQAGZhLyu85+Pp1HOBSFVT8TmiW7DT+QagFTf
   TKLNnojCLIh0N/pf1QxRcETHlXlJ6oUy8gV7bI5W3WdNMvQ3k1sGqyywv
   w==;
X-CSE-ConnectionGUID: KezL740lQaqi9w9Jyr6zWw==
X-CSE-MsgGUID: +kZJkzA7QySulWS4KpFNAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="36219460"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="36219460"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 13:06:40 -0800
X-CSE-ConnectionGUID: 4i0majBjRiW5Y5aN5VTZ6w==
X-CSE-MsgGUID: pohvIPsgR4KwitFcsOdTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93692021"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2024 13:06:38 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIDcq-0002u5-1z;
	Mon, 02 Dec 2024 21:06:36 +0000
Date: Tue, 3 Dec 2024 05:06:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:objtool/core 2/16] sound/soc/sof/snd-sof.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202412030541.tAmAZH2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   e7e0eb53c2f0f68fe2577472ce2802a4efd9d7ce
commit: 22c3d58079688b697f36d670616e463cbb14d058 [2/16] objtool: Convert ANNOTATE_NOENDBR to ANNOTATE
config: x86_64-buildonly-randconfig-006-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030541.tAmAZH2V-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030541.tAmAZH2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030541.tAmAZH2V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/snd-sof.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> sound/pci/hda/snd-hda-intel.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> sound/soc/sof/intel/snd-sof-intel-hda-common.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/fsi/fsi-core.c:31:
   In file included from include/trace/events/fsi.h:245:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/fsi/fsi-core.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/spmi/spmi.c:18:
   In file included from include/trace/events/spmi.h:136:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/spmi/spmi.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
