Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93492D12ED;
	Tue, 31 Mar 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971589; cv=none; b=Hnx8ceGXFYUX6zrD+136BBejISyqbJjQrysi2blALpC5fJONW+vyAwPNUUdGBpFmTKya+yG2YpDAP5lFaTD81UiTq7XiXVhjyIqFJvwisKGX29ZYQVm/i5BbNujsYWI+HTet3W0QG0opkU+b31+rQJxruSynhBz04h867GwgfpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971589; c=relaxed/simple;
	bh=OItpxqU5oSqyN8bGRByxmZipjRxVPgdfQBBwjM5jNZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba2cnGlAC+7Y7vR6TINFnvJ8o2quSE1PlvSsRpKGLsIdZHqbr5/8JtlQeq8+unRwSaUxadgoY/ncpXNZvdxennUF/tMvDrDWdoIacsblwARYUZtZ/OXnr1+Rw7sPaoniZ/838HQ/P4vwvbRNabn6Mr59/Wz+8XjeHDvU1wEXLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaQ4jbpP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaQ4jbpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774971588; x=1806507588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OItpxqU5oSqyN8bGRByxmZipjRxVPgdfQBBwjM5jNZI=;
  b=YaQ4jbpPix2pJDO5+3PNI1R0mLb7M6ez/otpFu5wOHHjNujUAPnaK3OS
   BlNhhZsxcPcwoaNFhpNoDNLwRHqqcGk7mkYfC7EqVG5qU5/q/j6nMgBfk
   bhdC3y9ZpdcM0NPH7StpkNy7ooiRyk/lrzqdzdjY0+ZrHoSWCL7ywUfPN
   0IzzZymN5ynfsGcxff87thOPItZgDWVWC5Di7q0cA7xDtKRVd5Ma/xrMQ
   VLuHjNxFI8XAH2ZM70qeznD2rXaCeDdDZSwB6Tucaa4ri1GXj3jRtho10
   mVmmo+Cd/0hiLX/SE1+nM/rvyDdh6hH6DpnKCgd+HScR56h9xp0E/uMoM
   g==;
X-CSE-ConnectionGUID: /PprAZyWQcW1rQ9oevm5iw==
X-CSE-MsgGUID: EjKBLVoUR9OzTtLWW+VPEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76103878"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76103878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:39:47 -0700
X-CSE-ConnectionGUID: sB1v2yFzTUOJq8v7416Iqg==
X-CSE-MsgGUID: oFRpaSPpSniEPLV2ERbWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226264303"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 08:39:45 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7bBu-000000002or-19bA;
	Tue, 31 Mar 2026 15:39:42 +0000
Date: Tue, 31 Mar 2026 23:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: Re: [PATCH] um: mconsole: validate notify socket path length
Message-ID: <202603312307.FOQx0THR-lkp@intel.com>
References: <20260329030945.32368-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329030945.32368-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on uml/next]
[also build test ERROR on wireless-next/main wireless/main uml/fixes linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/um-mconsole-validate-notify-socket-path-length/20260331-052930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20260329030945.32368-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH] um: mconsole: validate notify socket path length
config: um-defconfig (https://download.01.org/0day-ci/archive/20260331/202603312307.FOQx0THR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312307.FOQx0THR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312307.FOQx0THR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/um/drivers/mconsole_user.c:203:6: error: call to undeclared function 'snprintf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     203 |         if (snprintf(target.sun_path, sizeof(target.sun_path), "%s", sock_name) >=
         |             ^
   1 error generated.


vim +/snprintf +203 arch/um/drivers/mconsole_user.c

   180	
   181	int mconsole_notify(char *sock_name, int type, const void *data, int len)
   182	{
   183		struct sockaddr_un target;
   184		struct mconsole_notify packet;
   185		int n, err = 0;
   186	
   187		lock_notify();
   188		if (notify_sock < 0) {
   189			notify_sock = socket(PF_UNIX, SOCK_DGRAM, 0);
   190			if (notify_sock < 0) {
   191				err = -errno;
   192				printk(UM_KERN_ERR "mconsole_notify - socket failed, "
   193				       "errno = %d\n", errno);
   194			}
   195		}
   196		unlock_notify();
   197	
   198		if (err)
   199			return err;
   200	
   201		memset(&target, 0, sizeof(target));
   202		target.sun_family = AF_UNIX;
 > 203		if (snprintf(target.sun_path, sizeof(target.sun_path), "%s", sock_name) >=

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
