Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AB212160;
	Tue, 12 Nov 2024 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406156; cv=none; b=L8EAJ1WhNA33WOVZSM79OH0Chauqb7vU5T555Od3PFLMlUkIyBzgpQXx6LUHKFaYSg36vsk8D+z7F/9qxXMhM+DgFX84FIeowf2DUYh5noYn7+jxliZENogHEkCLa69rkSysYJakDfyfRUM44YOR8G+hOErL1Dt8Fn2AAEi5dFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406156; c=relaxed/simple;
	bh=5WEzNQzknxX/zlAL9Qx9kMSoOVROMzKSOzm2xf3xRKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZoHsC7CvWPFj+7rjhXHLVUTAIFvOt9UffNI+p49ntxQT1qSDWv/N3YwvlgY7xnSPk9LSoGr5aV3WO1zTdore+4SNr012E6e+dBsitMmBKVTIFDKjvfBhAgXTiBGHSiLAuNq/NHXTFNeEh3sLmCKsfvhfGa1iR3pxiyYYxuyWS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6iWOcgG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6iWOcgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731406154; x=1762942154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WEzNQzknxX/zlAL9Qx9kMSoOVROMzKSOzm2xf3xRKI=;
  b=g6iWOcgG2VwhCQ242aqlVwDANixfiVVeGyyedBKLFs6Q72THqhj+F0VF
   KlUrqLfx4QLom0YvB8tax/gKZO8r6Eqymy8m0kHUH3rksonkqcJdQuv3G
   +h0Iorar324Jp6HGaNhFLioiq54cF7atP4sUTHoBZ0H/IukvQLxFU6d5T
   HaNtlwRRyEf8LFEhnDQLZeowMPuerfQ/BEOTdqH4wX5xuPh1Vohidm1e3
   dJ4E6urxkWgpE3xCgCz8fy/hpJ2v/WWBIyrgJ78WJr0/ROF8B0C4ml8hS
   ts0VUhWD1Z4mLd6c2moWcMpBaNxJ4ampkD0mzetsxfgWtDK6ogaiOkh0M
   Q==;
X-CSE-ConnectionGUID: fZANGStWTxeYTAq1jBsj0A==
X-CSE-MsgGUID: Wx9MIW1iQjKFvfgJ2JWjZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="30633678"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="30633678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:09:14 -0800
X-CSE-ConnectionGUID: x5exkiDYT66PHj7j2RuRcQ==
X-CSE-MsgGUID: oaTGnE/gT3OgEmz/rK2VvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87809813"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2024 02:09:13 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnpe-0000hV-2n;
	Tue, 12 Nov 2024 10:09:10 +0000
Date: Tue, 12 Nov 2024 18:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 112/112] fs/bcachefs/io_write.c:1127:2:
 error: expected expression
Message-ID: <202411121809.xSrI6EYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   bf89bd21105c3685314ed3a68f06167ba9f198fa
commit: e661d0e153cca3184d0914da1866ef8e9c75af29 [112/112] bcachefs: bch2_inum_to_path()
config: arm-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241112/202411121809.xSrI6EYd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121809.xSrI6EYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121809.xSrI6EYd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/io_write.c:1127:2: error: expected expression
           struct printbuf buf = PRINTBUF;
           ^
>> fs/bcachefs/io_write.c:1128:23: error: use of undeclared identifier 'buf'
           bch2_write_op_error(&buf, op);
                                ^
   fs/bcachefs/io_write.c:1129:14: error: use of undeclared identifier 'buf'
           prt_printf(&buf, "error verifying existing checksum while rewriting existing data (memory corruption?)");
                       ^
   fs/bcachefs/io_write.c:1130:31: error: use of undeclared identifier 'buf'
           bch_err_ratelimited(c, "%s", buf.buf);
                                        ^
   fs/bcachefs/io_write.c:1131:17: error: use of undeclared identifier 'buf'
           printbuf_exit(&buf);
                          ^
   5 errors generated.


