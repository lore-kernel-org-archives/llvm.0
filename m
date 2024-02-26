Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFFD1CA87;
	Mon, 26 Feb 2024 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708935603; cv=none; b=SVo4R6BbJY+uCQf6P8hG2wR+5ymwgphHARSHUrAt4H5IEpxuayaq5TKTsxl5RvM5ZJArUnV5LWPooELWxYeUOlKT+918MNMUX/wSVrvEkpVXfNFg8XgAFfMkFRX1qMIWiwJn86cauLPyC9x60ZukgoQZR4pMtA8pz3Jjz92qa+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708935603; c=relaxed/simple;
	bh=x+F1sEyIkG6i836oJsC0oXwsTmD/G97DAVLmHq6er60=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jmPDGzkUq8KIZK/LSfGhILyrC/v6VaP4Fbt7MNpcU+XXcNEigV6OWNTU56MtPPXArtbIrEKDEKDHmWU3IvBaJkxBwduirWg5igoSAmBMcYrLR8aIYDqWC2Qon9VI2SlreRkAvfqw4yX8ilg7PxIiTw9E59b3pCItSV9zjsVRYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TjtlY128Rz1X3Gk;
	Mon, 26 Feb 2024 16:17:45 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DA89140383;
	Mon, 26 Feb 2024 16:19:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 16:19:57 +0800
Subject: Re: [rw-ubifs:next 19/33] fs/ubifs/find.c:86: warning: Function
 parameter or struct member 'arg' not described in 'scan_for_dirty_cb'
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Richard
 Weinberger <richard@nod.at>
References: <202402261559.cYtMOkIn-lkp@intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4da3ece6-e2da-98cf-5d21-8e6bf296519f@huawei.com>
Date: Mon, 26 Feb 2024 16:19:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402261559.cYtMOkIn-lkp@intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)

ÔÚ 2024/2/26 15:16, kernel test robot Ð´µÀ:

Hi Arnd,
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
> head:   3ce485803da1b79b2692b6d0c2792829292ad838
> commit: ec724e534dfdd592abc5ac066be77ef15c455ccc [19/33] ubifs: fix function pointer cast warnings
> config: i386-buildonly-randconfig-001-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261559.cYtMOkIn-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261559.cYtMOkIn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402261559.cYtMOkIn-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> fs/ubifs/find.c:86: warning: Function parameter or struct member 'arg' not described in 'scan_for_dirty_cb'
>>> fs/ubifs/find.c:86: warning: Excess function parameter 'data' description in 'scan_for_dirty_cb'
>>> fs/ubifs/find.c:353: warning: Function parameter or struct member 'arg' not described in 'scan_for_free_cb'
>>> fs/ubifs/find.c:353: warning: Excess function parameter 'data' description in 'scan_for_free_cb'
>>> fs/ubifs/find.c:594: warning: Function parameter or struct member 'arg' not described in 'scan_for_idx_cb'
>>> fs/ubifs/find.c:594: warning: Excess function parameter 'data' description in 'scan_for_idx_cb'
>>> fs/ubifs/find.c:786: warning: Function parameter or struct member 'arg' not described in 'scan_dirty_idx_cb'
>>> fs/ubifs/find.c:786: warning: Excess function parameter 'data' description in 'scan_dirty_idx_cb'
> --
>>> fs/ubifs/lprops.c:1018: warning: Function parameter or struct member 'arg' not described in 'scan_check_cb'
>     fs/ubifs/lprops.c:1018: warning: Excess function parameter 'lst' description in 'scan_check_cb'

Looks like [1] imported a compiling warning, because the functions' 
comments(on parameters) are missed to update. Do you have time to send a 
patch to fix it? Thanks.

[1] 
https://patchwork.ozlabs.org/project/linux-mtd/patch/20240213095412.453787-2-arnd@kernel.org/
> 
> 
> vim +86 fs/ubifs/find.c
> 
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   70
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   71  /**
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   72   * scan_for_dirty_cb - dirty space scan callback.
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   73   * @c: the UBIFS file-system description object
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   74   * @lprops: LEB properties to scan
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   75   * @in_tree: whether the LEB properties are in main memory
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   76   * @data: information passed to and from the caller of the scan
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   77   *
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   78   * This function returns a code that indicates whether the scan should continue
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   79   * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   80   * in main memory (%LPT_SCAN_ADD), or whether the scan should stop
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   81   * (%LPT_SCAN_STOP).
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   82   */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   83  static int scan_for_dirty_cb(struct ubifs_info *c,
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   84  			     const struct ubifs_lprops *lprops, int in_tree,
> ec724e534dfdd5 Arnd Bergmann    2024-02-13   85  			     void *arg)
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  @86  {
> ec724e534dfdd5 Arnd Bergmann    2024-02-13   87  	struct scan_data *data = arg;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   88  	int ret = LPT_SCAN_CONTINUE;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   89
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   90  	/* Exclude LEBs that are currently in use */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   91  	if (lprops->flags & LPROPS_TAKEN)
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   92  		return LPT_SCAN_CONTINUE;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   93  	/* Determine whether to add these LEB properties to the tree */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   94  	if (!in_tree && valuable(c, lprops))
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   95  		ret |= LPT_SCAN_ADD;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   96  	/* Exclude LEBs with too little space */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   97  	if (lprops->free + lprops->dirty < data->min_space)
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   98  		return ret;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14   99  	/* If specified, exclude index LEBs */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  100  	if (data->exclude_index && lprops->flags & LPROPS_INDEX)
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  101  		return ret;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  102  	/* If specified, exclude empty or freeable LEBs */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  103  	if (lprops->free + lprops->dirty == c->leb_size) {
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  104  		if (!data->pick_free)
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  105  			return ret;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  106  	/* Exclude LEBs with too little dirty space (unless it is empty) */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  107  	} else if (lprops->dirty < c->dead_wm)
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  108  		return ret;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  109  	/* Finally we found space */
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  110  	data->lnum = lprops->lnum;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  111  	return LPT_SCAN_ADD | LPT_SCAN_STOP;
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  112  }
> 1e51764a3c2ac0 Artem Bityutskiy 2008-07-14  113
> 
> :::::: The code at line 86 was first introduced by commit
> :::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system
> 
> :::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> :::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 

