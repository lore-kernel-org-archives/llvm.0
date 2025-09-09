Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F554654;
	Tue,  9 Sep 2025 04:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757390987; cv=none; b=uOVpIWggqX9y5zb0JYLGmQhWTSTHDsi3u1mFdW4+ptmzZ8uEOK/InRwbA0Xqtyxi+0v58ySJMusTjIzRgb2hTrYWJbKssJ2hx7vhnyq1diZLHNgU8qdn5Q3z/3bI7NIyUcjjtdxI/dQvZKTz7KZ9+8p/DiO9A+hm3LK9RG1B+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757390987; c=relaxed/simple;
	bh=jhYZYCBzrdRs97Lp5NHmjYhyow4hwuVi+HJ47Uu6hEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgEw8mbShGf4AuUZ/abNXplsA/gXhKNzofV0c3dGzP/SpoWTKIgvvPufRf6W/9u5ZjQzWWEUYrqn7sS+WesTYgcLg+usI73h73Ruj3VZ+wxYeFvs6mHBTNVIbyK+CXsfs5nACV6nHKMu0fwAw3BeAHiR7/cb1R226wrQc1xASeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoMz4YCf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoMz4YCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757390985; x=1788926985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jhYZYCBzrdRs97Lp5NHmjYhyow4hwuVi+HJ47Uu6hEY=;
  b=YoMz4YCfyqBZBt9iamBcydeGpAlmrBMzaKiS5SMnkSKpQIG991qeUrOk
   TvppCy47yZYfswH03Hl1EFsiAqHI9iT48T9mxHmxm/PjrFQmMp7AcWd8h
   /doJ4EnU4QskrIaVythcFJ25ccV7bwEe1jzDYAICuXZAJw9A9zdzkZMwM
   1SKVCdV9k39y4ZcdDOlIfIlaoUVATEea/s0+Q/Ibyq8+ceJSJ2hO0SnU9
   iUMcjMcs1Y3W87I4Eb6+2PsDu+L0R8DX/pvccrmuVnsxzJNfv4UBSwPZx
   myU9cPN3Cm7dAHZfzFEOFBfLy7sRrz2eT9GBJeo+VA8xwSvIhkE1OgwWt
   Q==;
X-CSE-ConnectionGUID: 71aqZ8b/RBGJJm0yhMlarw==
X-CSE-MsgGUID: DMqZBdgvRnKqKjzBLbdDhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47239522"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="47239522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 21:09:45 -0700
X-CSE-ConnectionGUID: KZ/2k0LqTpC8WVCYgqnxaA==
X-CSE-MsgGUID: 8I5xC4gsSpiBDJf3Eq8iug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172150183"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2025 21:09:37 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvpfi-0004Q3-2X;
	Tue, 09 Sep 2025 04:09:34 +0000
Date: Tue, 9 Sep 2025 12:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>, Guo Ren <guoren@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Nicolas Pitre <nico@fluxnic.net>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH 04/16] relay: update relay to use mmap_prepare
Message-ID: <202509091137.FMoksKmh-lkp@intel.com>
References: <9cfe531c6d250665dfae940afdb54c9bd2e9ba37.1757329751.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cfe531c6d250665dfae940afdb54c9bd2e9ba37.1757329751.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on brauner-vfs/vfs.all char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus s390/features lwn/docs-next linus/master v6.17-rc5 next-20250908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-shmem-update-shmem-to-use-mmap_prepare/20250908-191516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/9cfe531c6d250665dfae940afdb54c9bd2e9ba37.1757329751.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 04/16] relay: update relay to use mmap_prepare
config: i386-buildonly-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091137.FMoksKmh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091137.FMoksKmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091137.FMoksKmh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/relay.c:83 function parameter 'buf' not described in 'relay_mmap_prepare_buf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
