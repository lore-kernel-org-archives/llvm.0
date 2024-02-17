Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CED1C36;
	Sat, 17 Feb 2024 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708128187; cv=none; b=fDnlePOAMu85jSu+TLQwNXnZPWLA5081kpT1d6j5xd1STmdq4otto22wAI7BJv/hWrpxsP5Aj+vyj/ykOkRlRHNBf6lQITa4Wnko20OQsM5KLkPYrMGogb0IXtb+Dku3p752OyeHGhqFzphlgNUTUdUrc2ohIsPn8mfqOu7W6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708128187; c=relaxed/simple;
	bh=TWz44F2ZNw+AgUXqzS6iNm/VAQClI4R2NMSsnPODE9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtnLfVJYsZX0aRUu102ehq+Af4DsjaTFrho+QvrME3S20ECYrV1Sbd7XdN3YZtXDijdjSvPfdGSwc0Xn1WQVhxToqYdjd6h/Anpq9R38ppRcEexOx3r4BhKi2Pa6W43NvTMhS9VVTDQpDW3h2KlWv0mNfr6Oh4W3MuWenhUuf3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kqg1ceVA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kqg1ceVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708128186; x=1739664186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWz44F2ZNw+AgUXqzS6iNm/VAQClI4R2NMSsnPODE9c=;
  b=Kqg1ceVA/h1L8ydEDgQPBDm/xrp+DTGY7cozTurNqsRUCTNM4+cshY+d
   g1DLW1wcXgqQFcQOjNDSKVYtVQJQ9wwkaXmS53HoItNJbE0hEOVurhC+i
   e2Fn/IOv7iCmO5HgKmgV9qM03kmmeKIc2j7GBbt6FNWijicdt5vBywWWW
   o+ZMgXZaRvLboG/xLF7TRQ2JrtHudLV8bsY7xC30/3diXLUjrMutOQUhB
   6tauAdTwIQiJmuYNI9cDHwWGbO4bhvDD7VwslptZroljmrQBX5G761KXs
   o200Bqp03rVtodZ7Ko6NxcQX1Wdm73PHdAb/vpr1w+PlRgpfZBx3Rlt2l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19695172"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="19695172"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 16:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="34764566"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2024 16:02:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rb8AK-0001hM-1f;
	Sat, 17 Feb 2024 00:02:48 +0000
Date: Sat, 17 Feb 2024 08:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] drm/ttm: Consider hitch moves within bulk sublist
 moves
Message-ID: <202402170714.cflOUDkj-lkp@intel.com>
References: <20240216131446.101961-4-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216131446.101961-4-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip next-20240216]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240216-211801
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240216131446.101961-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/4] drm/ttm: Consider hitch moves within bulk sublist moves
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240217/202402170714.cflOUDkj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402170714.cflOUDkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402170714.cflOUDkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_resource.c:545:20: warning: incompatible pointer to integer conversion assigning to 'u64' (aka 'unsigned long long') from 'u64 *' (aka 'unsigned long long *'); remove & [-Wint-conversion]
                   cursor->bulk_age = &bulk->age;
                                    ^ ~~~~~~~~~~
>> drivers/gpu/drm/ttm/ttm_resource.c:551:23: warning: comparison between pointer and integer ('u64' (aka 'unsigned long long') and 'u64 *' (aka 'unsigned long long *')) [-Wpointer-integer-compare]
           if (cursor->bulk_age == &bulk->age)
               ~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~
   2 warnings generated.


vim +545 drivers/gpu/drm/ttm/ttm_resource.c

   517	
   518	/* Adjust to a bulk sublist being bumped while traversing it.*/
   519	static bool
   520	ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
   521				       struct ttm_lru_item *next_lru)
   522	{
   523		struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
   524		struct ttm_lru_bulk_move *bulk = NULL;
   525		struct ttm_buffer_object *bo = next->bo;
   526	
   527		lockdep_assert_held(&cursor->man->bdev->lru_lock);
   528		if (bo && bo->resource == next)
   529			bulk = bo->bulk_move;
   530	
   531		if (!bulk) {
   532			ttm_resource_cursor_clear_bulk(cursor);
   533			return false;
   534		}
   535	
   536		/*
   537		 * We encountered a bulk sublist. Record its age and
   538		 * set a hitch after the sublist.
   539		 */
   540		if (cursor->bulk != bulk) {
   541			struct ttm_lru_bulk_move_pos *pos =
   542				ttm_lru_bulk_move_pos(bulk, next);
   543	
   544			cursor->bulk = bulk;
 > 545			cursor->bulk_age = &bulk->age;
   546			list_move(&cursor->bulk_hitch.link, &pos->last->lru.link);
   547			return false;
   548		}
   549	
   550		/* Continue iterating down the bulk sublist */
 > 551		if (cursor->bulk_age == &bulk->age)
   552			return false;
   553	
   554		/*
   555		 * The bulk sublist in which we had a hitch has moved and the
   556		 * hitch moved with it. Restart iteration from a previously
   557		 * set hitch after the bulk_move, and remove that backup
   558		 * hitch.
   559		 */
   560		list_move(&cursor->hitch.link, &cursor->bulk_hitch.link);
   561		ttm_resource_cursor_clear_bulk(cursor);
   562	
   563		return true;
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
