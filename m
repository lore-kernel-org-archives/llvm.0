Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D517753;
	Tue, 23 Apr 2024 02:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713838916; cv=none; b=DTjd9icB7HmcsbFTTK2hYQjMKh5n3g4gqP0TfJKhFLEZJprWHS8pNZyYsuelnJc88TBQk1XcBgRZCSsgLna4nhXpuSTLqOSkS46lNcdsktYUCm7vJuhwf7D3QHKhul/t5RuA+9JGRRGGVNHLh5DwJ5dFbx1eav++hfxD+Tr7iSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713838916; c=relaxed/simple;
	bh=FxXOyQhexVOzPMpNgJfPd52RveJ/r+rGkGZnBZsSFpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HO8UHqvmPcLwF8OHUyp2gtqCmVq/MuhWT+/4JRfQwuMV8qxxUh8l8lWEhnTMa66JQv/FHjoIPGWjFT1DIkJgN/zlrLgIZQF2E121KsV6z0boxhcVrXYzJbo1LY6HgNNAqnqKAS7VIuqxIZq62zvF7Pn2dT21c6meV9pJyIMaCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJTyWy9L; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJTyWy9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713838914; x=1745374914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FxXOyQhexVOzPMpNgJfPd52RveJ/r+rGkGZnBZsSFpU=;
  b=CJTyWy9Lgcp4rhJNvT2gLbA0QLECDgDXjX768ANbtprNPbuEBd67CE0l
   k6lS4mnADbCMhtCYReUVCSVhcamy0ry4lO0pXCnYCrZwGPDUte+6CiP21
   z7tE4EYzqzYXSm4mUDmL9dR0Rp8aW16WjSCiPtuHP75gB6RFQyBnZpFsG
   37eC3ROS5qT+6Wke9V+xMsHYSWAp6ChoLEG9PMrwL4DOrxjiocAvq15VG
   Bd7nzdoSV4Y/MY8JO+QCNnbHbtQxPyScWiPmV97S4yI9V8GjTP1/F/F8P
   5xHaB2ItLsJ7T1QhZPVYRZL7k7gHcYeOqPLMB1T77ebC3xQ87gC6hQC02
   A==;
X-CSE-ConnectionGUID: oQxo3aBTRXeHse6AqmMTlA==
X-CSE-MsgGUID: SSkvgvw+Tey6dQnu6vD2vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20101691"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20101691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 19:21:51 -0700
X-CSE-ConnectionGUID: ubUzMZeNS4mahzh15shkgA==
X-CSE-MsgGUID: JMq8Q2ObQWKcYltgIgoC2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28660896"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2024 19:21:48 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz5n0-0000Ow-2m;
	Tue, 23 Apr 2024 02:21:46 +0000
Date: Tue, 23 Apr 2024 10:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jianfeng Wang <jianfeng.w.wang@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka-slab:slab/for-next 11/12] mm/slub.c:3256:14: error: call to
 undeclared function 'node_nr_objs'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202404231035.P6HbfrHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/=
for-next
head:   b6f00c4ef02065161c09fdf560e492cfbb1fec0a
commit: 1c5610f451be71ca2f8b9c6b86ef4712aeed6437 [11/12] slub: introduce co=
unt_partial_free_approx()
config: arm-mps2_defconfig (https://download.01.org/0day-ci/archive/2024042=
3/202404231035.P6HbfrHW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef=
5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240423/202404231035.P6HbfrHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231035.P6HbfrHW-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enu=
meration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-con=
version]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "n=
r_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/slub.c:3256:14: error: call to undeclared function 'node_nr_objs'; IS=
O C99 and later do not support implicit function declarations [-Wimplicit-f=
unction-declaration]
    3256 |                 x =3D min(x, node_nr_objs(n));
         |                            ^
   mm/slub.c:3256:14: note: did you mean 'node_nr_slabs'?
   mm/slub.c:1862:29: note: 'node_nr_slabs' declared here
    1862 | static inline unsigned long node_nr_slabs(struct kmem_cache_node=
 *n)
         |                             ^
