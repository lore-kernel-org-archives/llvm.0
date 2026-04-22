Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4FB332EBB;
	Wed, 22 Apr 2026 15:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871254; cv=none; b=mmEu4anlEkKRO3OBMG43RdKdQ99UGCSyvAJas5Q+64wP0Qo5H2czi8Th8Vd/UK3rPmchjjgQdAdsReYYpBWLhdjVba+tNPHXuih2c85mXpHtqRoyhi7OYOBaVCGYPV/AABSLk7JfE7/CKAkZd55fOznwX0AP8+RoneWQgFhOOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871254; c=relaxed/simple;
	bh=nPT6f5FYGhcVdKdpuUk9EjT3sZU3HjqJhMw47zMMZGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRqCAFvd4ifHXuNN61JZAUMTKCIqX1GvuyFdfJNZi8hwNgy7/TOe778JW349FNrXDGAWFYJOxkws54whm1bq+GtoCBQx2gXLUPiCMhzYPhcLTsmCvIwwhWMA/GM9Lb14DivBGdXLfs+AKyWw8S85MlstPrN8FAP3Bm115N0tmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU2vu/BA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU2vu/BA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776871252; x=1808407252;
  h=date:from:to:cc:subject:message-id;
  bh=nPT6f5FYGhcVdKdpuUk9EjT3sZU3HjqJhMw47zMMZGo=;
  b=nU2vu/BAxZY5WEO1Vw7ttixyE9HVExoDd7CftoZDzVRMn1jCYvIJv/Q8
   j9fp8F0ai2yODuDjHgyoOkBtV2u0qXWxlQy01C4AjA6lHn0ldCpRzSavC
   A0y8F87O245cm60tvS9agnAMWywpuIUnBP8Tqx4kGiewKssFuHShz2fwZ
   Efn31RqPP3pyJ0BIfhQPCDAam1GrtJ7+Xvvp5HPBH/n/+TtXKue941z+d
   DWhQuPVyUN+D7oDHAnBz6BHkq+7+yq+E3x9OSrjihn/2A4UKp+MFPyji2
   DU3qyj40/T2cxKdSXc1jewv5CvHnNPPDr1b/nmWIxIRF/XA7tXID3J2gq
   g==;
X-CSE-ConnectionGUID: EI/ew6YQTCy9WXUf/W7vaQ==
X-CSE-MsgGUID: AkCFZZEOQbGsJ416V2dL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81690480"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81690480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 08:20:51 -0700
X-CSE-ConnectionGUID: TwF5lK6aR1aXS3Cd+WURAg==
X-CSE-MsgGUID: jNrAEZTfTQ+ULgLHg9Nj9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="237365831"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2026 08:20:50 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFZNf-000000000kj-2ivW;
	Wed, 22 Apr 2026 15:20:47 +0000
Date: Wed, 22 Apr 2026 23:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: Codex <jullanggit@proton.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 60/62]
 fs/bcachefs/init/dev.c:2241:12: warning: stack frame size (1088) exceeds
 limit (1024) in 'bch2_dev_resize_thread'
Message-ID: <202604222317.Gn6OQEv2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   d2a62b04dbdf826f75c734329003dbb927941266
commit: a2c5355977eeeff6c78b444746f448b673689cea [60/62] bcachefs: shrink: bound stalled tail detection on reconcile work
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604222317.Gn6OQEv2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604222317.Gn6OQEv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604222317.Gn6OQEv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/init/dev.c:1004:5: warning: stack frame size (1056) exceeds limit (1024) in 'bch2_dev_add' [-Wframe-larger-than]
    1004 | int bch2_dev_add(struct bch_fs *c, const char *path, struct printbuf *err)
         |     ^
>> fs/bcachefs/init/dev.c:2241:12: warning: stack frame size (1088) exceeds limit (1024) in 'bch2_dev_resize_thread' [-Wframe-larger-than]
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
