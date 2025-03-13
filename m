Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649E52E339B;
	Thu, 13 Mar 2025 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741839041; cv=none; b=FmyXidQxb+wDzKbBVix8UwZgyHhHFZE6PMP3TyOcgfLfr6KeSyTQ/cZYkqtKSuvNBB96H/Y+Qp79zLRlWgl429D3tdcEpYJMyWJ+oA9HDJcjF/ANoRnBbhUWSio3TOSeoeI88Tz9p9WSjILDQi1hWlrvujvFmvBC0fzeZf3UtNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741839041; c=relaxed/simple;
	bh=olwTIRIbOTV2ooxJo2TCIaH4VcpGS+YCcl5HRNEd1jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYEo4S+ghhK4FvZaGJRhke82y7qxNLXa9ATMv02FRZiCer33PLar+SF59m3KhXn6lLbxdmHszafxeBUMQXVeTuUMvWHZ51M8NtCbRT/Li33K950xST2E2kIV/06xlotxUGyE9MTB/wJKrPtDhI+Xr6MCKd31Eiy0Sr4EmIDJxmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLBBW2M/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLBBW2M/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741839039; x=1773375039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=olwTIRIbOTV2ooxJo2TCIaH4VcpGS+YCcl5HRNEd1jY=;
  b=TLBBW2M/ZDEMX9prPuOeOmM6wSA8exk5gF2u7zVORHmuCs/C+dnXEb25
   zRe8Xlje1pERbyOKHQ74N0Gf5U/TPUtneYGiNc1g6AmVXRZcssK04baaY
   lr2MijQaX82BJ9G31NtoX61wNQvDzDPP/R921DoCK7VYWRiq+Dm+QHsHB
   yAOKWL6eDypVrl/yHUZmkV9hMGp24PMhiaUSftjm7UJJ+0LxnQ2g+WVYJ
   E28J5akvQgHavVJU8WoFAffmO8ZykbL5bIbgJAZpSDjzFr24A6p2uG9oN
   eiG0bAnjBVRfIa20hNfxWSU6AgGbmA6OwRYE0J/RRaSrBFI+R8lWAbWTJ
   A==;
X-CSE-ConnectionGUID: IJnujcDdQt2wpyxX4vDG4A==
X-CSE-MsgGUID: K/scKYPpSf2SWUKogA636A==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43073717"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43073717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 21:10:39 -0700
X-CSE-ConnectionGUID: ++jONdwJT0egXUrFZDYDjQ==
X-CSE-MsgGUID: WpelIrrKSVis7iDl2kGwag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121326279"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2025 21:10:37 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsZty-00096y-2G;
	Thu, 13 Mar 2025 04:10:34 +0000
Date: Thu, 13 Mar 2025 12:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 136/139]
 fs/bcachefs/io_read.c:1240:6: warning: variable 'u' is uninitialized when
 used here
Message-ID: <202503131242.QPYpneza-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   25ce7511b762c1ba686ec718e0a27f23827f13f9
commit: 33db4ed37494abc928db09701d425cb6e9241b57 [136/139] bcachefs: BCH_READ_data_update -> bch_read_bio.data_update
config: i386-buildonly-randconfig-005-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131242.QPYpneza-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131242.QPYpneza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131242.QPYpneza-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/io_read.c:1240:6: warning: variable 'u' is uninitialized when used here [-Wuninitialized]
    1240 |         if (u)
         |             ^
   fs/bcachefs/io_read.c:999:2: note: variable 'u' is declared here
     999 |         struct data_update *u = rbio_data_update(orig);
         |         ^
   1 warning generated.


