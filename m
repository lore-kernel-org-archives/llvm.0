Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54884D02;
	Sat, 19 Apr 2025 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745025699; cv=none; b=kTW4mTRn0NXAo3DiFDivwG7NfTCZXzf7ettwyM9Nlqc275t4QKLujdbEMpXUkyiYoeqDmMPh8ABjYisEOckpE9pEQbZ8ZpP7GPHKXfnKAZff6Tv/EjEs6tc8ls9tkjjjx1ITFsYS9msRnETbYi5A01DLC40qAhSYUopcRs/gzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745025699; c=relaxed/simple;
	bh=cyAGdUcUXeL8GReA2AqsYpo+qSR5XfDMbU3F29jmW5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0mvjC3byEeGYlIyV3qT/doPrPL6kW5jFSoGHynJG1VDaqfYTXqZ5EzqqnQmq2o+TS6lx4xcq2IDsBafwiCd26UhuGP3yY+sNEX6ACWls1+zW+V4kZfyyK4em9OtxyLtDgholBXvDwpmg+yZSAtByqhuWDdR2OD9mc4jc8tx4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixeyd5cH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixeyd5cH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745025697; x=1776561697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyAGdUcUXeL8GReA2AqsYpo+qSR5XfDMbU3F29jmW5U=;
  b=ixeyd5cHHGpyM5p4F3Uzvu38zjr/H5cwfg9uUDhW9iwhbjYqrAvPUVHx
   lqRlQOiUx7+1LNqBauMfZEgMJ127TCO40JRINXE/orWbSi+cFa4reYLkR
   KnYnU0GKacLRiKVJ+xqwtEv9Y+zvRI6EHRQlhM9hmTI3jw7DMzzUu3mMg
   DXX3VVz4bVzDIqbdUNLnbr7BV0etTs53yP6hPe/dTCZUM3XqTWLepiMaJ
   uJjY7CUOf1PHvqe0rEUbB+seregHtp03bysdevaFRj8ppNDnNZinS3J0B
   6BPJoa1Srjj+kS6hC3htISF7Ns9WXw5Jyv3zvOYyP0ZV7zWKh9n1IwJOP
   w==;
X-CSE-ConnectionGUID: oy0MdsOnSrmoUiGbVwpMXQ==
X-CSE-MsgGUID: wYC/jyy3T/+pGQvZmnJ+Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="72047326"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="72047326"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 18:21:36 -0700
X-CSE-ConnectionGUID: JnU356ykSg2rabWehrVfxA==
X-CSE-MsgGUID: S372TFgbSNOxn5skT17v9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="131820551"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Apr 2025 18:21:33 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5wtf-0003UT-0t;
	Sat, 19 Apr 2025 01:21:31 +0000
Date: Sat, 19 Apr 2025 09:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Tinguely <mark.tinguely@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [akpm-mm:mm-nonmm-unstable 66/67] fs/ocfs2/aops.c:1133:17: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202504190950.rq1NDlDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   d1a9b961293d30be9a865d8685590635db282957
commit: 89e3e963129e945e0333e474709bde627b6a9cee [66/67] ocfs2: fix panic in failed foilio allocation
config: s390-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190950.rq1NDlDz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ocfs2/aops.c:1133:17: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1133 |                         wc->w_folios[i] = NULL;
         |                                      ^
   fs/ocfs2/aops.c:1101:12: note: initialize the variable 'i' to silence this warning
    1101 |         int ret, i;
         |                   ^
         |                    = 0
   1 warning generated.


