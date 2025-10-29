Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DF2E542B;
	Wed, 29 Oct 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735322; cv=none; b=rA7BTnwFklloc4q7JNxFFWTKfLSyCjB7cSMDiiKFZZzgeKJ4AEjwAOGlLQh9aOK63LWEOuCrP7RIH2dMxE08APkN0/gQUOwvMnuzIm7Rg8rK3ykvMY1i8dYEYhFqsiTs/eNx8x3d0T/OIIG2Ulu2z1TxL1y4QSxaHK6rIxDSQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735322; c=relaxed/simple;
	bh=NjNiDioOMI1pkx10hlj9h3au0FJsjS8Y9KRPvUKKpXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfHPhyEBIF832nk9DDOhx6/0t7IvpxUYn7m7utdjSahFK4FqdDZAsIeK4U8Nu9l5bgKS2fLApcHPYkXbGd4h6oRirW5mCVtY4QmlmzzFoUHv9KCOiCAY+9N6Q3taIiSbqCabiBe0Ljb1MUZmJC3sJ0ZrSodcbE8cVibb5vf2808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWCYd8eZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWCYd8eZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761735321; x=1793271321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NjNiDioOMI1pkx10hlj9h3au0FJsjS8Y9KRPvUKKpXE=;
  b=cWCYd8eZ4XfurrADHBWlrTqDxq6hxXuORApid4XSmrz78bbRI1txQoPl
   kBDVtkcy/MyP0pXctT7L/WyZwYkR26f2KnNswrmEd8WwYk/x7Du7bXoR1
   NnMTdpvo8TPi9G/+70TE6Xn40bXkkvWe7hk6d0f4X3e7k1VI/wVrkCBU4
   XEsvXBtHUBCBny7oeO91JIsJlwFy+U1HPo0RP2DYd1/YuCYJXY29lWinC
   C+zlTbHldlnjz/ncR0qoSNUjGC7SHdB5QcObI4igxZbw08BHzfpC2sQ1i
   x9OVZUQmwK9TMAYOwiO5+R8wq/BeBKSS5uFWKsf74wzcOGg9L5ciB3hsa
   w==;
X-CSE-ConnectionGUID: 1Nmf9SOwSI2L5P8WW9kWvA==
X-CSE-MsgGUID: lEA1FJC7Tu2FHe3OeScHwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67689634"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67689634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 03:55:20 -0700
X-CSE-ConnectionGUID: LAJPwXoKToezH8Ftdg68Ig==
X-CSE-MsgGUID: wJ654h5ERO6mu5sGN5DDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="184812315"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2025 03:55:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE3pc-000KWj-1C;
	Wed, 29 Oct 2025 10:55:09 +0000
Date: Wed, 29 Oct 2025 18:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Fedor Pchelkin <pchelkin@ispras.ru>, Theodore Ts'o <tytso@mit.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/2] ext4: fix up copying of mount_opts in superblock
 tuning ioctls
Message-ID: <202510291846.pFj7PlQQ-lkp@intel.com>
References: <20251028130949.599847-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028130949.599847-1-pchelkin@ispras.ru>

Hi Fedor,

kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fedor-Pchelkin/ext4-fix-string-copying-in-parse_apply_sb_mount_options/20251028-211235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20251028130949.599847-1-pchelkin%40ispras.ru
patch subject: [PATCH 1/2] ext4: fix up copying of mount_opts in superblock tuning ioctls
config: x86_64-buildonly-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291846.pFj7PlQQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291846.pFj7PlQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291846.pFj7PlQQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ext4.h:141:22: error: expected ';' at end of declaration list
     141 |         __u8  mount_opts[64] __nonstring;
         |                             ^
         |                             ;
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