vim +/u +1240 fs/bcachefs/io_read.c

   924	
   925	int __bch2_read_extent(struct btree_trans *trans, struct bch_read_bio *orig,
   926			       struct bvec_iter iter, struct bpos read_pos,
   927			       enum btree_id data_btree, struct bkey_s_c k,
   928			       unsigned offset_into_extent,
   929			       struct bch_io_failures *failed, unsigned flags, int dev)
   930	{
   931		struct bch_fs *c = trans->c;
   932		struct extent_ptr_decoded pick;
   933		struct bch_read_bio *rbio = NULL;
   934		bool bounce = false, read_full = false, narrow_crcs = false;
   935		struct bpos data_pos = bkey_start_pos(k.k);
   936		int ret = 0;
   937	
   938		if (bkey_extent_is_inline_data(k.k)) {
   939			unsigned bytes = min_t(unsigned, iter.bi_size,
   940					       bkey_inline_data_bytes(k.k));
   941	
   942			swap(iter.bi_size, bytes);
   943			memcpy_to_bio(&orig->bio, iter, bkey_inline_data_p(k));
   944			swap(iter.bi_size, bytes);
   945			bio_advance_iter(&orig->bio, &iter, bytes);
   946			zero_fill_bio_iter(&orig->bio, iter);
   947			this_cpu_add(c->counters[BCH_COUNTER_io_read_inline],
   948				     bvec_iter_sectors(iter));
   949			goto out_read_done;
   950		}
   951	retry_pick:
   952		ret = bch2_bkey_pick_read_device(c, k, failed, &pick, dev);
   953	
   954		/* hole or reservation - just zero fill: */
   955		if (!ret)
   956			goto hole;
   957	
   958		if (unlikely(ret < 0)) {
   959			struct printbuf buf = PRINTBUF;
   960			bch2_read_err_msg_trans(trans, &buf, orig, read_pos);
   961			prt_printf(&buf, "%s\n  ", bch2_err_str(ret));
   962			bch2_bkey_val_to_text(&buf, c, k);
   963	
   964			bch_err_ratelimited(c, "%s", buf.buf);
   965			printbuf_exit(&buf);
   966			goto err;
   967		}
   968	
   969		if (unlikely(bch2_csum_type_is_encryption(pick.crc.csum_type)) && !c->chacha20) {
   970			struct printbuf buf = PRINTBUF;
   971			bch2_read_err_msg_trans(trans, &buf, orig, read_pos);
   972			prt_printf(&buf, "attempting to read encrypted data without encryption key\n  ");
   973			bch2_bkey_val_to_text(&buf, c, k);
   974	
   975			bch_err_ratelimited(c, "%s", buf.buf);
   976			printbuf_exit(&buf);
   977			ret = -BCH_ERR_data_read_no_encryption_key;
   978			goto err;
   979		}
   980	
   981		struct bch_dev *ca = bch2_dev_get_ioref(c, pick.ptr.dev, READ);
   982	
   983		/*
   984		 * Stale dirty pointers are treated as IO errors, but @failed isn't
   985		 * allocated unless we're in the retry path - so if we're not in the
   986		 * retry path, don't check here, it'll be caught in bch2_read_endio()
   987		 * and we'll end up in the retry path:
   988		 */
   989		if ((flags & BCH_READ_in_retry) &&
   990		    !pick.ptr.cached &&
   991		    ca &&
   992		    unlikely(dev_ptr_stale(ca, &pick.ptr))) {
   993			read_from_stale_dirty_pointer(trans, ca, k, pick.ptr);
   994			bch2_mark_io_failure(failed, &pick, false);
   995			percpu_ref_put(&ca->io_ref);
   996			goto retry_pick;
   997		}
   998	
   999		struct data_update *u = rbio_data_update(orig);
  1000		if (likely(!u)) {
  1001			if (!(flags & BCH_READ_last_fragment) ||
  1002			    bio_flagged(&orig->bio, BIO_CHAIN))
  1003				flags |= BCH_READ_must_clone;
  1004	
  1005			narrow_crcs = !(flags & BCH_READ_in_retry) &&
  1006				bch2_can_narrow_extent_crcs(k, pick.crc);
  1007	
  1008			if (narrow_crcs && (flags & BCH_READ_user_mapped))
  1009				flags |= BCH_READ_must_bounce;
  1010	
  1011			EBUG_ON(offset_into_extent + bvec_iter_sectors(iter) > k.k->size);
  1012	
  1013			if (crc_is_compressed(pick.crc) ||
  1014			    (pick.crc.csum_type != BCH_CSUM_none &&
  1015			     (bvec_iter_sectors(iter) != pick.crc.uncompressed_size ||
  1016			      (bch2_csum_type_is_encryption(pick.crc.csum_type) &&
  1017			       (flags & BCH_READ_user_mapped)) ||
  1018			      (flags & BCH_READ_must_bounce)))) {
  1019				read_full = true;
  1020				bounce = true;
  1021			}
  1022		} else {
  1023			/*
  1024			 * can happen if we retry, and the extent we were going to read
  1025			 * has been merged in the meantime:
  1026			 */
  1027			if (pick.crc.compressed_size > u->op.wbio.bio.bi_iter.bi_size) {
  1028				if (ca)
  1029					percpu_ref_put(&ca->io_ref);
  1030				rbio->ret = -BCH_ERR_data_read_buffer_too_small;
  1031				goto out_read_done;
  1032			}
  1033	
  1034			iter.bi_size	= pick.crc.compressed_size << 9;
  1035			read_full = true;
  1036		}
  1037	
  1038		if (orig->opts.promote_target || have_io_error(failed))
  1039			rbio = promote_alloc(trans, iter, k, &pick, flags, orig,
  1040					     &bounce, &read_full, failed);
  1041	
  1042		if (!read_full) {
  1043			EBUG_ON(crc_is_compressed(pick.crc));
  1044			EBUG_ON(pick.crc.csum_type &&
  1045				(bvec_iter_sectors(iter) != pick.crc.uncompressed_size ||
  1046				 bvec_iter_sectors(iter) != pick.crc.live_size ||
  1047				 pick.crc.offset ||
  1048				 offset_into_extent));
  1049	
  1050			data_pos.offset += offset_into_extent;
  1051			pick.ptr.offset += pick.crc.offset +
  1052				offset_into_extent;
  1053			offset_into_extent		= 0;
  1054			pick.crc.compressed_size	= bvec_iter_sectors(iter);
  1055			pick.crc.uncompressed_size	= bvec_iter_sectors(iter);
  1056			pick.crc.offset			= 0;
  1057			pick.crc.live_size		= bvec_iter_sectors(iter);
  1058		}
  1059	
  1060		if (rbio) {
  1061			/*
  1062			 * promote already allocated bounce rbio:
  1063			 * promote needs to allocate a bio big enough for uncompressing
  1064			 * data in the write path, but we're not going to use it all
  1065			 * here:
  1066			 */
  1067			EBUG_ON(rbio->bio.bi_iter.bi_size <
  1068			       pick.crc.compressed_size << 9);
  1069			rbio->bio.bi_iter.bi_size =
  1070				pick.crc.compressed_size << 9;
  1071		} else if (bounce) {
  1072			unsigned sectors = pick.crc.compressed_size;
  1073	
  1074			rbio = rbio_init_fragment(bio_alloc_bioset(NULL,
  1075							  DIV_ROUND_UP(sectors, PAGE_SECTORS),
  1076							  0,
  1077							  GFP_NOFS,
  1078							  &c->bio_read_split),
  1079					 orig);
  1080	
  1081			bch2_bio_alloc_pages_pool(c, &rbio->bio, sectors << 9);
  1082			rbio->bounce	= true;
  1083		} else if (flags & BCH_READ_must_clone) {
  1084			/*
  1085			 * Have to clone if there were any splits, due to error
  1086			 * reporting issues (if a split errored, and retrying didn't
  1087			 * work, when it reports the error to its parent (us) we don't
  1088			 * know if the error was from our bio, and we should retry, or
  1089			 * from the whole bio, in which case we don't want to retry and
  1090			 * lose the error)
  1091			 */
  1092			rbio = rbio_init_fragment(bio_alloc_clone(NULL, &orig->bio, GFP_NOFS,
  1093							 &c->bio_read_split),
  1094					 orig);
  1095			rbio->bio.bi_iter = iter;
  1096		} else {
  1097			rbio = orig;
  1098			rbio->bio.bi_iter = iter;
  1099			EBUG_ON(bio_flagged(&rbio->bio, BIO_CHAIN));
  1100		}
  1101	
  1102		EBUG_ON(bio_sectors(&rbio->bio) != pick.crc.compressed_size);
  1103	
  1104		rbio->submit_time	= local_clock();
  1105		if (!rbio->split)
  1106			rbio->end_io	= orig->bio.bi_end_io;
  1107		rbio->bvec_iter		= iter;
  1108		rbio->offset_into_extent= offset_into_extent;
  1109		rbio->flags		= flags;
  1110		rbio->have_ioref	= ca != NULL;
  1111		rbio->narrow_crcs	= narrow_crcs;
  1112		rbio->ret		= 0;
  1113		rbio->context		= 0;
  1114		rbio->pick		= pick;
  1115		rbio->subvol		= orig->subvol;
  1116		rbio->read_pos		= read_pos;
  1117		rbio->data_btree	= data_btree;
  1118		rbio->data_pos		= data_pos;
  1119		rbio->version		= k.k->bversion;
  1120		INIT_WORK(&rbio->work, NULL);
  1121	
  1122		rbio->bio.bi_opf	= orig->bio.bi_opf;
  1123		rbio->bio.bi_iter.bi_sector = pick.ptr.offset;
  1124		rbio->bio.bi_end_io	= bch2_read_endio;
  1125	
  1126		if (rbio->bounce)
  1127			trace_and_count(c, io_read_bounce, &rbio->bio);
  1128	
  1129		if (!u)
  1130			this_cpu_add(c->counters[BCH_COUNTER_io_read], bio_sectors(&rbio->bio));
  1131		else
  1132			this_cpu_add(c->counters[BCH_COUNTER_io_move_read], bio_sectors(&rbio->bio));
  1133		bch2_increment_clock(c, bio_sectors(&rbio->bio), READ);
  1134	
  1135		/*
  1136		 * If it's being moved internally, we don't want to flag it as a cache
  1137		 * hit:
  1138		 */
  1139		if (ca && pick.ptr.cached && !u)
  1140			bch2_bucket_io_time_reset(trans, pick.ptr.dev,
  1141				PTR_BUCKET_NR(ca, &pick.ptr), READ);
  1142	
  1143		if (!(flags & (BCH_READ_in_retry|BCH_READ_last_fragment))) {
  1144			bio_inc_remaining(&orig->bio);
  1145			trace_and_count(c, io_read_split, &orig->bio);
  1146		}
  1147	
  1148		/*
  1149		 * Unlock the iterator while the btree node's lock is still in
  1150		 * cache, before doing the IO:
  1151		 */
  1152		if (!(flags & BCH_READ_in_retry))
  1153			bch2_trans_unlock(trans);
  1154		else
  1155			bch2_trans_unlock_long(trans);
  1156	
  1157		if (likely(!rbio->pick.do_ec_reconstruct)) {
  1158			if (unlikely(!rbio->have_ioref)) {
  1159				struct printbuf buf = PRINTBUF;
  1160				bch2_read_err_msg_trans(trans, &buf, rbio, read_pos);
  1161				prt_printf(&buf, "no device to read from:\n  ");
  1162				bch2_bkey_val_to_text(&buf, c, k);
  1163	
  1164				bch_err_ratelimited(c, "%s", buf.buf);
  1165				printbuf_exit(&buf);
  1166	
  1167				bch2_rbio_error(rbio,
  1168						-BCH_ERR_data_read_retry_device_offline,
  1169						BLK_STS_IOERR);
  1170				goto out;
  1171			}
  1172	
  1173			this_cpu_add(ca->io_done->sectors[READ][BCH_DATA_user],
  1174				     bio_sectors(&rbio->bio));
  1175			bio_set_dev(&rbio->bio, ca->disk_sb.bdev);
  1176	
  1177			if (unlikely(c->opts.no_data_io)) {
  1178				if (likely(!(flags & BCH_READ_in_retry)))
  1179					bio_endio(&rbio->bio);
  1180			} else {
  1181				if (likely(!(flags & BCH_READ_in_retry)))
  1182					submit_bio(&rbio->bio);
  1183				else
  1184					submit_bio_wait(&rbio->bio);
  1185			}
  1186	
  1187			/*
  1188			 * We just submitted IO which may block, we expect relock fail
  1189			 * events and shouldn't count them:
  1190			 */
  1191			trans->notrace_relock_fail = true;
  1192		} else {
  1193			/* Attempting reconstruct read: */
  1194			if (bch2_ec_read_extent(trans, rbio, k)) {
  1195				bch2_rbio_error(rbio, -BCH_ERR_data_read_retry_ec_reconstruct_err,
  1196						BLK_STS_IOERR);
  1197				goto out;
  1198			}
  1199	
  1200			if (likely(!(flags & BCH_READ_in_retry)))
  1201				bio_endio(&rbio->bio);
  1202		}
  1203	out:
  1204		if (likely(!(flags & BCH_READ_in_retry))) {
  1205			return 0;
  1206		} else {
  1207			bch2_trans_unlock(trans);
  1208	
  1209			int ret;
  1210	
  1211			rbio->context = RBIO_CONTEXT_UNBOUND;
  1212			bch2_read_endio(&rbio->bio);
  1213	
  1214			ret = rbio->ret;
  1215			rbio = bch2_rbio_free(rbio);
  1216	
  1217			if (bch2_err_matches(ret, BCH_ERR_data_read_retry_avoid))
  1218				bch2_mark_io_failure(failed, &pick,
  1219						ret == -BCH_ERR_data_read_retry_csum_err);
  1220	
  1221			return ret;
  1222		}
  1223	
  1224	err:
  1225		if (flags & BCH_READ_in_retry)
  1226			return ret;
  1227	
  1228		orig->bio.bi_status	= BLK_STS_IOERR;
  1229		orig->ret		= ret;
  1230		goto out_read_done;
  1231	
  1232	hole:
  1233		this_cpu_add(c->counters[BCH_COUNTER_io_read_hole],
  1234			     bvec_iter_sectors(iter));
  1235		/*
  1236		 * won't normally happen in the data update (bch2_move_extent()) path,
  1237		 * but if we retry and the extent we wanted to read no longer exists we
  1238		 * have to signal that:
  1239		 */
> 1240		if (u)
  1241			orig->ret = -BCH_ERR_data_read_key_overwritten;
  1242	
  1243		zero_fill_bio_iter(&orig->bio, iter);
  1244	out_read_done:
  1245		if ((flags & BCH_READ_last_fragment) &&
  1246		    !(flags & BCH_READ_in_retry))
  1247			bch2_rbio_done(orig);
  1248		return 0;
  1249	}
  1250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
