Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EDA10784;
	Thu, 29 Jun 2023 23:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688081957; x=1719617957;
  h=date:from:cc:subject:message-id:mime-version;
  bh=w6vWHxz+rgCvYphTY2G6Lv5BvclrewW2Ri9H4QlQQiE=;
  b=mb2cp9WkdDdYsLsByV6qLRN8b05whNdxG6gJO7YnXsC+LXiTCYs4aCVY
   7hs9h+TRs3Z8iGCGkTnvpNs7aGPDu5BhvyqPMwjVpsVusoN34RQm7AlPT
   NB9LZWahxzfUzL9YVm9oOx/Gm9Wil4p/sH+U1dyyvRkJxKhSstcQUKWU7
   mabkq/o0qUv2ARplYuCMB9R1wJ3m3AeUivoALMDo2XyH0pATaHEvAGYAl
   fi8bUvlbOsulbg9Mir4JJOjPRDZwwtDNiaK0+1ZjvqJH1bNPpglbZ5UlQ
   BIl6s4ij9bCU7iBdtYvMj2fXUozqukZ4czCmcNeEMpSV4dCbTLm1Cykoz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="347040374"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="347040374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 16:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048009380"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="1048009380"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 16:39:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF1E8-000EWH-04;
	Thu, 29 Jun 2023 23:39:04 +0000
Date: Fri, 30 Jun 2023 07:38:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] objtool: Make 'sec-address' always on
Message-ID: <202306300717.hia1E3f7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
References: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4 next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/objtool-Make-sec-address-always-on/20230621-232305
base:   linus/master
patch link:    https://lore.kernel.org/r/e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] objtool: Make 'sec-address' always on
config: x86_64-randconfig-x001-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300717.hia1E3f7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300717.hia1E3f7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300717.hia1E3f7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/reiserfs/lbalance.o: warning: objtool: leaf_move_items+0xf5b (.text+0xf5b): stack state mismatch: cfa1=4+160 cfa2=4+152
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer+0x2091 (.text+0x4931): stack state mismatch: cfa1=4+240 cfa2=4+224
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item+0x35ef (.text+0xae3f): stack state mismatch: cfa1=4+248 cfa2=4+240
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely+0xe41 (.text+0xbdf1): stack state mismatch: cfa1=4+256 cfa2=4+248
--
>> fs/reiserfs/do_balan.o: warning: objtool: replace_key+0x497 (.text+0xc67): stack state mismatch: cfa1=4+112 cfa2=4+128
>> fs/reiserfs/do_balan.o: warning: objtool: balance_leaf+0xcb30 (.text+0x10490): stack state mismatch: cfa1=4+440 cfa2=4+456
--
>> fs/reiserfs/ibalance.o: warning: objtool: balance_internal+0x4f7c (.text+0x4f7c): stack state mismatch: cfa1=4+304 cfa2=4+312
>> fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items+0x8e0 (.text+0x7ab0): stack state mismatch: cfa1=4+232 cfa2=4+224

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
