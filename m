Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BF2CCB4;
	Thu, 15 Aug 2024 03:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723693682; cv=none; b=KBv8Xyy0z4Juad49zKwH2Gcajw88CgjvkOdc72HwRLaxRAazb6KMqcwXfgh13Vr5i518+IU/PmhotThYVa9Fh5t6WkE35D6pIq4YNFWI0BvYdEkbUHlpi3yWrS3CVC9PkFv7myNIFsRu9n04ZVCsue+lsbJq/hIqtjRv8kqI6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723693682; c=relaxed/simple;
	bh=8jdHYyzrVxI2ZpkL5OVz0sF9lPZiBIy28lyVU46/0os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTONgJg4z2Aru0eAlJs+yxIhDq/0jI5BLiE1ywTAvKwoESjvjF7sMDQReaA4kUuAUAErXaEjMCKREDnK8J6yOCf+R/FpH9R0KrImd0tP8AlaaXeW8FoudjW5daNi2D2ma6JJ0cBEfz8JEP1iH8bxPd1K163u/n2gGzrBGqNr3kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euGW3fvS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euGW3fvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723693678; x=1755229678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8jdHYyzrVxI2ZpkL5OVz0sF9lPZiBIy28lyVU46/0os=;
  b=euGW3fvSHUrwjhKoOVi2pn3DvpAQm7eDZKvJhR+lPbpifnxZbNKGcRNa
   60rccgOO2wcBd9AdpSau5bfthy35v9+p3QVrCP0sKQTjt8/h1pfjWHSU0
   2TXgVbODQsCK42eMUsmJyHosNgeVcdZnAxgCT59cUWsjyCiQc4YhRR89N
   CQ9D/8xvdNhJJyWoMrZkHPoYMUtCdJE8+AHrFfWMFav9AeOxVZklRdNX6
   sclV9/tnKbYGz3wQ3ShU8eEOTFcG25JnKmuzNisylF7AbMDSM58aZ/a+M
   MT1D+Laa73xPxBA2yxeXIF2y79g0XK3tFHqE/05t3HSYIa+Op8LljFQlm
   A==;
X-CSE-ConnectionGUID: Rk/42CkSQzKpVzY7wPAr2g==
X-CSE-MsgGUID: 1WRu5FvUQDaFNhvaisVkPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33331259"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="33331259"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 20:47:56 -0700
X-CSE-ConnectionGUID: Vx3Y+Qj2RR6DU6eAAKk/kA==
X-CSE-MsgGUID: uBrNHq4XTNq2JJg9geNZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="59389058"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2024 20:47:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRSp-00039k-2G;
	Thu, 15 Aug 2024 03:47:51 +0000
Date: Thu, 15 Aug 2024 11:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: bajing <bajing@cmss.chinamobile.com>, w.d.hubbs@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	chris@the-brannons.com, kirk@reisers.ca,
	samuel.thibault@ens-lyon.org, nicolas@fjasle.eu,
	masahiroy@kernel.org, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org, bajing <bajing@cmss.chinamobile.com>
Subject: Re: [PATCH] speakup: genmap: initialization the variable
Message-ID: <202408151133.RcP4kFGW-lkp@intel.com>
References: <20240814030243.2138-1-bajing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814030243.2138-1-bajing@cmss.chinamobile.com>

Hi bajing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bajing/speakup-genmap-initialization-the-variable/20240815-000631
base:   linus/master
patch link:    https://lore.kernel.org/r/20240814030243.2138-1-bajing%40cmss.chinamobile.com
patch subject: [PATCH] speakup: genmap: initialization the variable
config: x86_64-randconfig-005-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151133.RcP4kFGW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151133.RcP4kFGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151133.RcP4kFGW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accessibility/speakup/genmap.c:75:3: warning: variable 'lc' is uninitialized when used here [-Wuninitialized]
      75 |                 lc++;
         |                 ^~
   drivers/accessibility/speakup/genmap.c:52:31: note: initialize the variable 'lc' to silence this warning
      52 |         int value, shift_state, i, lc, spk_val = 0, lock_val = 0;
         |                                      ^
         |                                       = 0
   1 warning generated.


vim +/lc +75 drivers/accessibility/speakup/genmap.c

6a5c94d92699b7 Samuel Thibault 2022-06-12  48  
6a5c94d92699b7 Samuel Thibault 2022-06-12  49  int
6a5c94d92699b7 Samuel Thibault 2022-06-12  50  main(int argc, char *argv[])
6a5c94d92699b7 Samuel Thibault 2022-06-12  51  {
1cb16586b0aba7 bajing          2024-08-14  52  	int value, shift_state, i, lc, spk_val = 0, lock_val = 0;
6a5c94d92699b7 Samuel Thibault 2022-06-12  53  	int max_key_used = 0, num_keys_used = 0;
6a5c94d92699b7 Samuel Thibault 2022-06-12  54  	struct st_key *this;
6a5c94d92699b7 Samuel Thibault 2022-06-12  55  	struct st_key_init *p_init;
6a5c94d92699b7 Samuel Thibault 2022-06-12  56  	char buffer[256];
6a5c94d92699b7 Samuel Thibault 2022-06-12  57  
6a5c94d92699b7 Samuel Thibault 2022-06-12  58  	bzero(key_table, sizeof(key_table));
6a5c94d92699b7 Samuel Thibault 2022-06-12  59  	bzero(key_data, sizeof(key_data));
6a5c94d92699b7 Samuel Thibault 2022-06-12  60  
6a5c94d92699b7 Samuel Thibault 2022-06-12  61  	shift_table[0] = 0;
6a5c94d92699b7 Samuel Thibault 2022-06-12  62  	for (i = 1; i <= 16; i++)
6a5c94d92699b7 Samuel Thibault 2022-06-12  63  		shift_table[i] = -1;
6a5c94d92699b7 Samuel Thibault 2022-06-12  64  
6a5c94d92699b7 Samuel Thibault 2022-06-12  65  	if (argc < 2) {
6a5c94d92699b7 Samuel Thibault 2022-06-12  66  		fputs("usage: genmap filename\n", stderr);
6a5c94d92699b7 Samuel Thibault 2022-06-12  67  		exit(1);
6a5c94d92699b7 Samuel Thibault 2022-06-12  68  	}
6a5c94d92699b7 Samuel Thibault 2022-06-12  69  
6a5c94d92699b7 Samuel Thibault 2022-06-12  70  	for (p_init = init_key_data; p_init->name[0] != '.'; p_init++)
6a5c94d92699b7 Samuel Thibault 2022-06-12  71  		add_key(p_init->name, p_init->value, p_init->shift);
6a5c94d92699b7 Samuel Thibault 2022-06-12  72  
6a5c94d92699b7 Samuel Thibault 2022-06-12  73  	open_input(NULL, argv[1]);
6a5c94d92699b7 Samuel Thibault 2022-06-12  74  	while (fgets(buffer, sizeof(buffer), infile)) {
6a5c94d92699b7 Samuel Thibault 2022-06-12 @75  		lc++;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
