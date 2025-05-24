Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B315A8;
	Sat, 24 May 2025 01:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748050555; cv=none; b=CcaDM9Bs6WGgtHek90g7Pt4hdO+PiDTN0SEWQI72RPKIX528Yvm7zxs+Fb7bgE/j/Y3WauvZIDF80C4SdIHi2yhF4Q3RMwwBt8bvnlOK17tRE5zN3edS34oa8Cu8wMVRahlZSWqz5w9e5ppFLZNTUXc2ygZU90qdFmc4Wu2pJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748050555; c=relaxed/simple;
	bh=+wJWoMRiUbxdMJ/CLKK0laW6T1Hg/71MyeNUSIWIfPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ob3QdPKSb3NF81XPShlHyzLpyQPThsWnrah/E8zFnGRdjMeIMi2oPz2a2lNxM5g0fWhTIQgGWqkHW75j1kdjk78m7ET6xL3Q7F5sl8HaQwogR9yuYyN9Apil0EnT/JF4+i1zMdI1WKnI7G72ZostaBOlgnimKufIWWAj2xySXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIbcPyhB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIbcPyhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748050553; x=1779586553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wJWoMRiUbxdMJ/CLKK0laW6T1Hg/71MyeNUSIWIfPk=;
  b=DIbcPyhBmelKbYcQe5m+s2dSSwprqKLZnPA+Ww67lwt9N2w40Jems0gW
   ZmbSjWlPduipDJ2J2x0rQwAdf8wDCMhRJcWc71Sl6sruwIT5rQJEXyI4j
   tJ25RQZXprA590ysvTKNh+meaU/gtdiZMh0qOKPzmfyGd/bDlcqs5tAFh
   naizDCBKpBm4EiNwo1gW6vmfIAhYmNfDtukjp14uGnrmBpLQG3JOIbp9b
   lwxcfRXIW874H9mgWYTJJM/mV8m/oOxluND1pJ5V/iccxhSqjsWL0/XUG
   oMXil8kgc+78ydAfwBCHgM3k/sYEH5E4za4c0z/yls5dn8Hm+XRBE7ics
   w==;
X-CSE-ConnectionGUID: em8O5TriQEWYE8s4THgVRw==
X-CSE-MsgGUID: g2teP+46Tt+FkvV+pKaxTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53918267"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="53918267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 18:35:53 -0700
X-CSE-ConnectionGUID: gdYbpoI3TSawCS7RWzhqhA==
X-CSE-MsgGUID: gBpP0wNITXy3otz0Yvna3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142329098"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 18:35:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIdni-000QrI-0R;
	Sat, 24 May 2025 01:35:50 +0000
Date: Sat, 24 May 2025 09:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 3/15] kernel/container.c:148:36: warning:
 unused variable 'container_proc_ops'
Message-ID: <202505240904.O3FLNxGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: a04b5d08723a675c6e3d5ba710a1ad8266678ebc [3/15] containers: Provide /proc/containers
config: hexagon-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240904.O3FLNxGy-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240904.O3FLNxGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240904.O3FLNxGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/container.c:148:36: warning: unused variable 'container_proc_ops' [-Wunused-const-variable]
     148 | static const struct seq_operations container_proc_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/container_proc_ops +148 kernel/container.c

   147	
 > 148	static const struct seq_operations container_proc_ops = {
   149		.start	= container_proc_start,
   150		.next	= container_proc_next,
   151		.stop	= container_proc_stop,
   152		.show	= container_proc_show,
   153	};
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
