Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44F223DE9;
	Sat, 20 Sep 2025 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758346461; cv=none; b=tic6OUbyuQlc+IUvWxpnSLg/8SR9aC3QbSXBltItX2hTXADuSz+V2pVke/D7oDQ/MilxUm9TwA4gg7j4RlkdacnTnjN5tNSolS1JnNHQ+LJxiJGXjUujvgg+LiYY4qbh2ifgNyTVpAcaH48C/w3lAB8t3IVYQdvE2gAS02oVHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758346461; c=relaxed/simple;
	bh=9RNdOz2u2ovSL9qkr2UJ/rQ8bq6tfFGFC1mdUVJhVaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngSRP/ckXCVnfsXKp+5P3Tu3UBIhChbagl4rp1ota96zwJh39XUs5248g9IFg3lcf8p0x4Od6ALY3ZC4vTDQmaMAesrt3R1Zf73K7K1OZr8UvjyDyA7bgK49FBPFfQHq+qLT0JExOLdtwBBtal4jw/urCcLgPOH4h8oY3kGLzAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K12ZzXbu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K12ZzXbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758346459; x=1789882459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9RNdOz2u2ovSL9qkr2UJ/rQ8bq6tfFGFC1mdUVJhVaI=;
  b=K12ZzXbu8P8Rc4uzNATgbxe1eAP4rfNoNr9xQVQdYjE1bM549m91ZW+W
   7q0L524Nk5m04hDY9DYiLWr4CJFdWMSlfS+HoA+PLDCnWe28Sm2YEVhdX
   xpvwGzWNKmLaJ7in8IMNxeZvYVKbf503JyKfcEF9clUSk0wOhMEPiwCyQ
   VCOWyMTZFjfsUonRlQUCc3wRybeD8aGnn+7M2d/Tj5Klp+BVzrWcIV06K
   9vnOXxZFQ9OS7HDgHn4D0FzPYXLewwFR7lQK/ETZLPbT/aWRPx9l/QQo9
   5V0Tt7RCHgVDCbcnkTYAETcsownZWptTwJNWv3XiACdBUIzxtArSgajDZ
   w==;
X-CSE-ConnectionGUID: lEcF4shXTzyyJtCQgb6MRg==
X-CSE-MsgGUID: DuU0VIwRS/qYXynRy++0Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59906703"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="59906703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 22:34:15 -0700
X-CSE-ConnectionGUID: T8gzDnOZQxOJkAXyomqHnA==
X-CSE-MsgGUID: 18PghmS2TFiw/quFqedpeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="175256037"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Sep 2025 22:34:14 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzqEd-00054l-0b;
	Sat, 20 Sep 2025 05:34:11 +0000
Date: Sat, 20 Sep 2025 13:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] dm-crypt: allow unaligned bio_vecs for direct io
Message-ID: <202509201341.vkf3aDEL-lkp@intel.com>
References: <20250918161642.2867886-1-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918161642.2867886-1-kbusch@meta.com>

