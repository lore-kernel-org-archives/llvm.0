Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F639291E;
	Mon, 15 Jul 2024 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721022935; cv=none; b=ZZbVgsMq5zPbS9ium1Od8pH6v6dHGnBxa4Gn8lqs2l6ewZCktdad2N0y3UX/8HUQDtq22TnMK2zx3gX3KkmRIx9rUEoURRExrUtyCr3lltpvUTVygr6yO0VM4ues/CZgOtbCflhGREiQQoviR5XgnkCbxgX+i5uXkf9j6+Z6B2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721022935; c=relaxed/simple;
	bh=IUolkFBEmvcx1E57sHKTboQAZiLLaq0fvTypzUGmYTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gujhUtvXT6air2fTwZzaKV4/skrR1rY/wWJpYYhRfaKcnAkwdeD4qJHdpLnU29T6K3aKpJ4enIUEU4H5dxx0lnM9lJSxMiseCvLx5cMEeTKgL+7EqcxR2aotyE83ItUqhMTGznk0ZvIKGPPZHKMzStKPzFNSvLFtZPGFRhu6Pmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjLyS3DZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjLyS3DZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721022933; x=1752558933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IUolkFBEmvcx1E57sHKTboQAZiLLaq0fvTypzUGmYTI=;
  b=jjLyS3DZN2iNipeQyU7b/9QFnhaItMSfoRMgcZ6emF2EyTrZ+FGf8Y5w
   8pZ3EjQlgFtn9XojIMgpJo6cPiOEepEL1dyJSHG6CEJkeCT3HxYAyLhES
   Y/mV1eRMfh6Psf5o2JNAFMkHEujQRAalJWI4XXSCtCxXGgBVDW1Vqb3GK
   tl7MpZJsxJI8y6zk0+7s8DK9zjI2MPMB2eZ2qRoYj2g/iS/Zpdd/pC4cf
   40J3eqvZI9ihSb8fvqRUjdgtG918Ci7KmtUPZrC2+iZ7Fmoy5fW082hNW
   TgxWchnTKDg0rpHAgi9FaiBl5Y7fcI9SmLgUDGSLz0EWxIgsM5LqrnftL
   g==;
X-CSE-ConnectionGUID: gjv31qolR5aIipLf9qAHPg==
X-CSE-MsgGUID: t4PBE12XRZi7iEa2FcgsOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18336929"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="18336929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 22:55:33 -0700
X-CSE-ConnectionGUID: iwBTyI6vQiG19M85pe4i/A==
X-CSE-MsgGUID: SWrgCtIxRo+YMdPqR+2Z4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="80191054"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jul 2024 22:55:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTEgK-000e2s-2H;
	Mon, 15 Jul 2024 05:55:28 +0000
Date: Mon, 15 Jul 2024 13:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v9 05/11] bpf: net_sched: Support implementation of
 Qdisc_ops in bpf
Message-ID: <202407151312.caDCQqr8-lkp@intel.com>
References: <20240714175130.4051012-6-amery.hung@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714175130.4051012-6-amery.hung@bytedance.com>

Hi Amery,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on net-next/main next-20240712]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Support-getting-referenced-kptr-from-struct_ops-argument/20240715-020211
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240714175130.4051012-6-amery.hung%40bytedance.com
patch subject: [RFC PATCH v9 05/11] bpf: net_sched: Support implementation of Qdisc_ops in bpf
config: i386-randconfig-003-20240715 (https://download.01.org/0day-ci/archive/20240715/202407151312.caDCQqr8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407151312.caDCQqr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407151312.caDCQqr8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: register_qdisc
   >>> referenced by bpf_qdisc.c:231 (net/sched/bpf_qdisc.c:231)
   >>>               net/sched/bpf_qdisc.o:(bpf_qdisc_reg) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: unregister_qdisc
   >>> referenced by bpf_qdisc.c:236 (net/sched/bpf_qdisc.c:236)
   >>>               net/sched/bpf_qdisc.o:(bpf_qdisc_unreg) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: qdisc_watchdog_init
   >>> referenced by bpf_qdisc.c:44 (net/sched/bpf_qdisc.c:44)
   >>>               net/sched/bpf_qdisc.o:(bpf_qdisc_init_op) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: qdisc_watchdog_cancel
   >>> referenced by bpf_qdisc.c:52 (net/sched/bpf_qdisc.c:52)
   >>>               net/sched/bpf_qdisc.o:(bpf_qdisc_reset_op) in archive vmlinux.a
   >>> referenced by bpf_qdisc.c:59 (net/sched/bpf_qdisc.c:59)
   >>>               net/sched/bpf_qdisc.o:(bpf_qdisc_destroy_op) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
