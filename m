Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E65D520;
	Mon, 16 Sep 2024 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726453730; cv=none; b=TmGw/m99fJNI9bSC+Wes2bU1IP8TGZkXmwoBzAf5bggxDlGdsHJZcSmvQFCbFYwiYJ/84VY1ClFrPve6QiA5HxiXlK8qQuVm9gTWu2mswCfNdzGld4l0lUxfbSqTz5sZK8fkyilGoI6raVbf6MZiBHZDfaLa8g2pEru69vn06DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726453730; c=relaxed/simple;
	bh=wbkU5U4xZN6n0KQSFlfPnDD1W4SoNXtV1HAasNYFbf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl55WLrpoyM3c9OlwxSga8VzWOPQiywqQSzviaDJq1mwLHjQlnolh/UjfXOrm7crgXo75CoJ90czjbqaWroyLr3daOX/j0CzDqSzTYKJ5dD6zAD/REiLs3dI/gZZrjKbjnb2V91HzvZX7laYmiLEtFYScANhsP0VinYMsIwF5fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgo97QGk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgo97QGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726453729; x=1757989729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbkU5U4xZN6n0KQSFlfPnDD1W4SoNXtV1HAasNYFbf8=;
  b=Xgo97QGkm7ZdAJPwzFqcpv75EMzyoE3glawg3YEJkw8+HU1WMDXmGhlu
   XveqCh7GUdiZanC9PxFo/+c9+gbbwFn18/WvGcE9o35suBJfyqXXv72IA
   6oBH9T2N9gvEfo1xo4JNi/ckEuRI7bLM69SiR8lGg77Piq9FN/Nz+ppow
   nVcz7ZZbnf/Yj5XNsd9NB46MIW3tYj2AWUKCiq00k/EY/qgntj13wUcGo
   f8XOCj0p0UyGtRdODC8E9HoN2itg0vmIePY8YPzoPa/nbYJdO/ob8JL/4
   zbOfSFBVdjFR/+n0MTwQWY97bbnfgIf6TesTzHk0rnd+tJgGlgzbKdwwN
   g==;
X-CSE-ConnectionGUID: RVmTEmfFQqicDfC0gJa5Mw==
X-CSE-MsgGUID: iSZzFVo9TiGzrhStKma5rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36626675"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="36626675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 19:28:47 -0700
X-CSE-ConnectionGUID: tn0KQ7TPT3Whbg+c2C2qcA==
X-CSE-MsgGUID: uGXKRgPmT1W94/X2BtsqYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73573295"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 19:28:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq1Tm-0009FI-0r;
	Mon, 16 Sep 2024 02:28:42 +0000
Date: Mon, 16 Sep 2024 10:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever III <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nfsd-next] SQUASH sunrpc: allow svc threads to fail
 initialisation cleanly
Message-ID: <202409161022.FCpNdJMX-lkp@intel.com>
References: <172644394073.17050.16376953609629336068@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172644394073.17050.16376953609629336068@noble.neil.brown.name>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240913]
[cannot apply to trondmy-nfs/linux-next v6.11 v6.11-rc7 v6.11-rc6 linus/master v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/SQUASH-sunrpc-allow-svc-threads-to-fail-initialisation-cleanly/20240916-074739
base:   next-20240913
patch link:    https://lore.kernel.org/r/172644394073.17050.16376953609629336068%40noble.neil.brown.name
patch subject: [PATCH nfsd-next] SQUASH sunrpc: allow svc threads to fail initialisation cleanly
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240916/202409161022.FCpNdJMX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161022.FCpNdJMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161022.FCpNdJMX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/trace.c:4:
   In file included from fs/nfsd/trace.h:18:
   In file included from fs/nfsd/nfsfh.h:12:
>> include/linux/sunrpc/svc.h:333:2: error: call to undeclared function 'smb_mb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     333 |         smb_mb();
         |         ^
   1 error generated.
--
   In file included from fs/nfsd/export.c:19:
   In file included from include/linux/sunrpc/svc_xprt.h:11:
>> include/linux/sunrpc/svc.h:333:2: error: call to undeclared function 'smb_mb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     333 |         smb_mb();
         |         ^
   fs/nfsd/export.c:1020:17: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
    1020 |         struct inode            *inode;
         |                                  ^
   1 warning and 1 error generated.


vim +/smb_mb +333 include/linux/sunrpc/svc.h

   313	
   314	/**
   315	 * svc_thread_init_status - report whether thread has initialised successfully
   316	 * @rqstp: the thread in question
   317	 * @err: errno code
   318	 *
   319	 * After performing any initialisation that could fail, and before starting
   320	 * normal work, each sunrpc svc_thread must call svc_thread_init_status()
   321	 * with an appropriate error, or zero.
   322	 *
   323	 * If zero is passed, the thread is ready and must continue until
   324	 * svc_thread_should_stop() returns true.  If a non-zero error is passed
   325	 * the call will not return - the thread will exit.
   326	 */
   327	static inline void svc_thread_init_status(struct svc_rqst *rqstp, int err)
   328	{
   329		rqstp->rq_err = err;
   330		/* memory barrier ensures assignment to error above is visible before
   331		 * waitqueue_active() test below completes.
   332		 */
 > 333		smb_mb();
   334		wake_up_var(&rqstp->rq_err);
   335		if (err)
   336			kthread_exit(1);
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
