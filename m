Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645122;
	b=WrxTJzHc8KxiWjT3wS7ibMX9K2tO4dxNlLnbqOIUyJJnzFij2ElppNcHgoR5z3lvqrVk
	 /tStHZ1OrZAPpOt9whnuyPyMjLKlUqoiflXBCgo7eZM7UBL32E2fWmOedqjcNWXCwT+Pw
	 uxM+iWVEoBKXbjQg5aTINRaOizjuoxjq+NhoNocy3pX1uWZo9/9Aq11sg9wGrQZzaw729
	 5c43dfhgY0RC3TzL+xLI6IHpusJkzLsjkgXuVBwJzISeYIinqeb2B3xIzDk6WRUtuCork
	 HNvjVfQFLI4fv4YB8zgQa4yc3o9hh3Ecquv4u2zTN4eUOxhr8hszTgiUatWMkryp38A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645122;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=o5KFqUXXjfeTfqARHGi1E8eWl4G8Q6kAjZPv4QHZ+Z8=;
	b=laqcvrZ68y2Ubranr9/zg7OjtnIPv8qvwopRYfKXXGbGtRSsBL9ODTq2ZLK9bcJ8crpL
	 kI8uXwJvGIzay3Z1+zMbp5hjwSePlYsIaGkzy1g4Lg5v6DxUMZXQ0eAOroj32BsgSCsJN
	 Pdo0YTdFGq6MKwk4f5vxFyzZkq9ILfudOL9ylcMQOaqGlg9bH39Rifh6RmSa9v0B3vujt
	 lNfENH41zsNucTMj4ppQJM6xDSc/RKEQbQ0HBnncpRhgFQG5KQfN3ehboxv6jplCYt91w
	 tCyk4O+bsKL3oj0BwZ62vJQtPqwsHVW/2vBM3jfoZa8YTWozguOEoJLSvu+gfWs1FCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHZcxydn;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F08606A321;
	Wed, 25 Nov 2026 22:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08F08606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHZcxydn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795645122; x=1827181122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPukY6G2SgZJasLiTZ5RJSGQ781r9OSE3UZlYheDPgc=;
  b=mHZcxydnJBf7K5826MxY+ZwAbCW7uf3iEaEOdvBpjkFhzgvAtcOOyL24
   dNQE/zA+1OQNFPeBEYv7YjJegC21tfWtyDjYxhnxMQ5uR3C7lFHlN5UEr
   K32ItfVgcdBt/mGFloy/ZZ/r2gLXcZ0Y04ZGHTfaqq4MjX12DwkvmOMx+
   en/9FvDSLprDc7ePJZ1NcAUsj62hfAXFCafNcv7r29XWYj+xjQIYNAiob
   pkmai7fhmCd2lH+M5c0HM5mSLxabkQ6Yv5Zs68Qukh6W3xwGQXQ0I8rsc
   IZkHBveGtX8qoz4aXP2c9E1eMXxgCDZPJpC8jZZVeWdlv0VlIZ4rdlgqm
   g==;
X-CSE-ConnectionGUID: aSmTLe57TlK2SY1kfzGChQ==
X-CSE-MsgGUID: rT+aQiMjRoKFBl3iMAvLSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4512049"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4512049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:18:41 -0800
X-CSE-ConnectionGUID: fJrdTqlmT3uj9FZd8amQpQ==
X-CSE-MsgGUID: Fy48RiB9TUqmlTK2M7JttA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11866513"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2026 14:18:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWLK0-00000001SlM-1Gj4;
	Wed, 25 Nov 2026 22:18:36 +0000
Date: Thu, 26 Nov 2026 06:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-btrfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>, Boris Burkov <boris@bur.io>,
	Filipe Manana <fdmanana@suse.com>, David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [PATCH v8 25/27] btrfs: zoned: keep a zone free for relocation
 when allocating data chunks
Message-ID: <20261126060952.TMeGle2I-lkp@intel.com>
References: <20261125102956.266389-26-johannes.thumshirn@wdc.com>
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
In-Reply-To: <20261125102956.266389-26-johannes.thumshirn@wdc.com>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on btrfs/for-next]
[cannot apply to linux-review/Johannes-Thumshirn/btrfs-zoned-don-t-wait-for-a-zone-finish-after-a-filesystem-error/20261117-195824 linus/master v7.4-rc4 next-20261125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-don-t-wait-for-a-zone-finish-after-a-filesystem-error/20261125-112930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20261125102956.266389-26-johannes.thumshirn%40wdc.com
patch subject: [PATCH v8 25/27] btrfs: zoned: keep a zone free for relocation when allocating data chunks
config: hexagon-randconfig-1001-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126060952.TMeGle2I-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126060952.TMeGle2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126060952.TMeGle2I-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol '__hexagon_udivdi3' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
