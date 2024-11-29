Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2304A14B06E;
	Fri, 29 Nov 2024 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732899993; cv=none; b=OLtHf4BfWgtymju7ptgIo6rSHdQMJ5p24mVRldzdQnE8UeOYD0MpJ3jjn2JXVwFBu+B5o9Qw+fbEM8tffsjGTJN1YaciIZKn8d9fwn+dZYaVo0+wOu5dI4AZBt6bAnUv/w6nRrEoGRCNTDtJ8AlQW2+T3lBuqiYY97H47ooBmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732899993; c=relaxed/simple;
	bh=Qai2HBU1H3DmuSvV9zmwtCWzyVKxdqExdlqy6089KRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1amjCGfYlZJuElTBQTfXxKXjkeARnIbOAM+kq1jpwV5nlmZogS/xSz7u8V/SIA7Zy0SU5Jdz0KdqLUV/YuzA05nijoI7WHRhO0swPipRV0zJSaS2bU4BXT6tl95lp3IPHFMpUX8Pj9WiCEpdeDbNw/gxoNHiAqk+cFJoedCIyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a66C11ni; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a66C11ni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732899991; x=1764435991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qai2HBU1H3DmuSvV9zmwtCWzyVKxdqExdlqy6089KRc=;
  b=a66C11nimxz1LyB9RDX4dXb7VWjtUbvrNMzA663AqYS2+jfXhmicCI+k
   xRB5zETCkAb0ekmth19BAnpoWRxCZecTjj+K+k1aw7EIUEL5VFMNzTvNo
   NdM2DdIIL6LSTCMJyaPuESEsMhdAHGk6+02DZ1gNUMYmHUwchz/B6Aerh
   zpBLjy8RCK8IvIvlvPiu34B24u7+JdRYm/G3kXgecxoulUoT1KbURkOdX
   jLjUvCNLDLsUAlrDLRIXoidGXUimoXZ6KUSnaP8PJ/ZrjhRIONTe6GV8G
   6gi/HktgA+8ysX7MxeRoKP8H9Wi9942UQU8BPbT0TZiZ7quUoWoHVqkqw
   w==;
X-CSE-ConnectionGUID: mTqFSRzVTg6u7MFt5StDMw==
X-CSE-MsgGUID: QQayZaScTw27ELErFhYcOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44519662"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="44519662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 09:06:30 -0800
X-CSE-ConnectionGUID: b5oO7d3MRIaDplRTYkH5qg==
X-CSE-MsgGUID: aCvfVPkDTWiH2dwmAF/EbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="96960729"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2024 09:06:30 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH4Rn-0000XV-0b;
	Fri, 29 Nov 2024 17:06:27 +0000
Date: Sat, 30 Nov 2024 01:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 92/92] net/ceph/snapshot.c:40:22: warning:
 cast from 'void (*)(const void *)' to 'void (*)(struct netfs_group *)'
 converts to incompatible function type
Message-ID: <202411300046.aELPVLas-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   ae69436bf8db8f3a53edd0dfa379e753700240c0
commit: ae69436bf8db8f3a53edd0dfa379e753700240c0 [92/92] ceph: Use netfslib
config: arm-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300046.aELPVLas-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300046.aELPVLas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300046.aELPVLas-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ceph/snapshot.c:10:
   In file included from include/linux/ceph/libceph.h:8:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/ceph/snapshot.c:40:22: warning: cast from 'void (*)(const void *)' to 'void (*)(struct netfs_group *)' converts to incompatible function type [-Wcast-function-type-strict]
      40 |         snapc->group.free = (void (*)(struct netfs_group *))kfree;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +40 net/ceph/snapshot.c

    11	
    12	/*
    13	 * Ceph snapshot contexts are reference counted objects, and the
    14	 * returned structure holds a single reference.  Acquire additional
    15	 * references with ceph_get_snap_context(), and release them with
    16	 * ceph_put_snap_context().  When the reference count reaches zero
    17	 * the entire structure is freed.
    18	 */
    19	
    20	/*
    21	 * Create a new ceph snapshot context large enough to hold the
    22	 * indicated number of snapshot ids (which can be 0).  Caller has
    23	 * to fill in snapc->seq and snapc->snaps[0..snap_count-1].
    24	 *
    25	 * Returns a null pointer if an error occurs.
    26	 */
    27	struct ceph_snap_context *ceph_create_snap_context(u32 snap_count,
    28							gfp_t gfp_flags)
    29	{
    30		struct ceph_snap_context *snapc;
    31		size_t size;
    32	
    33		size = sizeof (struct ceph_snap_context);
    34		size += snap_count * sizeof (snapc->snaps[0]);
    35		snapc = kzalloc(size, gfp_flags);
    36		if (!snapc)
    37			return NULL;
    38	
    39		refcount_set(&snapc->group.ref, 1);
  > 40		snapc->group.free = (void (*)(struct netfs_group *))kfree;
    41		snapc->num_snaps = snap_count;
    42	
    43		return snapc;
    44	}
    45	EXPORT_SYMBOL(ceph_create_snap_context);
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
