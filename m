Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452C4FBF3;
	Mon,  3 Jun 2024 04:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717388228; cv=none; b=RYzMQecASuTBg9NzbjPQ8NtWXmh7y5iHythBzzY7fDKeF/TGDW9GFkK3juUjVohriCItMV3VaX5No9BE3qjxc+P93Sx7lhu5ExYXiKIa9wxyX1wfh2tG1M0SIsZFyXB165EmcwifLw808mPb781kwMfkUfwJtJbpAd8LCcr7v4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717388228; c=relaxed/simple;
	bh=O/4sSGwgaQocie1Gnbe9oYv7EOtmCu7aDVA49dj2VnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIjvmWi3SskJFnhCu3vL0glOP8mf81b+tHIu53N7BvJo+dqxpn0i6z8IcSr5V0beC9dAjHRE+DQQAOtyUlT3O6Uwf74QE1YtvXS61u6yPP4SRhPzQoizekD8DcuVIIAv10Tb+HajDbbZvFkwL86aHw7dg1aW8BC9TPOx3aHa8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MectnGOu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MectnGOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717388226; x=1748924226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/4sSGwgaQocie1Gnbe9oYv7EOtmCu7aDVA49dj2VnY=;
  b=MectnGOuOuP43Nudt9Y410Ktn389jI8Bk5IvrLWDQ1iitAGlN9lS40xN
   bA6PHs4yQEiFDHyg3rZESvcfPCLDIBrJkUmHhF1w/Qbs5JqFZdVv50eyl
   fM2rcfQI4Cah5T2FHhoiFeIAUz5Uj+mIUDk5GEzIZk6YkZtazoWXMp5Lx
   QgarzouDSQiwU8gjvq3aVIjzbAmg/lJ0l3ZoliIrnseK6RwcMeM6otPk3
   Pqdx/++Vc4pYypMW73W4l2fuI722AyF87nS3N0COIiw4gNVMEyHZVZrum
   m6n8DFQTUaQ92Z/O2zdMfeuutG0oa8/KJopdHPbGOLuOFVlvdew4nWjka
   Q==;
X-CSE-ConnectionGUID: MrO+OKNiTvClZFHvhtXOBw==
X-CSE-MsgGUID: Ee3duRyeReWsCtalfzfvvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="39269415"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="39269415"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 21:17:05 -0700
X-CSE-ConnectionGUID: 6f6rtPN+RLOh83WH3GdKzA==
X-CSE-MsgGUID: Cjbm2nWZT6KdWLY6C9xA1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="41839561"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Jun 2024 21:17:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDz7z-000L0z-21;
	Mon, 03 Jun 2024 04:16:59 +0000
Date: Mon, 3 Jun 2024 12:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>,
	Kent Overstreet <kent.overstreet@linux.dev>, brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	Bernd Schubert <bernd.schubert@fastmail.fm>, linux-mm@kvack.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 3/5] fs: sys_ringbuffer
Message-ID: <202406031142.Xw5hn2Ks-lkp@intel.com>
References: <20240603003306.2030491-4-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603003306.2030491-4-kent.overstreet@linux.dev>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on linus/master v6.10-rc2]
[cannot apply to akpm-mm/mm-nonmm-unstable tip/x86/asm akpm-mm/mm-everything next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/darray-lift-from-bcachefs/20240603-083536
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20240603003306.2030491-4-kent.overstreet%40linux.dev
patch subject: [PATCH 3/5] fs: sys_ringbuffer
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240603/202406031142.Xw5hn2Ks-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031142.Xw5hn2Ks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031142.Xw5hn2Ks-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1603:2: warning: syscall ringbuffer not implemented [-W#warnings]
    1603 | #warning syscall ringbuffer not implemented
         |  ^
>> <stdin>:1606:2: warning: syscall ringbuffer_wait not implemented [-W#warnings]
    1606 | #warning syscall ringbuffer_wait not implemented
         |  ^
>> <stdin>:1609:2: warning: syscall ringbuffer_wakeup not implemented [-W#warnings]
    1609 | #warning syscall ringbuffer_wakeup not implemented
         |  ^
   3 warnings generated.
--
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> <stdin>:1603:2: warning: syscall ringbuffer not implemented [-W#warnings]
    1603 | #warning syscall ringbuffer not implemented
         |  ^
>> <stdin>:1606:2: warning: syscall ringbuffer_wait not implemented [-W#warnings]
    1606 | #warning syscall ringbuffer_wait not implemented
         |  ^
>> <stdin>:1609:2: warning: syscall ringbuffer_wakeup not implemented [-W#warnings]
    1609 | #warning syscall ringbuffer_wakeup not implemented
         |  ^
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
