Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003201097E;
	Tue, 15 Aug 2023 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692112062; x=1723648062;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yBR9xVYZPKMuH/zCwbpZcsvvyDnXZMiEfHQj5a3kNDI=;
  b=ZGADTJSDOtW9wppkLlxKFD2QyCVSaj7nraSRcPwxb/PtsOcCwP0AZO+G
   re0HoR5uBYdeBTHzENXTKNe+mRfezMGJ0wp7dG+Sz9T/tlIy4/Fo4uH2u
   6hXrgL6Ppws8RASC6mbPOeLtZr1y51e6ozb38RIFSx6uiEe0cAdSojFF4
   ZbOZDPWO69svFdV+9wkUy3jfGelN/L78HHZAfkG2gkEuayPeHz6R9862G
   t3WTRbONLALbDTaiONn+htmCwv6q5o/TxuHt4sOkIGFUl/rQZ8fcI9rxH
   w4NiWTCSrca550I85+UWBOrfFYuzqywTAGkDJ0idOs+5y+S/rRZkMzwUU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372294077"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="372294077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="710747435"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="710747435"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Aug 2023 08:07:39 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVvdC-00012J-2y;
	Tue, 15 Aug 2023 15:07:03 +0000
Date: Tue, 15 Aug 2023 23:06:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-4.14.y 3076/9999] /bin/bash: line 1:  3796
 Segmentation fault      ./tools/objtool/objtool orc generate --no-fp
 --no-unreachable "kernel/trace/ring_buffer.o"
Message-ID: <202308152241.gdcxWEOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Dirk Mueller <dmueller@suse.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Rob Herring <robh@kernel.org>
CC: Nathan Chancellor <natechancellor@gmail.com>

Hi Dirk,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   4dbbc9b492fb6a28528de6a1958263780693e96c
commit: 88f7a6aa7fb9aa5076b65489146045dac865f1d3 [3076/9999] scripts/dtc: Remove redundant YYLOC global declaration
config: x86_64-buildonly-randconfig-r002-20230815 (https://download.01.org/0day-ci/archive/20230815/202308152241.gdcxWEOX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152241.gdcxWEOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308152241.gdcxWEOX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c:4791:6: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
           int cnt;
               ^
   1 warning generated.
>> /bin/bash: line 1:  3796 Segmentation fault      ./tools/objtool/objtool orc generate --no-fp --no-unreachable "kernel/trace/ring_buffer.o"
--
   /tmp/bmap-bb0f6e.s: Assembler messages:
   /tmp/bmap-bb0f6e.s:3529: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
>> fs/gfs2/bmap.o: warning: objtool: trunc_dealloc()+0x439: can't find switch jump table
--
          static 
   fs/xfs/libxfs/xfs_bmap.c:2681:1: warning: no previous prototype for function 'xfs_bmap_add_extent_hole_delay' [-Wmissing-prototypes]
   xfs_bmap_add_extent_hole_delay(
   ^
   fs/xfs/libxfs/xfs_bmap.c:2680:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC void
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:2831:1: warning: no previous prototype for function 'xfs_bmap_add_extent_hole_real' [-Wmissing-prototypes]
   xfs_bmap_add_extent_hole_real(
   ^
   fs/xfs/libxfs/xfs_bmap.c:2830:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int                              /* error */
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:3477:1: warning: no previous prototype for function 'xfs_bmap_btalloc_nullfb' [-Wmissing-prototypes]
   xfs_bmap_btalloc_nullfb(
   ^
   fs/xfs/libxfs/xfs_bmap.c:3476:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:3511:1: warning: no previous prototype for function 'xfs_bmap_btalloc_filestreams' [-Wmissing-prototypes]
   xfs_bmap_btalloc_filestreams(
   ^
   fs/xfs/libxfs/xfs_bmap.c:3510:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:3555:1: warning: no previous prototype for function 'xfs_bmap_btalloc' [-Wmissing-prototypes]
   xfs_bmap_btalloc(
   ^
   fs/xfs/libxfs/xfs_bmap.c:3554:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:3813:1: warning: no previous prototype for function 'xfs_bmap_alloc' [-Wmissing-prototypes]
   xfs_bmap_alloc(
   ^
   fs/xfs/libxfs/xfs_bmap.c:3812:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:3870:1: warning: no previous prototype for function 'xfs_bmapi_trim_map' [-Wmissing-prototypes]
   xfs_bmapi_trim_map(
   ^
   fs/xfs/libxfs/xfs_bmap.c:3869:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC void
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:3916:1: warning: no previous prototype for function 'xfs_bmapi_update_map' [-Wmissing-prototypes]
   xfs_bmapi_update_map(
   ^
   fs/xfs/libxfs/xfs_bmap.c:3915:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC void
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:4334:1: warning: no previous prototype for function 'xfs_bmapi_convert_unwritten' [-Wmissing-prototypes]
   xfs_bmapi_convert_unwritten(
   ^
   fs/xfs/libxfs/xfs_bmap.c:4333:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:5082:1: warning: no previous prototype for function 'xfs_bmap_del_extent' [-Wmissing-prototypes]
   xfs_bmap_del_extent(
   ^
   fs/xfs/libxfs/xfs_bmap.c:5081:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int                              /* error */
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:5858:1: warning: no previous prototype for function 'xfs_bmse_can_merge' [-Wmissing-prototypes]
   xfs_bmse_can_merge(
   ^
   fs/xfs/libxfs/xfs_bmap.c:5857:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC bool
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:5890:1: warning: no previous prototype for function 'xfs_bmse_merge' [-Wmissing-prototypes]
   xfs_bmse_merge(
   ^
   fs/xfs/libxfs/xfs_bmap.c:5889:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:5969:1: warning: no previous prototype for function 'xfs_bmse_shift_one' [-Wmissing-prototypes]
   xfs_bmse_shift_one(
   ^
   fs/xfs/libxfs/xfs_bmap.c:5968:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   fs/xfs/libxfs/xfs_bmap.c:6257:1: warning: no previous prototype for function 'xfs_bmap_split_extent_at' [-Wmissing-prototypes]
   xfs_bmap_split_extent_at(
   ^
   fs/xfs/libxfs/xfs_bmap.c:6256:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int
          ^
          static 
   32 warnings generated.
>> fs/xfs/libxfs/xfs_bmap.o: warning: objtool: xfs_bmap_add_extent_delay_real()+0x572: can't find switch jump table
--
>> drivers/media/radio/radio-si476x.c:779:2: warning: variable 'rangehigh' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (!seek->rangehigh) {
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:6: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/radio/radio-si476x.c:789:17: note: uninitialized use occurs here
           if (rangelow > rangehigh) {
                          ^~~~~~~~~
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
                                       ^~~~
   drivers/media/radio/radio-si476x.c:779:2: note: remove the 'if' if its condition is always true
           if (!seek->rangehigh) {
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                         ^
   include/linux/compiler.h:58:2: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
           ^
   drivers/media/radio/radio-si476x.c:758:25: note: initialize the variable 'rangehigh' to silence this warning
           u32 rangelow, rangehigh;
                                  ^
                                   = 0
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
