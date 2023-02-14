Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E727721;
	Tue, 14 Feb 2023 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676381413; x=1707917413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KiY8ACAIUMz6YB9Pycr31MXRldnNgckI7Vc05G9agmM=;
  b=I5zClv5qoZvmS9NJ1JoZUWjB9H1bFLwLx6xuz1vzNwRWQCwaWyr31rTu
   GvjgAOh7u7HEImxZC4I7bkzwa2uoWzql4iENqrPGR5dmORI1ec/HFXbQZ
   2Gg1/7euLomP+HQQhmYSSksVjCMLIeAd8utdJeL9QnqInLdSMwzXUyYrE
   FNK/Knqh4dSaoUULKcHUWFw5mgo5z2h9AIDinT4uSHZ83BBBbpfwqO20i
   EJku9xdyj8tOyXBYDf4uNm+sQOR8BRoG36HEoTwbY5JUGWVml9RmT36AY
   D6gzCPDPh8BwJvnKPlfO8J8oeuAr5ZWj6ER7OxJXwJ5p6Q4pFfrSGhMzm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333294318"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="333294318"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 05:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757995661"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="757995661"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 05:30:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRvNq-0008Xd-2M;
	Tue, 14 Feb 2023 13:30:10 +0000
Date: Tue, 14 Feb 2023 21:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-extract-3 17/17]
 mm/shmem.c:2731:9: warning: comparison of distinct pointer types ('typeof
 (size) *' (aka 'unsigned int *') and 'typeof (((1UL) << (12)) - offset) *'
 (aka 'unsigned long *'))
Message-ID: <202302142135.btT3KXbD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract-3
head:   17cd42e56c9be2df7fc5ec06c2315cab669a43b0
commit: 17cd42e56c9be2df7fc5ec06c2315cab669a43b0 [17/17] shmem, overlayfs, coda, tty, proc, kernfs, random: Fix splice-read
config: riscv-randconfig-r042-20230214 (https://download.01.org/0day-ci/archive/20230214/202302142135.btT3KXbD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/17cd42e56c9be2df7fc5ec06c2315cab669a43b0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-extract-3
        git checkout 17cd42e56c9be2df7fc5ec06c2315cab669a43b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142135.btT3KXbD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2731:9: warning: comparison of distinct pointer types ('typeof (size) *' (aka 'unsigned int *') and 'typeof (((1UL) << (12)) - offset) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           size = min(size, PAGE_SIZE - offset);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +2731 mm/shmem.c

  2725	
  2726	static size_t splice_zeropage_into_pipe(struct pipe_inode_info *pipe,
  2727						loff_t fpos, size_t size)
  2728	{
  2729		size_t offset = fpos & ~PAGE_MASK;
  2730	
> 2731		size = min(size, PAGE_SIZE - offset);
  2732	
  2733		if (!pipe_full(pipe->head, pipe->tail, pipe->max_usage)) {
  2734			struct pipe_buffer *buf = pipe_head_buf(pipe);
  2735	
  2736			*buf = (struct pipe_buffer) {
  2737				.ops	= &zero_pipe_buf_ops,
  2738				.page	= ZERO_PAGE(0),
  2739				.offset	= offset,
  2740				.len	= size,
  2741			};
  2742			get_page(buf->page);
  2743			pipe->head++;
  2744		}
  2745	
  2746		return size;
  2747	}
  2748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
