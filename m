Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB3242D6B;
	Sat, 16 May 2026 04:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778905579; cv=none; b=CAQC8ut2WjLWDc/r1Ho0DcsC7ivRMB8BXmELlrn6lmtDD/Kcy2GXhEIoNZSFxoBTVun2+YeeEATINXfAXYNDk+vKYUSGeFHyNYXpzF9ZLYVsIV/IlFNXlA6q8Z8iaVsC8y0hknqfkr5DdJSvzjrYjtM2068HU8LaH5NQdLZaGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778905579; c=relaxed/simple;
	bh=TNHWdNq0jaQHgemNCzPm65DCtvcanMoxHJzUvRR4cXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P0ZotIlV40OgkBeZVQ0nwgE/jFe0wqDtGSPCRWwmT+BhrTrUhoS5qR46lCm9zS08YuhYyQha4bWLuKY4MT1m2ToFBqwdCnBE2gMxHV7LwZicNvr7n4IdeBizLaRXWMMrDC9jEjY2OcP1Ja9pjuT+bbThoUA8JtrkB65mjfAZNlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXaGM5e+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXaGM5e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778905577; x=1810441577;
  h=date:from:to:cc:subject:message-id;
  bh=TNHWdNq0jaQHgemNCzPm65DCtvcanMoxHJzUvRR4cXA=;
  b=lXaGM5e+7IyYXPakK0Pdi3Va2bfd4tN1KjAeGbo1okMWWzLBsBPZiXls
   leoufc5d3ffNpU0M+nlNi2IHFx/ipO7DVZRCCaaA3RxV9o+mMMwMR8/aV
   AvTjUP+IGihZK54aN8wIDVJnMJQmNtPVPGHo2rmmnyDJNt+xyhlX378gl
   A4jlf2NZXpF9txkbrpWe3iD74KgGUv4KHD3o4H9R1/Vx8OSM/7hkT3+F5
   jGWLG3HrgZxkDXvu+wPEGGFEHOU0cWWATUdfXB7FgLN+Cjn0oYGt9uyc6
   XkrMOmDdbb7oOiK3MwhMNjb883t1qMbDZ5SkLqXkQPIqkAMdf47YPE+eQ
   g==;
X-CSE-ConnectionGUID: E5nfTt4rSEqKanGGJnzx8Q==
X-CSE-MsgGUID: TXtN9LXfTJe4zXc7hXIong==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78993519"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="78993519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 21:26:16 -0700
X-CSE-ConnectionGUID: 8x1Odts1TpSwNiz+MpkdDA==
X-CSE-MsgGUID: NU/aB43JSq6ObeUQOCDxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="232499700"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2026 21:26:15 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO6bM-000000000TB-3lBp;
	Sat, 16 May 2026 04:26:12 +0000
Date: Sat, 16 May 2026 12:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 6/7] fs/nfsd/nfsctl.c:2469:1: warning:
 unused label 'out'
Message-ID: <202605161220.GVDLfyL6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   32078d4509258ed0a8083fd51e4da9525663c611
commit: 97de12fd081f4f4883c2b529338d815425bda778 [6/7] nfsd: implement server-stats-get netlink handler
config: hexagon-randconfig-002-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161220.GVDLfyL6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161220.GVDLfyL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161220.GVDLfyL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfsctl.c:2469:1: warning: unused label 'out' [-Wunused-label]
   out:
   ^~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +/out +2469 fs/nfsd/nfsctl.c

  2467	
  2468		cb->args[0] = -1;
> 2469	out:
  2470		return skb->len;
  2471	
  2472	err_cancel:
  2473		genlmsg_cancel(skb, hdr);
  2474		return ret;
  2475	}
  2476	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
