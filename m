Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4831DF757;
	Mon, 21 Apr 2025 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745256411; cv=none; b=IzjgxY5JJMmEypIj3Ntn7/HwH48ynKky24SNv76EurLJ9rCdmj0EzymF5bZFk2hSLqS4ZhcSYqi8CHahDKWCU+Mc8DWQ1j3chBP5timEeGk55J5ZDiI8mfPql9juQKekdL/Vu8vk1OT3peOUBmd7Uqbd+KyOQwW4c1ZJrKvaPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745256411; c=relaxed/simple;
	bh=kTD948qUOewiqNdJKPUZq+DKcBYdSVmBcF46+D+WFKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pn7og76xOa8RitMz0yBh7A3KrfH46+EjYUTP7AiEFQ90uScQJ5EzD4kCC85Co1oNOgqrsLZyXCwSetKkFrA6+fgEfNYYmgGQT74pPnMvS8A3l5tXPZiGqMW8juJxmjjlAAl/eet08RoCuu1A3xEZlWEGKLKaAHYEKj57LPiZqT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJUu/dxt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJUu/dxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745256410; x=1776792410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTD948qUOewiqNdJKPUZq+DKcBYdSVmBcF46+D+WFKU=;
  b=kJUu/dxtQAfZvi9UDUKcKPZhovGqOT+ja7OK8aXRWHIQRoH7NjLCuM3d
   hgVSHdVx8ml09/5Ae/038BQOgVYybY+l2y+Fz0p7UK0yYSPBZhEbhTcUX
   Wo6QAR6+2vOxbk6Udwe90Vjhr6CkajVNsN0InQkuZJlFNO2QBQjXBMuch
   XqlrTU4Gr3cfgAgZuIZM04/NVFfZ5RGLxirLhDNaz7s7jOXS5U657lCns
   0F3/anOMeOEj5vKGjUr9pY7vqjsDYMNxR2dWhjy8cCydqxxXA81Zjh009
   vmK1f26lsZYXDy/tRYmywZ0foLBT/GlRkaLHVi/rhbBQtdWeh9dblh26s
   Q==;
X-CSE-ConnectionGUID: vfb8zlSYSYubhAqLn+8YCA==
X-CSE-MsgGUID: 3EJ2LQHoRliCddk65qZA5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46708692"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="46708692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 10:26:49 -0700
X-CSE-ConnectionGUID: OcFjVfVIRnqvI6P9i3yZvg==
X-CSE-MsgGUID: QSdFfHk0T8umL0pY6bW6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="136733766"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Apr 2025 10:26:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6uuq-0000Gp-2T;
	Mon, 21 Apr 2025 17:26:44 +0000
Date: Tue, 22 Apr 2025 01:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 9/24] drivers/perf/arm_spe_pmu.c:1225:6:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202504220122.xk8VGIkc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   2017a5b657d38d470385b73ae1704eefe13bf2a5
commit: c4dc9ff02fe9b78fb6f5cead8defbb4e6d3b632c [9/24] perf: arm_spe_pmu: Convert to new IRQ affinity retrieval API
config: arm64-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220122.xk8VGIkc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220122.xk8VGIkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220122.xk8VGIkc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_spe_pmu.c:1225:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1225 |         if (ret) {
         |             ^~~
   drivers/perf/arm_spe_pmu.c:1211:9: note: initialize the variable 'ret' to silence this warning
    1211 |         int ret, irq;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1225 drivers/perf/arm_spe_pmu.c

  1205	
  1206	/* Driver and device probing */
  1207	static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
  1208	{
  1209		struct platform_device *pdev = spe_pmu->pdev;
  1210		const struct cpumask *affinity;
  1211		int ret, irq;
  1212	
  1213		irq = platform_get_irq_affinity(pdev, 0, &affinity);
  1214		if (irq < 0)
  1215			return -ENXIO;
  1216	
  1217		if (!irq_is_percpu(irq)) {
  1218			dev_err(&pdev->dev, "expected PPI but got SPI (%d)\n", irq);
  1219			return -EINVAL;
  1220		}
  1221	
  1222		if (!affinity)
  1223			affinity = cpu_possible_mask;
  1224	
> 1225		if (ret) {
  1226			dev_err(&pdev->dev, "failed to get PPI partition (%d)\n", irq);
  1227			return -EINVAL;
  1228		}
  1229	
  1230		cpumask_copy(&spe_pmu->supported_cpus, affinity);
  1231	
  1232		spe_pmu->irq = irq;
  1233		return 0;
  1234	}
  1235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
