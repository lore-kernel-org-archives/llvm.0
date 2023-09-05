Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF01FA4;
	Tue,  5 Sep 2023 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901097; x=1725437097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TjkU5C7YEJNf+omUGGBB9Q+W1jCtCApBBKERLuMV3CY=;
  b=CGZVYpwy1qj4hRMr8KiZ5r4+RiFRlEWxxXY+g6ynuMpRf9UwCFCGN8Lx
   gcJTKWnA1YUvXdptgs6ezl1ouoc5/wDlOfMZf2ckXhk0nKM0/DZlQjba1
   YbYKoif/w2qVzNwjQEpPJ3/JFpI6N70DqToj5Cs0JURTDXeC9rFvFWRU2
   NoJfybqnBsjhnZe4RGKHVLpWw9YjTresqVfsQHlh3oRCPR3KDMQlAgQ5F
   i2GF8uZHsQx2CUZuB92/B4RROGODuSKMn1zhf228Anb4/e20ces34dkxy
   IJH8e11LNrsKJ2CLHppKBwImJn3QbJB4OgNB7RxC9mnPlLUxvW+yAz14/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379455982"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="379455982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="864613174"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="864613174"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2023 01:04:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdR3L-0001Pm-1g;
	Tue, 05 Sep 2023 08:04:51 +0000
Date: Tue, 5 Sep 2023 16:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to
 user-space
Message-ID: <202309051551.x8wzvudr-lkp@intel.com>
References: <20230905052631.18240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905052631.18240-1-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-seq-Fix-snd_seq_expand_var_event-call-to-user-space/20230905-132920
base:   linus/master
patch link:    https://lore.kernel.org/r/20230905052631.18240-1-tiwai%40suse.de
patch subject: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to user-space
config: arm-randconfig-r014-20230905 (https://download.01.org/0day-ci/archive/20230905/202309051551.x8wzvudr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051551.x8wzvudr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051551.x8wzvudr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/seq/seq_memory.c:194:4: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     194 |                         clear_user((__force void __user *)buf + len, newlen - len);
         |                         ^~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/warn_unused_result +194 sound/core/seq/seq_memory.c

   173	
   174	int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char *buf,
   175				     int in_kernel, int size_aligned)
   176	{
   177		int len, newlen, err;
   178	
   179		len = get_var_len(event);
   180		if (len < 0)
   181			return len;
   182		newlen = len;
   183		if (size_aligned > 0)
   184			newlen = roundup(len, size_aligned);
   185		if (count < newlen)
   186			return -EAGAIN;
   187		err = expand_var_event(event, 0, len, buf, in_kernel);
   188		if (err < 0)
   189			return err;
   190		if (len != newlen) {
   191			if (in_kernel)
   192				memset(buf + len, 0, newlen - len);
   193			else
 > 194				clear_user((__force void __user *)buf + len, newlen - len);
   195		}
   196		return newlen;
   197	}
   198	EXPORT_SYMBOL(snd_seq_expand_var_event);
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
