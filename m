Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B353EBF1A;
	Tue, 13 Oct 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858037; cv=none; b=rTPVA2Hpc6Hp+E2/yWDOD994j51vGITY8BMzMd7tFH5NsE1qef1pK8h/TnTdaUrrwUGyYusKWo/hZwzVeI3x9xVCLzbGlmJ5J0gzGvYf/Aqiu5D7/f7G4GUG5yVydfRd24zCI/hcVwDEanJXanhKP5HR3vkYMgMRBlJ5m/gTXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858037; c=relaxed/simple;
	bh=kBPNfyQcChunT1JOmgMyn3mDkWcbfxmQmpiBTDujKn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cuFqEpKz4SHeZE5fewOJjQXGBCSmuVLu9ONFWubZgsGjZNEIF8Y8/8oLWepdBN05Mi361W6vedXDMx4gwZGY0DvecXS7kmNweKxiS/W+ZmfQs69igOjSWwlyusDS7+AMSpaqnsd7/FB9S0wkrDh+vAUJl+5Dt3QXtEsdof8viEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgEb+3dh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgEb+3dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791858036; x=1823394036;
  h=date:from:to:cc:subject:message-id;
  bh=kBPNfyQcChunT1JOmgMyn3mDkWcbfxmQmpiBTDujKn4=;
  b=YgEb+3dhxEAi37ebxx0l0wUhnrt38LU/31OF9/Hw6oJfqFAav8T7v4H4
   64MoU98judEvklGCrua1bzUvHh8d3ApmOBrEVs9RJyvT7EULP/Ly72Dlv
   ZDQCm/ZORYnntacGe6ACCoMggg+MaMQCltOtNnmNS0mR5IPBytX0suEig
   nIiV5EuABmfdKcfWfOxjST7uoLfayA9zurAqL36zl+fsgQl7lyJlaAPJN
   78QdtqDfr7V95aRT0EER5g1V0QHql/ORyfujC23qF/9U7jgvgzFPp4eGD
   zxnbXLGR6oeK/7pl5n0SV38buH81pfhFMQew4Xur6+4wNlo52KCYS+bNk
   g==;
X-CSE-ConnectionGUID: s6HkmAP7SmmNBCtJB8Fnrw==
X-CSE-MsgGUID: GwfeeHbERYy4zLGPTQWAqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="453444"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="453444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 19:20:36 -0700
X-CSE-ConnectionGUID: US9zDQ+DRyaCGjx7wdLJrg==
X-CSE-MsgGUID: 2LJPiDn3Q0CY5AbJWU4mgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1157664"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 19:20:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGS7z-00000000CPY-1QBp;
	Tue, 13 Oct 2026 02:20:31 +0000
Date: Tue, 13 Oct 2026 10:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 32/68] net/ceph/databuf.c:63:23:
 warning: variable 'part' is uninitialized when used within its own
 initialization
Message-ID: <202610131048.aC2zOPgx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   c67464ec28da31de31fe4358eb13c2771a280cb7
commit: 8a641e79bed7f15b432c0cdeebe6399dc1846aa4 [32/68] libceph: Add a new data container type, ceph_databuf
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261013/202610131048.aC2zOPgx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131048.aC2zOPgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131048.aC2zOPgx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ceph/databuf.c:63:23: warning: variable 'part' is uninitialized when used within its own initialization [-Wuninitialized]
      63 |                         size_t part = umin(part, enc->space);
         |                                ~~~~        ^~~~
   include/linux/minmax.h:121:22: note: expanded from macro 'umin'
     121 |         __careful_cmp(min, (x) + 0u + 0ul + 0ull, (y) + 0u + 0ul + 0ull)
         |                             ^
   include/linux/minmax.h:98:25: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                ^
   include/linux/minmax.h:92:13: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   1 warning generated.


vim +/part +63 net/ceph/databuf.c

    44	
    45	/**
    46	 * ceph_bvecq_append - Append some data onto a buffer
    47	 * @enc: The encoding context
    48	 * @data: The data to append
    49	 * @len: The length of the data
    50	 *
    51	 * Add some data onto the end of the encoding buffer's occupied region.  This
    52	 * will expand the maximum size of the buffer if necessary.
    53	 *
    54	 * If ENOMEM is encountered, enc->nomem is set to true and all future appends
    55	 * will do nothing.
    56	 */
    57	void ceph_bvecq_append(struct ceph_encode *enc, const void *data, size_t len)
    58	{
    59		for (;;) {
    60			struct bvecq *bq;
    61	
    62			if (likely(len <= enc->space)) {
  > 63				size_t part = umin(part, enc->space);
    64	
    65				memcpy(enc->p, data, len);
    66				enc->p += len;
    67				enc->space -= len;
    68				enc->len += len;
    69	
    70				if (part >= len)
    71					return;
    72				data += part;
    73				len -= part;
    74			}
    75	
    76			if (enc->p)
    77				kunmap_local(enc->p);
    78	
    79			if (unlikely(enc->nomem))
    80				return;
    81			if (ceph_bvecq_reserve(enc, len) < 0) {
    82				enc->p = NULL;
    83				enc->nomem = true;
    84				return;
    85			}
    86	
    87			enc->slot++;
    88			bq = enc->bq;
    89			if (enc->slot >= bq->nr_slots) {
    90				bq = bq->next;
    91				enc->bq = bq;
    92				enc->slot = 0;
    93			}
    94			enc->space = bq->bv[enc->slot].bv_len;
    95			enc->p = kmap_local_bvecq(enc->bq, 0);
    96		}
    97	}
    98	EXPORT_SYMBOL(ceph_bvecq_append);
    99	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
