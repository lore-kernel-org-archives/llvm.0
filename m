Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A14B5B7;
	Wed, 20 Dec 2023 23:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMPAmzly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703115012; x=1734651012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sNDfmG/Lc7rx8IVvaw+6DAeqnw43+bn1OAwsGOtcHuM=;
  b=FMPAmzlyRsL4sTzK8KhQMvwumr/7iXd8EkZ8N+q7g+/irE6Y6eJECqUc
   ozQsO7jqQp6ChIcvIbzqtYjnj164QzHpjOpCQvU2JPFzzfjJ0Cq3ViBe6
   6fgcp5TjA+28SmbnrAGFF3C7v5zycqcEdjg+yneVnPPDj++7+WhYYJAGu
   LSQlBia35AdkiCWfYbjeTF7jMF3LU8PSgupM+vJKs0/XsfkFHcirUYx8+
   eOTRdMHLiX6S8tSjclcucYymvXT5DCS0VHT6SdPJTAwKzoP75gQCF8CIB
   5PR4n40402gflzZNk8LmWfLqipS4b53f9iddNSWz0TqWc9q1PKFYFbSrA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9272362"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="9272362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 15:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="18477097"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2023 15:29:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rG60e-0007dd-1s;
	Wed, 20 Dec 2023 23:29:52 +0000
Date: Thu, 21 Dec 2023 07:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hangyu Hua <hbh25y@gmail.com>, jhs@mojatatu.com,
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tgraf@suug.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: Re: [PATCH] net: sched: em_text: fix possible memory leak in
 em_text_destroy()
Message-ID: <202312210705.j1LTJmpH-lkp@intel.com>
References: <20231220030838.11751-1-hbh25y@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220030838.11751-1-hbh25y@gmail.com>

Hi Hangyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.7-rc6 next-20231220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hangyu-Hua/net-sched-em_text-fix-possible-memory-leak-in-em_text_destroy/20231220-111317
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231220030838.11751-1-hbh25y%40gmail.com
patch subject: [PATCH] net: sched: em_text: fix possible memory leak in em_text_destroy()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231221/202312210705.j1LTJmpH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312210705.j1LTJmpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312210705.j1LTJmpH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sched/em_text.c:102:9: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
                   kfree(m->data);
                         ^~~~~~~
   include/linux/slab.h:227:24: note: passing argument to parameter 'objp' here
   void kfree(const void *objp);
                          ^
   1 error generated.


vim +102 net/sched/em_text.c

    97	
    98	static void em_text_destroy(struct tcf_ematch *m)
    99	{
   100		if (EM_TEXT_PRIV(m) && EM_TEXT_PRIV(m)->config) {
   101			textsearch_destroy(EM_TEXT_PRIV(m)->config);
 > 102			kfree(m->data);
   103		}
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
