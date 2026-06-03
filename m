Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8537BE89;
	Wed,  3 Jun 2026 17:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508753; cv=none; b=eRF0tRdkkpSsfjc+McfQIJSIB8Pb+7jMKsCzvdWPWPfW4gCFGhLRyZ153OjxnilMv44f6prjpgF92QW7PCgXY2ujfjO12DRYOv9HUSD7zMg9hKkOOGzCjdqPqbhhjMIpMvR+pCM4xvELjp8Cg+daH5Wu7lRfYog7QuYMPcdyeCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508753; c=relaxed/simple;
	bh=qJt147BrsreeHbJrYMOblgXpYN9KI0pqzDvbZ9LhVyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAmKYJOg5BuWVGRx1nckBeMf0/jXgpZ6hwiyaAFPsM470Cndf3QFJ7nvhg+ryfKV7GtAfE4sUhQTgrtrkwIgEigN5GxYMFZteSSBBDcrJxFb1lOEKwq0H4hdGk128LNqcK14SasRlnR6ioTuWvm9V51tyoINO9BaXe5lo2bpoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1ezJi32; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1ezJi32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780508749; x=1812044749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qJt147BrsreeHbJrYMOblgXpYN9KI0pqzDvbZ9LhVyE=;
  b=Q1ezJi3246/8gBL7niCxJ2rMYXiLTXOEYXJ4jwL6xlytlPaBBOmlwotN
   Z98EF5mM+Pjhi0ljUBW2chUrbpTzAcUSM+kY/Z1ZDBoBaFnikcygqL1BR
   Q0n0n7kIGdR7FVsOXKMIY6B27PX3913mBkAGuNdraJ+sJkmUMHAwz6ROL
   XXVkXcWLhVOua/01EoqvgY1YhriUcrR0CpbXrjw6LP+rwjm51fj9Cvxp7
   AVCTIQlC/mD6OKeJeIo2b/rGFN+oFtmsKTqI3k0bc9HZ9kdt5qngT6cVW
   iDrgABf00I4ZvtWQXmili9uN09v5wQKfINvTClroUhIkY4QiDJYuGoRX0
   Q==;
X-CSE-ConnectionGUID: Tcnq7wPDQ1ypb2XSiiLpYg==
X-CSE-MsgGUID: Xb9Sr2mvSGyqtzhYqFxH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92703222"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92703222"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 10:45:48 -0700
X-CSE-ConnectionGUID: EqADPJ1TRHWXoExjlzSOEw==
X-CSE-MsgGUID: gdqv3b/dTi2DOsv2lsHPrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="267969880"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 10:45:46 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUpey-0000000027d-2O3q;
	Wed, 03 Jun 2026 17:45:44 +0000
Date: Wed, 3 Jun 2026 19:44:45 +0200
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, linux@dominikbrodowski.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maxwell Doose <m32285159@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pcmcia: cs: Replace manual mutex locking with
 guard(mutex)
Message-ID: <202606031924.nEoqNaNq-lkp@intel.com>
References: <20260603062714.45848-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603062714.45848-1-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc6 next-20260602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/pcmcia-cs-Replace-manual-mutex-locking-with-guard-mutex/20260603-144020
base:   linus/master
patch link:    https://lore.kernel.org/r/20260603062714.45848-1-m32285159%40gmail.com
patch subject: [PATCH] pcmcia: cs: Replace manual mutex locking with guard(mutex)
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260603/202606031924.nEoqNaNq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031924.nEoqNaNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031924.nEoqNaNq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pcmcia/cs.c:592:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     592 |         if (sysfs_events) {
         |             ^~~~~~~~~~~~
   drivers/pcmcia/cs.c:621:9: note: uninitialized use occurs here
     621 |         return ret;
         |                ^~~
   drivers/pcmcia/cs.c:592:2: note: remove the 'if' if its condition is always true
     592 |         if (sysfs_events) {
         |         ^~~~~~~~~~~~~~~~~
   drivers/pcmcia/cs.c:585:9: note: initialize the variable 'ret' to silence this warning
     585 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +592 drivers/pcmcia/cs.c

   581	
   582	static int pccardd_helper(struct pcmcia_socket *skt, unsigned int events,
   583				  unsigned int sysfs_events)
   584	{
   585		int ret;
   586	
   587		guard(mutex)(&skt->skt_mutex);
   588	
   589		if (events & SS_DETECT)
   590			socket_detect_change(skt);
   591	
 > 592		if (sysfs_events) {
   593			if (sysfs_events & PCMCIA_UEVENT_EJECT)
   594				socket_remove(skt);
   595			if (sysfs_events & PCMCIA_UEVENT_INSERT)
   596				socket_insert(skt);
   597			if ((sysfs_events & PCMCIA_UEVENT_SUSPEND) &&
   598			    !(skt->state & SOCKET_CARDBUS)) {
   599				if (skt->callback)
   600					ret = skt->callback->suspend(skt);
   601				else
   602					ret = 0;
   603				if (!ret) {
   604					socket_suspend(skt);
   605					msleep(100);
   606				}
   607			}
   608			if ((sysfs_events & PCMCIA_UEVENT_RESUME) &&
   609			    !(skt->state & SOCKET_CARDBUS)) {
   610				ret = socket_resume(skt);
   611				if (!ret && skt->callback)
   612					skt->callback->resume(skt);
   613			}
   614			if ((sysfs_events & PCMCIA_UEVENT_REQUERY) &&
   615			    !(skt->state & SOCKET_CARDBUS)) {
   616				if (!ret && skt->callback)
   617					skt->callback->requery(skt);
   618			}
   619		}
   620	
   621		return ret;
   622	}
   623	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
