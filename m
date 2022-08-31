Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7264C
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661928117; x=1693464117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g/FALfi66SZTPm+27PiHU6XzrrHQolJStBoJ/qziRrE=;
  b=Ku/zjyzl3Hl3AKzy/k5x7WrCvLfOwSt7x9lfl20iCxTRocb9IcuK4HFY
   8QH2f4xY855kmnflM6yvw+5mRzYZCOTSf1hRmjh2YpkIukNKJ+HpYmyuT
   4OczlCnoWuwBZIsX2jBvw8nY5dW2yr2aTbzQ+P9280Ekmup+G7BQcdsoL
   x93xSfK1IIMnbQtN7XJEd9xI3+u67ynNWck5bzpBW1TB8f9WytD5lound
   2iBxw3Ji9mwzQhgqoswJJ1mn3LSX8ks7eS0q6ASMrwXbcWY8e9rLFWgKJ
   maHMqEkNFHirdd3jKENddBP2xvp9Ohseu6am1C5OlQVUb35LaFQ99wUnt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="381681253"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="381681253"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 23:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="940335224"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 23:41:56 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTHQB-00002D-1y;
	Wed, 31 Aug 2022 06:41:55 +0000
Date: Wed, 31 Aug 2022 14:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 17/30] lib/string.c: strsep_no_empty()
Message-ID: <202208311418.jkohaAzL-lkp@intel.com>
References: <20220830214919.53220-18-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-18-surenb@google.com>

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
config: hexagon-randconfig-r045-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311418.jkohaAzL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1c66bacd6cde1f37d6ac96c45b389666a1334ec0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/63f3651a67a805e471d31f4dc870dd65ddeaacce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
        git checkout 63f3651a67a805e471d31f4dc870dd65ddeaacce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/string.c:607: warning: expecting prototype for strsep_no_empt(). Prototype was for strsep_no_empty() instead


vim +607 lib/string.c

   598	
   599	/**
   600	 * strsep_no_empt - Split a string into tokens, but don't return empty tokens
   601	 * @s: The string to be searched
   602	 * @ct: The characters to search for
   603	 *
   604	 * strsep() updates @s to point after the token, ready for the next call.
   605	 */
   606	char *strsep_no_empty(char **s, const char *ct)
 > 607	{
   608		char *ret;
   609	
   610		do {
   611			ret = strsep(s, ct);
   612		} while (ret && !*ret);
   613	
   614		return ret;
   615	}
   616	EXPORT_SYMBOL_GPL(strsep_no_empty);
   617	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
