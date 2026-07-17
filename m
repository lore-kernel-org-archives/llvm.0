Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5F390C85;
	Fri, 17 Jul 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784317812; cv=none; b=C3cHk7kUG9lwkK9JpDU6VMpIxgDUNRzzuo+r32NUo+EFEPfuf0Unw8vc06ym0HCNBZr1QxshB7aR3/K9O4KJdNbFD0ZzNwn9PUutuiWGIk0h0cvh1/JUiVPENEeMY2n1jOPCDBNA0FxBTSIUHp+m6bszBcT2TzeLCInIKq9bi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784317812; c=relaxed/simple;
	bh=zWBt+DDVR50Xvb9PyVldsVSOQ90jdQJp7euTcObsFR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XrCw0V3gp3+64prkdOEaaa7h+s3trvW4SUjCWMxFtBYaGB2gPC5k6YADUPvkG97cKXKm7IqGiyB/Zrdg1dPieHXpy91OkScnc3iUthawQ1Z4WFk4pRcSh2kE/kpBVcA4HSmIQXdL299d0Uh4PH4HesjOpa8oRvzozIZ/zbF2ubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEfPrIKB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEfPrIKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784317810; x=1815853810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWBt+DDVR50Xvb9PyVldsVSOQ90jdQJp7euTcObsFR0=;
  b=mEfPrIKB0nMPnrtCv202wwabgMu/hYmq0+yNaAYnFlmUMM0elOGj8/Ai
   ZMk3ULYjBSeFcHxXpmdN+nUPTAgtnkoNqciUwZBsib8+EebK5Ig9DH7CQ
   G8pKpUQok/OD3q70s2CTGqpyr6TMr+uYWSHu2bAH0Uv4efLHsjJacLHwz
   LEjU2Oy4IT+C8VZvBey3PoN63fOGr+C3/OXa5vglzcia2ydgLkHNqgFev
   WCbCu8U/vX+dm+4/He+cSgM88X3BjWsAPMp70I/3HsCnjH13J2timdr+y
   kLnj/HVQpf22ChNTqQzOqj3qN6KLAfrDoLsP+2Rs8BAtP9WJhbw8mnikZ
   Q==;
X-CSE-ConnectionGUID: bz/UOA90T7yuJH6pK7vzjg==
X-CSE-MsgGUID: RcRe/plQTxWfLNSC2j3ZVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87539390"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87539390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 12:50:09 -0700
X-CSE-ConnectionGUID: 0ILIiV2GQJynK6f24B7t+A==
X-CSE-MsgGUID: zUTZpYGvS8qtFSz5gg8EVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256951971"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 12:50:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkoZQ-00000000T6N-2YG1;
	Fri, 17 Jul 2026 19:50:04 +0000
Date: Sat, 18 Jul 2026 03:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 2/31] ERROR:
 modpost: "ktime_mono_to_aux" [kernel/time/time_test.ko] undefined!
Message-ID: <202607180345.0XKGQTHJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   36b70ed194973abf48fbb212bf61d246721391d8
commit: 26bfd7e75b8185be25577c735682f077070822ec [2/31] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: um-randconfig-001-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180345.0XKGQTHJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180345.0XKGQTHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180345.0XKGQTHJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ktime_mono_to_aux" [kernel/time/time_test.ko] undefined!
>> ERROR: modpost: "ktime_aux_to_mono" [kernel/time/time_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
