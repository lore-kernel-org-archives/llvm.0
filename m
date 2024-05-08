Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C912FF99;
	Wed,  8 May 2024 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715195571; cv=none; b=uCv3SNaamsyQVxbTRNAI0OHzRrDFl356zFnHqBLQsU94nUV3gtlWcRov8cd76jBarb8ODmqGmtgKIatdBCX6thuXlq1I5j+n6G4N1YhTjc2sAQbu/it+F7hwqq/nQhld9iWXVfuzWNNqackfTptcWlYSAE07lDhBpZrsHDzg2dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715195571; c=relaxed/simple;
	bh=UDZ+y5C+6hi5R+nL3waykWlk6BdAqhdWysBV2RefEBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dATK+qAQxlUjb0gJe8fXeIv3QxzXz+s61j47T/Htd4L7KJMYkPNBfbnqigmcchIYStbxRQEsn1xzCnEvLq/lv9UHEJ57ltbVuCcq96ERvqTSNy3Gtgx9r+jqlgUeqaiLs4PA3hJjCOQbFJlTvxkht0bpYOiVi1QLrSmqdaNbklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQKodHYQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQKodHYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715195570; x=1746731570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UDZ+y5C+6hi5R+nL3waykWlk6BdAqhdWysBV2RefEBo=;
  b=mQKodHYQ7iLPOykywkrG0PKlTPG1wm0ivef1ar4gxj1nkAOKgopOX1QQ
   k5ojcblv8ymQL9scLAxL23hXlb3miRDV8UGJAhAkriCtem8JYMvPU9Yw2
   /z2MR+NojFnN2rJMaebpJbrK8+zREcHS2pXdgPy4KwISI0Nb8mIvBD2D7
   QXaok5dFndZnZb4pfMcpJ5EDdPi3AnXDsMlyVxXg32A7KXRV5SBZt6FXX
   qS2SDGm8T7aNp4LAZwtN7VrCGvxyw130sKiscYWR6Hq3ImAc5MGYveof1
   L/OhhKkQwK/J7gLpn4INyjn7YjqWq8eihF7oRgX2bRtq8ILZikOYi8/FQ
   Q==;
X-CSE-ConnectionGUID: I/Zzv9RVQaK9c59KSGGTIQ==
X-CSE-MsgGUID: z8eESwNvQeGnxTmO6wlrHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22472883"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="22472883"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 12:12:49 -0700
X-CSE-ConnectionGUID: Y9xI5MwgSyyR4UMngLRhrw==
X-CSE-MsgGUID: 9tj+b7tkSDeV37hXSQ8cfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33502300"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 12:12:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4mib-00042A-24;
	Wed, 08 May 2024 19:12:45 +0000
Date: Thu, 9 May 2024 03:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] erofs: Zstandard compression support
Message-ID: <202405090343.ZIq0cRfw-lkp@intel.com>
References: <20240508090346.2992116-1-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508090346.2992116-1-hsiangkao@linux.alibaba.com>

Hi Gao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev]
[also build test WARNING on next-20240508]
[cannot apply to xiang-erofs/dev-test xiang-erofs/fixes linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gao-Xiang/erofs-Zstandard-compression-support/20240508-170754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
patch link:    https://lore.kernel.org/r/20240508090346.2992116-1-hsiangkao%40linux.alibaba.com
patch subject: [PATCH] erofs: Zstandard compression support
config: arm64-randconfig-002-20240509 (https://download.01.org/0day-ci/archive/20240509/202405090343.ZIq0cRfw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090343.ZIq0cRfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405090343.ZIq0cRfw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/decompressor_zstd.c:90:56: warning: variable 'dict_size' is uninitialized when used here [-Wuninitialized]
                   erofs_err(sb, "unsupported zstd dictionary size %u", dict_size);
                                                                        ^~~~~~~~~
   fs/erofs/internal.h:30:39: note: expanded from macro 'erofs_err'
           _erofs_err(sb, __func__, fmt "\n", ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   fs/erofs/decompressor_zstd.c:80:24: note: initialize the variable 'dict_size' to silence this warning
           unsigned int dict_size, wkspsz;
                                 ^
                                  = 0
   1 warning generated.


vim +/dict_size +90 fs/erofs/decompressor_zstd.c

    74	
    75	int z_erofs_load_zstd_config(struct super_block *sb,
    76				struct erofs_super_block *dsb, void *data, int size)
    77	{
    78		static DEFINE_MUTEX(zstd_resize_mutex);
    79		struct z_erofs_zstd_cfgs *zstd = data;
    80		unsigned int dict_size, wkspsz;
    81		struct z_erofs_zstd *strm, *head = NULL;
    82		void *wksp;
    83	
    84		if (!zstd || size < sizeof(struct z_erofs_zstd_cfgs) || zstd->format) {
    85			erofs_err(sb, "unsupported zstd format, size=%u", size);
    86			return -EINVAL;
    87		}
    88	
    89		if (zstd->windowlog > ilog2(Z_EROFS_ZSTD_MAX_DICT_SIZE) - 10) {
  > 90			erofs_err(sb, "unsupported zstd dictionary size %u", dict_size);
    91			return -EINVAL;
    92		}
    93		dict_size = 1U << (zstd->windowlog + 10);
    94	
    95		/* in case 2 z_erofs_load_zstd_config() race to avoid deadlock */
    96		mutex_lock(&zstd_resize_mutex);
    97		if (z_erofs_zstd_max_dictsize >= dict_size) {
    98			mutex_unlock(&zstd_resize_mutex);
    99			return 0;
   100		}
   101	
   102		/* 1. collect/isolate all streams for the following check */
   103		while (z_erofs_zstd_avail_strms) {
   104			struct z_erofs_zstd *n;
   105	
   106			for (strm = z_erofs_isolate_strms(true); strm; strm = n) {
   107				n = strm->next;
   108				strm->next = head;
   109				head = strm;
   110				--z_erofs_zstd_avail_strms;
   111			}
   112		}
   113	
   114		/* 2. walk each isolated stream and grow max dict_size if needed */
   115		wkspsz = zstd_dstream_workspace_bound(dict_size);
   116		for (strm = head; strm; strm = strm->next) {
   117			wksp = kvmalloc(wkspsz, GFP_KERNEL);
   118			if (!wksp)
   119				break;
   120			kvfree(strm->wksp);
   121			strm->wksp = wksp;
   122			strm->wkspsz = wkspsz;
   123		}
   124	
   125		/* 3. push back all to the global list and update max dict_size */
   126		spin_lock(&z_erofs_zstd_lock);
   127		DBG_BUGON(z_erofs_zstd_head);
   128		z_erofs_zstd_head = head;
   129		spin_unlock(&z_erofs_zstd_lock);
   130		z_erofs_zstd_avail_strms = z_erofs_zstd_nstrms;
   131		wake_up_all(&z_erofs_zstd_wq);
   132		if (!strm)
   133			z_erofs_zstd_max_dictsize = dict_size;
   134		mutex_unlock(&zstd_resize_mutex);
   135		return strm ? -ENOMEM : 0;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
