Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC3289340;
	Wed,  6 Aug 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470774; cv=none; b=hU7/zB2ti0NgU1dPd47JZ0AV/j5OPUE307e5tKTc2Wot3i77g9UB6TXHJfvrwMaz7qj2iK9dit4dThJNzfHXGaNEYMaw4YdyMlpQej3AptwijGwd/Xt+P7rp3Fz+QTAS7T2bflJnPxrs2r1Zt5zKa/pxEQglqivdn/4S4x4zmUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470774; c=relaxed/simple;
	bh=DDngxPPQ0mU3LdYk7yMRu+shf3e3cpuCjWrR61HrCj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrlCLm2ke8pgm6Ib1T/WjmchIH6DJj/88S8S+Eog0kdwiKy0v4VdQfaHmO73VbB4CqpxT/UYXq6x5UdrT0O5scoONWLZnia/zWPtWbhRKNctRGZH/wHid/5LlVhTxhKfWvXrTS6hPjGuoazgI5Z8c38WrfZvnsgZyNzi1ZDhgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1qkdT+G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1qkdT+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754470773; x=1786006773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDngxPPQ0mU3LdYk7yMRu+shf3e3cpuCjWrR61HrCj0=;
  b=B1qkdT+G7WOP40L1YPPTvsKEyP3aewCZol8GnR0Z7TkOztGyIW+1pxRY
   vwqM9Vcm8TiSbVgS3vGjQS7cCDdKqjFwEGogYnooBMrTlRnU9a3Sa2Fig
   xWk3yHYTJu/OIWAk+IOCT5Lb5gQ4/zO+DapBOi4JmalDm0QxI+9g0U/M2
   N3Q48A5MKezLAGBl8wMzXjw6hsW66QzxNvur8Vm5yeI/mjHX1gPFOkYma
   jF8sEIrxWS0Znzy5dZOyp+lmV1B5XBHcAt8LmDpQPcVsmFb6zAVJakvFc
   c8GBWpRTbNYawXHPdrOenUycYEXb4U958mrf/x+fX0swIr3YbXDKr6cAU
   g==;
X-CSE-ConnectionGUID: a5XaChzVTEqYDtQgcEnBuw==
X-CSE-MsgGUID: Zp+PSs2gRX+5zBxUcQ+jbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82230013"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="82230013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 01:59:33 -0700
X-CSE-ConnectionGUID: m+zsZQRSTK2iF24dWEZ6ew==
X-CSE-MsgGUID: IGaoh4j3S1m0tUsm+D/RMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164253948"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 01:59:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujZzd-0001Qs-2F;
	Wed, 06 Aug 2025 08:59:29 +0000
Date: Wed, 6 Aug 2025 16:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kbusch:kbusch/nvme-virt-boundaries 13/17] block/blk-mq-dma.c:18:27:
 error: no member named 'bi_integrity' in 'struct bio'
Message-ID: <202508061614.ReRfMzE6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git kbusch/nvme-virt-boundaries
head:   6586a1a5cd6772594c5afbc077979c8e370ae265
commit: 20aeb67ff13e29203779874125598410a09baf56 [13/17] blk-mq-dma: add support for mapping integrity metadata
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250806/202508061614.ReRfMzE6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061614.ReRfMzE6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061614.ReRfMzE6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-mq-dma.c:18:27: error: no member named 'bi_integrity' in 'struct bio'
      18 |                 iter->iter = iter->bio->bi_integrity->bip_iter;
         |                              ~~~~~~~~~  ^
   block/blk-mq-dma.c:19:27: error: no member named 'bi_integrity' in 'struct bio'
      19 |                 iter->bvec = iter->bio->bi_integrity->bip_vec;
         |                              ~~~~~~~~~  ^
   2 errors generated.


vim +18 block/blk-mq-dma.c

     8	
     9	static bool __blk_map_iter_next(struct blk_map_iter *iter)
    10	{
    11		if (iter->iter.bi_size)
    12			return true;
    13		if (!iter->bio || !iter->bio->bi_next)
    14			return false;
    15	
    16		iter->bio = iter->bio->bi_next;
    17		if (iter->is_integrity) {
  > 18			iter->iter = iter->bio->bi_integrity->bip_iter;
    19			iter->bvec = iter->bio->bi_integrity->bip_vec;
    20		} else {
    21			iter->iter = iter->bio->bi_iter;
    22			iter->bvec = iter->bio->bi_io_vec;
    23		}
    24		return true;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
