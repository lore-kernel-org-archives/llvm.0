Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755D15AA
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 03:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653019179; x=1684555179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFKsShW4JICrygY8XRlIokt1kXFF5Vhlbt6wSyHgbz0=;
  b=eeRgoQg5qWGEeNtUpVqgKKPvUcywqwBizW5PNCYolr/lGSz/XZtrdgDO
   E5rpfZ1NWwAoqBUdm9FXVQvpuDl8zEyNuUcEttwLCtH/W2+SBJg/sPbzE
   KJqIl4DTJfVum5nRhk6fO/HyFiTgRbegJ0mLtr/QLTkMYqfP1nCVkuz+K
   U38PMG7T1kdWaSTWcEIvZWRvtUSNqJ1cDOiQvAduocV83U/cgIMGwJLzA
   alX+NGZah+K6SmUjbeaKXpBZkEUigmcxqxnbrQMvroFqfW+vYh12wo8/g
   d98UC7ITpD6TeqqP8Q0k/QCof6/WGDqvpN6CO9RnRHcVL/q4TtTU3R4wl
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272180579"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="272180579"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 20:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="662067436"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 May 2022 20:59:36 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrtnb-0004GJ-FW;
	Fri, 20 May 2022 03:59:35 +0000
Date: Fri, 20 May 2022 11:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Abrego <javier.abrego.lorente@gmail.com>,
	trond.myklebust@hammerspace.com, anna@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	javier.abrego.lorente@gmail.com
Subject: Re: [PATCH] FS: nfs: removed goto statement
Message-ID: <202205201106.ONDKuLvW-lkp@intel.com>
References: <20220519225115.35431-1-javier.abrego.lorente@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519225115.35431-1-javier.abrego.lorente@gmail.com>

Hi Javier,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on v5.18-rc7 next-20220519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Abrego/FS-nfs-removed-goto-statement/20220520-065648
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220520/202205201106.ONDKuLvW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/99dd76e4af5d61f97c1981a240cbd1d86908ac8e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Abrego/FS-nfs-removed-goto-statement/20220520-065648
        git checkout 99dd76e4af5d61f97c1981a240cbd1d86908ac8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfs/nfs42xattr.c:754:3: warning: variable 'entry' is uninitialized when used here [-Wuninitialized]
                   entry->bucket = &cache->buckets[0];
                   ^~~~~
   fs/nfs/nfs42xattr.c:743:32: note: initialize the variable 'entry' to silence this warning
           struct nfs4_xattr_entry *entry;
                                         ^
                                          = NULL
   1 warning generated.


vim +/entry +754 fs/nfs/nfs42xattr.c

95ad37f90c338e Frank van der Linden 2020-06-23  735  
95ad37f90c338e Frank van der Linden 2020-06-23  736  /*
95ad37f90c338e Frank van der Linden 2020-06-23  737   * Cache listxattr output, replacing any possible old one.
95ad37f90c338e Frank van der Linden 2020-06-23  738   */
95ad37f90c338e Frank van der Linden 2020-06-23  739  void nfs4_xattr_cache_set_list(struct inode *inode, const char *buf,
95ad37f90c338e Frank van der Linden 2020-06-23  740  			       ssize_t buflen)
95ad37f90c338e Frank van der Linden 2020-06-23  741  {
95ad37f90c338e Frank van der Linden 2020-06-23  742  	struct nfs4_xattr_cache *cache;
95ad37f90c338e Frank van der Linden 2020-06-23  743  	struct nfs4_xattr_entry *entry;
95ad37f90c338e Frank van der Linden 2020-06-23  744  
95ad37f90c338e Frank van der Linden 2020-06-23  745  	cache = nfs4_xattr_get_cache(inode, 1);
99dd76e4af5d61 Javier Abrego        2022-05-20  746  	if (cache == NULL) {
99dd76e4af5d61 Javier Abrego        2022-05-20  747  		kref_put(&cache->ref, nfs4_xattr_free_cache_cb);
99dd76e4af5d61 Javier Abrego        2022-05-20  748  	} else {
95ad37f90c338e Frank van der Linden 2020-06-23  749  	       /*
95ad37f90c338e Frank van der Linden 2020-06-23  750  		* This is just there to be able to get to bucket->cache,
95ad37f90c338e Frank van der Linden 2020-06-23  751  		* which is obviously the same for all buckets, so just
95ad37f90c338e Frank van der Linden 2020-06-23  752  		* use bucket 0.
95ad37f90c338e Frank van der Linden 2020-06-23  753  		*/
95ad37f90c338e Frank van der Linden 2020-06-23 @754  		entry->bucket = &cache->buckets[0];
95ad37f90c338e Frank van der Linden 2020-06-23  755  
95ad37f90c338e Frank van der Linden 2020-06-23  756  		if (!nfs4_xattr_set_listcache(cache, entry))
95ad37f90c338e Frank van der Linden 2020-06-23  757  			kref_put(&entry->ref, nfs4_xattr_free_entry_cb);
99dd76e4af5d61 Javier Abrego        2022-05-20  758  	}
95ad37f90c338e Frank van der Linden 2020-06-23  759  }
95ad37f90c338e Frank van der Linden 2020-06-23  760  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
