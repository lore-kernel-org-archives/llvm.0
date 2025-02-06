Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D815199B;
	Thu,  6 Feb 2025 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738814485; cv=none; b=KboaCJRkt6uGkZCL1SF32cZGmXF4EOBID/g+V9FwoQiB/4t5xIIoJFj6HPHGerMsxgJa4TCxvSyKzvkBGVWA+Lm3dDHy5W9BfJRdCwE9a9DaiKxyZppWp1xsuUIYc+07zdoK6UvTG0d2xX26GqFJuV8AZ3+Vl8RqKTKbXnVreR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738814485; c=relaxed/simple;
	bh=VBG8ueTC/i8Z61HJM1RINScLHP8vnPug/fMhVPkSafU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGQasato9PVX8SVEPQ7oJSNkWno17JboS9WBE67s5Er09BQuEhhla8FDsOmXiKgiLeRQ3NONTDw+vGgiyPvovIJKtCm2XD2OEAYp6bgavb0/Axs9ybY9ya2ry76m8qf8DJ9jWGR90QHK4h9uMW0bZwiSbfGXpJsQq/edjTqpdlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q49FxVOb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q49FxVOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738814484; x=1770350484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VBG8ueTC/i8Z61HJM1RINScLHP8vnPug/fMhVPkSafU=;
  b=Q49FxVOb9RCkLZyMMwzngsYWx1GTMndgTfdam/IffYKkbhTZlafLMjpw
   ygeMY7l1Xzc+0wJ4byID/Fr7M6+DvHVaYn4noigXMmUXaetMmBHRkMS45
   R1pOVhfL597h3ZSqCo1E/K813fKZny7/jz73wBPha9tz9GnT7EZK8XLZH
   7hOBVoe2jsnNBiGZn+JsgsRdMe3YJ9FhliwqitY25n1zC0yLX9cdxLPoN
   B2TS1IsG62HwPXhHZ9HDXd072jr1rJTPkC7YIz1gWvEm3Gn1W5bt4kkuZ
   NMz04ElEWyrQ+tAc8I1SgT/H/cZra+lYCuiZhb/lEdTl4FOczNriSXFXE
   w==;
X-CSE-ConnectionGUID: kMP6E3BhRWqMJz09Kmmr1w==
X-CSE-MsgGUID: vsXX68sbT3e+T1GOpfeD5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39536947"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39536947"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 20:01:23 -0800
X-CSE-ConnectionGUID: 1rRFeGtWQWW/ht4EMl2fpw==
X-CSE-MsgGUID: TSGdv4oyQ8iuMrJ9FcnOEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116286043"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2025 20:01:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tft4p-000wQX-0A;
	Thu, 06 Feb 2025 04:01:19 +0000
Date: Thu, 6 Feb 2025 12:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.30a 71/73] include/linux/printk.h:319:13:
 error: unused function 'pr_flush'
Message-ID: <202502061107.63OiEuce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.01.30a
head:   a87cfdd8dfd5499a8b2e29a40ce4ad6ffca6eb56
commit: 1edbc527e3d6610b4781edba8e927ebca102eaf6 [71/73] fixup! printk: Flush console log from kernel_power_off()
config: um-randconfig-001-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061107.63OiEuce-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061107.63OiEuce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061107.63OiEuce-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/um/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:13:
   In file included from include/linux/bug.h:5:
   In file included from ./arch/um/include/generated/asm/bug.h:1:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:319:13: error: unused function 'pr_flush' [-Werror,-Wunused-function]
   static bool pr_flush(int timeout_ms, bool reset_on_progress)
               ^
   1 error generated.


vim +/pr_flush +319 include/linux/printk.h

   318	
 > 319	static bool pr_flush(int timeout_ms, bool reset_on_progress)
   320	{
   321		return true;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