>> mm/slub.c:3256:7: error: static assertion failed due to requirement '__b=
uiltin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((un=
signed long)(-1)) < (unsigned long)1)) * 0L)) : (int *)8))), (((unsigned lo=
ng)(-1)) < (unsigned long)1), 0) =3D=3D __builtin_choose_expr((sizeof(int) =
=3D=3D sizeof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) * 0L)) : (int=
 *)8))), (((int)(-1)) < (int)1), 0) || __builtin_choose_expr((sizeof(int) =
=3D=3D sizeof (*(8 ? ((void *)((long)((((unsigned long)(-1)) < (unsigned lo=
ng)1)) * 0L)) : (int *)8))), (((unsigned long)(-1)) < (unsigned long)1), 0)=
 =3D=3D __builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((=
long)((((int)(-1)) < (int)1)) * 0L)) : (int *)8))), (((int)(-1)) < (int)1),=
 0) || (__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((=
long)(x) * 0L)) : (int *)8))) && __builtin_choose_expr((sizeof(int) =3D=3D =
sizeof (*(8 ? ((void *)((long)((((unsigned long)(-1)) < (unsigned long)1)) =
* 0L)) : (int *)8))), (((unsigned long)(-1)) < (unsigned long)1), 0), x, -1=
) >=3D 0) || (__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((voi=
d *)((long)(node_nr_objs(n)) * 0L)) : (int *)8))) && __builtin_choose_expr(=
(sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) =
* 0L)) : (int *)8))), (((int)(-1)) < (int)1), 0), node_nr_objs(n), -1) >=3D=
 0)': min(x, node_nr_objs(n)) signedness error, fix types or consider umin(=
) before min_t()
    3256 |                 x =3D min(x, node_nr_objs(n));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:85:19: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:58:3: note: expanded from macro '__careful_cmp'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_=
ID(__y)))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/minmax.h:51:16: note: expanded from macro '__cmp_once'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                 #op "(" #x ", " #y ") signedness error, fix type=
s or consider u" #op "() before " #op "_t()"); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:31:2: note: expanded from macro '__is_signed'
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(type=
of(x))),        \
         |         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 warning and 2 errors generated.


vim +/node_nr_objs +3256 mm/slub.c

  3226=09
  3227	static unsigned long count_partial_free_approx(struct kmem_cache_nod=
e *n)
  3228	{
  3229		unsigned long flags;
  3230		unsigned long x =3D 0;
  3231		struct slab *slab;
  3232=09
  3233		spin_lock_irqsave(&n->list_lock, flags);
  3234		if (n->nr_partial <=3D MAX_PARTIAL_TO_SCAN) {
  3235			list_for_each_entry(slab, &n->partial, slab_list)
  3236				x +=3D slab->objects - slab->inuse;
  3237		} else {
  3238			/*
  3239			 * For a long list, approximate the total count of objects in
  3240			 * it to meet the limit on the number of slabs to scan.
  3241			 * Scan from both the list's head and tail for better accuracy.
  3242			 */
  3243			unsigned long scanned =3D 0;
  3244=09
  3245			list_for_each_entry(slab, &n->partial, slab_list) {
  3246				x +=3D slab->objects - slab->inuse;
  3247				if (++scanned =3D=3D MAX_PARTIAL_TO_SCAN / 2)
  3248					break;
  3249			}
  3250			list_for_each_entry_reverse(slab, &n->partial, slab_list) {
  3251				x +=3D slab->objects - slab->inuse;
  3252				if (++scanned =3D=3D MAX_PARTIAL_TO_SCAN)
  3253					break;
  3254			}
  3255			x =3D mult_frac(x, n->nr_partial, scanned);
> 3256			x =3D min(x, node_nr_objs(n));
  3257		}
  3258		spin_unlock_irqrestore(&n->list_lock, flags);
  3259		return x;
  3260	}
  3261=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