vim +/i +1133 fs/ocfs2/aops.c

  1088	
  1089	/*
  1090	 * Prepare a single cluster for write one cluster into the file.
  1091	 */
  1092	static int ocfs2_write_cluster(struct address_space *mapping,
  1093				       u32 *phys, unsigned int new,
  1094				       unsigned int clear_unwritten,
  1095				       unsigned int should_zero,
  1096				       struct ocfs2_alloc_context *data_ac,
  1097				       struct ocfs2_alloc_context *meta_ac,
  1098				       struct ocfs2_write_ctxt *wc, u32 cpos,
  1099				       loff_t user_pos, unsigned user_len)
  1100	{
  1101		int ret, i;
  1102		u64 p_blkno;
  1103		struct inode *inode = mapping->host;
  1104		struct ocfs2_extent_tree et;
  1105		int bpc = ocfs2_clusters_to_blocks(inode->i_sb, 1);
  1106	
  1107		if (new) {
  1108			u32 tmp_pos;
  1109	
  1110			/*
  1111			 * This is safe to call with the page locks - it won't take
  1112			 * any additional semaphores or cluster locks.
  1113			 */
  1114			tmp_pos = cpos;
  1115			ret = ocfs2_add_inode_data(OCFS2_SB(inode->i_sb), inode,
  1116						   &tmp_pos, 1, !clear_unwritten,
  1117						   wc->w_di_bh, wc->w_handle,
  1118						   data_ac, meta_ac, NULL);
  1119			/*
  1120			 * This shouldn't happen because we must have already
  1121			 * calculated the correct meta data allocation required. The
  1122			 * internal tree allocation code should know how to increase
  1123			 * transaction credits itself.
  1124			 *
  1125			 * If need be, we could handle -EAGAIN for a
  1126			 * RESTART_TRANS here.
  1127			 */
  1128			mlog_bug_on_msg(ret == -EAGAIN,
  1129					"Inode %llu: EAGAIN return during allocation.\n",
  1130					(unsigned long long)OCFS2_I(inode)->ip_blkno);
  1131			if (ret < 0) {
  1132				mlog_errno(ret);
> 1133				wc->w_folios[i] = NULL;
  1134				goto out;
  1135			}
  1136		} else if (clear_unwritten) {
  1137			ocfs2_init_dinode_extent_tree(&et, INODE_CACHE(inode),
  1138						      wc->w_di_bh);
  1139			ret = ocfs2_mark_extent_written(inode, &et,
  1140							wc->w_handle, cpos, 1, *phys,
  1141							meta_ac, &wc->w_dealloc);
  1142			if (ret < 0) {
  1143				mlog_errno(ret);
  1144				goto out;
  1145			}
  1146		}
  1147	
  1148		/*
  1149		 * The only reason this should fail is due to an inability to
  1150		 * find the extent added.
  1151		 */
  1152		ret = ocfs2_get_clusters(inode, cpos, phys, NULL, NULL);
  1153		if (ret < 0) {
  1154			mlog(ML_ERROR, "Get physical blkno failed for inode %llu, "
  1155				    "at logical cluster %u",
  1156				    (unsigned long long)OCFS2_I(inode)->ip_blkno, cpos);
  1157			goto out;
  1158		}
  1159	
  1160		BUG_ON(*phys == 0);
  1161	
  1162		p_blkno = ocfs2_clusters_to_blocks(inode->i_sb, *phys);
  1163		if (!should_zero)
  1164			p_blkno += (user_pos >> inode->i_sb->s_blocksize_bits) & (u64)(bpc - 1);
  1165	
  1166		for (i = 0; i < wc->w_num_folios; i++) {
  1167			int tmpret;
  1168	
  1169			/* This is the direct io target page. */
  1170			if (wc->w_folios[i] == NULL) {
  1171				p_blkno += (1 << (PAGE_SHIFT - inode->i_sb->s_blocksize_bits));
  1172				continue;
  1173			}
  1174	
  1175			tmpret = ocfs2_prepare_folio_for_write(inode, &p_blkno, wc,
  1176					wc->w_folios[i], cpos, user_pos, user_len,
  1177					should_zero);
  1178			if (tmpret) {
  1179				mlog_errno(tmpret);
  1180				if (ret == 0)
  1181					ret = tmpret;
  1182			}
  1183		}
  1184	
  1185		/*
  1186		 * We only have cleanup to do in case of allocating write.
  1187		 */
  1188		if (ret && new)
  1189			ocfs2_write_failure(inode, wc, user_pos, user_len);
  1190	
  1191	out:
  1192	
  1193		return ret;
  1194	}
  1195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
