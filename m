Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108216D33A;
	Fri, 21 Jun 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966223; cv=none; b=nU6g+3pLT+CWkxCkG91mNaUX/A+Tvumpku+mzRMIpPSgO5ICS91euPz9N3kuYU2JDXX50CwLURU77tuAMYYQl7jpa+PldhtheZCi0B+jKEm5vAWrYP+f7BkGJ0cdd0Cuwk/dUxUQPZyaVb8rmeeLYvjHVykh7EdlvfaADutdoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966223; c=relaxed/simple;
	bh=tZpjYMvrOzZxe5tS8XoMzGxFQgrVwTSKZizhwHVeYBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsKDzZlz6DG5PxjCkUJ7qFplrFTIAPFR9mL/T106cDSHvcjx1q0NGTPgqfiSdkSBtXG6RnTHTuBQrEYki+UQ8C6cJk2ww11Bobm34ZTlRkHVfDPExUQ+FAQEVWvLzqbF3HPVBZw/y2tkNoq0Kr+An5hgN3Smu6LbxJsZT3o33WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FO9I+OX/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FO9I+OX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718966221; x=1750502221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZpjYMvrOzZxe5tS8XoMzGxFQgrVwTSKZizhwHVeYBA=;
  b=FO9I+OX/LbDxXUL6hw+SM1sLyD7TZvgkm8c04umNtMOzZ4mHAGcFhPlj
   +J94dfK7QkJrXjXG7wbVyi+NLcrxRD50kHN70q98R3HOQpU48bTvjd25M
   c1wiid/CMxONqfaqYL04P5t6TPYWPG5UTOwCjaPtFS+NDD1z6REHVV/WA
   2JmvkGfygIPStU+XXd94jquDXFVzxfNVqeW9zlBgU1a6JkJ6dKh05KkX1
   Dbt+R9O+BX1/r/rMan/el0dyn2XZNvcnucQ/4a4g1zRCeDSEoWNMCbO6P
   lYZOYdzOp6lGO6woRbkfZm5T7tdA0J+Uw9e0r1Q+QHvBpmeXkcwIzsWQy
   A==;
X-CSE-ConnectionGUID: A+OC9SfcS1CZgP68YtNmMw==
X-CSE-MsgGUID: 7AwBcWqHTS24Vst7pbA7gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18902406"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="18902406"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 03:37:00 -0700
X-CSE-ConnectionGUID: 3Y/64gknR+uAuGGmUswNuQ==
X-CSE-MsgGUID: Oi9Mtse2T/KeDOz+NldDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42630550"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jun 2024 03:36:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKbdZ-0008TK-0n;
	Fri, 21 Jun 2024 10:36:57 +0000
Date: Fri, 21 Jun 2024 18:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 2/15] ld.lld: error: undefined symbol:
 __ia32_compat_sys_io_pgetevents_time64
Message-ID: <202406211852.a1e7U4K8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   c2dd777003347c510f9fecc965fb3e65d7c79a43
commit: 15153fb4dbea2439f889a2edf580c245559de325 [2/15] syscalls: fix compat_sys_io_pgetevents_time64 usage
config: x86_64-randconfig-013-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211852.a1e7U4K8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211852.a1e7U4K8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211852.a1e7U4K8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __ia32_compat_sys_io_pgetevents_time64
   >>> referenced by syscall_32.c:38 (arch/x86/entry/syscall_32.c:38)
   >>>               vmlinux.o:(ia32_sys_call)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
