Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7E25776;
	Sat,  2 Aug 2025 21:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754168689; cv=none; b=OyB5m8kKkU0WBGrjket6YsZ0SHRDO71ZVxmI+tS7jb15jUnPNbo9CMclHsmSjtnUy2R7hGybu5CEKI4XjVFjQ9IrC1z8W5fBDZYrypJXGxdE6Nn5P+P/RiiOqkDY8mFlDFtN7NbkJEisqt9iHhrKkeOU1iUEQi7t9oUTtXAvwB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754168689; c=relaxed/simple;
	bh=HVCw/ums2+GbSs2nNoNRXRXxNNLaozl5ohYBKWjGkFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va66c15pvBykwvG000r2xsXzAW0NhpK6jpFizB96Y+UbnKkGSQj6c/eSmirorrWJKxbaiqVDjN10ua1FJi/mq+gBWqrBWIpQ8gLmOlwiluf2Mk8cqK/4pr1+AMANr4OoCoOcIIY+lpPm03r9dMcBdoG2BHeCGs474U8JYCNLi68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6lVPFwd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6lVPFwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754168687; x=1785704687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVCw/ums2+GbSs2nNoNRXRXxNNLaozl5ohYBKWjGkFM=;
  b=S6lVPFwdP27KOTpye+byleEnUS7PfHE/RPq8t2DsQGmOufpDsEhDsSmM
   42LNIrafiTwhUcSfbgq8+Jd6BQ2L4MzwZYRHVvHIhEiNmy+pqAXsgeJ+z
   mnzMw3b/ipOlDvId2XrogWt8PuSN4kYLbK7qAg74UVy0J3bZoY3tytTXH
   H40foca774HWIatGneTS/Qxq9BwFc/8V7R+5DOc+3io8uvzThATDUaoG9
   nPePvuNpFp2koKvBLXDJDJpP3VWRJKGHuiUtGYGPNUwkngAQi870/5sRS
   edCqqEPGsFX3fZHls9KOJtmmTb4weHZCQVfOuJJmqotw1fF023nLBr1pb
   w==;
X-CSE-ConnectionGUID: VoxOkvyPRw+Y0TtNIBsmJw==
X-CSE-MsgGUID: rih0O+/yQkuYk6AfDsQLfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="79033274"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79033274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 14:04:46 -0700
X-CSE-ConnectionGUID: X+apVM/tT5+7iem5KDZ/vg==
X-CSE-MsgGUID: Xqd3NhdMSHKhb2aNzkvJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168293533"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2025 14:04:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiJPF-0005bY-18;
	Sat, 02 Aug 2025 21:04:41 +0000
Date: Sun, 3 Aug 2025 05:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
Message-ID: <202508030428.qmzSb9kN-lkp@intel.com>
References: <20250802024121.955274-8-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802024121.955274-8-haren@linux.ibm.com>

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
patch link:    https://lore.kernel.org/r/20250802024121.955274-8-haren%40linux.ibm.com
patch subject: [PATCH 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
config: powerpc64-randconfig-001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030428.qmzSb9kN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030428.qmzSb9kN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030428.qmzSb9kN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-hvpipe.c:698:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     698 |         if (!enable_hvpipe_IRQ()) {
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:710:9: note: uninitialized use occurs here
     710 |         return ret;
         |                ^~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:698:2: note: remove the 'if' if its condition is always true
     698 |         if (!enable_hvpipe_IRQ()) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:676:9: note: initialize the variable 'ret' to silence this warning
     676 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +698 arch/powerpc/platforms/pseries/papr-hvpipe.c

   673	
   674	static int __init papr_hvpipe_init(void)
   675	{
   676		int ret;
   677	
   678		if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
   679			NULL))
   680			return -ENODEV;
   681	
   682		if (!rtas_function_implemented(RTAS_FN_IBM_SEND_HVPIPE_MSG) ||
   683			!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
   684			return -ENODEV;
   685	
   686		papr_hvpipe_work = kzalloc(sizeof(struct work_struct), GFP_ATOMIC);
   687		if (!papr_hvpipe_work)
   688			return -ENOMEM;
   689	
   690		INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
   691	
   692		papr_hvpipe_wq = alloc_ordered_workqueue("papr hvpipe workqueue", 0);
   693		if (!papr_hvpipe_wq) {
   694			ret = -ENOMEM;
   695			goto out;
   696		}
   697	
 > 698		if (!enable_hvpipe_IRQ()) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
