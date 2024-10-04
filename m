Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EE01BF24;
	Fri,  4 Oct 2024 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728083329; cv=none; b=ibZ5NNgrdyVuypbzzgosKuuM+sgArRAEiCZPQcWRNhffH2/Tfl254JwMbVRrXbtwM3fXfY6LMzS5owIsy5lyCILcZOO/lEiN/m7B6ADyKp/aIvlxyKPcdp3RmE2+ImJbTcu7oP8ERaDU5X0BCAxc4Drr53kd8CuWz8Fg/n8rHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728083329; c=relaxed/simple;
	bh=O7OVkVgHnNgcV/+46lk1FqL58KCVJdC+kuoAu9fv//k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnDzNn2IBCuFx7XQxxPthuVPBNQECgaX3Vl4oBB4OrQyAxMbdOkW+PkkS6cg0rSDPSMZp2WfqctxN2M6d4QyHSL8A9+zW9NTuyI/LQwceGCg1spjRqZd0zeDxc00W7bXYRRLHopXAxUIQb9C6+6VmkO8cPWQdaRgyrSMUm0LR84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJPCbKvG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJPCbKvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728083327; x=1759619327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7OVkVgHnNgcV/+46lk1FqL58KCVJdC+kuoAu9fv//k=;
  b=eJPCbKvGqVegnSRSdYjTpOmrL5YgbD49pSY+ZMx7X61Npxwkli1Xo6XF
   Wfb1kekWYCuKfTycBLJPmvNtfKfO1pqSsb0IGKP8nudrGJc+DXUvnHhZY
   HqgnakGFqZxICqfO48vZsRLEXUYg0825ZUva4f0IvqeIkPt9ZItyrHiuy
   mbp0uFPQ7kVU88nnHQJQmzkMRuRfwIx4bcP96tQEMYazHvPGOq2bKjIIq
   4SIyFmucTiyBELg7bhaeZCWo6QwQ+70kI48qp3AU36AYBeMHPcM/8Fkqk
   rmmq8p7VVVmnvsxJHVzSmmhYZkSEOHbmRcvFHYfEaYEo+qDjH68XifXyP
   g==;
X-CSE-ConnectionGUID: zh9PPhv3ROmvjGDzFZ8HGg==
X-CSE-MsgGUID: FZQkTFAfRK6n/KW+UJwXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38683819"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="38683819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 16:08:46 -0700
X-CSE-ConnectionGUID: dFU+zBcjTvGyuXax+jCL6A==
X-CSE-MsgGUID: xmAUUbcLQd6gxWKGaku+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="79622433"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2024 16:08:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swrPe-0002Jg-2r;
	Fri, 04 Oct 2024 23:08:42 +0000
Date: Sat, 5 Oct 2024 07:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
Message-ID: <202410050620.4sYPbMYO-lkp@intel.com>
References: <20241001180658.76396-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001180658.76396-2-wse@tuxedocomputers.com>

Hi Werner,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip lee-leds/for-leds-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20241002-020814
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241001180658.76396-2-wse%40tuxedocomputers.com
patch subject: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: i386-buildonly-randconfig-005-20241004 (https://download.01.org/0day-ci/archive/20241005/202410050620.4sYPbMYO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050620.4sYPbMYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050620.4sYPbMYO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hid_allocate_device
   >>> referenced by tuxedo_nb04_wmi_ab_virtual_lamp_array.c
   >>>               drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o:(tuxedo_nb04_virtual_lamp_array_add_device) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: hid_add_device
   >>> referenced by tuxedo_nb04_wmi_ab_virtual_lamp_array.c
   >>>               drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o:(tuxedo_nb04_virtual_lamp_array_add_device) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: hid_destroy_device
   >>> referenced by tuxedo_nb04_wmi_ab_virtual_lamp_array.c
   >>>               drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o:(tuxedo_nb04_virtual_lamp_array_add_device) in archive vmlinux.a
   >>> referenced by tuxedo_nb04_wmi_ab_init.c
   >>>               drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.o:(remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: hid_parse_report
   >>> referenced by tuxedo_nb04_wmi_ab_virtual_lamp_array.c
   >>>               drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o:(ll_parse) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
