Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E6C29D291;
	Thu, 11 Dec 2025 01:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416508; cv=none; b=tONbnBokZRjnn543eVsWykieRxWEoQVJdpI26RvKefj+CSDYRnlkyGDir2dI/5Fj/poOQpVISgLBr2YruJErlvzPss1uJB6hCbZwxXb9UfN3xk2IY/OyFQCUq1Cgi77XBD4zkMqPlhtdkmB0wJPIxyIcz37Fdii01hXZkV9HTOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416508; c=relaxed/simple;
	bh=kYFLtzjoxezzACa+5GuHjngDsx8N9z1QN+BnRh2Lhdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UffBYy47wIFlT66CfTkQ+wFVoAHy7GNtesRu/QV3XcBLYyUeegf4my4h3VvRA8p3l5586Dwt6ek/bEzxTAncBBYAW7TFfg3P3Qs2wLF7kqtVdX03mNM6DxA0Wug2amU25lieebB/oPJkUgNdYYlPZf5Fx7jwT8w61fpVHlzn0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDZpPYWC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDZpPYWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765416507; x=1796952507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYFLtzjoxezzACa+5GuHjngDsx8N9z1QN+BnRh2Lhdg=;
  b=WDZpPYWC9phOHACsZX8yGv5DUDPGXsmg/quTpBcNDDywn8JpZ3tlXvjG
   zHnJNeiKQVBvhShidXiwsGP00oKLhNtDxkNMi5zVEzvG0swd5sfyukhDt
   sO7XYnXiQjMu0PXIG17p7g6hpqT+KHBxcPRtOol3exX/HNUyA5AO11OsH
   u8iv8grQZCj8r93TEFeYsISjRCqq0V/NiLgNltzMeqfgLNhLZ8v7Ekzjv
   Psum4TX/meTWlaxuvaj3jrSFR/mvKG1yJ93fOtDxKT7L/TWLZpjhBR7Fu
   rDVuPkKl2fZZUFhyucNjI73jZDiiKuQpty4yV8eXOPbgWijtps/sWGnud
   A==;
X-CSE-ConnectionGUID: Z4s+EPe1Tg6zI7Idvm+WeA==
X-CSE-MsgGUID: zBjfDopnRuunvQx5hUVQ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84804454"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84804454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 17:28:24 -0800
X-CSE-ConnectionGUID: 1AzRYoFXS5yRvFHsZswHqQ==
X-CSE-MsgGUID: LOseoaXQT6OPTGisS5PSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220007977"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 17:28:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTVTg-000000003y1-27ZD;
	Thu, 11 Dec 2025 01:28:20 +0000
Date: Thu, 11 Dec 2025 09:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20251210 10/20]
 kernel/bpf/core.c:2608:22: warning: comparison of distinct pointer types
 ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *')
Message-ID: <202512110957.bdkyzTzG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251210
head:   ea71f4781aeb04a51e64f521bd95b80be09c14ae
commit: 69cad6a5b5543737a73e8a9dcd366cbf2fbef9ff [10/20] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: arm-defconfig (https://download.01.org/0day-ci/archive/20251211/202512110957.bdkyzTzG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110957.bdkyzTzG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110957.bdkyzTzG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:2608:22: warning: comparison of distinct pointer types ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *') [-Wcompare-distinct-pointer-types]
    2608 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                       ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2608 kernel/bpf/core.c

8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2605  
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2606  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2607  {
8c7dcb84e3b744b Delyan Kratunov 2022-06-14 @2608  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2609  		return;
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2610  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2611  }
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2612  

:::::: The code at line 2608 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
