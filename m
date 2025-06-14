Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D542A87;
	Sat, 14 Jun 2025 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749939221; cv=none; b=IiE8ovolmpgENhpIkO8SV+mBQ/3DdO3K/Rki35ZXHP3ExXQ3yBU9LN3IcyVvEftDasS27+am0kAqe32so54eDItW13OTo8z+NHH7mQWEzp0uFTpY9w9MVcwLkq8IzzupyU1qLuKjzA+XvsnvrLB3dtHjBaFhZkm+KqpooJoxEpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749939221; c=relaxed/simple;
	bh=ShIrQXQXO5Wupqfne0421oVxlenzp497eFBtPHij32s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8s4ME7LQUodwpJ2K8I3bYcd+wa2n1LklKUUHyw5HCQdStork14QbBRrUDe5wiYUIz6A71R75+SlQruBS67QrQGontINNTnBMbbStP5DnU4KHKBlbfWnBDAAxUYYwg6n2qAs8y6BbWGdQre15FgaJI772KUmwThIuLwwf4+cKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foFwW2uj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foFwW2uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749939220; x=1781475220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShIrQXQXO5Wupqfne0421oVxlenzp497eFBtPHij32s=;
  b=foFwW2ujt/bdt0c6mmcN5ZnixKj1dZXJ/1o26aXkD1mPGV8VLPsvHDg+
   AR9AgseuVa1yKiEYNQH25Z7vPkBFct91Cxrkir97MezQKeLe4z3PWKjjJ
   eIMp8tz9++ldbOC2NGIIFwFp1RksH6jY4rQEIZpV1iIwGp0vWvhN8LA4J
   Bq99Iib5yHkvNholYyx+M2eeoUnu9F7298gPPcn3BdyWf4IP0SG6k5ecr
   dthk6vTRjmlyngXkRKTIKziv+EDVZ6myIdAHraOdVIKfLOPsCi+HpVHDS
   JuWnc8IAWFz2uFcRgsg6ERRC2AlQAbX/u6UTiDsUtFm0DPNKmNuXJomVs
   g==;
X-CSE-ConnectionGUID: awP65WGjSKmCzaou/ZVLWg==
X-CSE-MsgGUID: 0FgN2IiqQM6nHJKnHgRXxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52217907"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52217907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 15:13:39 -0700
X-CSE-ConnectionGUID: K576y4MQSQOkxPD5xErZeQ==
X-CSE-MsgGUID: dIousxx1SN+etVTdskp/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148596100"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2025 15:13:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQZ83-000Du0-20;
	Sat, 14 Jun 2025 22:13:35 +0000
Date: Sun, 15 Jun 2025 06:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 1651/2468] lib/crc/crc64-main.c:58:10: fatal
 error: 'crc64.h' file not found
Message-ID: <202506150606.rxZTzhKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc6e0ba6c9bafa6241b05524b9829808056ac4ad
commit: f58a15d5151d0d21b505ea43457f362cf0d75469 [1651/2468] lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250615/202506150606.rxZTzhKn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150606.rxZTzhKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150606.rxZTzhKn-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: no such include directory: 'lib/crc/um' [-Wmissing-include-dirs]
>> lib/crc/crc64-main.c:58:10: fatal error: 'crc64.h' file not found
      58 | #include "crc64.h" /* $(SRCARCH)/crc64.h */
         |          ^~~~~~~~~
   1 error generated.


vim +58 lib/crc/crc64-main.c

e2fd1883971db5 Eric Biggers 2025-06-07  56  
e2fd1883971db5 Eric Biggers 2025-06-07  57  #ifdef CONFIG_CRC64_ARCH
e2fd1883971db5 Eric Biggers 2025-06-07 @58  #include "crc64.h" /* $(SRCARCH)/crc64.h */
e2fd1883971db5 Eric Biggers 2025-06-07  59  #else
e2fd1883971db5 Eric Biggers 2025-06-07  60  #define crc64_be_arch crc64_be_generic
e2fd1883971db5 Eric Biggers 2025-06-07  61  #define crc64_nvme_arch crc64_nvme_generic
e2fd1883971db5 Eric Biggers 2025-06-07  62  #endif
e2fd1883971db5 Eric Biggers 2025-06-07  63  

:::::: The code at line 58 was first introduced by commit
:::::: e2fd1883971db5a2e3537f7deb6702056891d03f lib/crc: prepare for arch-optimized code in subdirs of lib/crc/

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
