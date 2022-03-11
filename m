Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D333D5
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647004327; x=1678540327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AWq7WnNf892beOMKbeBL1LamJ6gbZ6LG2IxRKIe5Kpw=;
  b=GG67jQPug0jOH9OopZRfbyVUWdcE6eAp54G+++NdCd5ikFkaj2uqaaZp
   wgROuMpvMhzWVz1fb30y64IBN8LFCMiQNs+gx4JrzPzIruLz3alSgDLA/
   3EXZ0pD/6kdXHqjBT++UhkvwzL5UnNuFZcI3dSTg8pXpuWWDE4S/UCJT2
   C9tWZrlxE+AxHyGuJD4G6cTAIR/C9sNEfDDyJ4TwF/L0knf2SzSGAy0rh
   Ms9GamNsBCDRGVi1/MXRRZ57mvNms6HdKYEbeAVcbSifEk+yihmcbDW1h
   jHs25w1e0k6gvFxu0puAKFh6is5lgTfU55BESTJAmfqKxq0unEbcWC5IY
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="237741587"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="237741587"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="496759227"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2022 05:12:05 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSf3s-0006Rk-Dd; Fri, 11 Mar 2022 13:12:04 +0000
Date: Fri, 11 Mar 2022 21:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: lib/list-test.c:15:2: error: type name requires a specifier or
 qualifier
Message-ID: <202203112120.LIt7DF8t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220311-151720/Xiaomeng-Tong/list_for_each_entry-make-iterator-invisiable-outside-the-loop/20220301-160113
head:   54ae283053c127aac4b946dffa0f31f9885dbb77
commit: 32c7dc1050a5376225f79589948ac5a63cb75e5a list: test: Add a test for list_traverse
date:   6 hours ago
config: hexagon-randconfig-r045-20220310 (https://download.01.org/0day-ci/archive/20220311/202203112120.LIt7DF8t-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/32c7dc1050a5376225f79589948ac5a63cb75e5a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220311-151720/Xiaomeng-Tong/list_for_each_entry-make-iterator-invisiable-outside-the-loop/20220301-160113
        git checkout 32c7dc1050a5376225f79589948ac5a63cb75e5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/list-test.c:15:2: error: type name requires a specifier or qualifier
           list_traversal_head(struct list_test_struct, head, list);
           ^
>> lib/list-test.c:15:47: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           list_traversal_head(struct list_test_struct, head, list);
                                                        ^
   lib/list-test.c:15:53: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           list_traversal_head(struct list_test_struct, head, list);
                                                              ^
>> lib/list-test.c:665:23: error: no member named 'head' in 'struct list_test_struct'
           INIT_LIST_HEAD(&head.head);
                           ~~~~ ^
   lib/list-test.c:669:41: error: no member named 'head' in 'struct list_test_struct'
                   list_add_tail(&entries[i].list, &head.head);
                                                    ~~~~ ^
>> lib/list-test.c:674:2: error: implicit declaration of function 'list_traverse' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           list_traverse(cur, &head.head, list) {
           ^
   lib/list-test.c:674:27: error: no member named 'head' in 'struct list_test_struct'
           list_traverse(cur, &head.head, list) {
                               ~~~~ ^
>> lib/list-test.c:674:38: error: expected ';' after expression
           list_traverse(cur, &head.head, list) {
                                               ^
                                               ;
>> lib/list-test.c:674:16: error: use of undeclared identifier 'cur'
           list_traverse(cur, &head.head, list) {
                         ^
>> lib/list-test.c:674:33: error: use of undeclared identifier 'list'
           list_traverse(cur, &head.head, list) {
                                          ^
   lib/list-test.c:675:25: error: use of undeclared identifier 'cur'
                   KUNIT_EXPECT_EQ(test, cur->data, i);
                                         ^
   lib/list-test.c:675:25: error: use of undeclared identifier 'cur'
   12 errors generated.


vim +15 lib/list-test.c

    11	
    12	struct list_test_struct {
    13		int data;
    14		struct list_head list;
  > 15		list_traversal_head(struct list_test_struct, head, list);
    16	};
    17	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