vim +1127 fs/bcachefs/io_write.c

   936	
   937	static int bch2_write_extent(struct bch_write_op *op, struct write_point *wp,
   938				     struct bio **_dst)
   939	{
   940		struct bch_fs *c = op->c;
   941		struct bio *src = &op->wbio.bio, *dst = src;
   942		struct bvec_iter saved_iter;
   943		void *ec_buf;
   944		unsigned total_output = 0, total_input = 0;
   945		bool bounce = false;
   946		bool page_alloc_failed = false;
   947		int ret, more = 0;
   948	
   949		BUG_ON(!bio_sectors(src));
   950	
   951		ec_buf = bch2_writepoint_ec_buf(c, wp);
   952	
   953		switch (bch2_write_prep_encoded_data(op, wp)) {
   954		case PREP_ENCODED_OK:
   955			break;
   956		case PREP_ENCODED_ERR:
   957			ret = -EIO;
   958			goto err;
   959		case PREP_ENCODED_CHECKSUM_ERR:
   960			goto csum_err;
   961		case PREP_ENCODED_DO_WRITE:
   962			/* XXX look for bug here */
   963			if (ec_buf) {
   964				dst = bch2_write_bio_alloc(c, wp, src,
   965							   &page_alloc_failed,
   966							   ec_buf);
   967				bio_copy_data(dst, src);
   968				bounce = true;
   969			}
   970			init_append_extent(op, wp, op->version, op->crc);
   971			goto do_write;
   972		}
   973	
   974		if (ec_buf ||
   975		    op->compression_opt ||
   976		    (op->csum_type &&
   977		     !(op->flags & BCH_WRITE_PAGES_STABLE)) ||
   978		    (bch2_csum_type_is_encryption(op->csum_type) &&
   979		     !(op->flags & BCH_WRITE_PAGES_OWNED))) {
   980			dst = bch2_write_bio_alloc(c, wp, src,
   981						   &page_alloc_failed,
   982						   ec_buf);
   983			bounce = true;
   984		}
   985	
   986		saved_iter = dst->bi_iter;
   987	
   988		do {
   989			struct bch_extent_crc_unpacked crc = { 0 };
   990			struct bversion version = op->version;
   991			size_t dst_len = 0, src_len = 0;
   992	
   993			if (page_alloc_failed &&
   994			    dst->bi_iter.bi_size  < (wp->sectors_free << 9) &&
   995			    dst->bi_iter.bi_size < c->opts.encoded_extent_max)
   996				break;
   997	
   998			BUG_ON(op->compression_opt &&
   999			       (op->flags & BCH_WRITE_DATA_ENCODED) &&
  1000			       bch2_csum_type_is_encryption(op->crc.csum_type));
  1001			BUG_ON(op->compression_opt && !bounce);
  1002	
  1003			crc.compression_type = op->incompressible
  1004				? BCH_COMPRESSION_TYPE_incompressible
  1005				: op->compression_opt
  1006				? bch2_bio_compress(c, dst, &dst_len, src, &src_len,
  1007						    op->compression_opt)
  1008				: 0;
  1009			if (!crc_is_compressed(crc)) {
  1010				dst_len = min(dst->bi_iter.bi_size, src->bi_iter.bi_size);
  1011				dst_len = min_t(unsigned, dst_len, wp->sectors_free << 9);
  1012	
  1013				if (op->csum_type)
  1014					dst_len = min_t(unsigned, dst_len,
  1015							c->opts.encoded_extent_max);
  1016	
  1017				if (bounce) {
  1018					swap(dst->bi_iter.bi_size, dst_len);
  1019					bio_copy_data(dst, src);
  1020					swap(dst->bi_iter.bi_size, dst_len);
  1021				}
  1022	
  1023				src_len = dst_len;
  1024			}
  1025	
  1026			BUG_ON(!src_len || !dst_len);
  1027	
  1028			if (bch2_csum_type_is_encryption(op->csum_type)) {
  1029				if (bversion_zero(version)) {
  1030					version.lo = atomic64_inc_return(&c->key_version);
  1031				} else {
  1032					crc.nonce = op->nonce;
  1033					op->nonce += src_len >> 9;
  1034				}
  1035			}
  1036	
  1037			if ((op->flags & BCH_WRITE_DATA_ENCODED) &&
  1038			    !crc_is_compressed(crc) &&
  1039			    bch2_csum_type_is_encryption(op->crc.csum_type) ==
  1040			    bch2_csum_type_is_encryption(op->csum_type)) {
  1041				u8 compression_type = crc.compression_type;
  1042				u16 nonce = crc.nonce;
  1043				/*
  1044				 * Note: when we're using rechecksum(), we need to be
  1045				 * checksumming @src because it has all the data our
  1046				 * existing checksum covers - if we bounced (because we
  1047				 * were trying to compress), @dst will only have the
  1048				 * part of the data the new checksum will cover.
  1049				 *
  1050				 * But normally we want to be checksumming post bounce,
  1051				 * because part of the reason for bouncing is so the
  1052				 * data can't be modified (by userspace) while it's in
  1053				 * flight.
  1054				 */
  1055				if (bch2_rechecksum_bio(c, src, version, op->crc,
  1056						&crc, &op->crc,
  1057						src_len >> 9,
  1058						bio_sectors(src) - (src_len >> 9),
  1059						op->csum_type))
  1060					goto csum_err;
  1061				/*
  1062				 * rchecksum_bio sets compression_type on crc from op->crc,
  1063				 * this isn't always correct as sometimes we're changing
  1064				 * an extent from uncompressed to incompressible.
  1065				 */
  1066				crc.compression_type = compression_type;
  1067				crc.nonce = nonce;
  1068			} else {
  1069				if ((op->flags & BCH_WRITE_DATA_ENCODED) &&
  1070				    bch2_rechecksum_bio(c, src, version, op->crc,
  1071						NULL, &op->crc,
  1072						src_len >> 9,
  1073						bio_sectors(src) - (src_len >> 9),
  1074						op->crc.csum_type))
  1075					goto csum_err;
  1076	
  1077				crc.compressed_size	= dst_len >> 9;
  1078				crc.uncompressed_size	= src_len >> 9;
  1079				crc.live_size		= src_len >> 9;
  1080	
  1081				swap(dst->bi_iter.bi_size, dst_len);
  1082				ret = bch2_encrypt_bio(c, op->csum_type,
  1083						       extent_nonce(version, crc), dst);
  1084				if (ret)
  1085					goto err;
  1086	
  1087				crc.csum = bch2_checksum_bio(c, op->csum_type,
  1088						 extent_nonce(version, crc), dst);
  1089				crc.csum_type = op->csum_type;
  1090				swap(dst->bi_iter.bi_size, dst_len);
  1091			}
  1092	
  1093			init_append_extent(op, wp, version, crc);
  1094	
  1095			if (dst != src)
  1096				bio_advance(dst, dst_len);
  1097			bio_advance(src, src_len);
  1098			total_output	+= dst_len;
  1099			total_input	+= src_len;
  1100		} while (dst->bi_iter.bi_size &&
  1101			 src->bi_iter.bi_size &&
  1102			 wp->sectors_free &&
  1103			 !bch2_keylist_realloc(&op->insert_keys,
  1104					      op->inline_keys,
  1105					      ARRAY_SIZE(op->inline_keys),
  1106					      BKEY_EXTENT_U64s_MAX));
  1107	
  1108		more = src->bi_iter.bi_size != 0;
  1109	
  1110		dst->bi_iter = saved_iter;
  1111	
  1112		if (dst == src && more) {
  1113			BUG_ON(total_output != total_input);
  1114	
  1115			dst = bio_split(src, total_input >> 9,
  1116					GFP_NOFS, &c->bio_write);
  1117			wbio_init(dst)->put_bio	= true;
  1118			/* copy WRITE_SYNC flag */
  1119			dst->bi_opf		= src->bi_opf;
  1120		}
  1121	
  1122		dst->bi_iter.bi_size = total_output;
  1123	do_write:
  1124		*_dst = dst;
  1125		return more;
  1126	csum_err:
> 1127		struct printbuf buf = PRINTBUF;
> 1128		bch2_write_op_error(&buf, op);
  1129		prt_printf(&buf, "error verifying existing checksum while rewriting existing data (memory corruption?)");
  1130		bch_err_ratelimited(c, "%s", buf.buf);
  1131		printbuf_exit(&buf);
  1132	
  1133		ret = -EIO;
  1134	err:
  1135		if (to_wbio(dst)->bounce)
  1136			bch2_bio_free_pages_pool(c, dst);
  1137		if (to_wbio(dst)->put_bio)
  1138			bio_put(dst);
  1139	
  1140		return ret;
  1141	}
  1142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
