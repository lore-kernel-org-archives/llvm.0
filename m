Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE5331EBB;
	Mon, 19 Oct 2026 02:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792377007; cv=none; b=hZW1BVZOhRbajCVVOecnpa57dtwdM8+X3InyJHUpYAj+wxpPLtlwXuNZykAxEIRs4VwnpJaE3z1J6i4YCie6wC1pe/UT/NpfGNMeAc+cMLqbu56KLIGXu2ADvMvWWJK+y2Aq2wxW8HZjKnYyfhBnLV3mejE9tO203Q9vwzYJr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792377007; c=relaxed/simple;
	bh=8eUftpKkm4gws7RamR7mgm1Cdr8pA/2dqzU6KHEzU4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sbr0ZxeLl5riE8YkHb4bmvvJry0ZrVAdVgTkw0hx2U4hzPnT3sGbdhIpn/0gYhrnpr03tE0w3VOp+AFGU2egmS1WCQE8S59/Yq0vCuyuINMQ1MGi0q+GHDol6a2DSdKjLD6j4GTZEk23K8Aduidl/0H8PGH/Es+rY816InAvpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPCKSyBr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPCKSyBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792377006; x=1823913006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8eUftpKkm4gws7RamR7mgm1Cdr8pA/2dqzU6KHEzU4I=;
  b=IPCKSyBrmnEahEKCTKVvSM9yhK/nPQFAxvM954LjBppxvdCzsrJze5BL
   zJOrc0M3qmWePzPy1fAVx0Qw96KsQ30kC/tYy2pSD5dnN+mOOQSBn0ZFO
   0URCU7/ZYU/7Qf+Z8CLxZyx/5k7tpqcOEAOcwHphGAoPCNfMDlbE/0l0C
   fNwduaizyJQY153CUxviMIeuDECx4zJInobazuczdcQRxYVAIeCsLff0s
   wP04CYhMfD2u6emKfgvb5s8bHfmC8FjX8I/ZoEfUG3/cPm3iAOQnsgb4e
   qnpqr2kaZpRahjIn/0uLYDxHCxaFu6l09C9e00n7L0sZU6GpjS3UhbYLW
   w==;
X-CSE-ConnectionGUID: Cd1G6iFDSNGYBW417Fs9Gw==
X-CSE-MsgGUID: +rzNn9uMRU6vKVKYsdam6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1064165"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1064165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:30:05 -0700
X-CSE-ConnectionGUID: fhon4bEzRwm0fJkRaX4f5g==
X-CSE-MsgGUID: iAJCNMKtRWa9BQPu9LlfCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2416171"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2026 19:30:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xId8T-00000000L7q-1Ud4;
	Mon, 19 Oct 2026 02:30:01 +0000
Date: Mon, 19 Oct 2026 10:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	LKML <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] block: avoid long sync_blockdev() under
 disk->open_mutex during parallel close
Message-ID: <202610191027.uw2yfQhY-lkp@intel.com>
References: <6efed2d0-fe66-4d29-876b-fd3b74abaa70@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6efed2d0-fe66-4d29-876b-fd3b74abaa70@I-love.SAKURA.ne.jp>

Hi Tetsuo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v7.3 next-20261016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/block-avoid-long-sync_blockdev-under-disk-open_mutex-during-parallel-close/20261017-004014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/6efed2d0-fe66-4d29-876b-fd3b74abaa70%40I-love.SAKURA.ne.jp
patch subject: [PATCH v7] block: avoid long sync_blockdev() under disk->open_mutex during parallel close
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20261019/202610191027.uw2yfQhY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191027.uw2yfQhY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191027.uw2yfQhY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bdev.c:1157:3: warning: releasing mutex 'disk->open_mutex' that was not held [-Wthread-safety-analysis]
    1157 |                 mutex_unlock(&disk->open_mutex);
         |                 ^
>> block/bdev.c:1162:1: warning: mutex 'disk->open_mutex' is not held on every path through here [-Wthread-safety-analysis]
    1162 | }
         | ^
   block/bdev.c:1159:3: note: mutex acquired here
    1159 |                 mutex_lock(&disk->open_mutex);
         |                 ^
   2 warnings generated.


vim +1157 block/bdev.c

  1152	
  1153	static inline void bd_early_sync(struct gendisk *disk, struct block_device *bdev)
  1154	{
  1155		if (atomic_read(&bdev->bd_openers) == 1 + bdev->bd_closers) {
  1156			bdev->bd_closers++;
> 1157			mutex_unlock(&disk->open_mutex);
  1158			sync_blockdev(bdev);
  1159			mutex_lock(&disk->open_mutex);
  1160			bdev->bd_closers--;
  1161		}
> 1162	}
  1163	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
