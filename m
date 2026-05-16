Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF8282F31;
	Sat, 16 May 2026 03:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778902999; cv=none; b=ANpSPs26DZNXuuRrxghFwuBSDWuJKQTRrLSzrjqcQWL9OV28k+9UVSQM9hnUWpR5MqzHrYQGuw4W+8bTnOBugE/73BjeM9Mbby47IK2BMKabo4shGu0UuKgm+QAvfq8mTj5SmGpowvWRfyFdsncL9yyUdefFD9/D8XbYOSYAFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778902999; c=relaxed/simple;
	bh=ID9tdn2gYJjBbnWVxJgcOf7EQejKZETrIpsg4qqVtHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGqy0I0muxVh+ok+4H2daw4J4HaG/1gnUrTcDscJBps3zxtsr4j10yEqQqfXFnWpp7jvZSfV97PuocE7zRMZZLjjF4YXFVnQZbz3UT9suzg94LAQD14jJKsBZbg94PiS9viYK27We8jnxfWamyz0r5AoOOR7+w90ihZlUIcw+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/tJEmJS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/tJEmJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778902998; x=1810438998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ID9tdn2gYJjBbnWVxJgcOf7EQejKZETrIpsg4qqVtHY=;
  b=I/tJEmJS4CYF06UuAfmFimH6OoQRz2Zc6XhQvIrv809/eprSqce+W2ei
   9IpEFjwTggXzCAYbfSm41HEQ0+r6Vr2aZ/RVy/9vHhmbYZFuOqfEHeIak
   9BX1QT2GHZfDd0aoYVeyqt7RGzkM+mGPDuIIXWMzcaT1h+s8xHNibtISu
   oxiQB/lnPaeLMIN92ogj3pP6gY2XnMHUtw5Zb/r6LLYM1tLhvJ7x5Aw2C
   OsOgo1t6evzLxoAwMNje+ZUuhdEpN27WO8lSgaayFy8NG79i/TLAqZoCd
   WVKEBavcZnTj1Tn6oHSI2ur2ZmEtAy+rnnj+Sb1sOQE97EybYqH3dtRAP
   w==;
X-CSE-ConnectionGUID: QL5vMCa1RrSOum6cR4dMAQ==
X-CSE-MsgGUID: YKZ+dqtpSf6v+t8ZyqHd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79886296"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79886296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:43:17 -0700
X-CSE-ConnectionGUID: s5Ygh37dSiCMUGCwRldduA==
X-CSE-MsgGUID: 3wjoSGchQBmh5FEgL/7rQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="276974691"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2026 20:43:14 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5vj-000000000RJ-1Wna;
	Sat, 16 May 2026 03:43:11 +0000
Date: Sat, 16 May 2026 11:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
	quic_jhugo@quicinc.com, mario.limonciello@amd.com,
	karol.wachowski@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lizhi Hou <lizhi.hou@amd.com>, linux-kernel@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
	christian.koenig@amd.com, simona@ffwll.ch, max.zhen@amd.com,
	sonal.santan@amd.com
Subject: Re: [PATCH V1] accel/amdxdna: Remove mmap and export support for ubuf
Message-ID: <202605161116.6FTLJOlI-lkp@intel.com>
References: <20260515155332.743097-1-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515155332.743097-1-lizhi.hou@amd.com>

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Hou/accel-amdxdna-Remove-mmap-and-export-support-for-ubuf/20260516-000523
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260515155332.743097-1-lizhi.hou%40amd.com
patch subject: [PATCH V1] accel/amdxdna: Remove mmap and export support for ubuf
config: x86_64-randconfig-002-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161116.6FTLJOlI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161116.6FTLJOlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161116.6FTLJOlI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/amdxdna/amdxdna_ubuf.c:86:42: warning: unused variable 'amdxdna_ubuf_vm_ops' [-Wunused-const-variable]
      86 | static const struct vm_operations_struct amdxdna_ubuf_vm_ops = {
         |                                          ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/amdxdna_ubuf_vm_ops +86 drivers/accel/amdxdna/amdxdna_ubuf.c

bd72d4acda1069 Lizhi Hou 2025-07-16  85  
bd72d4acda1069 Lizhi Hou 2025-07-16 @86  static const struct vm_operations_struct amdxdna_ubuf_vm_ops = {
bd72d4acda1069 Lizhi Hou 2025-07-16  87  	.fault = amdxdna_ubuf_vm_fault,
bd72d4acda1069 Lizhi Hou 2025-07-16  88  };
bd72d4acda1069 Lizhi Hou 2025-07-16  89  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
