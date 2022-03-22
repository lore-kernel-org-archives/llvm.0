Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005766A2
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647992016; x=1679528016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hbc2pFtG7mEW8CpMLyEQh/RQPVtI6UFLKdWHztwls2c=;
  b=eF9/EN2wscqAxRKXf+eQhR25T1UBm5dfBHT86RMdWaAFnletTwHUoSQj
   wtF2MFSpvJyqViV2tDTmlSGMGnfrzWORVhbi86Kyk5g+3i4XYEJfAOgrj
   GkDP8XiuhOpNXTlhGJDadysjlTC9bvc9/Ra6jCY3Gh9PbqPYc+xsTrOWQ
   PSaUUK83DT5lJbpMEWzSpXvDYOmcWEql541GeE90/tjnnk+XWI6zFFLxR
   CyYT8YXp60Sna6+k6Na/fskDVxSCWTvVB53dclc0ij3y8v9wE2WOPc/NR
   6uY2s44EP/qgFapSR5zN8yILfkHt+v4a7AOy08Ncj9EZgTfBu1HVoUN/D
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="245451934"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="245451934"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 16:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="519122899"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2022 16:33:35 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWo0M-000JOt-G8; Tue, 22 Mar 2022 23:33:34 +0000
Date: Wed, 23 Mar 2022 07:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] getvalues(2) prototype
Message-ID: <202203230743.V7IZ7cFy-lkp@intel.com>
References: <20220322192712.709170-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322192712.709170-1-mszeredi@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Miklos,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.17]
[cannot apply to tip/x86/asm next-20220322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miklos-Szeredi/getvalues-2-prototype/20220323-032854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
config: arm-pxa255-idp_defconfig (https://download.01.org/0day-ci/archive/20220323/202203230743.V7IZ7cFy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f4708fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/73262ccc914519ef252ba28b67b914b32d18ef4b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miklos-Szeredi/getvalues-2-prototype/20220323-032854
        git checkout 73262ccc914519ef252ba28b67b914b32d18ef4b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/values.c:14:15: error: field has incomplete type 'struct iovec'
           struct iovec value_in;          /* in */
                        ^
   include/linux/syscalls.h:18:8: note: forward declaration of 'struct iovec'
   struct iovec;
          ^
   fs/values.c:15:15: error: field has incomplete type 'struct iovec'
           struct iovec value_out;         /* out */
                        ^
   include/linux/syscalls.h:18:8: note: forward declaration of 'struct iovec'
   struct iovec;
          ^
   fs/values.c:23:15: error: field has incomplete type 'struct iovec'
           struct iovec vec;
                        ^
   include/linux/syscalls.h:18:8: note: forward declaration of 'struct iovec'
   struct iovec;
          ^
>> fs/values.c:72:15: error: variable has incomplete type 'struct iovec'
           struct iovec iov = {
                        ^
   include/linux/syscalls.h:18:8: note: forward declaration of 'struct iovec'
   struct iovec;
          ^
   4 errors generated.


vim +14 fs/values.c

    11	
    12	struct name_val {
    13		const char __user *name;	/* in */
  > 14		struct iovec value_in;		/* in */
    15		struct iovec value_out;		/* out */
    16		__u32 error;			/* out */
    17		__u32 reserved;
    18	};
    19	
    20	struct val_iter {
    21		struct name_val __user *curr;
    22		size_t num;
    23		struct iovec vec;
    24		char name[256];
    25		size_t bufsize;
    26		struct seq_file seq;
    27		const char *prefix;
    28		const char *sub;
    29	};
    30	
    31	struct val_desc {
    32		const char *name;
    33		union {
    34			int idx;
    35			int (*get)(struct val_iter *vi, const struct path *path);
    36		};
    37	};
    38	
    39	static int val_get(struct val_iter *vi)
    40	{
    41		struct name_val nameval;
    42		long err;
    43	
    44		if (copy_from_user(&nameval, vi->curr, sizeof(nameval)))
    45			return -EFAULT;
    46	
    47		err = strncpy_from_user(vi->name, nameval.name, sizeof(vi->name));
    48		if (err < 0)
    49			return err;
    50		if (err == sizeof(vi->name))
    51			return -ERANGE;
    52	
    53		if (nameval.value_in.iov_base)
    54			vi->vec = nameval.value_in;
    55	
    56		vi->seq.size = min(vi->vec.iov_len, vi->bufsize);
    57		vi->seq.count = 0;
    58	
    59		return 0;
    60	}
    61	
    62	static int val_next(struct val_iter *vi)
    63	{
    64		vi->curr++;
    65		vi->num--;
    66	
    67		return vi->num ? val_get(vi) : 0;
    68	}
    69	
    70	static int val_end(struct val_iter *vi, size_t count)
    71	{
  > 72		struct iovec iov = {
    73			.iov_base = vi->vec.iov_base,
    74			.iov_len = count,
    75		};
    76	
    77		if (copy_to_user(&vi->curr->value_out, &iov, sizeof(iov)))
    78			return -EFAULT;
    79	
    80		vi->vec.iov_base += count;
    81		vi->vec.iov_len -= count;
    82	
    83		return val_next(vi);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
