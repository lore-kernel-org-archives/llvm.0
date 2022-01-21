Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBB2C82
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 06:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642746458; x=1674282458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQMYaqZekK6rqxAXwRluzCH/6citvMVqzHOYp90jFrI=;
  b=kwo6wcPKsZb5piltxl9qFbuIMBWTKrLRICpeF35al8MOsHZaYcM8MvE5
   4AKxGvFb1UCkg/3qyEResY2GdiMOOxFepZFIY9jabcnaU/uOtRxvgDbOz
   k2OMsiA/5vKZLZNeaDMOWvnMd0J3/n4XySc4wwxmIlewXrD1kvN2A0xgQ
   vTo11Irk5I7Id9LYbsAHFQRFz/amM7Xen3KCYD7HxRJQqX2NdmAKL4Ddg
   PP5I+PjzZs/SudBx/Ye0gx9SqokoQAtGit7ZG1OpRShyzcpTUt60+8co6
   cAbFNEt22/wlmbVSCHHhgAJYTcCXp+6069VTlQ6xiqtYWT9irF9SRZdOa
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245797306"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="245797306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 22:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="765609208"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2022 22:27:34 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAnOX-000F0B-Qk; Fri, 21 Jan 2022 06:27:33 +0000
Date: Fri, 21 Jan 2022 14:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: ycaibb <ycaibb@gmail.com>, davem@davemloft.net, yoshfuji@linux-ipv6.org,
	dsahern@kernel.org, kuba@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
	songliubraving@fb.com, yhs@fb.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] inet: missing lock releases in udp.c
Message-ID: <202201211410.CFe494On-lkp@intel.com>
References: <20220121031553.5342-1-ycaibb@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121031553.5342-1-ycaibb@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi ycaibb,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v5.16 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/ycaibb/inet-missing-lock-releases-in-udp-c/20220121-111922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 8aaaf2f3af2ae212428f4db1af34214225f5cec3
config: mips-cu1000-neo_defconfig (https://download.01.org/0day-ci/archive/20220121/202201211410.CFe494On-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/1b84613d303e1496ea759aa171b7b36dfd8f26c3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review ycaibb/inet-missing-lock-releases-in-udp-c/20220121-111922
        git checkout 1b84613d303e1496ea759aa171b7b36dfd8f26c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/udp.c:2979:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                                   goto found;
                                   ^
   net/ipv4/udp.c:2976:4: note: previous statement is here
                           if (afinfo->family == AF_UNSPEC ||
                           ^
   1 warning generated.


vim +/if +2979 net/ipv4/udp.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  2952  
645ca708f936b2f Eric Dumazet      2008-10-29  2953  static struct sock *udp_get_first(struct seq_file *seq, int start)
^1da177e4c3f415 Linus Torvalds    2005-04-16  2954  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2955  	struct sock *sk;
9e8ca27afab6c92 Yonghong Song     2020-06-23  2956  	struct udp_seq_afinfo *afinfo;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2957  	struct udp_iter_state *state = seq->private;
6f191efe48af62d Denis V. Lunev    2008-03-28  2958  	struct net *net = seq_file_net(seq);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2959  
9e8ca27afab6c92 Yonghong Song     2020-06-23  2960  	if (state->bpf_seq_afinfo)
9e8ca27afab6c92 Yonghong Song     2020-06-23  2961  		afinfo = state->bpf_seq_afinfo;
9e8ca27afab6c92 Yonghong Song     2020-06-23  2962  	else
9e8ca27afab6c92 Yonghong Song     2020-06-23  2963  		afinfo = PDE_DATA(file_inode(seq->file));
9e8ca27afab6c92 Yonghong Song     2020-06-23  2964  
a3d2599b24462c7 Christoph Hellwig 2018-04-10  2965  	for (state->bucket = start; state->bucket <= afinfo->udp_table->mask;
f86dcc5aa8c7908 Eric Dumazet      2009-10-07  2966  	     ++state->bucket) {
a3d2599b24462c7 Christoph Hellwig 2018-04-10  2967  		struct udp_hslot *hslot = &afinfo->udp_table->hash[state->bucket];
f86dcc5aa8c7908 Eric Dumazet      2009-10-07  2968  
ca065d0cf80fa54 Eric Dumazet      2016-04-01  2969  		if (hlist_empty(&hslot->head))
f86dcc5aa8c7908 Eric Dumazet      2009-10-07  2970  			continue;
f86dcc5aa8c7908 Eric Dumazet      2009-10-07  2971  
645ca708f936b2f Eric Dumazet      2008-10-29  2972  		spin_lock_bh(&hslot->lock);
ca065d0cf80fa54 Eric Dumazet      2016-04-01  2973  		sk_for_each(sk, &hslot->head) {
878628fbf2589eb YOSHIFUJI Hideaki 2008-03-26  2974  			if (!net_eq(sock_net(sk), net))
a91275eff43a527 Daniel Lezcano    2008-03-21  2975  				continue;
9e8ca27afab6c92 Yonghong Song     2020-06-23  2976  			if (afinfo->family == AF_UNSPEC ||
9e8ca27afab6c92 Yonghong Song     2020-06-23  2977  			    sk->sk_family == afinfo->family)
1b84613d303e149 Ryan Cai          2022-01-21  2978  				spin_unlock_bh(&hslot->lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16 @2979  				goto found;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2980  		}
645ca708f936b2f Eric Dumazet      2008-10-29  2981  		spin_unlock_bh(&hslot->lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2982  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2983  	sk = NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2984  found:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2985  	return sk;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2986  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  2987  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
