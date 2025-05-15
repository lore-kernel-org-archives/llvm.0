Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0BC4B1E59;
	Thu, 15 May 2025 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341986; cv=none; b=eibKYOH82L/2GAxAiswN0cxNyhiB9noyqd3Ticwo6k7R200P2fbV9RBbRQOKs3JX4sYmMoYThZ9Hy1sVmYcDTHKhFPczcUkhcBc6TAR+DEqTu6rynxt+0gBFg5qHh9nkDpiG79tJ6O+wvv/15LCuR/OzpMDyiXV70SMpbolQuog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341986; c=relaxed/simple;
	bh=cVTCbFlNO4QPH1TMZmNXT5eYVJ2gwg+uBJu23n5PIH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaxMmpD778jWrGRxwds2eynFuPq2Od5R+5fsPo8vA3p1C5OrCacxg5h4siSzVZur0BHj33cGvtDlri1GjzJFABzlkGRvrcRbn1WC3akQ5MFvyVD4q5mQfKGOc9bLWv8N+9eR4ZHhdOdQVdaI03kbRwhODwh5Yhl2QXmmch77n4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8p7b2ZE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8p7b2ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747341984; x=1778877984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVTCbFlNO4QPH1TMZmNXT5eYVJ2gwg+uBJu23n5PIH8=;
  b=k8p7b2ZEA2DUiviyll3EQT72EtCAh69pDQ4FkwceyC9mtEF/H9cen9U3
   +J/HAnjoxafSPCcFNdpJhz+VQjqp+QvIDUtyaYD95yEP+zog+wPzNfzXE
   zk2EroA+IAbiq2R7P/Q0ZUu/jCgldK0b8zeIQBPKX8c1scOQFN4/YKjcH
   MvE9TJ3RmKf/K4Qi1nqMdApxSuKXymUMS9q50Tqdn0OMCcOBzLJReFnz/
   5Wj6GdMYAMn5vKQauYy9SjTOQF7nwAdtkAT/lHVPRhL5j5RPgeoPhq3PC
   kfGOdjTXNgwZaLhbcG+4oXvmG68CNbKb9hwOd0qKm1b4Ht4yWWz3jpf0u
   Q==;
X-CSE-ConnectionGUID: SpIEZ2iQRqikyo+59y6vlQ==
X-CSE-MsgGUID: UFX+Mz7KTy60at6lDovGTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60319290"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="60319290"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 13:46:24 -0700
X-CSE-ConnectionGUID: fp2kSfZOR2a3FfCS+CTknQ==
X-CSE-MsgGUID: e352/OpkTeiMVtR6icX/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138223085"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 13:46:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFfT9-000Ijf-1e;
	Thu, 15 May 2025 20:46:19 +0000
Date: Fri, 16 May 2025 04:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 94/107] ERROR: modpost:
 "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!
Message-ID: <202505160451.uiXqsnFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   90b85567e45736b662d034be536a76ba0f4c7ca8
commit: 92c025db52bb94a032eb3d473bb81e62c19ddbd3 [94/107] platform/x86/amd/hsmp: Report power via hwmon sensors
config: x86_64-buildonly-randconfig-001-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160451.uiXqsnFq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160451.uiXqsnFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160451.uiXqsnFq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
