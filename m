Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF82F5E;
	Sun, 13 Jul 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752393500; cv=none; b=OTAz7nEEht8sbY3aU4IW+1jmENMnTt9Fb16LDmazYgZ3cHagxeVoC5Dln3zPZeAUXUVcm6qO19ETGCfCtgnnDkoY+XU5UfBMjuk4hkxOulo2b4W+G0DY12+lF4r9+uZ8JrD5YA1hC4G2wJ+/qQVZ2yVXocLRgD7NplWOq9JE9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752393500; c=relaxed/simple;
	bh=gPDVAIYKkyLg9OAsg/werxjtALsfHc3gBbJFhuQwwDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpaiEzQ+8o0eOGK6/isuLiSqhqHjpLv0g/nustE6ubD1R2X3seYdyh7L6LkOJHXTqiEg3k+Y1HSPbNtNldR/KMqBeSKQ6X74ue9Jcq5d2dmu3guvJvra1I74+5PnqL3SP1ulaBLL0VxoPWAEJKDdVjIV3yLacoMMKpMnvhjwXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLHf1rjD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLHf1rjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752393498; x=1783929498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPDVAIYKkyLg9OAsg/werxjtALsfHc3gBbJFhuQwwDA=;
  b=cLHf1rjDX7A2zeExL7XVLY0cuqwcuZJwOu9i4kshBOEOoMuA4wJFA5aA
   CuuUJ1PmBQznOpYZc6YDJOEKn4GkAnQmO8vjoa4PiE0QIZASrifkEI/di
   b6D7IBISy5PTpaLKnnUIFjAoaL2/doHy7cjgUjKIV/tSs02a2gmVR+esZ
   34MMTWBHz7KuR/GtV/z1+wqsw7jCn1mLYExx+W+gTx0Y4zccxkhI2NxM9
   nA1bPUiQH5bbRELHVQp35HOpl/X4NSECyPas/1NQ7iBE90RLDn9Njxw0/
   Zhe4+oL2z+6g1fzyr/Hf6EqaRLZgkxIhW3inNxpfrvOYhCkQvTDtJEith
   w==;
X-CSE-ConnectionGUID: yqcrDdtJSVG3vjDLHx6VBw==
X-CSE-MsgGUID: x99i6GoMTYqEg5bm0PELYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54332109"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54332109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 00:58:17 -0700
X-CSE-ConnectionGUID: OMrvdtKSQCi/dPjcR1okMg==
X-CSE-MsgGUID: ZNmExFbcR1eEOnPPVYslbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="193888726"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jul 2025 00:58:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uarbB-0007yt-2k;
	Sun, 13 Jul 2025 07:58:13 +0000
Date: Sun, 13 Jul 2025 15:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 2/3] rust: io: mem: add a generic iomem abstraction
Message-ID: <202507131504.oJlec0Lk-lkp@intel.com>
References: <20250711-topics-tyr-platform_iomem-v13-2-06328b514db3@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-topics-tyr-platform_iomem-v13-2-06328b514db3@collabora.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on f5d3ef25d238901a76fe0277787afa44f7714739]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/rust-io-add-resource-abstraction/20250712-063449
base:   f5d3ef25d238901a76fe0277787afa44f7714739
patch link:    https://lore.kernel.org/r/20250711-topics-tyr-platform_iomem-v13-2-06328b514db3%40collabora.com
patch subject: [PATCH v13 2/3] rust: io: mem: add a generic iomem abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250713/202507131504.oJlec0Lk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131504.oJlec0Lk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131504.oJlec0Lk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `request_io_by_index` found for reference `&rust_doctest_kernel_alloc_kbox_rs_7::kernel::platform::Device<Core>` in the current scope
   --> rust/doctests_kernel_generated.rs:4671:26
   |
   4671 |       let request = pdev.request_io_by_index(0).ok_or(ENODEV)?;
   |                          ^^^^^^^^^^^^^^^^^^^ method not found in `&Device<Core>`
--
>> error[E0599]: no method named `request_io_by_index` found for reference `&rust_doctest_kernel_alloc_kbox_rs_7::kernel::platform::Device<Core>` in the current scope
   --> rust/doctests_kernel_generated.rs:4751:26
   |
   4751 |       let request = pdev.request_io_by_index(0).ok_or(ENODEV)?;
   |                          ^^^^^^^^^^^^^^^^^^^ method not found in `&Device<Core>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
