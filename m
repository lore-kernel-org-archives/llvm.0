Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8D28C873;
	Mon, 30 Jun 2025 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300710; cv=none; b=H0RbZHoduYqulsp43701A6DNs++nApWAIt9qjwo2wJQ8zke2wouJFxjhdaPORfd265zdTyZQT73oZsDaLH1c3ArreAq1XF9Qh0gfO14adICgF6N3jkmPqsNaHKBUzijjWBz8d31ZgoZD0dRSkmiEPYrLLSXToJCXorG4w2CjYso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300710; c=relaxed/simple;
	bh=ux+trMzmDsu919a8g/ViYn9yx0SZb18epLylTUUzWZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjswLwUm6PK5Vfkn65wDUUVnEMLnS2autb4omORdyMBMy1tlBwLTZDn1NcNKcaU06E7XHObB3aTPITUcKdweGejuKvNgR9v5ZuPWU6O9jt8WgFx8qtyHr/GG4Eak0LWf7PNQWgXB1XB/xm6MorDokaJ4/sNlzfhSPicDlsTi8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHbLfCuI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHbLfCuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751300708; x=1782836708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ux+trMzmDsu919a8g/ViYn9yx0SZb18epLylTUUzWZ8=;
  b=kHbLfCuIo7Ka31KxmKXApT9U4ln0hg3zHI0RsB2pNcUzAI9BWFeyQY63
   npX0R1hBcka8LEpatWNDqwK1uJyfzBYIXMiQi7jReatzOWITgbPNQzG30
   4iBFC4FFvD7BL36mfrMHML/hxp5PehC410LvpY/Jzd9tVVpz5MxX72qHx
   vaxyClcxeif5EWonQxJGE9WOdG9xLPz3202d5mG152KHCh4lZ10vM1wii
   dpJrqO2f1DBnqSzpqh8ohzBl3K9SzN1W3qgIHSMaloCrB2aBmY57Ing4p
   AfXYjMSp4srwIZSxy4l0h47K1guFgpS6KMj7ue1VAK5WNivjbkz8c3/3e
   w==;
X-CSE-ConnectionGUID: a52XwlpnQOWsxdjPm9yR1w==
X-CSE-MsgGUID: yWVzBtY6TrWnnsReQihyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57342878"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="57342878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 09:25:07 -0700
X-CSE-ConnectionGUID: CT6FU235T/WilUl3y3OD8Q==
X-CSE-MsgGUID: wladRW8rRZuhk5s23jbTaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="159012137"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2025 09:25:07 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWHJY-0001FP-1Q;
	Mon, 30 Jun 2025 16:25:04 +0000
Date: Mon, 30 Jun 2025 18:24:05 +0200
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-defer-tw.3 3/6] io_uring/slist.h:91:7:
 warning: variable 'ret' set but not used
Message-ID: <202506301848.F6jPQVAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw.3
head:   bbc42e47c323defdb248d9802a92852cca44d353
commit: 6e353f5918ea32f8c5719096de064efa5858e5c9 [3/6] io_uring/slist: add list-to-list list splice helper
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250630/202506301848.F6jPQVAB-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301848.F6jPQVAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301848.F6jPQVAB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:82:
   In file included from io_uring/io_uring.h:13:
>> io_uring/slist.h:91:7: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      91 |         bool ret = false;
         |              ^
   1 warning generated.


vim +/ret +91 io_uring/slist.h

    87	
    88	static inline bool wq_list_splice_list(struct io_wq_work_list *src,
    89					       struct io_wq_work_list *dst)
    90	{
  > 91		bool ret = false;
    92	
    93		if (wq_list_empty(dst)) {
    94			*dst = *src;
    95		} else {
    96			dst->last->next = src->first;
    97			dst->last = src->last;
    98			ret = true;
    99		}
   100		INIT_WQ_LIST(src);
   101		return false;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
