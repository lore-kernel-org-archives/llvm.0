Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6529ACFD;
	Sat, 17 Jan 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768672815; cv=none; b=OHIlSy3f2/pS/qXlusRQRWkU7ws3QLBPKTH7Kv6EyajhplgiWcjqSGQK6VCu5/l8ylcRU+IEZ/zm4qpRQAJd90SSB2P8DxD/JlthPZeo6RmuoYley5a2K0Wi5+h5/6dWilp2Og9v5OLh9UYtsWCUIgh8726LqfZpNjR1+YAZ1mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768672815; c=relaxed/simple;
	bh=GyMRxZECu/bjMjx4yL12v1hHoRKNIjEUn7lW/uYfH54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JyunaGWDk0BKXxkAjt6eUkFc2Bn9MEIsvPFP2HbswVnnWCd83SKPxv0LRzEoke+c3MdTLGzT8f3rCQtT+CwHh8jtHlmoK3WeRAzaBVgyg8SfUJt1f3ry2iepTi/BryGA16A62mFY2GJNm8Z5vwNkiKoFzuQTqrxMayolUCecpD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eA6h7Ol+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eA6h7Ol+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768672814; x=1800208814;
  h=date:from:to:cc:subject:message-id;
  bh=GyMRxZECu/bjMjx4yL12v1hHoRKNIjEUn7lW/uYfH54=;
  b=eA6h7Ol+PPKBCsGar5w8pv+sc28H67lF0PsJGiom/XGm0vQ2OW5yRJ8K
   cy6FopbdiVduwGqu8KEGmjjkr+gwJYq3x5aBM0jqDJZX9iu809s/5xYlu
   pGWfCCyBzPahOZZ8jmSdA7ME0T7Hl6AZK+kgL1B1weECfVQmnuUs5W9gD
   OWSALTQXLaoPcFXFJKNfQxwIghN64xNSamut8TRysYEmhgtV9SJRWIYcb
   2tidZ2K8LxPfvhE6PRqmJRV3+qeVe6quBtDG3jAoJyEatKBbO8fftaeZh
   Sq4p/pW3osDX3wHSHoNcMEMj1FrtlzCedC1cV2ZWiA8voSUhZQ0gFN5aT
   Q==;
X-CSE-ConnectionGUID: k2QMmK2CTfisDYZ+esxsww==
X-CSE-MsgGUID: AOYVhX2CRq6qj/ICtHqM+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81067180"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="81067180"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:00:13 -0800
X-CSE-ConnectionGUID: 6OTmIVZJTZO4XlfygZ4r2g==
X-CSE-MsgGUID: 9ygI66k6QCeoNd9bnLqCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205538181"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2026 10:00:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhAam-00000000M6w-3MXR;
	Sat, 17 Jan 2026 18:00:08 +0000
Date: Sun, 18 Jan 2026 02:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 216/216]
 fs/bcachefs/data/ec/create.c:802:2: warning: label followed by a declaration
 is a C23 extension
Message-ID: <202601180127.pXbEx3hC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   bde39b90107558a6e5c84934716bf171ced1cef5
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/216] bcachefs: Split up data/ec.c
config: i386-buildonly-randconfig-004-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180127.pXbEx3hC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180127.pXbEx3hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180127.pXbEx3hC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/ec/create.c:802:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     802 |         unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
         |         ^
   1 warning generated.


vim +802 fs/bcachefs/data/ec/create.c

   760	
   761	static struct ec_stripe_head *
   762	__bch2_ec_stripe_head_get(struct btree_trans *trans,
   763				  unsigned disk_label,
   764				  unsigned algo,
   765				  unsigned redundancy,
   766				  enum bch_watermark watermark)
   767	{
   768		struct bch_fs *c = trans->c;
   769		struct ec_stripe_head *h;
   770	
   771		if (!redundancy)
   772			return NULL;
   773	
   774		int ret = bch2_trans_mutex_lock(trans, &c->ec.stripe_head_lock);
   775		if (ret)
   776			return ERR_PTR(ret);
   777	
   778		if (test_bit(BCH_FS_going_ro, &c->flags)) {
   779			h = ERR_PTR(bch_err_throw(c, erofs_no_writes));
   780			goto err;
   781		}
   782	
   783		list_for_each_entry(h, &c->ec.stripe_head_list, list)
   784			if (h->disk_label	== disk_label &&
   785			    h->algo		== algo &&
   786			    h->redundancy	== redundancy &&
   787			    h->watermark	== watermark) {
   788				ret = bch2_trans_mutex_lock(trans, &h->lock);
   789				if (ret) {
   790					h = ERR_PTR(ret);
   791					goto err;
   792				}
   793				goto found;
   794			}
   795	
   796		h = ec_new_stripe_head_alloc(c, disk_label, algo, redundancy, watermark);
   797		if (!h) {
   798			h = ERR_PTR(bch_err_throw(c, ENOMEM_stripe_head_alloc));
   799			goto err;
   800		}
   801	found:
 > 802		unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
   803		if (h->rw_devs_change_count != rw_devs_change_count) {
   804			ec_stripe_head_devs_update(c, h);
   805			h->rw_devs_change_count = rw_devs_change_count;
   806		}
   807	
   808		if (h->insufficient_devs) {
   809			mutex_unlock(&h->lock);
   810			h = NULL;
   811		}
   812	err:
   813		mutex_unlock(&c->ec.stripe_head_lock);
   814		return h;
   815	}
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
