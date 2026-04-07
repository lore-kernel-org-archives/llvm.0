Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F73750BC;
	Tue,  7 Apr 2026 03:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534069; cv=none; b=Ihwi3ZEdXJPaGZaW9nvrI/8gxlxu8eQ/NCKaQnFBBgo26f65441IPDakSCeuvb4y4tH422dDMZRXpSNkaq31ISOIIxiNXr2DDp1IYyQEQWeLAum8ecA9WG15KX4uGJPHbJw3CJFYg2DhpnA1lQ91zh+o34R9Hi6Yw6Fpn4f90AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534069; c=relaxed/simple;
	bh=H/HZ1EX+Ot7vOWn4BbcSvCzJwKyy+Bhg+3NT492hkIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uuWOMCjXikQdW+YB9EdGNKfMlLQt9j5Ty4Hd+EHnYICUEtZr2MOvvB1EuI+q7W1thfD+jCMt2xipFrSTj5PgLnbFEE9eQp3zgUt73eblFk2+HHByDlCqY0PUd87MdFZsyd0qR5qaax5C/q7tOqy8E0bL47/KtB8HW0LlJYusMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+KRPkTA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+KRPkTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534068; x=1807070068;
  h=date:from:to:cc:subject:message-id;
  bh=H/HZ1EX+Ot7vOWn4BbcSvCzJwKyy+Bhg+3NT492hkIk=;
  b=m+KRPkTACwTcmFzPCWd0+jhdM9Unv8oDx/N7WiJgsaLF85r8cveRpBm3
   HBhwlu26Ib99FBOuNQ0QHUxd4N7u31qGUXxFS5aZtfkAhVHdCGdkY4jJC
   n82BxOfGBqbK42cCpSxbsS8eeUYAmvHXWmcgucjl8EFAZgDzWLfGIIs5O
   4b+UIVRA8aK8Hvx/qyLVhj/OBwVF1Ia02k3e3468VipYWNrMoZDhVzn9S
   LRLqX+X28gzYNvmECBNUda521rgVc7ae+gYdvYSyyNgWR+Cb9i554vqrA
   wXGmfM04y0EHY/nSctvQOcGh0lnnDKA0qXi+KrinWjLalh/IHDoEUAdsg
   g==;
X-CSE-ConnectionGUID: qW4RoJ0ES5ys2/zFkMJu2g==
X-CSE-MsgGUID: XGrjsKoHTuWKXoJrPU+GRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80080775"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80080775"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:27 -0700
X-CSE-ConnectionGUID: zmU6SGvRRcefyn6LyuH36g==
X-CSE-MsgGUID: P7MjfjUMS1uOWVI/5icbLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227994786"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:54:25 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-00000000040-0YNK;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 36/36]
 fs/bcachefs/init/dev.c:978:5: warning: stack frame size (1040) exceeds limit
 (1024) in 'bch2_dev_add'
Message-ID: <202604041202.bKcXxzJY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   58bb946d535130188a8558ac82889d1daa2ad56b
commit: 58bb946d535130188a8558ac82889d1daa2ad56b [36/36] bcachefs: record device serial number in superblock
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260404/202604041202.bKcXxzJY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041202.bKcXxzJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041202.bKcXxzJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/init/dev.c:978:5: warning: stack frame size (1040) exceeds limit (1024) in 'bch2_dev_add' [-Wframe-larger-than]
     978 | int bch2_dev_add(struct bch_fs *c, const char *path, struct printbuf *err)
         |     ^
   1 warning generated.


vim +/bch2_dev_add +978 fs/bcachefs/init/dev.c

