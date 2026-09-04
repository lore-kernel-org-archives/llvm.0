Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58A25D53B;
	Fri,  4 Sep 2026 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563772; cv=none; b=FoW+Ry2t9Ostj4tR+54MRF0upVozD1F7PJtvAmPlZmBdCEhllSL5NXaEc0oShHo9He21VhyLHHcHeS6owH+BpqXGhWMTeETLMadeSvi6yVxmed9lYMpQ4KNvjL+/V/wKe9OuYYiGB7mXxNwkrG+XIxC4A1bCc44GHJQjgP3cv+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563772; c=relaxed/simple;
	bh=BUVPyOVcYGrtZnHBBtTmb+UKnHnpJPPtArTPx3Su3c8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VNJMyTX7zhStDoMqgaDpOjotHvNpCPTcn5nk0d6en+gT1VgJVEw9TxI6cwNsrAlgcQkgb7Sqf+WNCfZIzZXVg317X+8Cq4fhjgdoRHkJNyAE3elWyBstfvStVtU3NlWLrd/rZ2q3/WlyMvJ2jRL4hpVNKxX3EzohWZzXB+ySqqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnt2EwF1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnt2EwF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788563768; x=1820099768;
  h=date:from:to:cc:subject:message-id;
  bh=BUVPyOVcYGrtZnHBBtTmb+UKnHnpJPPtArTPx3Su3c8=;
  b=bnt2EwF1rpp07e05bHAPIHNPCxQ+qiYoE7cB5VdDZTS9EvK8I2Ktp1G+
   fFOZ5M45kXeW9qWM4rPkIw0o/Ro3fJ3GZaq/BKgspwcRA37NMvfCfadKE
   eh/c2ImNgRZvMmv7rtBoNP34VO8DfQmlWrPcprQ3Fg102i2hpVHypfzPf
   0GLvoDgUQ44BnyEEPdIJQMPQ5CYf9DbLZUuNdO1xtFpGBEyIKhhW9BrvX
   ILZqF4ntWl3Vmp+B2VNvwKkj51UxjmKRyjj+uKGAIM+QRNbXzAo62cvFr
   gJZBtM2WR4D4ifSZ3Jbeh38OYV7aZN5tcklNoszplOFC4VmsHsfOeJ0/a
   g==;
X-CSE-ConnectionGUID: KXwiuGyxRDiUb/xtUMtkiQ==
X-CSE-MsgGUID: obQ/kKrZT7yxuNMkcRlhbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106438201"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="106438201"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 16:16:07 -0700
X-CSE-ConnectionGUID: +8syMdS2RbeukuLQxJO24g==
X-CSE-MsgGUID: QeEfs6ldQEmsDv23X5o74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="273949235"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2026 16:16:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2d8e-00000000AF4-3ZN1;
	Fri, 04 Sep 2026 23:16:04 +0000
Date: Sat, 05 Sep 2026 07:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 51/87] net/ceph/databuf.c:63:23:
 warning: variable 'part' is uninitialized when used within its own
 initialization
Message-ID: <202609050739.6wZ5nx0p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   376ad9d4942bf11500931178bbeb965348f01057
commit: af8c3f8a557313c0292b31d7dc1183647bf12100 [51/87] libceph: Add a new data container type, ceph_databuf
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050739.6wZ5nx0p-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0edd1b088cc36b4faee80358c925a91e16006258)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050739.6wZ5nx0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050739.6wZ5nx0p-lkp@intel.com/

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
