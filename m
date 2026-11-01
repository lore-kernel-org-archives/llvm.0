Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553856;
	b=iFp6dXBKTtXKyoR08QKNvgz/ys3wb93xEhHD5p166pHlTo7jjZIOqChdpiQ3DjGJ4d1W
	 7cL2v+jqy2YlavUYqCKFlGyehP5rytwCjwaV6kYbP8oO905HU0v+nkHgzmnwhg/84UmYm
	 n+c/JPDOHtWOiWIOyTnUbQHI25cTxTa5wg5cXwdJrCccJimVjXR+RlPzRwTqDG8WLqyAX
	 xmTe3ef1QMr7IOmcGQb8bmXB/w7rGhOeVEKmdWM9IKCWvnJLn9QHs4w7FpN5XE9CS2DN4
	 vvUS+RXVRLMrfkvTueCJP2vyuOosxwi6iRnhN/+qUxKCq6ZMox7d8GJRGvS/+SXPsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553856;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ys8m4INKms7xsP1uq2SmadS0BKPLnUYJFlIvJAxr0Bk=;
	b=2Nejmvg/8R5maVQzp4KWut6i7gzexo8KRcoFpXdNE7mLqPzy7rVtA+aIAcWU0mQXYPwF
	 P1zVFekj3goCsW7rY+rjtZg2Maea8Rhmiu2wgixEkk0TXL0mlR+nodkr4ty7TqpmXOrXY
	 6MHNfCHaMziqDKmpVzx89aAEz+T9JdjBhpv0kOtzA4c7M3wQwrjRLmcU8ZclWPext6zRb
	 upXsD/5MNEfV5CfJ6ADhFyTS2auiCVqDwYSiNnLNV0u82kimtxlMHAnK9v5wnestkjgjZ
	 NLosilccnLSrenTRD8nNWSD7cvu43obJxkU6boPb3ewUWGeibXpOjP2iujZ0b3k6OhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O2KJ1ncR;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43183606A325;
	Sun,  1 Nov 2026 17:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43183606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O2KJ1ncR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793553855; x=1825089855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WxsGFjKfwc6ElrMGH5ZEaN7g5s86W0syQU08kX8Hm3I=;
  b=O2KJ1ncRxkloUFhZVyxy0vYPQH4eDR+ntwI67TwQKr1qWIVcQaDTJ9DS
   mbAnHebYdsVHFuNB/G+noKzGWG0kKHtrYBs3VBno9DMYhJxkdzW2EkDGq
   I0G+PzhpHPh+kkhvU0jnjrH18zFBttqSCiwjpoMzukYSGnlDqaQuKDpI9
   8mNISUydF7r8Pivg0WFBaeUgIJWNSN18ahHLiolzByKcbjfNS5A9s/dOQ
   iQh/HFJ/Kl79OHOzyiz5B/w5LEZrm7t8CTy2D2qRzJqfxY94k4pgHV3sc
   +S4T0WV+vbQzVa/EZOc23GIlHxwXxgszMf8dwh33JVT8mfaMWRGZ9ZK3L
   w==;
X-CSE-ConnectionGUID: vnOupiGcSPmsl67L6s4OrQ==
X-CSE-MsgGUID: aPlc4Y31QPmft/KD++5hRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2281056"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2281056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 09:24:14 -0800
X-CSE-ConnectionGUID: kSlT8ZORShakNA0RFKR3cg==
X-CSE-MsgGUID: 42Q2YGubSP6FUC+SAQELcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6237496"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Nov 2026 09:24:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNZHo-00000000eVE-19Xy;
	Sun, 01 Nov 2026 17:24:04 +0000
Date: Mon, 2 Nov 2026 01:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Xinchen <caixinchen1@huawei.com>, mic@digikod.net,
	gnoack@google.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org,
	utilityemal77@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, rdunlap@infradead.org,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	johan@kernel.org, dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk,
	viro@zeniv.linux.org.uk, brauner@kernel.org
Subject: Re: [PATCH v3 -next 01/18] fs: pass struct path to notify_change()
Message-ID: <202611020100.FxxaH8E9-lkp@intel.com>
References: <20261027121151.1887650-2-caixinchen1@huawei.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027121151.1887650-2-caixinchen1@huawei.com>

Hi Cai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20261026]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Xinchen/fs-pass-struct-path-to-notify_change/20261027-201134
base:   next-20261026
patch link:    https://lore.kernel.org/r/20261027121151.1887650-2-caixinchen1%40huawei.com
patch subject: [PATCH v3 -next 01/18] fs: pass struct path to notify_change()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261102/202611020100.FxxaH8E9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020100.FxxaH8E9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020100.FxxaH8E9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4state.c:10537 function parameter 'path' not described in 'nfsd4_deleg_getattr_conflict'
>> Warning: fs/nfsd/nfs4state.c:10537 Excess function parameter 'dentry' description in 'nfsd4_deleg_getattr_conflict'
>> Warning: fs/nfsd/nfs4state.c:10537 function parameter 'path' not described in 'nfsd4_deleg_getattr_conflict'
>> Warning: fs/nfsd/nfs4state.c:10537 Excess function parameter 'dentry' description in 'nfsd4_deleg_getattr_conflict'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
