Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A348A1A9F84;
	Fri,  9 Jan 2026 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767921561; cv=none; b=Ga5d0xSXoaeLjBtN+qkF9ewRMnNABLqrbap7kwzwNwWxb0DO0tXIV0RFqSHgW1y8Td7sOUAIe5RA1XuK2ZUzDOd1H5tDpmpFYpQFUxQtDSLZxspcMINVLm27E7nLmjPz09eh9rEyyHHMAmVMn1tyi4ki2ZN3kNxIK2QFZlXLsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767921561; c=relaxed/simple;
	bh=ELxtyq4vddEpI3Ogsxk5PIfoXaHqV4FbI5PRrNHftnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYVLdcIwZWifB/3kpemHdbidEGLFlPNd5m6TU5laAVJr3MSSNK9rQj3DYqnlu6m5o4QyHSVp+0udvXLbavk7vzTnfirySToEVxlGbOlh9DwRRRbD1PqebJV6VOZ/huRZj+NDc6QFio6x/ZL8iBWNNiFVnDk3rTN6Wf1HDZoPif4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lC8X/y4b; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lC8X/y4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767921558; x=1799457558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ELxtyq4vddEpI3Ogsxk5PIfoXaHqV4FbI5PRrNHftnc=;
  b=lC8X/y4bY95s37dM+QQlS92vN6PgunYiaFTFHiDAPaO27GfhAKT7zi5F
   P9htY3Imj+FqvJRPtsAFun7WNXnbsNi/7uraVLJtDabnxgRUzT3Nptueu
   6eGE38QnmfWltv1jcYuC9oKOHS/HFhZo3sXR+gUpALHes5NJ7ozLpGXJ4
   Np8OsBoK60HMvejbItK9VllxUnmtayXEfwTTI6wZPFUCKS3S7NHJf3HU3
   Ev3i1w47ozu/4PdVMZn0DC5Q91YcIGlH0CyGf00Q1PNKxypiMoEcaZg/G
   LFsScpJUn4ISyUcsmjsSC1mlmejh5dhWQTPhtpHT7Rs6Z9hQ4+IAW8z3c
   A==;
X-CSE-ConnectionGUID: b5/I5ZZMS9S0mkxlPbTMAg==
X-CSE-MsgGUID: ARIW+U3XRtSVsyV2He0tzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69043473"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69043473"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 17:19:18 -0800
X-CSE-ConnectionGUID: Up0brljGS2aY70NDK/Nubg==
X-CSE-MsgGUID: BVSgPC8AQ3CKeoOrT0tl0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="202967176"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jan 2026 17:19:15 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve19l-000000001uK-02YQ;
	Fri, 09 Jan 2026 01:19:13 +0000
Date: Fri, 9 Jan 2026 02:18:29 +0100
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, pmladek@suse.com,
	bhe@redhat.com, linux-kernel@vger.kernel.org, lkp@intel.com,
	mgorman@suse.de, mingo@redhat.com, peterz@infradead.org,
	pnina.feder@mobileye.com, rostedt@goodmis.org,
	senozhatsky@chromium.org, tglx@linutronix.de, vkondra@mobileye.com
Subject: Re: [PATCH v4] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-ID: <202601090229.rC0GNQqG-lkp@intel.com>
References: <20260107215659.3619730-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107215659.3619730-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc4 next-20260108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-add-panic_force_cpu-parameter-to-redirect-panic-to-a-specific-CPU/20260108-055823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260107215659.3619730-1-pnina.feder%40mobileye.com
patch subject: [PATCH v4] panic: add panic_force_cpu= parameter to redirect panic to a specific CPU
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260109/202601090229.rC0GNQqG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090229.rC0GNQqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090229.rC0GNQqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/panic.c:344 function parameter 'buf' not described in 'panic_force_target_cpu'
>> Warning: kernel/panic.c:344 function parameter 'buf_size' not described in 'panic_force_target_cpu'
>> Warning: kernel/panic.c:344 function parameter 'buf' not described in 'panic_force_target_cpu'
>> Warning: kernel/panic.c:344 function parameter 'buf_size' not described in 'panic_force_target_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
