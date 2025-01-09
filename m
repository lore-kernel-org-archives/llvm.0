Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFC33F3;
	Thu,  9 Jan 2025 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736385262; cv=none; b=m9A2zcEGsMKmdD4gEZBMIff9Efs+sRWUH1S6XZn9QGGAxH+oknHU2oC6/yMrnhHN9+z72+fpQyFnxZvE4S+v3cH9Ak/lKz4oFFPQg389k/j1Wy76zjabqnOT6AulIgTrWq8mxdvVWvWuNTQ0VgVaIKV5OmFmxNtNdi1ctW7bW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736385262; c=relaxed/simple;
	bh=Jjx8Sl6uok1Sjd+8yBqJp5h/vfbbP0dceHRrIWEWMJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGiOplhnb6C5wQtVsUB/TSatLhScFt0Zt4hNZndG/jJKUBkmHloPQra8m4wm8/oisj9ZOGihKNRIgEVyDfVLsSjrDQcOxZy4oEMX5+N9lcvCqFd1na6ShWcHCDq1XanuA2St8ge3T81cStBXIKWT6vomYrpnTcsjwx7X3B8Bu6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWdPzb4j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWdPzb4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736385260; x=1767921260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jjx8Sl6uok1Sjd+8yBqJp5h/vfbbP0dceHRrIWEWMJA=;
  b=eWdPzb4jP2iOwYE5x1Z7zx5U5G5arrKUBP3lOdZq398oaQrLY9TLjuaE
   I2VgQO+EKPNl2+EftTl4JnB828bQlGdV5PmQZVJ+eCazHeas0rZp+1FCL
   f2HFGYxkyV+NW2nTCE2qdna6/SYguv2ElPnOk84PiREYB7g6njUWcpa6M
   Ood1DAtPXWP91s4/K9cj+ky02Tv8ybaJqk06q02CNVcHf8AzePT33qZOE
   SNHEgWAayJp07SW5LS1qWoMAGoP7ZAdHew1OQrPoqRnosvvntQjnhWCpj
   uNcB55SGrhiQV2/UgPbyYC5k3AhvBbq8u8MGYqHOkv0Gjum505sTxmIzM
   g==;
X-CSE-ConnectionGUID: M+fkV+Q0Sn6DSjHj4Usd1A==
X-CSE-MsgGUID: WHvQCFvyQxiBPfYXZ1km6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47991201"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="47991201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:14:19 -0800
X-CSE-ConnectionGUID: m/4T04jgRaie/8eMj3mGQQ==
X-CSE-MsgGUID: Y5vsaKkuSHWSBHm7JxpFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103217659"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jan 2025 17:14:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVh7m-000Gsp-1I;
	Thu, 09 Jan 2025 01:14:14 +0000
Date: Thu, 9 Jan 2025 09:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Rome <linux@jordanrome.com>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Kernel Team <kernel-team@fb.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [bpf-next v2 1/2] bpf: Add bpf_copy_from_user_task_str kfunc
Message-ID: <202501090817.0Uikg2ka-lkp@intel.com>
References: <20250107020632.170883-1-linux@jordanrome.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107020632.170883-1-linux@jordanrome.com>

Hi Jordan,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Rome/selftests-bpf-Add-tests-for-bpf_copy_from_user_task_str/20250107-100850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250107020632.170883-1-linux%40jordanrome.com
patch subject: [bpf-next v2 1/2] bpf: Add bpf_copy_from_user_task_str kfunc
config: arm-imxrt_defconfig (https://download.01.org/0day-ci/archive/20250109/202501090817.0Uikg2ka-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090817.0Uikg2ka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090817.0Uikg2ka-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: copy_str_from_process_vm
   >>> referenced by helpers.c
   >>>               kernel/bpf/helpers.o:(bpf_copy_from_user_task_str) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
