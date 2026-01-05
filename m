Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F92F5A27;
	Mon,  5 Jan 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630702; cv=none; b=P4TCKSJ6TQ1TA3FMDq/zH8zWcR9NPlx3Em1flpUMmLSH8aE22MVZHSAcR0GXR+vqvqY0NjJOjyLTptdVDTCTg8q70eWLYvK32N828Xi90LCtcn13TlGZ25WHDmGXXrpQ3oUf7ZXDX4vtfPLnupvhJYdaXQ1m44i2s2TPtL4UgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630702; c=relaxed/simple;
	bh=nhqYyN/WN3xmHfkC+FKXpcbd8BAu66xOc+Sc8AvtDRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WDR4t41OIYXsIFLGsz0EO9ZrYSz0OqI9b9E9idVIyZ/1MiRI9jvq7WIZZnwR/GLFLYRtg92l2aZMXJWNZppJ66GJgHDxRraYa3GmOxC70dpSqbcX3sJK/ePem6B70r/TN1b33OXNJRJ0QFflC+Yz9s33iG2+90uirL1EzVkyn4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTH/YDWi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTH/YDWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767630701; x=1799166701;
  h=date:from:to:cc:subject:message-id;
  bh=nhqYyN/WN3xmHfkC+FKXpcbd8BAu66xOc+Sc8AvtDRc=;
  b=eTH/YDWibemDZyziadpcml+QuOqFKwdUFRs0zRJ7difq69WlL7qrlOxu
   lUPvfJRCOh8h3IIPMQi4aNNlRXsbn7g0BmaeZ4cOqOf/2infYp0Pbrphw
   7461hBATui4BKWPY4ZZSC+mrmjBdSWAyM2hMGzlJTlEQhag/vn4s0jLem
   9vCytiKcCPSCRMj3+LwBgQb+tg5ZlDZaxdTloayO+as60RofMEeGyxgHQ
   K9XVe/5powiCmFXJGqFnxbYJjmLjJoBf33WYY9QR0sswLTqJaVyQuCpMb
   bUtOpwaa2j/yBd/OLszTPGAko2+JioTJJVKYAmdogIeRmmfMyjm3V7PY3
   g==;
X-CSE-ConnectionGUID: dJvGZkVUQxyvpmkKlgN2dQ==
X-CSE-MsgGUID: PsPQN+PsQsCWPUNwlhAucA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79631991"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="79631991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:31:40 -0800
X-CSE-ConnectionGUID: aTMNLjHdTJ6A4zMDqi9g2A==
X-CSE-MsgGUID: HbQH0kE8SvCfSwHtprfhBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="233565515"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 08:31:39 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcnUW-000000001A9-3K8A;
	Mon, 05 Jan 2026 16:31:36 +0000
Date: Mon, 05 Jan 2026 17:30:39 +0100
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260105 17/18]
 kernel/bpf/core.c:2628:22: warning: comparison of distinct pointer types
 ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *')
Message-ID: <202601051711.0PmYQM0T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260105
head:   0864e0ff8ab1707473f669bf2a8dc94e97629018
commit: 40b37ce99bc78d07509af78fd140eba26cf6f512 [17/18] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260105/202601051711.0PmYQM0T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051711.0PmYQM0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051711.0PmYQM0T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:2628:22: warning: comparison of distinct pointer types ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *') [-Wcompare-distinct-pointer-types]
    2628 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                       ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2628 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2625  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2626  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2627  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2628  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2629  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2630  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2631  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2632  

:::::: The code at line 2628 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
