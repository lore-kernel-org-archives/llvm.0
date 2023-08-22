Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655F1FA1;
	Tue, 22 Aug 2023 05:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692681122; x=1724217122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aXAGANQWUdOju3qwQ0k64Gy9Mkc9JcoibWROSruwz9Q=;
  b=QuAZXRtxisiDdqE+ViYOhmyyPwrqEDw0/M9daG1VjZpBQRQGM8Sfch17
   w8xcfdjpLqaIoGSfbEpO89YY440MSOZypU4wJ18Bd57SYSjwhzAhXsER9
   xyVvSfRkXiKi58An8xR/yjmsN3eu9jB0py3JO5s6OqLoX6wX/9pKL5NCE
   ohR/dWN/gwGwoPcFjYK1oa9iMlILLaqwcuEvQ4annH+tdIhmy1AM4IC6c
   cHSQjiVQYx7ZIGAfnoCeOgBPPOBYoafIe9tzEMXmnymEQeELlJeje3xAe
   15mnHxBRlWckSXh8yuUeJO9PaWMDD2p2gQakJZOIeUanUj6l/OgIfPc0G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460147100"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="460147100"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 22:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685912356"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="685912356"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 22:11:57 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYJgK-0001OM-1s;
	Tue, 22 Aug 2023 05:11:56 +0000
Date: Tue, 22 Aug 2023 13:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrei Vagin <avagin@openvz.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH] procfs: Fix /proc/self/maps output for 32-bit kernel and
 compat tasks
Message-ID: <202308221231.B7yBmSQV-lkp@intel.com>
References: <ZOCJltW/eufPUc+T@p100>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOCJltW/eufPUc+T@p100>

Hi Helge,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc7 next-20230821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Helge-Deller/procfs-Fix-proc-self-maps-output-for-32-bit-kernel-and-compat-tasks/20230821-100823
base:   linus/master
patch link:    https://lore.kernel.org/r/ZOCJltW%2FeufPUc%2BT%40p100
patch subject: [PATCH] procfs: Fix /proc/self/maps output for 32-bit kernel and compat tasks
config: x86_64-randconfig-013-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221231.B7yBmSQV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221231.B7yBmSQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221231.B7yBmSQV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/seq_file.c:765:16: error: call to undeclared function 'is_compat_task'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (v == 0 || is_compat_task())
                         ^
   1 error generated.


vim +/is_compat_task +765 fs/seq_file.c

   737	
   738	/**
   739	 * seq_put_hex_ll - put a number in hexadecimal notation
   740	 * @m: seq_file identifying the buffer to which data should be written
   741	 * @delimiter: a string which is printed before the number
   742	 * @v: the number
   743	 * @width: a minimum field width
   744	 *
   745	 * seq_put_hex_ll(m, "", v, 8) is equal to seq_printf(m, "%08llx", v)
   746	 *
   747	 * This routine is very quick when you show lots of numbers.
   748	 * In usual cases, it will be better to use seq_printf(). It's easier to read.
   749	 */
   750	void seq_put_hex_ll(struct seq_file *m, const char *delimiter,
   751					unsigned long long v, unsigned int width)
   752	{
   753		unsigned int len;
   754		int i;
   755	
   756		if (delimiter && delimiter[0]) {
   757			if (delimiter[1] == 0)
   758				seq_putc(m, delimiter[0]);
   759			else
   760				seq_puts(m, delimiter);
   761		}
   762	
   763	#ifdef CONFIG_64BIT
   764		/* If x is 0, the result of __builtin_clzll is undefined */
 > 765		if (v == 0 || is_compat_task())
   766			len = 1;
   767		else
   768			len = (sizeof(v) * 8 - __builtin_clzll(v) + 3) / 4;
   769	#else
   770		/* On 32-bit kernel always use provided width */
   771		len = 1;
   772	#endif
   773	
   774		if (len < width)
   775			len = width;
   776	
   777		if (m->count + len > m->size) {
   778			seq_set_overflow(m);
   779			return;
   780		}
   781	
   782		for (i = len - 1; i >= 0; i--) {
   783			m->buf[m->count + i] = hex_asc[0xf & v];
   784			v = v >> 4;
   785		}
   786		m->count += len;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
