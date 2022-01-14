Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E68168
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642174211; x=1673710211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5MEenRgsV99RuDIwkigMcLewxKs9xAK/aqCyfI/OXvA=;
  b=AE9WL0q5m6pMmmEaysUs5SGS24YAzTIC4DCNXgyCMg0BlfUzJLCZNf3+
   mCtkPwEk8QEKZrOL0mZBhnA2h6G+iHzYfjaaiaDrVFkAdBAdijELnVsmu
   iKDJT24PLM0f6AKChcQlH8lALJ5UPpLYlxd0PJWvoNFHhb7NDEHR81ab9
   GluJhVG2iemHWQzqMGTiE38Uk6zymsYkywPhMPGKenyEj4mAKTHMFvX4J
   ANn1LXk5dablId8za1nih6oQwFlPZAr8xCKMH25ggIb8sTaJum0jfLcKG
   AJrriSMs0WY3t7hZxVoWrEc1X/y2KXLrFd0UNPgGWDuxT253WAcoS1lIs
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="243079847"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="243079847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 07:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="516431451"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Jan 2022 07:30:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8OWm-0008gh-K2; Fri, 14 Jan 2022 15:30:08 +0000
Date: Fri, 14 Jan 2022 23:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Beau Belgrave <beaub@linux.microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v9 01/12] user_events: Add minimal support for
 trace_event into ftrace
Message-ID: <202201142322.DpkhCCS2-lkp@intel.com>
References: <20220111172602.2513-2-beaub@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111172602.2513-2-beaub@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Beau,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 85c62c8c3749eec02ba81217bdcac26867dc262e]

url:    https://github.com/0day-ci/linux/commits/Beau-Belgrave/user_events-Enable-user-processes-to-create-and-write-to-trace-events/20220112-014042
base:   85c62c8c3749eec02ba81217bdcac26867dc262e
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220114/202201142322.DpkhCCS2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a5a2d34cbaeb90d281d8c13c753f4aaaa447ec11
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Beau-Belgrave/user_events-Enable-user-processes-to-create-and-write-to-trace-events/20220112-014042
        git checkout a5a2d34cbaeb90d281d8c13c753f4aaaa447ec11
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/ sound/soc/sof/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events_user.c:1027:14: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return NULL + (*pos == 0);
                  ~~~~ ^
   1 warning generated.


vim +1027 kernel/trace/trace_events_user.c

  1024	
  1025	static void *user_seq_start(struct seq_file *m, loff_t *pos)
  1026	{
> 1027		return NULL + (*pos == 0);
  1028	}
  1029	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
