Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167102FC897;
	Tue,  9 Dec 2025 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282120; cv=none; b=SliLarI9UcIYVEHBOQPDdB4SdJL8Gkh6+wpQxyhhqABdKgxY9cya8A8NH5gWAqCJZanxcozGDRA/exTg+9fKSn2PQOR0A/XIxodtEYdhXvFIcSWEWP/xXef007o50sepqN0G2keYvrsiBdqIWSy/hCh4MfrZd0uSko7KdVOxl2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282120; c=relaxed/simple;
	bh=CA/jF//Pyu9vBCfk69Ze70TgL1gmuRMabTFvMMgRu/o=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pr3SqOrS1/DANt75f2Y0D43PgvSMoltmRYOaVdmFb9/D7x8HIYTqW4fJYoEOX4R4ni8G07gmlutp4ISrt9C/NL36C3l2641eMqKNOMz/Wi6CTb2l0h1dp5OlDJ7Z4IsQQN7wYd2MtUJcF65axdUPwxuY1luwsiMSKKduVzEsDFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj1vu1ZD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj1vu1ZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765282117; x=1796818117;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CA/jF//Pyu9vBCfk69Ze70TgL1gmuRMabTFvMMgRu/o=;
  b=Bj1vu1ZDfr1KODTVw+bLVM03jl1NryNrtIzRbAUhrpgj4zn8JmJgN7j9
   eQgM0gPBWh5EXnZ1GSjxmDzkod1cKyDcLiJl8w8ypf6DAU2C2ZWBKZg+x
   9Kc1e9IFFKfXZlvZhztaVrWuyg3NN5Zlwy+PtZrrV9YvjXvWESHM0FAi/
   WTIglxWOWBwUWMSJKB1o/ICxnsCUSheGqGcwFEZ7pvXPM5auJ7qJ9ihcT
   OxzHxePpc7/Kolxt4eABMbsX0012uK/SUfGYQSG6juiH4Vm7SfnmAJ19F
   1oaevd3Ey5UhsoxBo8A4tmU8F2cXb2nGmkczv9wE+UlHEpk7UvBqBxTNc
   Q==;
X-CSE-ConnectionGUID: w3BlWiJEQGqu2bHcaNlVqw==
X-CSE-MsgGUID: ypaixnkBTNGIak7tfQO6Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78597864"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="78597864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 04:08:35 -0800
X-CSE-ConnectionGUID: fT9QtySdSz2QD2VM0F1SYQ==
X-CSE-MsgGUID: L6KBQYoTSxeS7jxiW6ejnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196498717"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2025 04:08:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSwW8-000000001kn-2dI1;
	Tue, 09 Dec 2025 12:08:32 +0000
Date: Tue, 9 Dec 2025 20:08:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] resource: add WARN_ON_ONCE for resource_size() and
 document misusage
Message-ID: <202512091956.PFGPNOBR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In-Reply-To: <20251208202921.16819-1-ansuelsmth@gmail.com>
References: <20251208202921.16819-1-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: linux-kernel@vger.kernel.org
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/resource-add-WARN_ON_ONCE-for-resource_size-and-document-misusage/20251209-043037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251208202921.16819-1-ansuelsmth%40gmail.com
patch subject: [PATCH] resource: add WARN_ON_ONCE for resource_size() and document misusage
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251209/202512091956.PFGPNOBR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091956.PFGPNOBR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091956.PFGPNOBR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/linux/ioport.h:302:2: error: call to undeclared function 'WARN_ON_ONCE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   clang diag: include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>> Unable to generate bindings: clang diagnosed error: include/linux/ioport.h:302:2: error: call to undeclared function 'WARN_ON_ONCE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


vim +/WARN_ON_ONCE +302 include/linux/ioport.h

   288	
   289	/**
   290	 * resource_size - Get the size of the resource
   291	 * @res: Resource descriptor
   292	 *
   293	 * This MUST be used ONLY with correctly inizialized resource descriptor.
   294	 * Passing a resource descriptor with zeroed flags will produce a WARN
   295	 * signaling a misusage of this helper and probably a BUG in the user
   296	 * of this helper.
   297	 *
   298	 * Return: Size of the resource calculated from resource end - start + 1.
   299	 */
   300	static inline resource_size_t resource_size(const struct resource *res)
   301	{
 > 302		WARN_ON_ONCE(!res->flags);
   303		return res->end - res->start + 1;
   304	}
   305	static inline unsigned long resource_type(const struct resource *res)
   306	{
   307		return res->flags & IORESOURCE_TYPE_BITS;
   308	}
   309	static inline unsigned long resource_ext_type(const struct resource *res)
   310	{
   311		return res->flags & IORESOURCE_EXT_TYPE_BITS;
   312	}
   313	/* True iff r1 completely contains r2 */
   314	static inline bool resource_contains(const struct resource *r1, const struct resource *r2)
   315	{
   316		if (resource_type(r1) != resource_type(r2))
   317			return false;
   318		if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
   319			return false;
   320		return r1->start <= r2->start && r1->end >= r2->end;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
