Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3BA8F6D;
	Sat, 27 Jul 2024 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722113682; cv=none; b=qTy/Ss9tcNr8bBXFwaTx6W7URwSM0WPRvqjKcJA4313+z/Z999Xn0SA02wnG9tG36XE22cHu25kHyrHZNslpFwQgp/3L0pcW6zfSEvfNiGPIUJFUtNcMnaAhtzUoEYJ/7J9jJhfCePxJG/LEQMdiCwFZlhlOw1s4iOSxqPd4Wzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722113682; c=relaxed/simple;
	bh=3Wbu24ZpypYEMy8OcpmsEZMljDa15vew8oB/K7YycDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIeRBhCTKWX0MddAf62r++zmJcSf3Q0t5WJhky6Y3Vsu5gbpbScd0nEeTlFyJH6bgTAMQ4riWNMFRgQ4SHt9B6RQtUYknUbr/T2IUEkK27PYMBQ8SxiKRGnhku8uzQQsr9FPSKmV2DOgWoZb7XryvD3ejfJkYKGv9EKT1SyGwH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6YEvXUB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6YEvXUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722113680; x=1753649680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Wbu24ZpypYEMy8OcpmsEZMljDa15vew8oB/K7YycDs=;
  b=Q6YEvXUBbAkr0V56WxK6K/UHzrYROUaSMKHe9xVD4JX3uIzxyn3b1BZy
   KHmJL0XF4tv9jYYCdlWjVXubMhyS6mUjmqzeWeIexGOrPiGu7e0ak0yHc
   hcEGJX3IFNqV2Pb3tVmSFYLqAPt5iM94KsC0I8uejbL696dge6RSlgwid
   LXFwivV3A59j5QexzeM4e7h1lJ6Vq0VU5+iDwB5GrTm4GoIaPPUgEQ/QY
   Gl5xwRriHerpvqoQMNQlTdkV+1rcIXXoR6n1fnoDiVma4x1o+O8rScSv0
   lKYfpREKF+AUFnBddrL+xYzUVp5KBVFzkPBTIcsPMuJYfrtlpCqhYjIBi
   Q==;
X-CSE-ConnectionGUID: ARlVzdyGTyOsuqtyNJYGqw==
X-CSE-MsgGUID: I3RdvyE2RIS3sRdrtly2Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="19490993"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="19490993"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 13:54:39 -0700
X-CSE-ConnectionGUID: GBlpMMdIStSZZSKWhWwQEw==
X-CSE-MsgGUID: JyyKlSTiQ6OPV9+0wR7MZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53654865"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2024 13:54:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXoR2-000qEC-1o;
	Sat, 27 Jul 2024 20:54:36 +0000
Date: Sun, 28 Jul 2024 04:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmclock 22/22] drivers/ptp/ptp_vmclock.c:470:1: error:
 expected expression
Message-ID: <202407280413.gDsj8ZO6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux vmclock
head:   54c99ce14ab0f5db82ef9bdfbfcd4c2633c486a8
commit: 54c99ce14ab0f5db82ef9bdfbfcd4c2633c486a8 [22/22] ptp: Add vDSO-style vmclock support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240728/202407280413.gDsj8ZO6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280413.gDsj8ZO6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280413.gDsj8ZO6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_vmclock.c:470:1: error: expected expression
     470 | `       status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
         | ^
   1 error generated.


vim +470 drivers/ptp/ptp_vmclock.c

   456	
   457	static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st)
   458	{
   459		struct acpi_device *adev = ACPI_COMPANION(dev);
   460		acpi_status status;
   461	
   462		/*
   463		 * This should never happen as this function is only called when
   464		 * has_acpi_companion(dev) is true, but the logic is sufficiently
   465		 * complex that Coverity can't see the tautology.
   466		 */
   467		if (!adev)
   468			return -ENODEV;
   469	
 > 470	`       status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
   471					     vmclock_acpi_resources, st);
   472		if (ACPI_FAILURE(status) || resource_type(&st->res) != IORESOURCE_MEM) {
   473			dev_err(dev, "failed to get resources\n");
   474			return -ENODEV;
   475		}
   476	
   477		return 0;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
