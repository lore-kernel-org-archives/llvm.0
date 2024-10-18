Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788B1509AF;
	Fri, 18 Oct 2024 03:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220586; cv=none; b=OMOo6+YQTHv9I5XSNQB2tznrh71SlTt0aqsZlf+/NjMiOt8ppuSsIzpuOcKAgoCMWTmjQmOP49r3Eu7hcesMnyS1V+0P/AQ1VxIhQLMhuVYt4ZgMEhMUxTh57+swyCIEF5K0NG04ky2pbkkNddpi6wXtNYG5FN7LH36ImFe/f9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220586; c=relaxed/simple;
	bh=kyXZIAP4Et8R+7JyclYm8M65sAcZ8G9p99HBRO+kfM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtcbBuPQ05mC7ZAZSg9ZTsUWm2WXU12Uk60tb+vsEnHB7chE0sL3S92GJdDmduiHbVHDCCMkY7ql8o1JgPgOF1uy6eGr/wIVxgrcJu0gGFMLMSHzlEdgn2oCABadg6jz+r7+p7jwoFMegCk7RAKV8Y8l6eAFBAH8eQ556c8iRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdHA9/xY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdHA9/xY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729220585; x=1760756585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kyXZIAP4Et8R+7JyclYm8M65sAcZ8G9p99HBRO+kfM8=;
  b=DdHA9/xYHT9MYPTV9wcqLaw2JBQf+ecLKYqxobv8T5NaWVSWofifq4Hk
   dCJ3y7Tq6dwidB3SMw2atIkzDuJP8nDb8J9MyVkVXEeBN9FU5VwzQSEz/
   lZUVmqPBJDPRG58PatPokWcfQU5j7ktWE2l6PLSvUx5qddDryIpfUcy7g
   n9ZWw/pE0OzCjlWMelsamEiBykYjDpAiVmc2wROoQIvrHu5UeEtpGhvZC
   YtTXasMn202J/cottbpgPHUUIqqKh+DogtXWEkeGjisW1TqBY3hT6fNZL
   KpZ0jT8POF6JgnSetGE6GayCeCvodtTJxinMHxhvcsrRlpZ3r+xRJ926a
   Q==;
X-CSE-ConnectionGUID: 6Nu/4f24TzWOf/Y75Ec3fg==
X-CSE-MsgGUID: 03z87WmsSUWy0LdNMMVPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28621308"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="28621308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 20:03:02 -0700
X-CSE-ConnectionGUID: gN4LXjRgQrqp2d8AZGJlBw==
X-CSE-MsgGUID: XnjKZdmUSZ+eHbVff6ldvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="83383154"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2024 20:03:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1dGU-000NCV-1w;
	Fri, 18 Oct 2024 03:02:58 +0000
Date: Fri, 18 Oct 2024 11:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: jeffxu@chromium.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/1] exec: seal system mappings
Message-ID: <202410181037.HW3qkHxT-lkp@intel.com>
References: <20241014215022.68530-2-jeffxu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014215022.68530-2-jeffxu@google.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.12-rc3 next-20241017]
[cannot apply to kees/for-next/execve kees/for-next/pstore kees/for-next/kspp tip/x86/asm acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jeffxu-chromium-org/exec-seal-system-mappings/20241015-055145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241014215022.68530-2-jeffxu%40google.com
patch subject: [RFC PATCH v2 1/1] exec: seal system mappings
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241018/202410181037.HW3qkHxT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181037.HW3qkHxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181037.HW3qkHxT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/uprobes.c:1507:42: error: use of undeclared identifier 'VM_SEALED'
    1507 |                                 VM_EXEC|VM_MAYEXEC|VM_DONTCOPY|VM_IO|VM_SEALED,
         |                                                                      ^
   1 error generated.


vim +/VM_SEALED +1507 kernel/events/uprobes.c

  1481	
  1482	/* Slot allocation for XOL */
  1483	static int xol_add_vma(struct mm_struct *mm, struct xol_area *area)
  1484	{
  1485		struct vm_area_struct *vma;
  1486		int ret;
  1487	
  1488		if (mmap_write_lock_killable(mm))
  1489			return -EINTR;
  1490	
  1491		if (mm->uprobes_state.xol_area) {
  1492			ret = -EALREADY;
  1493			goto fail;
  1494		}
  1495	
  1496		if (!area->vaddr) {
  1497			/* Try to map as high as possible, this is only a hint. */
  1498			area->vaddr = get_unmapped_area(NULL, TASK_SIZE - PAGE_SIZE,
  1499							PAGE_SIZE, 0, 0);
  1500			if (IS_ERR_VALUE(area->vaddr)) {
  1501				ret = area->vaddr;
  1502				goto fail;
  1503			}
  1504		}
  1505	
  1506		vma = _install_special_mapping(mm, area->vaddr, PAGE_SIZE,
> 1507					VM_EXEC|VM_MAYEXEC|VM_DONTCOPY|VM_IO|VM_SEALED,
  1508					&xol_mapping);
  1509		if (IS_ERR(vma)) {
  1510			ret = PTR_ERR(vma);
  1511			goto fail;
  1512		}
  1513	
  1514		ret = 0;
  1515		/* pairs with get_xol_area() */
  1516		smp_store_release(&mm->uprobes_state.xol_area, area); /* ^^^ */
  1517	 fail:
  1518		mmap_write_unlock(mm);
  1519	
  1520		return ret;
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
