Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B85C72627;
	Sun, 23 Nov 2025 02:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863469; cv=none; b=G9uvwoaV2VPXbHZGOFIchVT2rHLbm8kL7q+9WeXWAhOw65BVy/2e94QoB2KfYbiQ2jENj7qPkjXis1p5JJUBu5N0b+8vSoIZsfnNMyKZDsHVkYsP1dPYO3NUjzML5K5Tfdh2GokB7lRcspYeJNdx57Px0kt7GOr9GoxA8LFtwro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863469; c=relaxed/simple;
	bh=6M5sy1UedToqUBfoWHhK48XAKgOba8jpQlWiHB9q1jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLhy7/bypGMXXzUOJQPyGVoWiwYOrrLodXJxqIFuY2YPjB2tebuWitldFwitF0Ch/lV7pFI7oGxPtpKoafZV4qxYx3pZ2m8QPGEKq4tIYIReP468mFePX/idEG9QZZtkAP3LUrL1q30856bL92EqTKaTflDtM2lbm5qeTOFOtfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FW74uaD+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FW74uaD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863468; x=1795399468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6M5sy1UedToqUBfoWHhK48XAKgOba8jpQlWiHB9q1jI=;
  b=FW74uaD+5IrX30ne9B4MT168LG6xeTBN5ZSqIrEU1RxJ0tIN+HLdXfp5
   TrElCNQbL6365OrlGRSff/b43EXtbHFuv9EDIV4J7tN4t81Xps562gbo1
   0fJ79J10tr1mHXdjjzGXbHsVUX06QUYwgKqRssFjBSZUAHSEUWtRBE+mh
   /y9cN+J6aNYW9ogoi/Pxvp0p6IMNiER0L/wFIAXbMEwCwPLL6apjyvdPm
   M+wk6LRjpWgO4YQ25+EBgoyyyS+uPlquCk9Jq9UbpAkfc7Anv2Ks9xYw0
   23b9s5XyNl9s9PUhvNXbvJu3/8fNHL9V7gJZUJbCgt0UXLQDClDraI6/H
   A==;
X-CSE-ConnectionGUID: X5qJ/FgYTPeZNt6JLxZQiQ==
X-CSE-MsgGUID: +bIvyDTpRjePtnYe40ZVsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="68506707"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="68506707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:04:27 -0800
X-CSE-ConnectionGUID: kcKkESdnRKSWIYCdUWCSkg==
X-CSE-MsgGUID: vN6mO7tjTSKWVkqhZmvdRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="197136300"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2025 18:04:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzSh-0007zD-0C;
	Sun, 23 Nov 2025 02:04:23 +0000
Date: Sun, 23 Nov 2025 10:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Dittgen <mdittgen@amazon.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/13] KVM: arm64: Implement vLPI ENABLE ioctl for
 per-vCPU vLPI injection API
Message-ID: <202511230916.se6WfyxG-lkp@intel.com>
References: <20251120140305.63515-6-mdittgen@amazon.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120140305.63515-6-mdittgen@amazon.de>

Hi Maximilian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[cannot apply to kvm/queue kvm/next tip/irq/core linus/master kvm/linux-next v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maximilian-Dittgen/KVM-Introduce-config-option-for-per-vCPU-vLPI-enablement/20251120-221612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20251120140305.63515-6-mdittgen%40amazon.de
patch subject: [RFC PATCH 05/13] KVM: arm64: Implement vLPI ENABLE ioctl for per-vCPU vLPI injection API
config: arm-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230916.se6WfyxG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230916.se6WfyxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230916.se6WfyxG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-gic-v4.c:10:
   In file included from include/linux/kvm_host.h:40:
>> include/uapi/linux/kvm.h:15:10: fatal error: 'asm/kvm.h' file not found
      15 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +15 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   4  
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17   8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  10  
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  13  #include <linux/compiler.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  14  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @15  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
