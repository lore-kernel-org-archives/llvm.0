Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E52FD68B;
	Fri, 20 Feb 2026 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771629580; cv=none; b=sAQc300uxcufDMkALRKpK6I4dG/XNk0LEtALzM955JNq4UfZwNjhjqQ62iu7ZA91fl71ESbLBIb46bY4+XU8VHDT6KIbBazRCKGDJuwUKarCvVJL7xsbLceR+SVzM/VioHdHTmaJZYlEdMdpQqt1GKi6ZqNQstiuRvGhkNMR8UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771629580; c=relaxed/simple;
	bh=dQwL2CKW170kCR2FjwTS9tO75QXgMPqfIE4aHVT0eLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pndRMtdAo5k4Ht6/xJOl5zfZyEajDBp6PSWT7lCV3pAvZfruvuDzS2SfeQ63FWnD02pMv1GKRbR31Y8rk+Hiepti60EO0ExUVrWZNCOLO7BcTh0n3BX4nK38kQexCKmGxb5e4WTv4PIqFctLtfmzR9rIW/28FBkiKBVDOD2ouDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EL/rhf44; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EL/rhf44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771629578; x=1803165578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dQwL2CKW170kCR2FjwTS9tO75QXgMPqfIE4aHVT0eLg=;
  b=EL/rhf44Tdbz2BnHHCi1qmV863GXe0qI3uXwedlBx3r3PzqHC0OFKIA4
   p3bZcoxLLvtQf3aExJr+w3EwfD3KWBGKxEROv48Opf5m74LXyQtBUS5C9
   qYKa15YA2GywX3vaqi6vi9WA4NMG7ejjwyNud3rvM74DKRut96TWpXocb
   wlRc8tU5aPoIir7dqxa2Y1WG01yGTjmsUn+WG/G7umqL9tCaikVVCo4KV
   R7IEPrXg949M39lJP+2lKJbY6hgy6+8vJU/bCnVOI2hbS0OmBGkmiZ/0H
   BVhnJo53hUvTa1TcFhwITPVXvFhhX1LGEw7nLjKtuXw0i/OMPp+QgUu5k
   Q==;
X-CSE-ConnectionGUID: tx/vPfn2T3eEOkpCPJyB9Q==
X-CSE-MsgGUID: RE2Cte4DQo+Bi7wTRwIalQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83442519"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83442519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 15:19:37 -0800
X-CSE-ConnectionGUID: RP2jluMiTZSE8Pjlr37M1w==
X-CSE-MsgGUID: dwljGUUNRnyCd2WSVs9dCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219125347"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2026 15:19:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtZmV-000000014Xk-1Nd0;
	Fri, 20 Feb 2026 23:19:31 +0000
Date: Sat, 21 Feb 2026 07:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Sun Jian <sun.jian.kdev@gmail.com>
Subject: Re: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space
 annotations
Message-ID: <202602210752.PVuJInZ7-lkp@intel.com>
References: <20260220193353.21870-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220193353.21870-1-sun.jian.kdev@gmail.com>

Hi Sun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 770aaedb461a055f79b971d538678942b6607894]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-Jian/sched-rcu-fix-rq-curr-donor-address-space-annotations/20260221-033739
base:   770aaedb461a055f79b971d538678942b6607894
patch link:    https://lore.kernel.org/r/20260220193353.21870-1-sun.jian.kdev%40gmail.com
patch subject: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space annotations
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260221/202602210752.PVuJInZ7-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210752.PVuJInZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210752.PVuJInZ7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: kernel/sched/core.o: in function `wake_up_if_idle':
   core.c:(.text+0x1ecc): undefined reference to `lockdep_is_held'
>> arc-linux-ld: core.c:(.text+0x1ecc): undefined reference to `lockdep_is_held'
   arc-linux-ld: kernel/sched/core.o: in function `__schedule':
   core.c:(.sched.text+0x6a): undefined reference to `lockdep_is_held'
>> arc-linux-ld: core.c:(.sched.text+0x6a): undefined reference to `lockdep_is_held'
   arc-linux-ld: core.c:(.sched.text+0x136): undefined reference to `lockdep_is_held'
   arc-linux-ld: kernel/sched/core.o:core.c:(.sched.text+0x136): more undefined references to `lockdep_is_held' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
