Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92832295DAC;
	Thu,  7 May 2026 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124500; cv=none; b=sCm4XqPCMZNWfzWE1i8YJUGuPzYQOILBDpaJ9pr1R/y3pEUjri/HjJrABE4JgdCk6DFzZjhdh4In7qqyoxh8CtPqKcimoXyVi6IYFvcRSHQRpB/r1T+tWHuqIXgFXJ0fO3zdKjXMOQ5CS53nX5gOhgffVzw7MUOktM8WA3JM09s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124500; c=relaxed/simple;
	bh=WYKA3TLCm2F/uA51MXPWkTCIuGckh6R0CA3wcPxFhU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lkTpqGF2nKD/0x9EpB+8tIu/BJe50STA2HDdVQgNJ0S5xeFnWcT9Cy4O4oqJyVXx3gd3mtOZaY6iAB2lCiOs75bPoO7bP8a+gGzIb4LpoU6jZ69ePPB99w6xUcYyrusg9Cy6JFM1CnLjBR645UbKqjPcvryvtlRYm7uB92lWiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNNYBsfc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNNYBsfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778124497; x=1809660497;
  h=date:from:to:cc:subject:message-id;
  bh=WYKA3TLCm2F/uA51MXPWkTCIuGckh6R0CA3wcPxFhU4=;
  b=TNNYBsfcsWc/+Y7+oG7A+YyosDwpoIaYK4BoLFpbmIfb4JzwFRUmtyZz
   AeaMJKLi9GBRPiIo7aXPqW4J3BiCO1Fg6zqAy6QMjDjqAtjMFXGnX9rNo
   citX3R1fI/TxL4DCXUKeuH2uNTKi7geTlNqUXDDTN2oPmgQ3mO6YVveJT
   wJFurQbCUcvqRcjlkq8FxDPMUxSZMIJeOSx0sgJzXNFQiHSBJzl2lQIQz
   dCTSbh5ZvmLs+inE2W3XtWKuZOKnzJEjecucwYMTVO6OZN8VtvhgSy7pW
   EgxXUimTM9RdEC/L2Y61lNzSWEyFtBd/AZxI6fzhERsLiUPcrWWAlMfJZ
   Q==;
X-CSE-ConnectionGUID: mnabUS4MR4CCwJ21Ibv5BQ==
X-CSE-MsgGUID: rY3A2wFmQ/q/mA9lYLJgEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101743241"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="101743241"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 20:28:17 -0700
X-CSE-ConnectionGUID: KME59z9/SGejbcP+wgs1Wg==
X-CSE-MsgGUID: gm7mSTugTb+uGW03Cq7qLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="240326231"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2026 20:28:16 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKpPJ-000000001WZ-0o1h;
	Thu, 07 May 2026 03:28:13 +0000
Date: Thu, 07 May 2026 11:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Richard Kuo <rkuo@quicinc.com>
Subject: [bcain:bcain/glink 8/73] usr/include/asm/registers.h:234:31:
 error: expected ';' at end of declaration list
Message-ID: <202605071111.CZeNDxa8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   17a87072c714b49067779a32c01c02adf1d5ba57
commit: 912468fd30fb3900771d7972c28368c32ac82979 [8/73] hexagon: add HVX vector types to UAPI and set EXEC_PAGESIZE to 64KB
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260507/202605071111.CZeNDxa8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071111.CZeNDxa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071111.CZeNDxa8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ptrace.h:188:
   In file included from usr/include/asm/ptrace.h:25:
>> usr/include/asm/registers.h:234:31: error: expected ';' at end of declaration list
     234 |         struct hvm_event_record hvmer __aligned(8);
         |                                      ^
         |                                      ;
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/asm/registers.h:234:31: error: expected ';' at end of declaration list
     234 |         struct hvm_event_record hvmer __aligned(8);
         |                                      ^
         |                                      ;
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
