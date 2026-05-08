Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD613101A7;
	Fri,  8 May 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271450; cv=none; b=pRMOY2X7N10O06D+DwKM88Hc/r6WnZQ3yeVMKJ4kQc94goB8PhVaqMadgn8N3kZJ4New3UJANCnzej5jLFJ10Q0LxIuiWJaK/gQepiEFgkM/Q0tvsPkSgVkt6zcwrVwUjd8BgU8WLsASTA97M8c/si3FM7hGK+Rlvm8orUlQ3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271450; c=relaxed/simple;
	bh=ZnFiFLYyc08QhdYp/CYe0i6qWMms5q2wl0vpG4Z/i3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K9z2X+Jsytx8HeYJl0PQAM5jGbFYfCW8coG+RxQLSk9OgHyctU48hy2136x0KaazlQ6SXgZj0oTpSKCZQhS97aR5W+UiPUFokQPs+i4xRF7Kh8oMTlp8s4wlu/V2ehjTYJbelNW7E6B8PhVt2mtiDQnrZPjsXpKH/VgetOD44dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITcL6h19; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITcL6h19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778271449; x=1809807449;
  h=date:from:to:cc:subject:message-id;
  bh=ZnFiFLYyc08QhdYp/CYe0i6qWMms5q2wl0vpG4Z/i3U=;
  b=ITcL6h19MSABNgJZXhgR3zZB2YmMBrjxT6fHe4DPa10qV28A0N8K3hwC
   WgnGcAPl39rFovGTIrJFeHq3QvTpN1DX9CgAQtgCOL6h2Zia4C0J+/0Gs
   FIASoK8sHh0Em/4jjU79+EMyJP/Q597GB+KaunfVNAYv79orqHz60OIkL
   79J2n41dpZK3T0/aG8BxJuxMidGkmfF8shntb5jDaf9KC/j1fA+mqvi2B
   ZYfSLUmFX47pMwW/2AlYf86QTkcXoRwfSgz91ZsQcPwJEozhs+hffiqs8
   QyBbSxsDQEoNr9CcqNpif7UIEma6n56mPWAd4y1jaemtV6CJz9Ho+Rrqg
   g==;
X-CSE-ConnectionGUID: 2Q/qVUduRYG/+bLfhA/Byg==
X-CSE-MsgGUID: v6+pmPiSTWi2CEJDGLHRqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89840112"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="89840112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 13:17:28 -0700
X-CSE-ConnectionGUID: 20ufbky2TA2pM6ISX0fLHg==
X-CSE-MsgGUID: iebEbBQqRmOKo0u4FzeDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="241209896"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2026 13:17:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLRdU-000000000PR-2hqm;
	Fri, 08 May 2026 20:17:24 +0000
Date: Sat, 09 May 2026 04:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:configfs-ns 1/9]
 drivers/nvme/target/bpf_ops.c:11:20: warning: variable 'nvmet_bpf_ops_btf'
 set but not used
Message-ID: <202605090433.62EbXdyJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git configfs-ns
head:   509cbb083b05db0f02a3ceea68bb093f8725a6a5
commit: 94040dcdf8d7b146f62dfb3e0156d93a9713880d [1/9] nvmet-bpf: eBPF struct_ops support for log pages
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260509/202605090433.62EbXdyJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090433.62EbXdyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090433.62EbXdyJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/bpf_ops.c:11:20: warning: variable 'nvmet_bpf_ops_btf' set but not used [-Wunused-but-set-global]
      11 | static struct btf *nvmet_bpf_ops_btf;
         |                    ^
   1 warning generated.


vim +/nvmet_bpf_ops_btf +11 drivers/nvme/target/bpf_ops.c

    10	
  > 11	static struct btf *nvmet_bpf_ops_btf;
    12	static char nvmet_bpf_ops_name[] = "nvmet_bpf_ops";
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
