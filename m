Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46B173
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643103758; x=1674639758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XOdS/iTxjJHJRfr6Zq2jN0xvvnrv9+z4yKJaZXhRDb8=;
  b=H3GgZu3efyDUsKqRdYhL9AnijELNcuAE/dWGSua78vo1x4hu/lj0lRKD
   KnPTuY1jsKTS30H6BXQVHFCjxgoyNGPnseQFWHFKGVjc5g8CmJN/d46rg
   9RZ6K9XwXhmft0vjDd5BtVye6XUIg73gSQ7HBno9muj6hEf4j2wM09O6/
   wJ8Pv1jG1v6BSD8Qo8QJFtu6iSDpXrfgkUAfKb6jzPZoZx7i6VYpelgdM
   4JK2Gpp27xowAvL/7/qAtk6QxjVXqNzHR9Ghe+GQ8SWajInqubsAb4wzZ
   2fbneljCn/RoChb3Lm3Xl6TD1XvXzTYJd/5XAqtSbsl474Von1BCo2GMG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246046971"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="246046971"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 01:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="477051000"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 01:42:35 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCILS-000Jg2-I5; Tue, 25 Jan 2022 09:42:34 +0000
Date: Tue, 25 Jan 2022 17:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	akpm@linux-foundation.org, naoya.horiguchi@linux.dev,
	rostedt@goodmis.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH V2 2/2] mm/migration: Add trace events for base page and
 HugeTLB migrations
Message-ID: <202201251747.ZSFwDZvC-lkp@intel.com>
References: <1643080105-11416-3-git-send-email-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643080105-11416-3-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Anshuman,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.17-rc1]
[also build test ERROR on next-20220124]
[cannot apply to hnaz-mm/master rostedt-trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-migration-Add-trace-events/20220125-110944
base:    e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
config: hexagon-randconfig-r041-20220124 (https://download.01.org/0day-ci/archive/20220125/202201251747.ZSFwDZvC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f1100840c009fceb20d26ac4564c9d4c9c23c729
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Anshuman-Khandual/mm-migration-Add-trace-events/20220125-110944
        git checkout f1100840c009fceb20d26ac4564c9d4c9c23c729
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __traceiter_set_migration_pte
   >>> referenced by rmap.c
   >>> rmap.o:(try_to_migrate_one) in archive mm/built-in.a
   >>> referenced by rmap.c
   >>> rmap.o:(try_to_migrate_one) in archive mm/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
