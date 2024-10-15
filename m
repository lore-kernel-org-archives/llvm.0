Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0091BF2B;
	Tue, 15 Oct 2024 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984765; cv=none; b=qwnBgpGq/7AzyZbOm5ULIrurNPHaWkYlkAoKUSZaFJNMZoWoICnY5j8sfEQ1B9Z4jSRvnv44nGJknaAEA+NMD07X6RLsbRdlTdaE81t5eu4akW79FXt7uD6UeJ0n+AJoy9YdXmr9abGNU/2CfTGpmBNf2rBNPr459q4U7kGIQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984765; c=relaxed/simple;
	bh=DwXAbaj6iK+ikSt7t5O4YawWvOvZYFFiTORjiswVQak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toqXH/BM0krJEVb+05sLB84/U/JETwMyaiIxNElI9NKXlgn16T8Mg4j9W71HNkqGniWfE7uDJilFfkk7VvILWI8AkBqeZr06OUnCxyT2e3rBZkqpC7oPH6QvQBl4oTymKvkqx8OQ/8MFHBXE2JwRx7LJYtfxCF4o3+EGh0htZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2+cFv9U; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2+cFv9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728984764; x=1760520764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DwXAbaj6iK+ikSt7t5O4YawWvOvZYFFiTORjiswVQak=;
  b=U2+cFv9U58M1kVoi2MCpr36vg4FW/L0aTIE932aX+u8A8EArlPpN0ryO
   MJ2WSOseA91KplVFosc/f38i/btQ7IgbESYqFr8iV1Kpd6c5RRnoc7u0k
   QU9ZFhEQXTHcWBQwI0YlHx1Q6WjlHXqVtJqvMxTPMAAlCXAI8+tL7Ut2E
   2nT27XP6oapbm1ZWIsKoS6/73BXaPirTIfTbVwwKxE0HRZVDusAZsULgR
   Z6UtDt3YyATZwRbYRa6WdWJfqjA2aBmxlmpptN+zDysn9mJ7db4cQDGll
   g0BKnN9v2uIsOSBXZHi1jM5KzGzVPihWEim8s/pmTtBZxtZRPZAVNHr8V
   Q==;
X-CSE-ConnectionGUID: W1cIMR3OSb6Vn8MhKSvPEQ==
X-CSE-MsgGUID: LIMUuTD5T7ScHJAmSjzveQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39756193"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="39756193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 02:32:43 -0700
X-CSE-ConnectionGUID: 5bGJdhoxTrm6JryRqu//MA==
X-CSE-MsgGUID: hnhVU1fWQHqxY7sBb6MPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77505309"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Oct 2024 02:32:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0dux-000Hsl-2J;
	Tue, 15 Oct 2024 09:32:39 +0000
Date: Tue, 15 Oct 2024 17:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Duan Chenghao <duanchenghao@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] USB: Fix the issue of task recovery failure caused by
 USB status when S4 wakes up
Message-ID: <202410151722.rfjtknRz-lkp@intel.com>
References: <20241012094633.126736-1-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012094633.126736-1-duanchenghao@kylinos.cn>

Hi Duan,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.12-rc3 next-20241014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Duan-Chenghao/USB-Fix-the-issue-of-task-recovery-failure-caused-by-USB-status-when-S4-wakes-up/20241012-174830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241012094633.126736-1-duanchenghao%40kylinos.cn
patch subject: [PATCH v3] USB: Fix the issue of task recovery failure caused by USB status when S4 wakes up
config: i386-randconfig-004-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151722.rfjtknRz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151722.rfjtknRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151722.rfjtknRz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/core/hcd-pci.c:637:13: error: use of undeclared identifier 'hcd_pci_freeze'
     637 |         .freeze         = hcd_pci_freeze,
         |                           ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/hcd_pci_freeze +637 drivers/usb/core/hcd-pci.c

   631	
   632	const struct dev_pm_ops usb_hcd_pci_pm_ops = {
   633		.suspend	= hcd_pci_suspend,
   634		.suspend_noirq	= hcd_pci_suspend_noirq,
   635		.resume_noirq	= hcd_pci_resume_noirq,
   636		.resume		= hcd_pci_resume,
 > 637		.freeze		= hcd_pci_freeze,
   638		.freeze_noirq	= check_root_hub_suspended,
   639		.thaw_noirq	= NULL,
   640		.thaw		= hcd_pci_resume,
   641		.poweroff	= hcd_pci_suspend,
   642		.poweroff_late	= hcd_pci_poweroff_late,
   643		.poweroff_noirq	= hcd_pci_suspend_noirq,
   644		.restore_noirq	= hcd_pci_resume_noirq,
   645		.restore	= hcd_pci_restore,
   646		.runtime_suspend = hcd_pci_runtime_suspend,
   647		.runtime_resume	= hcd_pci_runtime_resume,
   648	};
   649	EXPORT_SYMBOL_GPL(usb_hcd_pci_pm_ops);
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
