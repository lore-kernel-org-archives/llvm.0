Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4B33B940;
	Wed, 25 Feb 2026 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040959; cv=none; b=X33gO4dk4ZTpmBpCMdlVFQ4gYGSkOQqAiP34z2k9rDsGdYUWW7Lp5MM46K9zYRluVvnqJa1CeIldRwz2/hyZyhRYzD43uXiqxCQ+PpRE5F5PobgTpqE/Bq4NRbP8Jyby+uxHqlysHSwQ+vyORfmHr22x6TitW8IVCYIjZOanZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040959; c=relaxed/simple;
	bh=jTkuq+opRJ8JdWnn0p+R4+vuxQ1w+E8Ucex1LO69KGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BYYS99vzl1L65n5XhgX2QM9aJSOlL+7e5kevUOKTy+EPo3qWI/eyjzu5jP/5AHfkwVWS1NYnIe7b8jK+pMxSJFibBKLcLU8EBpmnu2pehDK3bScB6fydY4tABGA/QrVFqr2tY6wZqZ8Q13/gYiY6U7mPCM4uVAnQ2GWTkHWDvbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFi4eQZt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFi4eQZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772040956; x=1803576956;
  h=date:from:to:cc:subject:message-id;
  bh=jTkuq+opRJ8JdWnn0p+R4+vuxQ1w+E8Ucex1LO69KGM=;
  b=cFi4eQZtSkFJsQzdcX7zw2dXefN2RkTDdcJCGLxesLl85mz7X2VWKFrV
   61uaVPMzku9/DPAuH2aYCnvz3l49+yGH2oj0zZZCqEVMud7M/wT5PwAUf
   QIDutrGyLIl1QzXZnd35FMdhjomJ3qzNhBwWPy60YHckMCuv/K5OevTrB
   ADpm//DpYZUHbVSgtwxsFVtbuVSqm6wsTr1iSOpbp5EP+fw3KhXTijDt3
   0NE2hGfWh7a6tJdiD4GFWclsJztZqOfWRfxP8YawKHWndEmy3BlGdc/DD
   FHqwgD1Mbn3VR6E4UWS2C0yiYn2pxwOa0/n9leGwq2kJFFatG3ccKhr10
   w==;
X-CSE-ConnectionGUID: pzCXqkR0RfGff+NMzYCSRg==
X-CSE-MsgGUID: QBfbFcizS7St70RYbrgpoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84182786"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="84182786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 09:35:56 -0800
X-CSE-ConnectionGUID: lRQqfHoJS7CPFodJMr/hYw==
X-CSE-MsgGUID: BNOSVnv5Qh2FXNuzzhu5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="214576039"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Feb 2026 09:35:53 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvInf-000000006ok-2aJt;
	Wed, 25 Feb 2026 17:35:51 +0000
Date: Thu, 26 Feb 2026 01:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:bleeding-edge 76/102]
 drivers/platform/chrome/chromeos_tbmc.c:49:27: error: expected ';' at end of
 declaration
Message-ID: <202602260154.XIWu0fTw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   afb26ba421df11fad71fc4be9b874a901efb0388
commit: 37ca8e5f81981188405d5722825b58173c275fb5 [76/102] platform/chrome: chromeos_tbmc: Convert to a platform driver
config: x86_64-randconfig-072-20260225 (https://download.01.org/0day-ci/archive/20260226/202602260154.XIWu0fTw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260154.XIWu0fTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260154.XIWu0fTw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/chrome/chromeos_tbmc.c:49:27: error: expected ';' at end of declaration
      49 |         struct device *dev = data
         |                                  ^
         |                                  ;
   1 error generated.


vim +49 drivers/platform/chrome/chromeos_tbmc.c

    46	
    47	static void chromeos_tbmc_notify(acpi_handle handle, u32 event, void *data)
    48	{
  > 49		struct device *dev = data
    50		struct acpi_device *adev = ACPI_COMPANION(dev);
    51	
    52		acpi_pm_wakeup_event(&adev->dev);
    53		switch (event) {
    54		case 0x80:
    55			chromeos_tbmc_query_switch(adev, dev_get_drvdata(dev));
    56			break;
    57		default:
    58			dev_err(dev, "Unexpected event: 0x%08X\n", event);
    59		}
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
