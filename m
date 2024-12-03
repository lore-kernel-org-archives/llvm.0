Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC0166308;
	Tue,  3 Dec 2024 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205899; cv=none; b=ZHba3oyFuY6v3KONXYmitp/wDjWhL4cwZhQu3SQwSBkyKATcVo7GLlpaiUYxXBlrrkMd4zjBIdoH5qjbhGlmVZKcrIrv/Xt9rG6w7Y+ltMDYxkbdyh/73LS7G4ifFOpvn8KBMznh/PZHdcTh0fqt/SAEEUHQOTjRIg97yp//0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205899; c=relaxed/simple;
	bh=BT83Re3GiDTTTTEsWas6izUc7PJ6WYHEM3jZoAJ95/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFFr5dBDw+C0lHyg/1j6CMxx9BYBp6glcm+3xrMmjDOuUZM/Lw0oz6vak8EX4jlIw/GVV61B+YPmDU5Rz3yM7Ooydyo3ps2RePmQIIeuy8Q2459g/QDVj9f8ZnN+iZNEyXyBokmQIa/G5EpqK6Bpz09jYqiFMrIHRT/H9G3Ba2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2omHsZw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2omHsZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733205898; x=1764741898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BT83Re3GiDTTTTEsWas6izUc7PJ6WYHEM3jZoAJ95/U=;
  b=R2omHsZw8R5JgRUCBBtSHdRHmnHUbH2dfZnYEcH3RfdYvQ4z8KrS8UUh
   GafSuqs3dC5g4+fvka9KQQF+tpq3ErK0YmVpzklbmUOe88n/f+zbp6lzo
   vAhZaGD4/k1YvucE5xfaszLFrkYym0pMPJn8K6TuAtbnhHiXKOCATe5I2
   QHBV8SFBcH577IXOZiOA6hXVNe6JcI4+xiw9N/5s6Yy/eWMCXmWQ60WM3
   Gwc8z/BaYf3rfwmIok/AXuQ4JQYxEn5hqZWuej2J003xPNZzkeezx9UCE
   j5TQI2RLNzq/2N3dBYdegnDt3iUzZrVL4WLqoDBN0uTGo+EUxn8PzIOhj
   A==;
X-CSE-ConnectionGUID: 4KDyBopOQ6S55H9dmvILxw==
X-CSE-MsgGUID: 4TU9VGDBRCyLfYIcYUmPhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32758579"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="32758579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:04:47 -0800
X-CSE-ConnectionGUID: W/jsw9LqTtCr7S/pP1lPzQ==
X-CSE-MsgGUID: KS9GA9HnTUqRTc7F2BmAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98104027"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 22:04:45 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIM1a-0000CF-2h;
	Tue, 03 Dec 2024 06:04:42 +0000
Date: Tue, 3 Dec 2024 14:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, gshan@redhat.com,
	steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
Message-ID: <202412031348.bp5i3ws2-lkp@intel.com>
References: <20241203000156.72451-2-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203000156.72451-2-jeremy.linton@arm.com>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.13-rc1 next-20241128]
[cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241203000156.72451-2-jeremy.linton%40arm.com
patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
config: arm64-randconfig-004-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
         |                     ^
   include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
     356 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   include/linux/mod_devicetable.h:607:8: note: previous definition is here
     607 | struct platform_device_id {
         |        ^
>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
     224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
         |                                                       ^~~~~~~~~~~~~
   2 warnings generated.


vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c

   222	
   223	/* modalias, so userspace can autoload this module when RSI is available */
 > 224	static const struct __maybe_unused platform_device_id arm_cca_match[] = {
   225		{ RSI_PDEV_NAME, 0},
   226		{ }
   227	};
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
