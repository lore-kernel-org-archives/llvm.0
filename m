Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754006;
	b=WIvGskYP2bWQsg7hDkOP5kZEWoiE4QFGswn8DUnhiu2iwYmhEUZzaKHfX/b3kbWhd2yE
	 /opPefVpvMAnQg3Y5kbQE7kicep8OzgjxPAPLD/tZAPkD9ae7wc+UgmKl1fwIEqfU3zZ/
	 y8+DOca3ulcngqTsgXd6qvfdAL838zOR5CTgE2wR/CPsD4O0CiYoVPyyay5IYYKeP7SNj
	 5iqyQyvlXk0mUQi9bB8pzZQZ/Jd44QPeosRAZPmsqD8e2CxIKo8qesWZl09fYvshJkeXh
	 A2K8EXD4kgELVPvwbSJNeVFvBE9sYWj0C4GSw5Wnwg6tPPG0kfEDJJlYf1fegZihP+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754006;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DkN5EBdbPUtDHIozM/fmpd/KL54M6Mf5B1VBYAKsU9k=;
	b=kjjUWvxIhvL1PArQd4+8NxivOg6D5xkuFvA9YX0WHtuo25nCbYdLIAm++Kj2z7kOGP8X
	 /hTWXrpHkBzf/d3QnhxM1LGKt4gLur1Tm6mlICZoYcPfPYKGGbG25R4zErzeBhhwgjf3f
	 KTHKzBnoSTWzNUdTktsEJxuqwO4CPWHrfvYW5zd2xA+O7mOLWMoFepTk2gyaseb/o8ZId
	 qdl2WDcJ7p90KeQavFG7/YUSio2ZuHXvQn85czGK71CjKpcFAqZ3Rn41bij7Qu5Z8/CPd
	 HS8dtoUMcYAXsrc90L15kBV2AbHFIDfkd43x9+58HRQCBa7C/e55N4Y2WgIFIuIi2Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BSS51C5t;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006C606A31B;
	Wed,  4 Nov 2026 01:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A006C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BSS51C5t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793754006; x=1825290006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7iNH0ZCFPCuLx066aBsp3hyWUzPD69yXDaRM1P+78Fc=;
  b=BSS51C5tEMq3WyKO5JE2dLjVYg3+KyWiJdd5TI+Blyjeka64phUJPU2l
   +UJmXeasGMozelc/LGUnb3dX9Km7mJswUaDN34xQWtfXzH+LIhMHtc+rc
   7FrMOfw4q1rVpENTKmw1oc0Z/PhBxYcV3q/Vo8OkbmBZ8oOMWX917xxVe
   dGX0VGBCKmT5oc2GmrJGokU32uqZ8cpna7buFB/QUBvl8/NAPoAHsBiRv
   QuWpLEUHBrroKL3m/p8daBBaKSCawz7OVNAVCEtVwrT/UnOf7b/mnJJyS
   pStYZ4CqDYZx3ABMqE6NXSo7gVHBPEthtNmRUgBnT25Hp3OfWi+sURfBe
   g==;
X-CSE-ConnectionGUID: KbHB5+cNSqCYbCx8Jlu69w==
X-CSE-MsgGUID: rbackrg8RVC2cQMubW6jmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2526952"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2526952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:00:05 -0800
X-CSE-ConnectionGUID: iIhjQ9bJQeafV4/CHTOQ6A==
X-CSE-MsgGUID: NMOFN8axSC2vmazRKiLDig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7128015"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 17:00:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOPM8-00000000jYV-1XdH;
	Wed, 04 Nov 2026 01:00:00 +0000
Date: Wed, 4 Nov 2026 08:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>,
	netfilter-devel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coreteam@netfilter.org, phil@nwl.cc, fw@strlen.de,
	pablo@netfilter.org, Fernando Fernandez Mancera <fmancera@suse.de>
Subject: Re: [PATCH nf] netfilter: synproxy: prevent unbounded recursion in
 transmit path
Message-ID: <202611040824.Zozbyqd6-lkp@intel.com>
References: <20261103125638.4667-1-fmancera@suse.de>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103125638.4667-1-fmancera@suse.de>

Hi Fernando,

kernel test robot noticed the following build errors:

[auto build test ERROR on netfilter-nf/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/netfilter-synproxy-prevent-unbounded-recursion-in-transmit-path/20261103-135638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20261103125638.4667-1-fmancera%40suse.de
patch subject: [PATCH nf] netfilter: synproxy: prevent unbounded recursion in transmit path
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261104/202611040824.Zozbyqd6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040824.Zozbyqd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040824.Zozbyqd6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nf_synproxy_core.c:24:10: fatal error: 'net/netfilter/nf_recursion.h' file not found
      24 | #include <net/netfilter/nf_recursion.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +24 net/netfilter/nf_synproxy_core.c

    16	
    17	#include <net/netfilter/nf_conntrack.h>
    18	#include <net/netfilter/nf_conntrack_ecache.h>
    19	#include <net/netfilter/nf_conntrack_extend.h>
    20	#include <net/netfilter/nf_conntrack_seqadj.h>
    21	#include <net/netfilter/nf_conntrack_synproxy.h>
    22	#include <net/netfilter/nf_conntrack_zones.h>
    23	#include <net/netfilter/nf_synproxy.h>
  > 24	#include <net/netfilter/nf_recursion.h>
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
