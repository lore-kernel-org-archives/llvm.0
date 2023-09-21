Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA5168B3;
	Thu, 21 Sep 2023 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695337046; x=1726873046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Q3uGIOvW/JQ8ZrerSYDX7JHd+40rGt8yFcuTrU6o4Q=;
  b=emn32VtjBXazmq9CQXoJfGO2ptPmeyvXK1YZBltZSfd7QxkNbyEJDgSs
   nAg1RgRuXZZXILGtcMQO+gYddbM4AtQh/0vmaMqtP54gmHjclKy+vOUns
   wJXpaztTsb0aSZF6XWahoAiE446UXGr9v+eyEEOBNwhQ7XoL/A1U+t0pH
   A4SgKwE0ktkBrrR86Pg9FBsizUha1aCbWYiLTxsPilkqrRm52VvtpEaVL
   LQyGBa+uBK1NH1wEg51CYV2+wOLPdAcGVBQsvHMm3g3tzYIug8vmzzBJu
   QhAmBWsbvdZmpLB3MFUaGVW180K8pgIp++nQdBgzp0hWK8+rUoB6I9BYl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="379567580"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="379567580"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 15:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782418348"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="782418348"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Sep 2023 15:57:13 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjSbf-0000W6-1F;
	Thu, 21 Sep 2023 22:57:11 +0000
Date: Fri, 22 Sep 2023 06:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1536/6975] fs/bcachefs/replicas.c:25:52: error:
 builtin functions must be directly called
Message-ID: <202309220650.uaIwHLV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: e0750d9473522d076b33ee257a21e27a5dd75031 [1536/6975] bcachefs: Initial commit
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309220650.uaIwHLV4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220650.uaIwHLV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220650.uaIwHLV4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/replicas.c:25:52: error: builtin functions must be directly called
           eytzinger0_sort(r->entries, r->nr, r->entry_size, memcmp, NULL);
                                                             ^
   arch/x86/include/asm/string_32.h:159:16: note: expanded from macro 'memcmp'
   #define memcmp __builtin_memcmp
                  ^
   fs/bcachefs/replicas.c:165:5: error: builtin functions must be directly called
                                   memcmp, &search) < r->nr;
                                   ^
   arch/x86/include/asm/string_32.h:159:16: note: expanded from macro 'memcmp'
   #define memcmp __builtin_memcmp
                  ^
   fs/bcachefs/replicas.c:499:9: error: builtin functions must be directly called
                         memcmp, NULL);
                         ^
   arch/x86/include/asm/string_32.h:159:16: note: expanded from macro 'memcmp'
   #define memcmp __builtin_memcmp
                  ^
   3 errors generated.


vim +25 fs/bcachefs/replicas.c

    22	
    23	static void bch2_cpu_replicas_sort(struct bch_replicas_cpu *r)
    24	{
  > 25		eytzinger0_sort(r->entries, r->nr, r->entry_size, memcmp, NULL);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
