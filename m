Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536EC1BDC3;
	Mon, 26 Feb 2024 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708931845; cv=none; b=CRYU8e48ufnE3N9f4RQ7/suOAA5wCKEMIJZn3RpkSSpvPgJHGpGzlTd5lzlwKc71t2xHQ5Q2//kWLei4VrlZmX+is1rRMRCA2Ow7fHZeFwerW6NwCx5n5nNwvYFItp0hm5tvSoRxW7vCNK9+TBmKrvpNwcQdoEG9aK0pg6Ygq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708931845; c=relaxed/simple;
	bh=TZE1FFNQriJ03qOf9be66xIgCd0D9Q17IZRC8LNo3oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNzu8CO6GC6tvTYvruNz6Sgtyl8fPs/sRu2LIvDG1epDgPRkDYr16Q8r/Tc5yezKKQGFZ99jiJyMVGCtVQ5OW4EEgz6lJyADzwfvPvngpZhR+e0N1Xfgk4+iR6xsDelpgbK5hcTpv6+CGN/kSs8aCDJV8KnCX5hMBvxUi5+LCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+rLAp5J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+rLAp5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708931843; x=1740467843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZE1FFNQriJ03qOf9be66xIgCd0D9Q17IZRC8LNo3oc=;
  b=I+rLAp5J2nV7ui917/Q0pZiymWtrje7X4Obijdc6OFiFqiwpggjgEDXd
   mxlZtrhRNDygzKjxX30WsgIs8zSedUqUJuBZ1Ge3jS24KaJOtlNP4cgT8
   Og0Ut3fo9xIzwWT8OVXQuEjUhn/1Xw10IoImKX9uw71zOcUI2A4UclBDq
   /P6p1yvAP5oYsSRMHRCMyMK2FC3HGacFz/LZ+35uHnrpphRemgaB3DqKX
   0duMQLwTkKxv0BqAsVw9bKUyr2VmFXpwWOVlskM7yGHYwB1Xcy1cswP92
   7YY1dDtwMiMZYtWdCIZXKTeGM/32s6/MN5SI3XE20OpY6lwYLC0xtBI8I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3363762"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3363762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 23:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11214836"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Feb 2024 23:17:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reVEk-000A9T-0z;
	Mon, 26 Feb 2024 07:17:18 +0000
Date: Mon, 26 Feb 2024 15:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [rw-ubifs:next 19/33] fs/ubifs/find.c:86: warning: Function
 parameter or struct member 'arg' not described in 'scan_for_dirty_cb'
Message-ID: <202402261559.cYtMOkIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
head:   3ce485803da1b79b2692b6d0c2792829292ad838
commit: ec724e534dfdd592abc5ac066be77ef15c455ccc [19/33] ubifs: fix function pointer cast warnings
config: i386-buildonly-randconfig-001-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261559.cYtMOkIn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261559.cYtMOkIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261559.cYtMOkIn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/find.c:86: warning: Function parameter or struct member 'arg' not described in 'scan_for_dirty_cb'
>> fs/ubifs/find.c:86: warning: Excess function parameter 'data' description in 'scan_for_dirty_cb'
>> fs/ubifs/find.c:353: warning: Function parameter or struct member 'arg' not described in 'scan_for_free_cb'
>> fs/ubifs/find.c:353: warning: Excess function parameter 'data' description in 'scan_for_free_cb'
>> fs/ubifs/find.c:594: warning: Function parameter or struct member 'arg' not described in 'scan_for_idx_cb'
>> fs/ubifs/find.c:594: warning: Excess function parameter 'data' description in 'scan_for_idx_cb'
>> fs/ubifs/find.c:786: warning: Function parameter or struct member 'arg' not described in 'scan_dirty_idx_cb'
>> fs/ubifs/find.c:786: warning: Excess function parameter 'data' description in 'scan_dirty_idx_cb'
--
>> fs/ubifs/lprops.c:1018: warning: Function parameter or struct member 'arg' not described in 'scan_check_cb'
   fs/ubifs/lprops.c:1018: warning: Excess function parameter 'lst' description in 'scan_check_cb'


vim +86 fs/ubifs/find.c

1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   70  
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   71  /**
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   72   * scan_for_dirty_cb - dirty space scan callback.
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   73   * @c: the UBIFS file-system description object
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   74   * @lprops: LEB properties to scan
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   75   * @in_tree: whether the LEB properties are in main memory
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   76   * @data: information passed to and from the caller of the scan
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   77   *
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   78   * This function returns a code that indicates whether the scan should continue
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   79   * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   80   * in main memory (%LPT_SCAN_ADD), or whether the scan should stop
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   81   * (%LPT_SCAN_STOP).
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   82   */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   83  static int scan_for_dirty_cb(struct ubifs_info *c,
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   84  			     const struct ubifs_lprops *lprops, int in_tree,
ec724e534dfdd5 Arnd Bergmann    2024-02-13   85  			     void *arg)
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  @86  {
ec724e534dfdd5 Arnd Bergmann    2024-02-13   87  	struct scan_data *data = arg;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   88  	int ret = LPT_SCAN_CONTINUE;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   89  
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   90  	/* Exclude LEBs that are currently in use */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   91  	if (lprops->flags & LPROPS_TAKEN)
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   92  		return LPT_SCAN_CONTINUE;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   93  	/* Determine whether to add these LEB properties to the tree */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   94  	if (!in_tree && valuable(c, lprops))
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   95  		ret |= LPT_SCAN_ADD;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   96  	/* Exclude LEBs with too little space */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   97  	if (lprops->free + lprops->dirty < data->min_space)
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   98  		return ret;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   99  	/* If specified, exclude index LEBs */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  100  	if (data->exclude_index && lprops->flags & LPROPS_INDEX)
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  101  		return ret;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  102  	/* If specified, exclude empty or freeable LEBs */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  103  	if (lprops->free + lprops->dirty == c->leb_size) {
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  104  		if (!data->pick_free)
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  105  			return ret;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  106  	/* Exclude LEBs with too little dirty space (unless it is empty) */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  107  	} else if (lprops->dirty < c->dead_wm)
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  108  		return ret;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  109  	/* Finally we found space */
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  110  	data->lnum = lprops->lnum;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  111  	return LPT_SCAN_ADD | LPT_SCAN_STOP;
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  112  }
1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  113  

:::::: The code at line 86 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
