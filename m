Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA5152522;
	Mon, 22 Apr 2024 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713798458; cv=none; b=lZStGpzPva3pYUVwtAAlfonVZC8aAM2gtFIxnpk68qaHWDNUOmVJIN9+WSy/bJzY5mYWF9nIdKvgwrZkueBr8PgHkne5mupFx+Q4d3/V54TCwkAJ07eMOiOXFOjvHJvqKblv8TZzo/3DzfT6FYbfj6q7rbXlhMI1sR7xTkEd/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713798458; c=relaxed/simple;
	bh=LECIaM91Psb2dm6DqMQro75OTIDA04zgrtVeFPRAHT8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENPpl/9tpDX+djUTT5ro+QQKrweMrKYFdfoDkK2l8TNaFVFtSoxZDP6SRuoV8NdfZrFQZUVQwna4+XF8l3b+QkxXrZim7+/igBjHB+IJAUu4BoDY4M8U7nA7ex7IKt06bg4CvOdh8qjDjAEYYZsBkykGBKBZOad3FlgHDfc58tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWcVBVLh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWcVBVLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713798455; x=1745334455;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LECIaM91Psb2dm6DqMQro75OTIDA04zgrtVeFPRAHT8=;
  b=iWcVBVLhJQ4VKnDi/e9fSHG7gE0ZK7M+CJEE9kaZw+3fcgignaN0K+w7
   jRIdyGQjon8985cu4waO/AuG2BE3Jg48hp7tpyBAr13TIrXitfqPMUjrc
   s3cMPs1z1MqLQaYZLHabhkaZBM/h+KpkQaFK6NqYMaK4RxbWOtwEpa445
   iw/I7CANL4nT74xXX79rzEaC0/rZxKW8m0/Mn6UdexdOjDAWieJhdYKlV
   +6C4FV3ZyP5dy8TApjTRn+Cmd81GYl8jBhH7pBWvcbKF82/CKziHkBG+H
   VXUDTNnbwvqe2iQYF3T4UPJrbxreXkL9VGcyZffpRvnVVoWN91JmmoCO0
   A==;
X-CSE-ConnectionGUID: Iq4OWtYxTP2MhI5DJtDTsQ==
X-CSE-MsgGUID: TO/Baj3jQE2fBT7Ma+V4bA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26857189"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="26857189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 08:07:34 -0700
X-CSE-ConnectionGUID: GycNDFl9RumH7RszF16mnw==
X-CSE-MsgGUID: fsvjIUCJTd+rP7rTH1H7RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="61492949"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2024 08:07:33 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryvGU-00003c-0b;
	Mon, 22 Apr 2024 15:07:30 +0000
Date: Mon, 22 Apr 2024 23:07:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/4] virtio_balloon: introduce memory allocation stall
 counter
Message-ID: <202404222241.599OtAGQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240422074254.1440457-4-pizhenwei@bytedance.com>
References: <20240422074254.1440457-4-pizhenwei@bytedance.com>
TO: zhenwei pi <pizhenwei@bytedance.com>
TO: linux-kernel@vger.kernel.org
TO: linux-mm@kvack.org
TO: virtualization@lists.linux.dev
CC: mst@redhat.com
CC: david@redhat.com
CC: jasowang@redhat.com
CC: xuanzhuo@linux.alibaba.com
CC: akpm@linux-foundation.org
CC: zhenwei pi <pizhenwei@bytedance.com>

Hi zhenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.9-rc5 next-20240422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/virtio_balloon-separate-vm-events-into-a-function/20240422-154406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240422074254.1440457-4-pizhenwei%40bytedance.com
patch subject: [PATCH v2 3/4] virtio_balloon: introduce memory allocation stall counter
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240422/202404222241.599OtAGQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404222241.599OtAGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404222241.599OtAGQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_balloon.c:9:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2254:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/virtio/virtio_balloon.c:340:37: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
     340 |                 stall += events[ALLOCSTALL_NORMAL - ZONE_NORMAL + zid];
         |                                 ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   2 warnings generated.


vim +340 drivers/virtio/virtio_balloon.c

   318	
   319	/* Return the number of entries filled by vm events */
   320	static inline unsigned int update_balloon_vm_stats(struct virtio_balloon *vb,
   321							   unsigned int start)
   322	{
   323	#ifdef CONFIG_VM_EVENT_COUNTERS
   324		unsigned long events[NR_VM_EVENT_ITEMS];
   325		unsigned int idx = start;
   326		unsigned int zid;
   327		unsigned long stall = 0;
   328	
   329		all_vm_events(events);
   330		update_stat(vb, idx++, VIRTIO_BALLOON_S_SWAP_IN,
   331			    pages_to_bytes(events[PSWPIN]));
   332		update_stat(vb, idx++, VIRTIO_BALLOON_S_SWAP_OUT,
   333			    pages_to_bytes(events[PSWPOUT]));
   334		update_stat(vb, idx++, VIRTIO_BALLOON_S_MAJFLT, events[PGMAJFAULT]);
   335		update_stat(vb, idx++, VIRTIO_BALLOON_S_MINFLT, events[PGFAULT]);
   336		update_stat(vb, idx++, VIRTIO_BALLOON_S_OOM_KILL, events[OOM_KILL]);
   337	
   338		/* sum all the stall events */
   339		for (zid = 0; zid < MAX_NR_ZONES; zid++)
 > 340			stall += events[ALLOCSTALL_NORMAL - ZONE_NORMAL + zid];
   341	
   342		update_stat(vb, idx++, VIRTIO_BALLOON_S_ALLOC_STALL, stall);
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
