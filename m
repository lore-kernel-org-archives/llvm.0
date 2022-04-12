Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD87B
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649757041; x=1681293041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ly8MdmHPLc+5oJDQTx/Jq3Qcj4r+aduCH/cUSyk+Qk=;
  b=bKGKV1w/6nK62K1I59CtdCaHs2NEOz2k1YTnkilk0HlXqbp5WTYyr6/Y
   Vek+/AGtXXDAandxah7jgvGSnjl/r3hjA9L9Jnfo3Yro8sLaTIHlWaOtm
   pSN1NRFxslBR0QHhcvV20aC5FkfOAglh1PqzUZ4GETNvXxnqpPQhmGaxm
   +NjRFUKH/g1nB3Ms/lRXjdGJbJTzBnUOPfQ6NlJ4WVGQ4JSfy6Cw4ztTI
   njSCA1LXLLjPHEJLVew7hi6JuFgYLA068M47tkxxlOMAsZzcnEKDLfPdK
   2tBGYQF7VfJnqLBOJKBQj4IMp65G9wm9AkxXUR9p8SaFyG2F9YqhJyY/i
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261182323"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="261182323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 02:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="590263394"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Apr 2022 02:50:38 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neDAT-0002ia-SI;
	Tue, 12 Apr 2022 09:50:37 +0000
Date: Tue, 12 Apr 2022 17:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:crng/random/jd/not-zero-entropy 3/12]
 kernel/time/timekeeping.c:2388: warning: expecting prototype for
 random_read_entropy_fallback(). Prototype was for
 random_get_entropy_fallback() instead
Message-ID: <202204121736.FCps0gwC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/not-zero-entropy
head:   4ee3bf173a552cd996e048d57f65bb5b471ab577
commit: aeeed98e20910aeafd5db8c56b449810b60bad9f [3/12] timekeeping: add raw clock fallback for random_get_entropy()
config: i386-randconfig-a003-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121736.FCps0gwC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/aeeed98e20910aeafd5db8c56b449810b60bad9f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block crng/random/jd/not-zero-entropy
        git checkout aeeed98e20910aeafd5db8c56b449810b60bad9f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/time/timekeeping.c:1684: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * We have three kinds of time sources to use for sleep time
   kernel/time/timekeeping.c:1705: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * 1) can be determined whether to use or not only when doing
>> kernel/time/timekeeping.c:2388: warning: expecting prototype for random_read_entropy_fallback(). Prototype was for random_get_entropy_fallback() instead
   kernel/time/timekeeping.c:2396: warning: Function parameter or member 'txc' not described in 'do_adjtimex'
   kernel/time/timekeeping.c:2462: warning: Function parameter or member 'phase_ts' not described in 'hardpps'
   kernel/time/timekeeping.c:2462: warning: Function parameter or member 'raw_ts' not described in 'hardpps'


vim +2388 kernel/time/timekeeping.c

  2382	
  2383	/**
  2384	 * random_read_entropy_fallback - Returns the raw clock source value,
  2385	 * used by random.c for platforms with no valid random_get_entropy().
  2386	 */
  2387	unsigned long random_get_entropy_fallback(void)
> 2388	{
  2389		return tk_clock_read(&tk_core.timekeeper.tkr_mono);
  2390	}
  2391	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
