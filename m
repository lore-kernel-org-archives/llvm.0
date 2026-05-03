Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE7313E10;
	Sun,  3 May 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823759; cv=none; b=DXdYleRf5I6MGP9cwQKbyWhCLUqO+X7y9dF0PplQR7Psl2x9jPMalLO1nNx9L95GMX9wyswrZPVn0/tY6TwdS6ikumB77R1HgCcUxKz0g5I2/rEh7sfdxOICCYBRXsI9TwAd90nSXk6fzwa5hNZvldyMfhkwW3y0E//y4R9YAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823759; c=relaxed/simple;
	bh=uO514r0yB/5tN6WfV9vXY+kD6qScmhyOyGNKS2/rq/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DpGnXGrwDTlSmcCY24vnIV74PLiDj2O9SJvIK9CpFZ9mA5Jhww7YUkSYRhNIMa8z+MM3xIYedfZnubIFPFvqpdjz2hpl8jtPw1Q4+w0s5G7Mnv76g81z9p5WGRYwu7rA21/DGJFBXIKFUYonh63hv4s9p1XLEogwvdMIKS5O9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORZNoXNo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORZNoXNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777823758; x=1809359758;
  h=date:from:to:cc:subject:message-id;
  bh=uO514r0yB/5tN6WfV9vXY+kD6qScmhyOyGNKS2/rq/I=;
  b=ORZNoXNoXPdY6djYr9tw8CuW9kRD7yOqrzS+sr5l8Toot8zba9t7hW+o
   STILHJMNKg8xCiX5jj4+mEx1TTJfbkRIWKIo5Tat6AEdTYbe4BKmhrg//
   rmFLHUw5geM+d8W11D/FNOzmXknSnfWdns2Mp24rWlTKrEq90pKs20a1A
   YKrXZvYsmU/fFxTYWDgnG0T0u/EhTMeRjtOZBL9lmY1O2wYby+kbF+jpc
   54eQIUsGNbRoP/18V69KIw8+2HmFZoY60JI+Rw4Nb5RYp+hm4Qs+8JCIA
   XXGncV1HTbH7R3PXFk1/2GWAbJPkjRHPKYmdW0dnh20Pt/KFheFlvDiBr
   Q==;
X-CSE-ConnectionGUID: HnrHpI0UQxKPcBL7CpfXrA==
X-CSE-MsgGUID: HM8fVq7gROSQKTefYIy/Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78565067"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78565067"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:55:58 -0700
X-CSE-ConnectionGUID: 5BNj7Kf7QyqSOeRHTNkfJw==
X-CSE-MsgGUID: ELQ2ubCZR4ubfnj+gxQr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="237089365"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 08:55:56 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZAf-000000002hV-3msg;
	Sun, 03 May 2026 15:55:53 +0000
Date: Sun, 03 May 2026 23:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 70/103] net/ceph/databuf.c:63:23:
 warning: variable 'part' is uninitialized when used within its own
 initialization
Message-ID: <202605032337.WICropXv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   62509662bb514752f7ae58e3c60ed040bd2bafaf
commit: c11033e35bafd4cf945adf0ad8f58d22e5aa6a0d [70/103] libceph: Add a new data container type, ceph_databuf
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032337.WICropXv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032337.WICropXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032337.WICropXv-lkp@intel.com/

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