Hi Keith,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on device-mapper-dm/for-next]
[also build test ERROR on linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/dm-crypt-allow-unaligned-bio_vecs-for-direct-io/20250919-001836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20250918161642.2867886-1-kbusch%40meta.com
patch subject: [RFC PATCH] dm-crypt: allow unaligned bio_vecs for direct io
config: i386-buildonly-randconfig-001-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201341.vkf3aDEL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201341.vkf3aDEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201341.vkf3aDEL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/dm-crypt.c:1473:8: error: assigning to 'struct scatterlist *' from incompatible type 'struct scatterlist'; take the address with &
    1473 |         sg_in = dmreq->sg_in[0];
         |               ^ ~~~~~~~~~~~~~~~
         |                 &
   1 error generated.


vim +1473 drivers/md/dm-crypt.c

  1426	
  1427	static int crypt_convert_block_skcipher(struct crypt_config *cc,
  1428						struct convert_context *ctx,
  1429						struct skcipher_request *req,
  1430						unsigned int tag_offset)
  1431	{
  1432		struct bio_vec bv_out = bio_iter_iovec(ctx->bio_out, ctx->iter_out);
  1433		unsigned int bytes = cc->sector_size;
  1434		struct scatterlist *sg_in, *sg_out;
  1435		struct dm_crypt_request *dmreq;
  1436		u8 *iv, *org_iv, *tag_iv;
  1437		__le64 *sector;
  1438		int r = 0;
  1439	
  1440		dmreq = dmreq_of_req(cc, req);
  1441		dmreq->iv_sector = ctx->cc_sector;
  1442		if (test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags))
  1443			dmreq->iv_sector >>= cc->sector_shift;
  1444		dmreq->ctx = ctx;
  1445	
  1446		*org_tag_of_dmreq(cc, dmreq) = tag_offset;
  1447	
  1448		iv = iv_of_dmreq(cc, dmreq);
  1449		org_iv = org_iv_of_dmreq(cc, dmreq);
  1450		tag_iv = iv_tag_from_dmreq(cc, dmreq);
  1451	
  1452		sector = org_sector_of_dmreq(cc, dmreq);
  1453		*sector = cpu_to_le64(ctx->cc_sector - cc->iv_offset);
  1454	
  1455		/* For skcipher we use only the first sg item */
  1456		sg_out = &dmreq->sg_out[0];
  1457	
  1458		do {
  1459			struct bio_vec bv_in = bio_iter_iovec(ctx->bio_in, ctx->iter_in);
  1460			int len = min(bytes, bv_in.bv_len);
  1461	
  1462			if (r >= ARRAY_SIZE(dmreq->sg_in))
  1463				return -EINVAL;
  1464	
  1465			sg_in = &dmreq->sg_in[r++];
  1466			memset(sg_in, 0, sizeof(*sg_in));
  1467			sg_set_page(sg_in, bv_in.bv_page, len, bv_in.bv_offset);
  1468			bio_advance_iter_single(ctx->bio_in, &ctx->iter_in, len);
  1469			bytes -= len;
  1470		} while (bytes);
  1471	
  1472		sg_mark_end(sg_in);
> 1473		sg_in = dmreq->sg_in[0];
  1474	
  1475		sg_init_table(sg_out, 1);
  1476		sg_set_page(sg_out, bv_out.bv_page, cc->sector_size, bv_out.bv_offset);
  1477	
  1478		if (cc->iv_gen_ops) {
  1479			/* For READs use IV stored in integrity metadata */
  1480			if (cc->integrity_iv_size && bio_data_dir(ctx->bio_in) != WRITE) {
  1481				memcpy(org_iv, tag_iv, cc->integrity_iv_size);
  1482			} else {
  1483				r = cc->iv_gen_ops->generator(cc, org_iv, dmreq);
  1484				if (r < 0)
  1485					return r;
  1486				/* Data can be already preprocessed in generator */
  1487				if (test_bit(CRYPT_ENCRYPT_PREPROCESS, &cc->cipher_flags))
  1488					sg_in = sg_out;
  1489				/* Store generated IV in integrity metadata */
  1490				if (cc->integrity_iv_size)
  1491					memcpy(tag_iv, org_iv, cc->integrity_iv_size);
  1492			}
  1493			/* Working copy of IV, to be modified in crypto API */
  1494			memcpy(iv, org_iv, cc->iv_size);
  1495		}
  1496	
  1497		skcipher_request_set_crypt(req, sg_in, sg_out, cc->sector_size, iv);
  1498	
  1499		if (bio_data_dir(ctx->bio_in) == WRITE)
  1500			r = crypto_skcipher_encrypt(req);
  1501		else
  1502			r = crypto_skcipher_decrypt(req);
  1503	
  1504		if (!r && cc->iv_gen_ops && cc->iv_gen_ops->post)
  1505			r = cc->iv_gen_ops->post(cc, org_iv, dmreq);
  1506	
  1507		bio_advance_iter(ctx->bio_out, &ctx->iter_out, cc->sector_size);
  1508	
  1509		return r;
  1510	}
  1511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