bf25974be5b42c Kent Overstreet 2025-10-04   976  
bf25974be5b42c Kent Overstreet 2025-10-04   977  /* Add new device to running filesystem: */
bf25974be5b42c Kent Overstreet 2025-10-04  @978  int bch2_dev_add(struct bch_fs *c, const char *path, struct printbuf *err)
bf25974be5b42c Kent Overstreet 2025-10-04   979  {
bf25974be5b42c Kent Overstreet 2025-10-04   980  	int ret = 0;
bf25974be5b42c Kent Overstreet 2025-10-04   981  
f5a0454134f4f4 Kent Overstreet 2026-01-07   982  	struct bch_opts opts = bch2_opts_empty();
f5a0454134f4f4 Kent Overstreet 2026-01-07   983  	struct bch_sb_handle sb __cleanup(bch2_free_super) = {};
bf25974be5b42c Kent Overstreet 2025-10-04   984  	ret = bch2_read_super(path, &opts, &sb);
bf25974be5b42c Kent Overstreet 2025-10-04   985  	if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04   986  		prt_printf(err, "error reading superblock: %s\n", bch2_err_str(ret));
f5a0454134f4f4 Kent Overstreet 2026-01-07   987  		return ret;
bf25974be5b42c Kent Overstreet 2025-10-04   988  	}
bf25974be5b42c Kent Overstreet 2025-10-04   989  
bf25974be5b42c Kent Overstreet 2025-10-04   990  	struct bch_member dev_mi = bch2_sb_member_get(sb.sb, sb.sb->dev_idx);
bf25974be5b42c Kent Overstreet 2025-10-04   991  
f5a0454134f4f4 Kent Overstreet 2026-01-07   992  	CLASS(printbuf, label)();
bf25974be5b42c Kent Overstreet 2025-10-04   993  	if (BCH_MEMBER_GROUP(&dev_mi)) {
bf25974be5b42c Kent Overstreet 2025-10-04   994  		bch2_disk_path_to_text_sb(&label, sb.sb, BCH_MEMBER_GROUP(&dev_mi) - 1);
f5a0454134f4f4 Kent Overstreet 2026-01-07   995  		if (label.allocation_failure)
f5a0454134f4f4 Kent Overstreet 2026-01-07   996  			return -ENOMEM;
bf25974be5b42c Kent Overstreet 2025-10-04   997  	}
bf25974be5b42c Kent Overstreet 2025-10-04   998  
bf25974be5b42c Kent Overstreet 2025-10-04   999  	if (list_empty(&c->list)) {
bf25974be5b42c Kent Overstreet 2025-10-04  1000  		scoped_guard(mutex, &bch2_fs_list_lock) {
bf25974be5b42c Kent Overstreet 2025-10-04  1001  			if (__bch2_uuid_to_fs(c->sb.uuid))
bf25974be5b42c Kent Overstreet 2025-10-04  1002  				ret = bch_err_throw(c, filesystem_uuid_already_open);
bf25974be5b42c Kent Overstreet 2025-10-04  1003  			else
bf25974be5b42c Kent Overstreet 2025-10-04  1004  				list_add(&c->list, &bch2_fs_list);
bf25974be5b42c Kent Overstreet 2025-10-04  1005  		}
bf25974be5b42c Kent Overstreet 2025-10-04  1006  
bf25974be5b42c Kent Overstreet 2025-10-04  1007  		if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  1008  			prt_printf(err, "cannot go multidevice: filesystem UUID already open\n");
f5a0454134f4f4 Kent Overstreet 2026-01-07  1009  			return ret;
bf25974be5b42c Kent Overstreet 2025-10-04  1010  		}
bf25974be5b42c Kent Overstreet 2025-10-04  1011  	}
bf25974be5b42c Kent Overstreet 2025-10-04  1012  
f5a0454134f4f4 Kent Overstreet 2026-01-07  1013  	try(bch2_dev_may_add(sb.sb, c));
bf25974be5b42c Kent Overstreet 2025-10-04  1014  
f5a0454134f4f4 Kent Overstreet 2026-01-07  1015  	struct bch_dev *ca = __bch2_dev_alloc(c, &dev_mi);
f5a0454134f4f4 Kent Overstreet 2026-01-07  1016  	if (!ca)
f5a0454134f4f4 Kent Overstreet 2026-01-07  1017  		return -ENOMEM;
bf25974be5b42c Kent Overstreet 2025-10-04  1018  
2d5b91710aa7ad Kent Overstreet 2025-11-10  1019  	ret = __bch2_dev_attach_bdev(c, ca, &sb, err);
bf25974be5b42c Kent Overstreet 2025-10-04  1020  	if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  1021  		goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  1022  
b5bc9e176a2cdf Kent Overstreet 2025-11-13  1023  	struct reconcile_scan s = { .type = RECONCILE_SCAN_pending };
463dd674455875 Kent Overstreet 2025-10-27  1024  	if (test_bit(BCH_FS_started, &c->flags)) {
463dd674455875 Kent Overstreet 2025-10-27  1025  		/*
463dd674455875 Kent Overstreet 2025-10-27  1026  		 * Technically incorrect, but 'bcachefs image update' is the
463dd674455875 Kent Overstreet 2025-10-27  1027  		 * only thing that adds a device to a not-started filesystem:
463dd674455875 Kent Overstreet 2025-10-27  1028  		 */
581f7e27bc9728 Kent Overstreet 2025-11-12  1029  		try(bch2_set_reconcile_needs_scan(c, s, false));
463dd674455875 Kent Overstreet 2025-10-27  1030  	}
463dd674455875 Kent Overstreet 2025-10-27  1031  
bf25974be5b42c Kent Overstreet 2025-10-04  1032  	scoped_guard(rwsem_write, &c->state_lock) {
84968c2bb32fef Kent Overstreet 2026-01-07  1033  		scoped_guard(memalloc_flags, PF_MEMALLOC_NOFS) {
84968c2bb32fef Kent Overstreet 2026-01-07  1034  			guard(mutex)(&c->sb_lock);
bf25974be5b42c Kent Overstreet 2025-10-04  1035  			SET_BCH_SB_MULTI_DEVICE(c->disk_sb.sb, true);
bf25974be5b42c Kent Overstreet 2025-10-04  1036  
bf25974be5b42c Kent Overstreet 2025-10-04  1037  			ret = bch2_sb_from_fs(c, ca);
bf25974be5b42c Kent Overstreet 2025-10-04  1038  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  1039  				prt_printf(err, "error setting up new superblock: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  1040  				goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  1041  			}
bf25974be5b42c Kent Overstreet 2025-10-04  1042  
bf25974be5b42c Kent Overstreet 2025-10-04  1043  			if (dynamic_fault("bcachefs:add:no_slot"))
bf25974be5b42c Kent Overstreet 2025-10-04  1044  				goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  1045  
bf25974be5b42c Kent Overstreet 2025-10-04  1046  			ret = bch2_sb_member_alloc(c);
bf25974be5b42c Kent Overstreet 2025-10-04  1047  			if (ret < 0) {
bf25974be5b42c Kent Overstreet 2025-10-04  1048  				prt_printf(err, "error allocating superblock member slot: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  1049  				goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  1050  			}
bf25974be5b42c Kent Overstreet 2025-10-04  1051  			unsigned dev_idx = ret;
bf25974be5b42c Kent Overstreet 2025-10-04  1052  			ret = 0;
bf25974be5b42c Kent Overstreet 2025-10-04  1053  
bf25974be5b42c Kent Overstreet 2025-10-04  1054  			/* success: */
bf25974be5b42c Kent Overstreet 2025-10-04  1055  
bf25974be5b42c Kent Overstreet 2025-10-04  1056  			dev_mi.last_mount = cpu_to_le64(ktime_get_real_seconds());
bf25974be5b42c Kent Overstreet 2025-10-04  1057  			*bch2_members_v2_get_mut(c->disk_sb.sb, dev_idx) = dev_mi;
bf25974be5b42c Kent Overstreet 2025-10-04  1058  
bf25974be5b42c Kent Overstreet 2025-10-04  1059  			ca->disk_sb.sb->dev_idx	= dev_idx;
bf25974be5b42c Kent Overstreet 2025-10-04  1060  			bch2_dev_attach(c, ca, dev_idx);
bf25974be5b42c Kent Overstreet 2025-10-04  1061  
f08ffce1e114f9 Kent Overstreet 2025-11-29  1062  			set_bit(ca->dev_idx, c->devs_online.d);
bf25974be5b42c Kent Overstreet 2025-10-04  1063  
bf25974be5b42c Kent Overstreet 2025-10-04  1064  			if (BCH_MEMBER_GROUP(&dev_mi)) {
bf25974be5b42c Kent Overstreet 2025-10-04  1065  				ret = __bch2_dev_group_set(c, ca, label.buf);
bf25974be5b42c Kent Overstreet 2025-10-04  1066  				prt_printf(err, "error creating new label: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  1067  				if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  1068  					goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  1069  			}
bf25974be5b42c Kent Overstreet 2025-10-04  1070  
e12a4b5e98b5a2 Kent Overstreet 2025-11-26  1071  
e12a4b5e98b5a2 Kent Overstreet 2025-11-26  1072  			bool write_sb = false;
e12a4b5e98b5a2 Kent Overstreet 2025-11-26  1073  			__bch2_dev_mi_field_upgrades(c, ca, &write_sb);
e12a4b5e98b5a2 Kent Overstreet 2025-11-26  1074  
bf25974be5b42c Kent Overstreet 2025-10-04  1075  			bch2_write_super(c);
bf25974be5b42c Kent Overstreet 2025-10-04  1076  		}
bf25974be5b42c Kent Overstreet 2025-10-04  1077  
bf25974be5b42c Kent Overstreet 2025-10-04  1078  		ret = bch2_dev_usage_init(ca, false);
bf25974be5b42c Kent Overstreet 2025-10-04  1079  		if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  1080  			goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  1081  
bf25974be5b42c Kent Overstreet 2025-10-04  1082  		if (test_bit(BCH_FS_started, &c->flags)) {
bf25974be5b42c Kent Overstreet 2025-10-04  1083  			ret = bch2_trans_mark_dev_sb(c, ca, BTREE_TRIGGER_transactional);
bf25974be5b42c Kent Overstreet 2025-10-04  1084  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  1085  				prt_printf(err, "error marking new superblock: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  1086  				goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  1087  			}
bf25974be5b42c Kent Overstreet 2025-10-04  1088  
bf25974be5b42c Kent Overstreet 2025-10-04  1089  			ret = bch2_fs_freespace_init(c);
bf25974be5b42c Kent Overstreet 2025-10-04  1090  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  1091  				prt_printf(err, "error initializing free space: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  1092  				goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  1093  			}
bf25974be5b42c Kent Overstreet 2025-10-04  1094  
bf25974be5b42c Kent Overstreet 2025-10-04  1095  			if (ca->mi.state == BCH_MEMBER_STATE_rw)
bf25974be5b42c Kent Overstreet 2025-10-04  1096  				__bch2_dev_read_write(c, ca);
bf25974be5b42c Kent Overstreet 2025-10-04  1097  
bf25974be5b42c Kent Overstreet 2025-10-04  1098  			ret = bch2_dev_journal_alloc(ca, false);
bf25974be5b42c Kent Overstreet 2025-10-04  1099  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  1100  				prt_printf(err, "error allocating journal: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  1101  				goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  1102  			}
bf25974be5b42c Kent Overstreet 2025-10-04  1103  		}
bf25974be5b42c Kent Overstreet 2025-10-04  1104  
bf25974be5b42c Kent Overstreet 2025-10-04  1105  		/*
bf25974be5b42c Kent Overstreet 2025-10-04  1106  		 * We just changed the superblock UUID, invalidate cache and send a
bf25974be5b42c Kent Overstreet 2025-10-04  1107  		 * uevent to update /dev/disk/by-uuid
bf25974be5b42c Kent Overstreet 2025-10-04  1108  		 */
bf25974be5b42c Kent Overstreet 2025-10-04  1109  		invalidate_bdev(ca->disk_sb.bdev);
bf25974be5b42c Kent Overstreet 2025-10-04  1110  
bf25974be5b42c Kent Overstreet 2025-10-04  1111  		char uuid_str[37];
bf25974be5b42c Kent Overstreet 2025-10-04  1112  		snprintf(uuid_str, sizeof(uuid_str), "UUID=%pUb", &c->sb.uuid);
bf25974be5b42c Kent Overstreet 2025-10-04  1113  
bf25974be5b42c Kent Overstreet 2025-10-04  1114  		char *envp[] = {
bf25974be5b42c Kent Overstreet 2025-10-04  1115  			"CHANGE=uuid",
bf25974be5b42c Kent Overstreet 2025-10-04  1116  			uuid_str,
bf25974be5b42c Kent Overstreet 2025-10-04  1117  			NULL,
bf25974be5b42c Kent Overstreet 2025-10-04  1118  		};
bf25974be5b42c Kent Overstreet 2025-10-04  1119  		kobject_uevent_env(&ca->disk_sb.bdev->bd_device.kobj, KOBJ_CHANGE, envp);
bf25974be5b42c Kent Overstreet 2025-10-04  1120  	}
463dd674455875 Kent Overstreet 2025-10-27  1121  
463dd674455875 Kent Overstreet 2025-10-27  1122  	if (test_bit(BCH_FS_started, &c->flags))
581f7e27bc9728 Kent Overstreet 2025-11-12  1123  		try(bch2_set_reconcile_needs_scan(c, s, true));
bf25974be5b42c Kent Overstreet 2025-10-04  1124  out:
bf25974be5b42c Kent Overstreet 2025-10-04  1125  	bch_err_fn(c, ret);
bf25974be5b42c Kent Overstreet 2025-10-04  1126  	return ret;
bf25974be5b42c Kent Overstreet 2025-10-04  1127  err:
bf25974be5b42c Kent Overstreet 2025-10-04  1128  	if (ca)
bf25974be5b42c Kent Overstreet 2025-10-04  1129  		bch2_dev_free(ca);
bf25974be5b42c Kent Overstreet 2025-10-04  1130  	goto out;
bf25974be5b42c Kent Overstreet 2025-10-04  1131  err_late:
bf25974be5b42c Kent Overstreet 2025-10-04  1132  	ca = NULL;
bf25974be5b42c Kent Overstreet 2025-10-04  1133  	goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  1134  }
bf25974be5b42c Kent Overstreet 2025-10-04  1135  

:::::: The code at line 978 was first introduced by commit
:::::: bf25974be5b42c0341a7f17cb7e6e835d80b41e6 bcachefs: split out init/dev.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
