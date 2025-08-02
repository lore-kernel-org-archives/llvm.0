Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D472A165F16;
	Sat,  2 Aug 2025 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754175116; cv=none; b=FOHI44DbGCxOMfimbPtR8CmvlW5bCHpusICRjOpd+JJAFNTYXscelLsOvu7alRjCI4SrCEbE6hxadNZpUMkq8JgtpQ+c0pqCjJ0tVnPSPqmJcGn4TO3gKVTt7fH9yTUr3vFzjAZjDIxSjswS2QZzf4tnYo6aUnP5NIILvExdVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754175116; c=relaxed/simple;
	bh=y/n12O9fa44RVpWSR/uGMzs+dyOyktMqkxPoVmLAku4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY5OqNrF/abpQIC7+w8BREa3JIMJWzH0ROmN5ZxDYuaFOYGHivlqSS8LDRLIj+pD0PakLLUhG2OYSLZYLUXpzszrVFe2HtICqA8olKerGQ3upr4lgpL0rQiyT55Hl7+icEL3QNg3AqhsrgFqyFLeOITBgCrrNcW2gBwB5zay8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oD26mui3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oD26mui3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754175115; x=1785711115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y/n12O9fa44RVpWSR/uGMzs+dyOyktMqkxPoVmLAku4=;
  b=oD26mui3OWKvgn+KTIJnrlO8NGN3aoOTHTNIi5P/BVnyg1NYD+cHNzg9
   jwXq6jI4m7/Mm69IzbHWrUAoVA14vXXP01wXOCt2tpV5wh3sYa/PAjdw5
   nkmY881ZpAFXkfH69MUSn04UF0TTeOxdWkqt7A80u/Acs67j11XPKB8jD
   jda0ft7eRzyLJeamvl9p+lBIhxcDGNYzkt35wKwVvXEY0meQeQVL+P1d+
   P0FAgFxPEhCWSsKTqDPNQkX7k3tRDHuZtHwtG7HIQ0DgHVkHDMTJ6wkPk
   Py8ZLe3Irhj0S2zWU/o1BAVFwQNTE7xq6PmYYrS9IeJhPndHA6ePLIujB
   w==;
X-CSE-ConnectionGUID: P0Pt8u1ESQ62rCQPCMM8rA==
X-CSE-MsgGUID: YAzA0w9SQraP6HgdvXYO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56353674"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56353674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 15:51:54 -0700
X-CSE-ConnectionGUID: L+yFVs7uRFmFVZcvmyaMfw==
X-CSE-MsgGUID: tbag8bmURFWXVRhQISzQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164639906"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Aug 2025 15:51:51 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiL4u-0005dc-2A;
	Sat, 02 Aug 2025 22:51:48 +0000
Date: Sun, 3 Aug 2025 06:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 8/9] powerpc/pseries: Enable hvpipe with
 ibm,set-system-parameter RTAS
Message-ID: <202508030602.TrsVGpjD-lkp@intel.com>
References: <20250802024121.955274-9-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802024121.955274-9-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes v6.16]
[cannot apply to linus/master next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250802-104715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250802024121.955274-9-haren%40linux.ibm.com
patch subject: [PATCH 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
config: powerpc64-randconfig-001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030602.TrsVGpjD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030602.TrsVGpjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030602.TrsVGpjD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-hvpipe.c:725:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:737:9: note: uninitialized use occurs here
     737 |         return ret;
         |                ^~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:725:2: note: remove the 'if' if its condition is always true
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:725:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:737:9: note: uninitialized use occurs here
     737 |         return ret;
         |                ^~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:725:6: note: remove the '&&' if its condition is always true
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:703:9: note: initialize the variable 'ret' to silence this warning
     703 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +725 arch/powerpc/platforms/pseries/papr-hvpipe.c

   700	
   701	static int __init papr_hvpipe_init(void)
   702	{
   703		int ret;
   704	
   705		if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
   706			NULL))
   707			return -ENODEV;
   708	
   709		if (!rtas_function_implemented(RTAS_FN_IBM_SEND_HVPIPE_MSG) ||
   710			!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
   711			return -ENODEV;
   712	
   713		papr_hvpipe_work = kzalloc(sizeof(struct work_struct), GFP_ATOMIC);
   714		if (!papr_hvpipe_work)
   715			return -ENOMEM;
   716	
   717		INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
   718	
   719		papr_hvpipe_wq = alloc_ordered_workqueue("papr hvpipe workqueue", 0);
   720		if (!papr_hvpipe_wq) {
   721			ret = -ENOMEM;
   722			goto out;
   723		}
   724	
 > 725		if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
