Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656083;
	b=Crq3SIoTbd6vc0w3FVy05RNmtYrbgOtRXhMRk6f3YJ4A9liOYCapcJyhHjFOaLiLOGkF
	 bk5VBZQecA/Rq7F126RnCC+Zl/20kaVuPZNWBKi8lpA7BfS6FkpXNyQOpUKfKUzlG2BTg
	 hIVKtAu9IryBuPuXFrLX+ZToXoQ0Sclzqsk/jIKb6L+nlpY1hKkVbtvdYMfE4OkfNyFiK
	 +dQSkHsQbfbiJvS2FBmnxDfh8JWIoJ1COr2uP2dBtxN6X8eyYUANNnmbt8PAmCZObY/lO
	 XtNjPsbUL7HVLz/NNRgpVoZqFokG1fqfsbouX8G8J8PJzLcGS+rhhFYlD0RuPor2wng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aUDLACHlyrxhpmZGNWGB4QTE3dHwiL05kQfWOo8WH70=;
	b=KQMvqWiEPXPdMl2cEULm6x73VkWajSG1VtITVnrGSqmGiMhZxZ65yNeljOjZaforBMvC
	 D26MQMkYZEGAcKxFwWBdHyL+RJ1KzKMLHaqQLhJGeIBd1lS+9pxR6hjiI7KQACu5w4AgA
	 OX/pNupFV86P2va6xvrGGu8Y5BPSpymOd1q8C7C45i+zF3htYbxgBtjLQ/bl2a/qxrrxN
	 dMVm5Lgpg48GcjoNekPIcdmThXw93CmdqGSR7AqSNhiTygjRAD8XVEECpRcfWRvjaJb+g
	 P25COFIPy2O/mdull3Dyz0CEYTSu8nFVQMBYSUV/CPdk0YO/wtjHP8pUEA5r9TfSaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4IPz6gm;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2076606D822;
	Mon,  2 Nov 2026 21:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2076606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4IPz6gm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793656082; x=1825192082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+k5sFKZYE6g5VogYmHeXbYF3Ix0grhxDoNMr2/mr34A=;
  b=a4IPz6gmMJVst3i2JOE56FC2u1jH7W4Jc6X63RRZ1XOJzvt2ECSqED6q
   /DhlKqfqrwHlTFLo50chX4tmnLB0d/bjgK2yc0bHSSarE5OLd0pNTSxp+
   NQMhowFnHWVnR+9J+DcWUMEUQOX2kOKxZSrmE3GAeF78LKixXytB4cylg
   uvZjaWZT/GC9ODlOanG75i6RVKQIV1qVX9tbcL6TUY+rD7j2ywUbmysnq
   umFT++86ZZh85DNEHnIVaHzITJzA0mz7IRGVNH8yTUvghIMh+G0BBbg/b
   12+3ZNjhTPmezdnumBz9Lup6t7lr6zCJIbjFKmeB+s1lc6ypm7HBs3ctU
   w==;
X-CSE-ConnectionGUID: eePJUYwMReKAhxH+Rhj/0Q==
X-CSE-MsgGUID: MZBh+oGXSLuNpNqujEEwOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2373265"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2373265"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:47:59 -0800
X-CSE-ConnectionGUID: wkZDEhLfRpyproKLtvzocw==
X-CSE-MsgGUID: ZcDCcwAfR72GqeNUK/o4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="8069525"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 02 Nov 2026 13:47:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNzsg-00000000htI-0DiS;
	Mon, 02 Nov 2026 21:47:54 +0000
Date: Tue, 3 Nov 2026 05:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Baorui.Liu" <baorliu@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org,
	kernel test robot <lkp@intel.com>, "Baorui . Liu" <baorliu@amd.com>
Subject: Re: [PATCH v6] ACPI: button: Report wakeup key only for power button
 wakeups
Message-ID: <202611030545.3st9p1ha-lkp@intel.com>
References: <20261102091049.856-1-baorliu@amd.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102091049.856-1-baorliu@amd.com>

Hi Baorui.Liu,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baorui-Liu/ACPI-button-Report-wakeup-key-only-for-power-button-wakeups/20261102-171049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20261102091049.856-1-baorliu%40amd.com
patch subject: [PATCH v6] ACPI: button: Report wakeup key only for power button wakeups
config: arm64-randconfig-1001-20261102 (https://download.01.org/0day-ci/archive/20261103/202611030545.3st9p1ha-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030545.3st9p1ha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030545.3st9p1ha-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:27:
   include/acpi/button.h:28:15: error: unknown type name 'bool'
      28 | static inline bool acpi_sleep_pwr_btn_wakeup_pending(void)
         |               ^
   include/acpi/button.h:30:9: error: use of undeclared identifier 'false'; did you mean 'else'?
      30 |         return false;
         |                ^~~~~
         |                else
>> include/acpi/button.h:30:9: error: expected expression
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:29:
   In file included from include/linux/pm_runtime.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:133:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:29:
   In file included from include/linux/pm_runtime.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:133:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:29:
   In file included from include/linux/pm_runtime.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:133:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:29:
   In file included from include/linux/pm_runtime.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:133:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:29:
   In file included from include/linux/pm_runtime.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:133:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:29:
   In file included from include/linux/pm_runtime.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:


vim +30 include/acpi/button.h

    17	
    18	/*
    19	 * Set in acpi_suspend_enter() when the fixed power-button status bit is
    20	 * observed (IRQ-disabled context). Consumed by the button driver on resume
    21	 * so KEY_WAKEUP can be reported without calling into the button driver from
    22	 * that early path. Implemented in sleep.c (built-in); safe when
    23	 * CONFIG_ACPI_BUTTON=m.
    24	 */
    25	#ifdef CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT
    26	bool acpi_sleep_pwr_btn_wakeup_pending(void);
    27	#else
    28	static inline bool acpi_sleep_pwr_btn_wakeup_pending(void)
    29	{
  > 30		return false;
    31	}
    32	#endif
    33	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
