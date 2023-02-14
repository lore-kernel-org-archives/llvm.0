Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796E27721;
	Tue, 14 Feb 2023 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676379434; x=1707915434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEHG4LVakJ2V+O8QHFL5goLrFcovuEcMhfNVjtbhWuM=;
  b=kMoPVzBAcxnqsxFnpGSOT8Uzi+m+0wSCNDJdRbUuoYgKE0qAAYA4sWSh
   fdihT0OHL2+Iu8gYwCItpnBacabJbCC6GEFEtgzLp1rFsRFzHx58xu8WC
   ozXSPxWbq4CkEPHUrgdnTsAbxQVmTk8G/cQwPZ55A0pk8tVYLJr+JFrnZ
   ARq0+HQ4HVC+FQWM0EbAgdKpD0BrALRSQBlBG8aCKY6Z9CDX9oTKvZo/I
   rHtG211JLjSVylw808Hgw1YVuz2TOkWUjqktVkPUKDH53+0cSQNQxiviy
   pHZ8Or3hHwse8k84NenREI1rydNVH+r6OpgOQwP78AnRh1y/E43uSEqwL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310784997"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="310784997"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 04:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699531456"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="699531456"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 04:57:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRurt-0008Vz-02;
	Tue, 14 Feb 2023 12:57:09 +0000
Date: Tue, 14 Feb 2023 20:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-extract-3 17/17]
 mm/shmem.c:2731:9: warning: comparison of distinct pointer types ('typeof
 (size) *' (aka 'unsigned int *') and 'typeof (((1UL) << 14) - offset) *'
 (aka 'unsigned long *'))
Message-ID: <202302142006.LFa6NtZ0-lkp@intel.com>
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
config: mips-randconfig-r003-20230212 (https://download.01.org/0day-ci/archive/20230214/202302142006.LFa6NtZ0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/17cd42e56c9be2df7fc5ec06c2315cab669a43b0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-extract-3
        git checkout 17cd42e56c9be2df7fc5ec06c2315cab669a43b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142006.LFa6NtZ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2731:9: warning: comparison of distinct pointer types ('typeof (size) *' (aka 'unsigned int *') and 'typeof (((1UL) << 14) - offset) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
