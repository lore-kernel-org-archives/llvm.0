Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05DDE566;
	Tue, 20 Jun 2023 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687257796; x=1718793796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uWQlpkSqYtXGwmGI3si1xIcWLNSUgBELgGDSlST7O7g=;
  b=K/gPUDf4c/E5qSJrX3HG/oAzHnZO57LZhJQs0mRHZUqxZhk4EKgHsZSD
   lqDLX09UlfENgJ3+haJR7nDgzuWJS0bcnyfq+D18vgrYUI92jsZbNl+KC
   j9xRBZVfhYjalQapcD2Biv/JOIs9nSdYylUH+4ke0WF0zT1/vOMBwwVH0
   NY7YoyF/wZvyOb57HfqGQxDkN/mFpzjfPUg7+kE4LbCUaaY2cENBGkUO1
   GB4BkM8eF9sNG1LAsHweT2jd7eEYf4CS/mOPE2d//P9nrfd0DBl4+RoWK
   9VOnYC1GBhgJyF+dXjX1R18lQ73TdkOB1EcLiYlCCwsHK0Mm6z4gxRkcX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="425781892"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="425781892"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858538335"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="858538335"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 03:43:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBYpL-0005oo-1x;
	Tue, 20 Jun 2023 10:43:11 +0000
Date: Tue, 20 Jun 2023 18:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Sowden <jeremy@azazel.net>,
	Netfilter Devel <netfilter-devel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next] lib/ts_bm: add helper to reduce indentation and
 improve readability
Message-ID: <202306201819.BoQ5IT7Y-lkp@intel.com>
References: <20230619190803.1906012-1-jeremy@azazel.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619190803.1906012-1-jeremy@azazel.net>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc7 next-20230620]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Sowden/lib-ts_bm-add-helper-to-reduce-indentation-and-improve-readability/20230620-031043
base:   linus/master
patch link:    https://lore.kernel.org/r/20230619190803.1906012-1-jeremy%40azazel.net
patch subject: [PATCH nf-next] lib/ts_bm: add helper to reduce indentation and improve readability
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230620/202306201819.BoQ5IT7Y-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201819.BoQ5IT7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201819.BoQ5IT7Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ts_bm.c:101:34: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                           bs = bm->bad_shift[text[shift-i]];
                                                         ^
   lib/ts_bm.c:79:16: note: initialize the variable 'i' to silence this warning
           unsigned int i, text_len, consumed = state->offset;
                         ^
                          = 0
   1 warning generated.


vim +/i +101 lib/ts_bm.c

    75	
    76	static unsigned int bm_find(struct ts_config *conf, struct ts_state *state)
    77	{
    78		struct ts_bm *bm = ts_config_priv(conf);
    79		unsigned int i, text_len, consumed = state->offset;
    80		const u8 *text;
    81		int shift = bm->patlen - 1, bs;
    82		const u8 icase = conf->flags & TS_IGNORECASE;
    83	
    84		for (;;) {
    85			text_len = conf->get_next_block(consumed, &text, conf, state);
    86	
    87			if (unlikely(text_len == 0))
    88				break;
    89	
    90			while (shift < text_len) {
    91				DEBUGP("Searching in position %d (%c)\n",
    92				       shift, text[shift]);
    93	
    94				if (patmtch(&bm->pattern[bm->patlen-1], &text[shift],
    95					    bm->patlen, icase)) {
    96					/* London calling... */
    97					DEBUGP("found!\n");
    98					return consumed + (shift-(bm->patlen-1));
    99				}
   100	
 > 101				bs = bm->bad_shift[text[shift-i]];
   102	
   103				/* Now jumping to... */
   104				shift = max_t(int, shift-i+bs, shift+bm->good_shift[i]);
   105			}
   106			consumed += text_len;
   107		}
   108	
   109		return UINT_MAX;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
