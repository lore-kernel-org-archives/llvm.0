Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686186341;
	Sun,  5 Jul 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783216875; cv=none; b=r608i6wovkM3aKeOKbNuJ6iMv6i4VtHVKppux3S8d0quATNaGsI6ah5EaUOutLmSiBaayG7O+saVOXjs75V6sRGBxdcC0U7j6362gvJzqUDXRnc5jD0fvK2IqEtX85xzyPFYfB6K4zp8IZS7FwNkw9OB33TjX3DzXNHVrl4h29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783216875; c=relaxed/simple;
	bh=ZLkXFOgZY1ItZwFYczXE11uCZIui8otfVXGKJSaxZ4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3sh6OGErax9BeREXXyMJPuigwD9Mlu9xpZLHZkpaWZOXUirODT5iODWNESBHgNuWhfitUhFAzDc42usNeibStf5we/rGYcyfjpD/ACKd7h8E51rX1x84jw09XmNqcZLvd2J2rcCs3uF+/vp71eNsuE1L1MwwTjIxG20Oq8H414=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3ojAUrH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3ojAUrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783216873; x=1814752873;
  h=date:from:to:cc:subject:message-id;
  bh=ZLkXFOgZY1ItZwFYczXE11uCZIui8otfVXGKJSaxZ4Y=;
  b=i3ojAUrHGgKzRl4a7+ynx0ZOnOSl57r7X91KHMD76nWne1AT+TP3tihz
   21FA95QIjufl/eTJfqKCeZ2cVva1Q4kRExSPNgIQPaKwNVzR+IwOZPR08
   e/aQbb1vQKKpksdiJFxplA0piiBGWnegeI8BWpiLXxkQSxvTHbwennxMJ
   s9sHQvdhU2AjbEif4zfk+mdCS6srdZrn98Vd+Z2lWORJJaC654gDZ4VjD
   5Bq4iY2tYyQt8N1rm+qbzJlHHpZOtOCFns3P+jTI5OqYaT98Kix35mGYb
   dlltzMhoFWOn96sytZoPfy4bxAYDPq39FDo2e5DyJAXClbOAr1SIQ7/D/
   g==;
X-CSE-ConnectionGUID: JmuIPIQRQRGr7XUznBHe7Q==
X-CSE-MsgGUID: q6FJ12X6TU6Crh6gCHztdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="87719765"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="87719765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 19:01:12 -0700
X-CSE-ConnectionGUID: I32hOi17QwynfqV5zuAWKw==
X-CSE-MsgGUID: dXUFSIw0RM+qyeDnlXJ1QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="257723035"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2026 19:01:12 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgCAP-000000001rB-0HWk;
	Sun, 05 Jul 2026 02:01:09 +0000
Date: Sun, 05 Jul 2026 04:00:53 +0200
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai@fygo.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: block/blk-cgroup.c:2071 function parameter 'nowait'
 not described in 'blkg_tryget_closest'
Message-ID: <202607050301.K2e67pxc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/nvme-multipath-retarget-failedover-bios-from-requeue-work/20260705-035728
head:   853fab63a2b2632658d2eb291f0195fd982dcb70
commit: e1fee376bdbbcb71cfcadb93acda718162f017c9 blk-cgroup: support non-blocking bio association
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260705/202607050301.K2e67pxc-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050301.K2e67pxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050301.K2e67pxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: block/blk-cgroup.c:2071 function parameter 'nowait' not described in 'blkg_tryget_closest'
>> Warning: block/blk-cgroup.c:2114 function parameter 'nowait' not described in 'bio_associate_blkg_from_css'
>> Warning: block/blk-cgroup.c:2149 function parameter 'nowait' not described in 'bio_associate_blkg'
>> Warning: block/blk-cgroup.c:2182 function parameter 'nowait' not described in 'bio_clone_blkg_association'
>> Warning: block/blk-cgroup.c:2071 function parameter 'nowait' not described in 'blkg_tryget_closest'
>> Warning: block/blk-cgroup.c:2114 function parameter 'nowait' not described in 'bio_associate_blkg_from_css'
>> Warning: block/blk-cgroup.c:2149 function parameter 'nowait' not described in 'bio_associate_blkg'
>> Warning: block/blk-cgroup.c:2182 function parameter 'nowait' not described in 'bio_clone_blkg_association'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
