Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAD033032B;
	Thu, 21 May 2026 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396818; cv=none; b=pF2onKtFQX/kZh4GwaiktabaVK/6zYL+IczND+8GAhIs4o1lexreH6xz6DJjQ4kzRs1uZ2a4XLSR1fK5feGnmIFKGHgm29ctFgmpBwSX3mApYsks7oLG5Avk8xn2iuTvST+D3H5P65Fmt8Osoa8+BHP832jwi5H3akGaGFK31RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396818; c=relaxed/simple;
	bh=EdjO+R65Fh809lfNCpDybil0v9ZlQUSRE9xbaAAbxrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lvlKH+U5MJcgHfx4BHHNi42zjGjhdYE/l4Y3G+L8TkKRRUJInQNch3JB3iDtew82g8mPI+uwLb18RCFTuyLhFsS2JIjLxiVOZ3jSmaa0pnQEWvkT1ohsmgFb+Vwr7iK7NSU+ZDVTBFKV4bTMvxQdKjRUBEk3DsnxGXyr5xkt1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDdpvOcb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDdpvOcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779396817; x=1810932817;
  h=date:from:to:cc:subject:message-id;
  bh=EdjO+R65Fh809lfNCpDybil0v9ZlQUSRE9xbaAAbxrM=;
  b=MDdpvOcbpU7Nk9pgoxaeLM576kvDVhvP6PCQ9leJSVqu28wF2Nku6hdA
   acnlM2vRTQuvgkvtWKSLOCOxopHe7rh57AGAlKQB75SmgsPAYyk3d2N6e
   Sls44oGF0T58a5RVpoOQF69sj9Oh2YT9JWJ1rRbJRQEDI8//2kNFf66wY
   igDBJ2mRL4h5Zav4RiYxTV7R3ZfnU1W6QGGMHkH6IrNd/ly3yktmX4nQI
   SucXC36/HoXyBkhpPnZ+5iwPc/0KVTWtUSx7Rt9u4XaDcKX6qyCat/wv1
   09FGxcJuCpjdPw4hdQC3KlIfGV/bQ4cUoiHwHIwuyI6SZ18QCqPrPtWDi
   Q==;
X-CSE-ConnectionGUID: lAYHHHM7RBWHhWKJ1vC6MQ==
X-CSE-MsgGUID: mHbbX+JNTJitxprZDmBS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90901325"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90901325"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 13:53:34 -0700
X-CSE-ConnectionGUID: IAU7tTSLTCG30vxr801H8g==
X-CSE-MsgGUID: NZNVBoDsTiyIyTOVGmJ4Zg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2026 13:53:33 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQAOY-0000000019D-2CAF;
	Thu, 21 May 2026 20:53:30 +0000
Date: Fri, 22 May 2026 04:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 131/1130]
 lib/iov_iter.c:1273:28: error: passing 'void *const *' to parameter of type
 'const void **' discards qualifiers in nested pointer types
Message-ID: <202605220410.FCJ7byxW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: bfc8dfe93000a1e663f657b51d31eeebfe733be9 [131/1130] [CHERRY-PICK] iov_iter: Use get_user_ptr for PCuABI support
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605220410.FCJ7byxW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220410.FCJ7byxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220410.FCJ7byxW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/iov_iter.c:3:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:726:9: warning: 'get_user_ptr' macro redefined [-Wmacro-redefined]
     726 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^
   include/asm-generic/uaccess.h:259:9: note: previous definition is here
     259 | #define get_user_ptr(x, ptr)                                    \
         |         ^
   In file included from lib/iov_iter.c:3:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:727:9: warning: 'put_user_ptr' macro redefined [-Wmacro-redefined]
     727 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^
   include/asm-generic/uaccess.h:218:9: note: previous definition is here
     218 | #define put_user_ptr(x, ptr)                                    \
         |         ^
>> lib/iov_iter.c:1273:28: error: passing 'void *const *' to parameter of type 'const void **' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1273 |                 unsafe_get_user_ptr(buf, &uiov->iov_base, uaccess_end);
         |                                          ^~~~~~~~~~~~~~~
   include/linux/uaccess.h:703:68: note: expanded from macro 'unsafe_get_user_ptr'
     703 | #define unsafe_get_user_ptr(x,p,e) unsafe_op_wrap(__get_user_ptr(x,p),e)
         |                                                                    ^
   include/asm-generic/uaccess.h:254:31: note: expanded from macro '__get_user_ptr'
     254 |         __gu_err = __get_user_ptr_fn(ptr, &__x);                \
         |                                      ^~~
   include/asm-generic/uaccess.h:286:51: note: expanded from macro '__get_user_ptr_fn'
     286 | #define __get_user_ptr_fn(u, k) __get_user_ptr_fn(u, k)
         |                                                   ^
   include/linux/uaccess.h:701:51: note: expanded from macro 'unsafe_op_wrap'
     701 | #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
         |                                                   ^~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   2 warnings and 1 error generated.


vim +1273 lib/iov_iter.c

  1259	
  1260	static __noclone int copy_iovec_from_user(struct iovec *iov,
  1261			const struct iovec __user *uiov, unsigned long nr_segs)
  1262	{
  1263		int ret = -EFAULT;
  1264	
  1265		if (!user_access_begin(uiov, nr_segs * sizeof(*uiov)))
  1266			return -EFAULT;
  1267	
  1268		do {
  1269			void __user *buf;
  1270			ssize_t len;
  1271	
  1272			unsafe_get_user(len, &uiov->iov_len, uaccess_end);
> 1273			unsafe_get_user_ptr(buf, &uiov->iov_base, uaccess_end);
  1274	
  1275			/* check for size_t not fitting in ssize_t .. */
  1276			if (unlikely(len < 0)) {
  1277				ret = -EINVAL;
  1278				goto uaccess_end;
  1279			}
  1280			iov->iov_base = buf;
  1281			iov->iov_len = len;
  1282	
  1283			uiov++; iov++;
  1284		} while (--nr_segs);
  1285	
  1286		ret = 0;
  1287	uaccess_end:
  1288		user_access_end();
  1289		return ret;
  1290	}
  1291	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
