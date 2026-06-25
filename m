Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3363316192;
	Thu, 25 Jun 2026 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782421158; cv=none; b=Zagaux5WXrjTXQkxb4t/e6Oz3OZ9wfhFSt2oKH5VfVSj4Ht4mj+6xKLxfU95FvcdqemYoJy3m8v9M4DqnxdVl7C88vHveDBqJ7obmYXxi9QkZZEw6RXwC3m6j6KIH8o9HfQPFQbW7ga4AHMvlgT9om3AEVqPfd/COMqKV29Hp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782421158; c=relaxed/simple;
	bh=vceNn5dg0LMMyDWw/9f25XnmDxgYL71gZ7Ij3F/7av8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p8dcZNyZNV2S6MVyxxHL3DV1SqIfME4ZouuL8tG5HX9vYoneMZN/6w77cMyVL6dvRBHVHtuGkmDAPFhzcUltaaL8cflFIq2CZtPulTq6zB/SPiCgp87bhTLKTF2lOyaANcf2/ghXGI9Zlt7/6PucEoBQnW5rvhIBS3jO32VleaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hE61N8O/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE61N8O/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782421157; x=1813957157;
  h=date:from:to:cc:subject:message-id;
  bh=vceNn5dg0LMMyDWw/9f25XnmDxgYL71gZ7Ij3F/7av8=;
  b=hE61N8O/EHRgHdIxo8vEO6quySyni13bmVk/6WYmIlR6ifSnXugYUqfN
   c4jt7dzff37MckbcG3Ukq3i8suJVGd5SvhbcEzINJow8An1UP80Ij7e8l
   eIfXZFwCoPvjnwXoMmMi1I/TMLEcLLGfEQgk7JPxJ1Qd2O/z5AXY/0UKU
   GQHJKGnB1HUKCyd017lAJpdHGkF6Qz0XQ291HAKdPoCtixASvXj9C2PJK
   yHX193BJlEON5KzHAvAwsF2MYcCy9RtE8QZINFJ3+6+6AxCCbEYE8l05C
   ea08HCWeP1vWkgGrv3zJRsHXy23XuWO5dpr6B+cEfV4C3sPfamy03B0Pt
   A==;
X-CSE-ConnectionGUID: g7f8XhsZTo2HvkFUaXkPyg==
X-CSE-MsgGUID: iSvtF3wySgaIVE1Pdw9nRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83339903"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83339903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 13:59:16 -0700
X-CSE-ConnectionGUID: 0qPBrgBDTYWsJTcegbeuYA==
X-CSE-MsgGUID: lbVwgT/TRECcSWwFg+/BtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="274296645"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jun 2026 13:59:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcrAD-000000004Vh-0T4u;
	Thu, 25 Jun 2026 20:59:09 +0000
Date: Fri, 26 Jun 2026 04:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Codex <jullanggit@proton.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 60/65]
 fs/bcachefs/init/dev.c:2241:12: warning: stack frame size (1040) exceeds
 limit (1024) in 'bch2_dev_resize_thread'
Message-ID: <202606260416.QM1oynxs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Codex,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   d294b8d3e670ce73e23093e05a92747e0701bf8d
commit: a2c5355977eeeff6c78b444746f448b673689cea [60/65] bcachefs: shrink: bound stalled tail detection on reconcile work
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260626/202606260416.QM1oynxs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260416.QM1oynxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260416.QM1oynxs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/init/dev.c:1004:5: warning: stack frame size (1072) exceeds limit (1024) in 'bch2_dev_add' [-Wframe-larger-than]
    1004 | int bch2_dev_add(struct bch_fs *c, const char *path, struct printbuf *err)
         |     ^
>> fs/bcachefs/init/dev.c:2241:12: warning: stack frame size (1040) exceeds limit (1024) in 'bch2_dev_resize_thread' [-Wframe-larger-than]
    2241 | static int bch2_dev_resize_thread(void *arg)
         |            ^
   2 warnings generated.


vim +/bch2_dev_resize_thread +2241 fs/bcachefs/init/dev.c

