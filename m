Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7441C14;
	Sat, 10 Feb 2024 00:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707523621; cv=none; b=au5F6KRPJk0Kjfv9QzYkqFn2VM4+hsxO7795FYfTPlv0k7DhIbQRrgqxj0nVjz7mvgP4BiOJrPbUvU18nOye8KRMDuDt1Lp3j/4aX2UF0Owom5Y+sxdolqmARmyNO+v69ZiUE1BKnxvTts3f0gFd2INYeFsElAInIYGloKY6sJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707523621; c=relaxed/simple;
	bh=4JuHIqxZrQxecnWUBRyW/Oj83+V/zwY+WyKYRNe4ITo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/xPV/zEVFy2okDQ+3Hq4PhoI43WgImAULyWv9RWf/zpqdgrP2l9j6vfQpPAXYF/tTOk+o6nz7ZR9KXFA93ngjL7HjL9hYziDi4LFEY681rdAsgVZtYzt2U0xnX5ngRfG8hs23FzhheWEcyptDvXBaSpY/vZUmyx6iQxQkyD81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmJVAS/F; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmJVAS/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707523619; x=1739059619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JuHIqxZrQxecnWUBRyW/Oj83+V/zwY+WyKYRNe4ITo=;
  b=KmJVAS/FxeouSMEBYpj259L1oIeiqYbBQ39FstzSlBCcNKqq5boG8lkv
   ahjShjLkpp54K9KAFBLD+DnN7Q/Tj22Eu+/kv8T0bBityS56UnCFqMiNU
   n+JJIy/hnFQrPwmkM5b+vfXCGJD+e3Vo4zuK3docBccfiMn7ejY+Z+Yqf
   tFWhU0Bn/anhBslENRbKdbii26kR3GhuA/fAUshIqS0LwuN9ovwtM8DIa
   Knw3psAUAkIMG/6MEIgZMND1umENznI9jB51EakpuLPIparOZOQkaEGNI
   MbA54XipKl0aI2kYeXFM3GpI0xkHUUbAmP270jnrQXUXGndBy3a3AoUkZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1656981"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1656981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 16:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="825272946"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="825272946"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2024 16:06:57 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYatS-0005Dc-1r;
	Sat, 10 Feb 2024 00:06:54 +0000
Date: Sat, 10 Feb 2024 08:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 03/20] bpf: Plumb get_unmapped_area()
 callback into bpf_map_ops
Message-ID: <202402100739.m56uNkG2-lkp@intel.com>
References: <20240209040608.98927-4-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209040608.98927-4-alexei.starovoitov@gmail.com>

Hi Alexei,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/bpf-Allow-kfuncs-return-void/20240209-120941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240209040608.98927-4-alexei.starovoitov%40gmail.com
patch subject: [PATCH v2 bpf-next 03/20] bpf: Plumb get_unmapped_area() callback into bpf_map_ops
config: arm-randconfig-001-20240209 (https://download.01.org/0day-ci/archive/20240210/202402100739.m56uNkG2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100739.m56uNkG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100739.m56uNkG2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:948:22: error: no member named 'get_unmapped_area' in 'struct mm_struct'
     948 |         return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
         |                ~~~~~~~~~~~  ^
   1 error generated.


vim +948 kernel/bpf/syscall.c

   939	
   940	static unsigned long bpf_get_unmapped_area(struct file *filp, unsigned long addr,
   941						   unsigned long len, unsigned long pgoff,
   942						   unsigned long flags)
   943	{
   944		struct bpf_map *map = filp->private_data;
   945	
   946		if (map->ops->map_get_unmapped_area)
   947			return map->ops->map_get_unmapped_area(filp, addr, len, pgoff, flags);
 > 948		return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
   949	}
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
