Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBD2144C4;
	Wed,  4 Jun 2025 03:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006207; cv=none; b=CWj6J4EhymKBOivxOo551xYO4HuRjS9eg8kdKSpG9XsfeAC0DrUGQaf5dm1F0y/oreZoEglw3rmCnjx77bSgCzamBCdRX1dM/cf8mUzqqcqYOxRN3xI2L7ZpkmIw9ncPrnCJ4cHZdPHv3cEkXa1QCMi92IW6o3teTOx/r0GtVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006207; c=relaxed/simple;
	bh=Lc7q5SYnuaN72jkUB0tCM1UzpbvcjvERtfpqMepqY7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4SbHXqv0EwIaNq1LKqpxgOB1pOVn01izUjG+Q8UVhoZXI2Pxg3frufQCiWuQobpJXVeK4feSPzbIZ5SMBXq66H9/dsPRFukpyK5nbvqq8X/TpvDVMzIlj9CyRgKnjTqFUJSVv9aJRt5/3ZSAVxVcgvr6wn5AbnheUv6gUVWc78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEWZFzbg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEWZFzbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749006205; x=1780542205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lc7q5SYnuaN72jkUB0tCM1UzpbvcjvERtfpqMepqY7A=;
  b=LEWZFzbgeQ7QjlDU0SK3DwxlTbOR3CTzXOiEXUjHUCOfmmnU2otnczhX
   55Bcfiep+n+DmgPr1mNiu09g3HXADxFbtE8APGSJwa3EaynDHSionVSwt
   tcs6Jxwiu/mh7FChntyggXlMyrUJ90RRkeaip7m/50qjvYqeDeU389cj4
   RsT+pGrYedfCTpv4aJjn+C5j3R/UWgZ5qY43cyikqAgrePN2D8qGXdo2M
   S0FVosE2O58T6/pCU4KfK3dHB+l3Y0WCn9Q0E/RyPKRezi1MTMMjEBx4v
   OvrSTsnAo/h5Jd2W6WaT4ioL1BMt5sH+FvwQ36TpTPFRsS468/s2i1LDP
   w==;
X-CSE-ConnectionGUID: LiySJaPAQxmdSA/1h+Fbxw==
X-CSE-MsgGUID: gQFKjqh8RUKGcN4iMKNxwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38700352"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="38700352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 20:03:23 -0700
X-CSE-ConnectionGUID: BDYuDxPVSOae2/n1SQQpqg==
X-CSE-MsgGUID: cz4Q63VaSqe7sYSgq36gwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="145066014"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2025 20:03:22 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMePP-0001cI-1M;
	Wed, 04 Jun 2025 03:03:19 +0000
Date: Wed, 4 Jun 2025 11:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core 2/23] ld.lld: error: duplicate
 symbol: housekeeping_flags
Message-ID: <202506041147.p4x5Ttp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core
head:   e8fa9a06cde680668da6763227a83c50ddac8b6b
commit: 3cabc4d30cdfa8b518ced3c6b8901e5905bc8489 [2/23] sched/isolation: Remove housekeeping static key
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250604/202506041147.p4x5Ttp4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041147.p4x5Ttp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041147.p4x5Ttp4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_sched.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_proto_ah_esp.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_nfct.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_proto_udp.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_proto_sctp.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_est.o:(.bss+0x8)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_xmit.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_proto_tcp.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_pe.o:(.bss+0x0)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_proto.o:(.bss+0x100)
--
>> ld.lld: error: duplicate symbol: housekeeping_flags
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_conn.o:(housekeeping_flags)
   >>> defined at isolation.h:28 (include/linux/sched/isolation.h:28)
   >>>            net/netfilter/ipvs/ip_vs_ctl.o:(.bss+0x1000)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
