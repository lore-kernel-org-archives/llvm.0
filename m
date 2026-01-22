Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EAA2E54B3;
	Thu, 22 Jan 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108935; cv=none; b=hxTQfKcQMF2Fn6dIyyH1JffMmMsV1Pn8BjcDwlC4SvxIcpRubHobGQu1pZudA4sErhWuKcXNKBdwigx0zX0uOT/Ib0f7Ln16nZ2UGVx+AvdPtyD5K2uZA0EUGpRyJgouKeqGbxOX/bjtJEfVhZiIkARWVRGvjD9AMzXPexomg8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108935; c=relaxed/simple;
	bh=Zfz951NlfIKF+nECaoQj+x+6fb0Mm9h3T9B/12F+znk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDA7bIkTokKcVvzQXcnS2GeLQ1Lith2HUl2a/QdxVINXsilE9iW/L5gY9Z3C+rGiP7DpY/K8ikD9AYpRxy58jl3AibkUspdKYb+ifOyUkmZ1fC+vrkFPj2lre6YVbJNYyFp54DO3MKu36EmVmVkaXb64KFUd3sGeqvC8TYkNIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5fPvQXG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5fPvQXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769108923; x=1800644923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zfz951NlfIKF+nECaoQj+x+6fb0Mm9h3T9B/12F+znk=;
  b=U5fPvQXGPfXyNejaaKSZfSUIJmwhvVBuOLCLvcZXUV6RoMLCpCi9o+82
   66uqwTWPsvUnfT2iYkTGez18pK9NTEKRt8x0eib2AhCP/ieBYKyNy6RYK
   IEuEn2K9VkJq0PmOFlfGsfRjV538dL6Xo6nLKZjxXHO15CKPL8rLcj4Z+
   UUAyVqKKgFtr/h5aiDyIAE8VbCWtaMMjTSw1f7PJGdlrV+Y1nwNdpLYI8
   wnNiiI8BMBkRcqPIiipd4/NT/PDFySNmVxPAwsha9eQcWbM0oyhwYwxv4
   xbenFpXSy0Qwqk+SIG0HCy3U94sKfH6ZUlHFUQpI/0JnVXGuYcPdvUzHR
   Q==;
X-CSE-ConnectionGUID: 33qFtpPuS26SX2KqsLrq7Q==
X-CSE-MsgGUID: Fr76UBYATQu0Z97XOMpxwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73990975"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="73990975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 11:08:38 -0800
X-CSE-ConnectionGUID: KcU6uuDkREytQPC6KeuVKA==
X-CSE-MsgGUID: AXmsAGl5SeW+rM5ETOiWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207241444"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 11:08:37 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj02l-000000000Xt-0DgY;
	Thu, 22 Jan 2026 19:08:35 +0000
Date: Thu, 22 Jan 2026 20:08:31 +0100
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-ID: <202601222042.OSZryOnl-lkp@intel.com>
References: <20260122102457.1154599-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122102457.1154599-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-add-panic_force_cpu-parameter-to-redirect-panic-to-a-specific-CPU/20260122-182657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122102457.1154599-1-pnina.feder%40mobileye.com
patch subject: [PATCH v8] panic: add panic_force_cpu= parameter to redirect panic to a specific CPU
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260122/202601222042.OSZryOnl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222042.OSZryOnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222042.OSZryOnl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/panic.c:79:14: warning: unused variable 'panic_force_buf' [-Wunused-variable]
      79 | static char *panic_force_buf;
         |              ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/panic_force_buf +79 kernel/panic.c

    77	
    78	static int panic_force_cpu = -1;
  > 79	static char *panic_force_buf;
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
