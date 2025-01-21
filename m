Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD34A32;
	Tue, 21 Jan 2025 01:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737424730; cv=none; b=jNBDJhIXlhEovA0sf/EfdX/KBK3OHTpE0AX0bsW2s6wLbx+qMZ/9Bam6zpO4IEZs4hVRGAd7OucdEaZlqAEq18gibYFAkyy6xA3KoO+fMiPp3a1mWhAcqi0i0QZpEXXlzQ6hkDKBWYp0iraD4H44KaGmzkMUiV/lEH2Ent9yLYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737424730; c=relaxed/simple;
	bh=raUKQDAysB8UV6QvG6k5sxNodocoD71iLSB6wRtr70k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onfqh2VzICMAxI09ksYeNv6sgKO7aatM4khsnQ7m5VUMg6D6cVROc6XTA0IhdhilG69FHIwOIqwTeVUJJBMZfQyyDMr/17FQIYoHmE9KzSl6untxttnrOlvvqN1DrSlS8umIcI1VY1S8YCcTNs8RPBOqZJc+VI7YxrZvZ4yjAOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PF33qMqV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PF33qMqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737424728; x=1768960728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=raUKQDAysB8UV6QvG6k5sxNodocoD71iLSB6wRtr70k=;
  b=PF33qMqVmVMQEJyQieD7ZrORJ7SY7QHhpIJ1biAdsxBMGYNyXfCyW2Rn
   SUr703iZAPyz9WNw5JPgTM4UjljAy8KQhiPw8IhejycBRThhenJIZtITf
   Wp1YWAl4uuXloLkCMqEueUj6ficrvbRuwGsu10K12h1CYGijOuEsSFadi
   SOQ1yUcW4OVp9JK9/dyRpa/2B0MNY5u4/9HBO/HrCdAbzk1ntNI7vkltC
   zoAMBqXEmSJUgfPBImmAa5oujnpWoz+3P6w4Tarbg+av5F3/kCXQbOU+K
   LnX83PEO37VjW9gnbeyCIVKNbqWRK5caXrQPAZ8pfpWO1lQyeDFw90Zr+
   Q==;
X-CSE-ConnectionGUID: fLkYCQUiQcub+hAzmRoNVA==
X-CSE-MsgGUID: ek401QlSRCK7dL2w8/K0Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="25425232"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="25425232"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:58:47 -0800
X-CSE-ConnectionGUID: JhXlER2rQUGYG7miP5JBow==
X-CSE-MsgGUID: 7eqw6VScS0iNql5ZnzO5Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111634959"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 17:58:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta3XP-000XTz-06;
	Tue, 21 Jan 2025 01:58:43 +0000
Date: Tue, 21 Jan 2025 09:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Basharath Hussain Khaja <basharath@couthit.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 2/2] of: address: Add kunit test for
 __of_address_resource_bounds()
Message-ID: <202501210916.KXb12BAV-lkp@intel.com>
References: <20250120-of-address-overflow-v1-2-dd68dbf47bce@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-of-address-overflow-v1-2-dd68dbf47bce@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/of-address-Fix-empty-resource-handling-in-__of_address_resource_bounds/20250120-221141
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250120-of-address-overflow-v1-2-dd68dbf47bce%40linutronix.de
patch subject: [PATCH 2/2] of: address: Add kunit test for __of_address_resource_bounds()
config: powerpc-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210916.KXb12BAV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210916.KXb12BAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210916.KXb12BAV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> WARNING: modpost: module of_test uses symbol __of_address_resource_bounds from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