24a0d1607fa915 Jul Lang 2026-02-17  2240  
557af95f7f9ec3 Codex    2026-04-14 @2241  static int bch2_dev_resize_thread(void *arg)
557af95f7f9ec3 Codex    2026-04-14  2242  {
557af95f7f9ec3 Codex    2026-04-14  2243  	struct bch_dev *ca = arg;
557af95f7f9ec3 Codex    2026-04-14  2244  	struct bch_fs *c = ca->fs;
557af95f7f9ec3 Codex    2026-04-14  2245  	u64 seen_seq = 0;
557af95f7f9ec3 Codex    2026-04-14  2246  
557af95f7f9ec3 Codex    2026-04-14  2247  	set_freezable();
557af95f7f9ec3 Codex    2026-04-14  2248  
557af95f7f9ec3 Codex    2026-04-14  2249  	while (!kthread_should_stop()) {
557af95f7f9ec3 Codex    2026-04-14  2250  		kthread_wait_freezable(kthread_should_stop() ||
557af95f7f9ec3 Codex    2026-04-14  2251  				       bch2_dev_resize_seq(ca) != seen_seq);
557af95f7f9ec3 Codex    2026-04-14  2252  		if (kthread_should_stop())
557af95f7f9ec3 Codex    2026-04-14  2253  			break;
557af95f7f9ec3 Codex    2026-04-14  2254  
557af95f7f9ec3 Codex    2026-04-14  2255  		while (!kthread_should_stop()) {
557af95f7f9ec3 Codex    2026-04-14  2256  			u64 seq = bch2_dev_resize_seq(ca);
557af95f7f9ec3 Codex    2026-04-14  2257  			u64 target = bch2_dev_resize_target(ca);
557af95f7f9ec3 Codex    2026-04-14  2258  			int ret;
557af95f7f9ec3 Codex    2026-04-14  2259  			CLASS(printbuf, err)();
557af95f7f9ec3 Codex    2026-04-14  2260  
557af95f7f9ec3 Codex    2026-04-14  2261  			if (target == ca->mi.nbuckets) {
557af95f7f9ec3 Codex    2026-04-14  2262  				ret = 0;
557af95f7f9ec3 Codex    2026-04-14  2263  			} else if (target > ca->mi.nbuckets) {
557af95f7f9ec3 Codex    2026-04-14  2264  				ret = __bch2_dev_grow(c, ca, target, &err);
557af95f7f9ec3 Codex    2026-04-14  2265  			} else {
557af95f7f9ec3 Codex    2026-04-14  2266  				ret = __bch2_dev_shrink(c, ca, target, seq, &err);
557af95f7f9ec3 Codex    2026-04-14  2267  			}
557af95f7f9ec3 Codex    2026-04-14  2268  
557af95f7f9ec3 Codex    2026-04-14  2269  			if (ret == -EAGAIN)
557af95f7f9ec3 Codex    2026-04-14  2270  				continue;
557af95f7f9ec3 Codex    2026-04-14  2271  
557af95f7f9ec3 Codex    2026-04-14  2272  			if (ret && err.pos)
557af95f7f9ec3 Codex    2026-04-14  2273  				bch_err_dev(ca, "%s", err.buf);
557af95f7f9ec3 Codex    2026-04-14  2274  			else if (ret && ret != -EINTR)
557af95f7f9ec3 Codex    2026-04-14  2275  				bch_err_fn_dev(ca, ret);
557af95f7f9ec3 Codex    2026-04-14  2276  
557af95f7f9ec3 Codex    2026-04-14  2277  			seen_seq = bch2_dev_resize_seq(ca);
557af95f7f9ec3 Codex    2026-04-14  2278  			if (ret == -EINTR)
557af95f7f9ec3 Codex    2026-04-14  2279  				break;
557af95f7f9ec3 Codex    2026-04-14  2280  			if (!bch2_dev_resize_finish(ca, seq, ret))
557af95f7f9ec3 Codex    2026-04-14  2281  				continue;
557af95f7f9ec3 Codex    2026-04-14  2282  			break;
557af95f7f9ec3 Codex    2026-04-14  2283  		}
557af95f7f9ec3 Codex    2026-04-14  2284  	}
557af95f7f9ec3 Codex    2026-04-14  2285  
557af95f7f9ec3 Codex    2026-04-14  2286  	return 0;
557af95f7f9ec3 Codex    2026-04-14  2287  }
557af95f7f9ec3 Codex    2026-04-14  2288  

:::::: The code at line 2241 was first introduced by commit
:::::: 557af95f7f9ec319e6085541199cc4e936a5778b bcachefs: make device resize converge to the latest target

:::::: TO: Codex <jullanggit@proton.me>
:::::: CC: Jul Lang <jullanggit@proton.me>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
