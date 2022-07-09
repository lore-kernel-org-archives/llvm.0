Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC517E9
	for <llvm@lists.linux.dev>; Sat,  9 Jul 2022 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657331180; x=1688867180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMWIagOKhvDzGvBAwB0g40/51/40bNQS3Nh5WLER7Gw=;
  b=AtuVLHh9WWFiWAdbnAPDlEuDwJ0uSuzK8VrSs//hXON5buUQ4WoIbBEI
   lc8NMaQL7Qy8bJDfiS8BqrJGTJWOrKHFsz17CC2vhxLaDxtr7t1wKKIG0
   eHxDzzHn8/tsdlVV4crm5YKtkvoAjMftBIXe3ixAEpPqdgM6fzCG5ZSgp
   p0VRnXgg4bkD0oE6/tTbr2fH2V28hJIK6URoB+sKrnvDODytDmYbTQX39
   9dVlqmTF5OoCM2noHt0hIiYmNCitfX77gyp6mOWgfFD3xWXqSmi7KLxY9
   2jokuyRtv6gr7sGrVuVArR7TC3W3dEeJHhF8vkvrLAlCwVSJUTG1bd5g6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="281950003"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="281950003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 18:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="770956492"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jul 2022 18:46:16 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9zXz-000OA9-Nf;
	Sat, 09 Jul 2022 01:46:15 +0000
Date: Sat, 9 Jul 2022 09:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:ceph-netfs-llist 1/10] fs/netfs/buffered_flush.c:916:6:
 warning: variable 'group' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202207090933.VQ7t96pN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ceph-netfs-llist
head:   fd428464b2220bd6c59f0a30f9dadb4720b3efb5
commit: 3d4ae7bbf12af2c1ee8f93df5d6ea3556bdfb6ca [1/10] netfs: Add a write context
config: hexagon-randconfig-r045-20220707 (https://download.01.org/0day-ci/archive/20220709/202207090933.VQ7t96pN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=3d4ae7bbf12af2c1ee8f93df5d6ea3556bdfb6ca
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ceph-netfs-llist
        git checkout 3d4ae7bbf12af2c1ee8f93df5d6ea3556bdfb6ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/netfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/netfs/buffered_flush.c:628:16: warning: comparison of distinct pointer types ('typeof (hard_align) *' (aka 'unsigned int *') and 'typeof (1UL << __builtin_choose_expr(((!!(sizeof ((typeof (ctx->min_bshift) *)1 == (typeof (ctx->crypto_bshift) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)(ctx->min_bshift) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)(ctx->crypto_bshift) * 0L)) : (int *)8))))), ((ctx->min_bshift) > (ctx->crypto_bshift) ? (ctx->min_bshift) : (ctx->crypto_bshift)), ({
       typeof (ctx->min_bshift) __UNIQUE_ID___x288 = (ctx->min_bshift);
       typeof (ctx->crypto_bshift) __UNIQUE_ID___y289 = (ctx->crypto_bshift);
       ((__UNIQUE_ID___x288) > (__UNIQUE_ID___y289) ? (__UNIQUE_ID___x288) : (__UNIQUE_ID___y289));
   }))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   hard_align = max(hard_align,
                                ^~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   fs/netfs/buffered_flush.c:631:16: warning: comparison of distinct pointer types ('typeof (hard_align) *' (aka 'unsigned int *') and 'typeof ((1UL << 18) << ctx->cache_order) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   hard_align = max(hard_align, PAGE_SIZE << ctx->cache_order);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   fs/netfs/buffered_flush.c:633:10: warning: comparison of distinct pointer types ('typeof (hard_align) *' (aka 'unsigned int *') and 'typeof ((1UL << (1 ? 4 : 6)) * (1UL << 18)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           align = min(hard_align, XA_CHUNK_SIZE * PAGE_SIZE);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
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
   fs/netfs/buffered_flush.c:761:22: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
           _leave(" ok [%zx]", wreq->last);
                        ~~~    ^~~~~~~~~~
                        %lx
   fs/netfs/internal.h:312:65: note: expanded from macro '_leave'
   #define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
                                                ~~~                ^~~~~~~~~~~
   include/linux/printk.h:131:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/netfs/buffered_flush.c:776:26: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
           _leave(" cancel [%zx]", wreq->last);
                            ~~~    ^~~~~~~~~~
                            %lx
   fs/netfs/internal.h:312:65: note: expanded from macro '_leave'
   #define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
                                                ~~~                ^~~~~~~~~~~
   include/linux/printk.h:131:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
>> fs/netfs/buffered_flush.c:916:6: warning: variable 'group' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (list_empty(&ctx->flush_groups) || force) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/buffered_flush.c:923:23: note: uninitialized use occurs here
           write->flush_group = group;
                                ^~~~~
   fs/netfs/buffered_flush.c:916:2: note: remove the 'if' if its condition is always true
           if (list_empty(&ctx->flush_groups) || force) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/buffered_flush.c:913:33: note: initialize the variable 'group' to silence this warning
           struct netfs_flush_group *group;
                                          ^
                                           = NULL
   fs/netfs/buffered_flush.c:511:33: warning: unused function 'netfs_find_writeback' [-Wunused-function]
   static struct netfs_io_request *netfs_find_writeback(struct netfs_inode *ctx,
                                   ^
   fs/netfs/buffered_flush.c:527:13: warning: unused function 'netfs_wait_for_writeback' [-Wunused-function]
   static void netfs_wait_for_writeback(struct netfs_io_request *wreq,
               ^
   8 warnings generated.


vim +916 fs/netfs/buffered_flush.c

2dc27084e13c291 David Howells 2021-06-29  907  
ce4670495468b79 David Howells 2022-02-07  908  /*
ce4670495468b79 David Howells 2022-02-07  909   * Make sure there's a flush group.
ce4670495468b79 David Howells 2022-02-07  910   */
3d4ae7bbf12af2c David Howells 2022-07-07  911  int netfs_require_flush_group(struct netfs_write_context *write, bool force)
ce4670495468b79 David Howells 2022-02-07  912  {
ce4670495468b79 David Howells 2022-02-07  913  	struct netfs_flush_group *group;
3d4ae7bbf12af2c David Howells 2022-07-07  914  	struct netfs_inode *ctx = write->ctx;
ce4670495468b79 David Howells 2022-02-07  915  
ce4670495468b79 David Howells 2022-02-07 @916  	if (list_empty(&ctx->flush_groups) || force) {
ce4670495468b79 David Howells 2022-02-07  917  		kdebug("new flush group");
3d4ae7bbf12af2c David Howells 2022-07-07  918  		group = netfs_new_flush_group(ctx, NULL);
ce4670495468b79 David Howells 2022-02-07  919  		if (!group)
ce4670495468b79 David Howells 2022-02-07  920  			return -ENOMEM;
ce4670495468b79 David Howells 2022-02-07  921  	}
3d4ae7bbf12af2c David Howells 2022-07-07  922  
3d4ae7bbf12af2c David Howells 2022-07-07  923  	write->flush_group = group;
ce4670495468b79 David Howells 2022-02-07  924  	return 0;
ce4670495468b79 David Howells 2022-02-07  925  }
ce4670495468b79 David Howells 2022-02-07  926  

:::::: The code at line 916 was first introduced by commit
:::::: ce4670495468b797b0c5927fcb661bc0da48b9ab netfs: Add a struct to group modifications together and flushed in order

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
