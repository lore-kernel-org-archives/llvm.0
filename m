Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841802F691C;
	Mon, 22 Dec 2025 21:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766440638; cv=none; b=ehGowEbMuByj155ci0UzYt3nMil9SFVaf3/4yzg3T6AfM9CHBKKcSyLx7zqQEI5w+6vV83TpttCFslnovQOwsJdS3AfFo+IHooQRsMWx86CNMXzMVEGZVXP7haiAT/LDKTsJzzARYhFp1RNfR1tmxQANTz6x9IorJ+J6I/1ivjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766440638; c=relaxed/simple;
	bh=nb8viLRr97SzZ6mQSi19rbQ0/XocCdbDMzlJw7HgULg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GobLfGyLzkyV30mu8z8kKywfHsdZexz8Atp+RlhN2Zeadf7DLpkybgeAVd9+S/YpzE3izfF2xcJSAqmHu8D67pCv4103BpAF6ORC3Ynxmqg7+C0JbC6QVAVPWEM3m426aey+fi0tlHX725YGM6X59NhsgzJuNdNLPbF+2D8/jhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gaf4lWft; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gaf4lWft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766440637; x=1797976637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nb8viLRr97SzZ6mQSi19rbQ0/XocCdbDMzlJw7HgULg=;
  b=Gaf4lWftz57MUohlNQVEGAPtAjwnqj3vnzXdjqmK3iNhTAgQCzpWGp3F
   1t1FwSiqFwmMlkzyw/HK0ZStg5WileYp6oJFT8jq5KxxTFpIoKLgXjim8
   w7DpyemMVdIz3iO6fOWqcJIZGwh1NmBLfFgR9rYyaFgql1XaUZtXg6kNJ
   DEOQeC5AsoCb2d1LM6o7zYMXyLwtlrDsCVZ9pdV6SiOfC3wry7LxyWb5t
   +3w+WHK+tCyOhPNlmdixMVlngWRvEe10FFryuPfLJiDdBvQXcH9raHwje
   qBTj/NQmSqnFX4Q+jU131R4nUEd45tOjs/KhrCjcMxxCuf81o3gVOGSo1
   w==;
X-CSE-ConnectionGUID: 8uOn1QM9TqiWtVk4E+Ki7A==
X-CSE-MsgGUID: +sa/rlzwRFa4vhcCyXy/vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79016452"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79016452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:57:16 -0800
X-CSE-ConnectionGUID: HjkeyhQ7RLuj5IQH3bhLXA==
X-CSE-MsgGUID: FYaVCt9SSeGIuO2CLx9ESQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="223101414"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 13:57:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnts-000000001A9-3mPE;
	Mon, 22 Dec 2025 21:57:08 +0000
Date: Tue, 23 Dec 2025 05:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bing Jiao <bingjiao@google.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	akpm@linux-foundation.org, gourry@gourry.net, longman@redhat.com,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, david@kernel.org, zhengqi.arch@bytedance.com,
	lorenzo.stoakes@oracle.com, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, cgroups@vger.kernel.org,
	Bing Jiao <bingjiao@google.com>
Subject: Re: [PATCH v2 1/2] mm/vmscan: respect mems_effective in
 demote_folio_list()
Message-ID: <202512230553.LuiUveL3-lkp@intel.com>
References: <20251221233635.3761887-2-bingjiao@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221233635.3761887-2-bingjiao@google.com>

Hi Bing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tj-cgroup/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bing-Jiao/mm-vmscan-respect-mems_effective-in-demote_folio_list/20251222-074143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251221233635.3761887-2-bingjiao%40google.com
patch subject: [PATCH v2 1/2] mm/vmscan: respect mems_effective in demote_folio_list()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251223/202512230553.LuiUveL3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230553.LuiUveL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230553.LuiUveL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
>> include/linux/memcontrol.h:1824:1: warning: non-void function does not return a value [-Wreturn-type]
    1824 | }
         | ^
   1 warning generated.
--
   In file included from arch/arm/kernel/signal.c:12:
   In file included from include/linux/resume_user_mode.h:8:
>> include/linux/memcontrol.h:1824:1: warning: non-void function does not return a value [-Wreturn-type]
    1824 | }
         | ^
   arch/arm/kernel/signal.c:143:15: warning: variable 'aux' set but not used [-Wunused-but-set-variable]
     143 |         char __user *aux;
         |                      ^
   2 warnings generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
>> include/linux/memcontrol.h:1824:1: warning: non-void function does not return a value [-Wreturn-type]
    1824 | }
         | ^
   1 warning generated.


vim +1824 include/linux/memcontrol.h

  1820	
  1821	static inline bool mem_cgroup_filter_mems_allowed(struct mem_cgroup *memcg,
  1822							  nodemask_t *mask)
  1823	{
> 1824	}
  1825	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
