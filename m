Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45163D
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 03:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661916472; x=1693452472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3JaKm/au0OXQLDWdCkosFEL/ZEv2MJ7D3Gzq5va63AI=;
  b=fXw0kmTQ0QK7ZKztSXK17YULHiP/qbj4hlx6pgAXVRB+92DVAsafVD4j
   pZc4WJu+149wlq7DA7bdpbaE1QsTrZWB1uGVy2giBRVPy3DkUy7oE2swu
   YT6CSd9gd807pah99wYNLdTnpxonFonT+3wVldHaS55t3I65iwjKajmtB
   3+ZOdIaUqTvMgs/R6SSaN/1di8dmHVvmDzohrhHRktnlz0b7Hjv2FNosP
   yeXoediIUWE7tR5o15k0DSosRhVJ+ak/EmGWeUsDaMVI2RTB7OE8M66wV
   7iQatI17UP26qUwT2MNKA0K5dxW00Uxa74DZhpxwVwlffh6oO3nfBb+Bs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="292939052"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="292939052"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 20:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="588887017"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2022 20:27:50 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTEOL-0000wI-2Q;
	Wed, 31 Aug 2022 03:27:49 +0000
Date: Wed, 31 Aug 2022 11:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 16/30] mm: enable slab allocation tagging for kmalloc
 and friends
Message-ID: <202208311155.oCFXzcZ0-lkp@intel.com>
References: <20220830214919.53220-17-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-17-surenb@google.com>

Hi Suren,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc3]
[cannot apply to vbabka-slab/for-next tip/sched/core xen-tip/linux-next next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dcf8e5633e2e69ad60b730ab5905608b756a032f
config: hexagon-randconfig-r045-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311155.oCFXzcZ0-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1c66bacd6cde1f37d6ac96c45b389666a1334ec0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b57e9620f17e9b625c9d01733bd6d125758bd8e7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
        git checkout b57e9620f17e9b625c9d01733bd6d125758bd8e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1215: warning: expecting prototype for krealloc(). Prototype was for _krealloc() instead


vim +1215 mm/slab_common.c

928cec9cd6db53 Andrey Ryabinin     2014-08-06  1200  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1201  /**
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1202   * krealloc - reallocate memory. The contents will remain unchanged.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1203   * @p: object to reallocate memory for.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1204   * @new_size: how many bytes of memory are required.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1205   * @flags: the type of memory to allocate.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1206   *
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1207   * The contents of the object pointed to are preserved up to the
15d5de496bebfd Bartosz Golaszewski 2020-12-14  1208   * lesser of the new and old sizes (__GFP_ZERO flag is effectively ignored).
15d5de496bebfd Bartosz Golaszewski 2020-12-14  1209   * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
15d5de496bebfd Bartosz Golaszewski 2020-12-14  1210   * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
a862f68a8b3600 Mike Rapoport       2019-03-05  1211   *
a862f68a8b3600 Mike Rapoport       2019-03-05  1212   * Return: pointer to the allocated memory or %NULL in case of error
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1213   */
b57e9620f17e9b Suren Baghdasaryan  2022-08-30  1214  void *_krealloc(const void *p, size_t new_size, gfp_t flags)
928cec9cd6db53 Andrey Ryabinin     2014-08-06 @1215  {
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1216  	void *ret;
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1217  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1218  	if (unlikely(!new_size)) {
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1219  		kfree(p);
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1220  		return ZERO_SIZE_PTR;
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1221  	}
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1222  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1223  	ret = __do_krealloc(p, new_size, flags);
772a2fa50ffb2f Andrey Konovalov    2018-12-28  1224  	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1225  		kfree(p);
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1226  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1227  	return ret;
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1228  }
b57e9620f17e9b Suren Baghdasaryan  2022-08-30  1229  EXPORT_SYMBOL(_krealloc);
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1230  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
