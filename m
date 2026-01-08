Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866D3328E0;
	Thu,  8 Jan 2026 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767906322; cv=none; b=OsA8GbJYnYttTFffgFiwtKyhFx4g+Qdou5N64PEFbyhLrKg1ad7GwRrxkmh6gzURK4iFtGYpzlTbsXBFuXtETxadPBai4MvNYL6ScPrz6rbIexJBWZNGhJlIRj54jzwfrylbF4w9TzdAqu26JrQcb5X96mNenb9URU0h9dz1LP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767906322; c=relaxed/simple;
	bh=+WnQHj0lg7EAQX+YbgE2lusc+q8ddfwIUjjQ0bTC3fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGLc330MbmGHAqUoT6k9NshrfDOlTzoX0eGnui1HkikC9P9geuAB2dawbGWeMzplSPM+vpIlNqc/qpiom0Q5tmtGHT8I++hoDXTKJ8Fw6g1jfihEVvD9hEaa9n2V6Hk6N8iE1hp6izhzCdmNYqDRaCeXLZqzKJ8BCKZtGyCzoZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmCzbN1k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmCzbN1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767906320; x=1799442320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+WnQHj0lg7EAQX+YbgE2lusc+q8ddfwIUjjQ0bTC3fE=;
  b=BmCzbN1kQtlmoXplGOHj5Xjg6356Y323XlmAnrj+NaJHTqsDTFX6JYmR
   uBFzMq20iJG7iOvLmgLcGGdKPLt43QGNrz57cpRoCEgsytYmGySPQ0KXY
   bvNbU+rQvC+tGctFCmgP8ugF9vB+NB8OMAVIZZaBu8+kzCPFb/Qg+Mhny
   4U9FOfqnoZ8I6dJH0tBEuCG+sBw2pQ9FID3zZuxaDOdWprCkMnxtwi8GL
   zoZqkZolBcYZamQstyeuzM+dfzNk1II9fhnei4msDDMPh9F/UrNQ/j7eA
   24PYr5b0Wdx1TOffPT06xBj380L021pK176Zza+ihK7PIrN+5zXIeHwre
   w==;
X-CSE-ConnectionGUID: PRb6jRWNSuW+pX7srNaCMQ==
X-CSE-MsgGUID: UjkNDmnwSnaHCmSQnM5pjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69342914"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69342914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 13:05:19 -0800
X-CSE-ConnectionGUID: Z6vPPb/XRty4kp7GZYZtGw==
X-CSE-MsgGUID: Xq2bwUfBQVaPeuvbfvmZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207783715"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2026 13:05:12 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdxBu-000000001qu-1XV0;
	Thu, 08 Jan 2026 21:05:10 +0000
Date: Thu, 8 Jan 2026 22:04:13 +0100
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>
Subject: Re: [PATCH V3 16/21] famfs_fuse: GET_DAXDEV message and daxdev_table
Message-ID: <202601082251.cKsBXMtT-lkp@intel.com>
References: <20260107153332.64727-17-john@groves.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107153332.64727-17-john@groves.net>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.19-rc4 next-20260108]
[cannot apply to mszeredi-fuse/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dax-add-fsdev-c-driver-for-fs-dax-on-character-dax/20260108-013232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260107153332.64727-17-john%40groves.net
patch subject: [PATCH V3 16/21] famfs_fuse: GET_DAXDEV message and daxdev_table
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260108/202601082251.cKsBXMtT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082251.cKsBXMtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082251.cKsBXMtT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/famfs.c:203 function parameter 'fm' not described in 'famfs_update_daxdev_table'
>> Warning: fs/fuse/famfs.c:203 function parameter 'meta' not described in 'famfs_update_daxdev_table'
   Warning: fs/fuse/famfs.c:316 function parameter 'fmap_buf' not described in 'famfs_fuse_meta_alloc'
   Warning: fs/fuse/famfs.c:316 function parameter 'fmap_buf_size' not described in 'famfs_fuse_meta_alloc'
>> Warning: fs/fuse/famfs.c:203 function parameter 'fm' not described in 'famfs_update_daxdev_table'
>> Warning: fs/fuse/famfs.c:203 function parameter 'meta' not described in 'famfs_update_daxdev_table'
   Warning: fs/fuse/famfs.c:316 function parameter 'fmap_buf' not described in 'famfs_fuse_meta_alloc'
   Warning: fs/fuse/famfs.c:316 function parameter 'fmap_buf_size' not described in 'famfs_fuse_meta_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
