Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1094223DE5;
	Mon, 23 Jun 2025 22:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717720; cv=none; b=Hhuh2nXHy3qPU22l7TxwKaLlM/jNY2vUjc9htjbBkCARed32rIn8f8QVrqkHrA+ZeLazUefv5+Mmo2ukeyk68AMiT53GswX6L73LWUrlnKj/sH1lPJ1k2ikITl+jjRL3cqfdsdZDEa8hyw7SF5Prd8LW5/T5kz89uav81GyWXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717720; c=relaxed/simple;
	bh=IDscL//YK13cEbpe8hOp7s0v96Vb0LFr4CLJ3x2bcg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyLIZCAHCpHYTggcxY0gcCf9m8Y1ul9Q3AYvcFU1fo2sTWIkt4lP2O/btN+b7UJDsm4w+c+TjzWWQrA9zGmaIn6xuu5azEakeLXu0JZxruQOpwF/QshiMpaaQkv0ixfpOICltr/8XlQn+8hZVldtLm9gY4T8p5XXTHdDIQ+d6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQrlsLCl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQrlsLCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750717719; x=1782253719;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IDscL//YK13cEbpe8hOp7s0v96Vb0LFr4CLJ3x2bcg4=;
  b=PQrlsLCl2H0tf3ZBTMjix0zXcV8FYUMD5DbxvWwSgqxpzoi0+KyxHp0n
   q8QWjK0aTA1C0Zk60m0o69EzY43r4CJxpyZayH3nTjgzNXT7RIqV+PweT
   A68TwbiYMkuwrag99KhRQFJPjCbfwCqsoQVjX/SKvAAkvQ0L1DcfS05p1
   UPZiw+ItmYV9XxqZxuwNg+IC2JmkUw1xRZFM++RPNptiDtOLpPeLy+4j1
   wMLuaiolU8kQMKk8+JIpxfruvvadQnHts85K6ug/1oYtC2g9B48kr8lXx
   UlLYRepIFI63w0/Oi+Trn1smupnNYdGSZmWavSYHPeTTxkLO9nD/vHYBz
   A==;
X-CSE-ConnectionGUID: pYL7wU5mQ/WkjxjLKQXykA==
X-CSE-MsgGUID: 3w9er+YzTeG/Rh6Y5LfIVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52057565"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52057565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 15:28:36 -0700
X-CSE-ConnectionGUID: yL4ap/FOQ6ukJUZThptdJA==
X-CSE-MsgGUID: Th11nDHDRuS5IbAWar/8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="182763922"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 15:28:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTpeS-000RKl-0Y;
	Mon, 23 Jun 2025 22:28:32 +0000
Date: Tue, 24 Jun 2025 06:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/virtio/virtio_balloon.c:401:21: warning: stack frame size
 (1040) exceeds limit (1024) in 'update_balloon_stats'
Message-ID: <202506240611.WIZwT0sn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: ad6b26b6a0a79166b53209df2ca1cf8636296382 sched/numa: add statistics of numa balance task
date:   3 weeks ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250624/202506240611.WIZwT0sn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240611.WIZwT0sn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240611.WIZwT0sn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_balloon.c:401:21: warning: stack frame size (1040) exceeds limit (1024) in 'update_balloon_stats' [-Wframe-larger-than]
     401 | static unsigned int update_balloon_stats(struct virtio_balloon *vb)
         |                     ^
   1 warning generated.


vim +/update_balloon_stats +401 drivers/virtio/virtio_balloon.c

fdba68d2adf8d9 zhenwei pi         2024-04-23  400  
fdba68d2adf8d9 zhenwei pi         2024-04-23 @401  static unsigned int update_balloon_stats(struct virtio_balloon *vb)
fdba68d2adf8d9 zhenwei pi         2024-04-23  402  {
fdba68d2adf8d9 zhenwei pi         2024-04-23  403  	struct sysinfo i;
fdba68d2adf8d9 zhenwei pi         2024-04-23  404  	unsigned int idx;
fdba68d2adf8d9 zhenwei pi         2024-04-23  405  	long available;
fdba68d2adf8d9 zhenwei pi         2024-04-23  406  	unsigned long caches;
fdba68d2adf8d9 zhenwei pi         2024-04-23  407  
fdba68d2adf8d9 zhenwei pi         2024-04-23  408  	idx = update_balloon_vm_stats(vb);
fdba68d2adf8d9 zhenwei pi         2024-04-23  409  
fdba68d2adf8d9 zhenwei pi         2024-04-23  410  	si_meminfo(&i);
fdba68d2adf8d9 zhenwei pi         2024-04-23  411  	available = si_mem_available();
fdba68d2adf8d9 zhenwei pi         2024-04-23  412  	caches = global_node_page_state(NR_FILE_PAGES);
9564e138b1f6eb Adam Litke         2009-11-30  413  	update_stat(vb, idx++, VIRTIO_BALLOON_S_MEMFREE,
9564e138b1f6eb Adam Litke         2009-11-30  414  				pages_to_bytes(i.freeram));
9564e138b1f6eb Adam Litke         2009-11-30  415  	update_stat(vb, idx++, VIRTIO_BALLOON_S_MEMTOT,
9564e138b1f6eb Adam Litke         2009-11-30  416  				pages_to_bytes(i.totalram));
5057dcd0f1aaad Igor Redko         2016-03-17  417  	update_stat(vb, idx++, VIRTIO_BALLOON_S_AVAIL,
5057dcd0f1aaad Igor Redko         2016-03-17  418  				pages_to_bytes(available));
4d32029b8ddb7b Tomáš Golembiovský 2017-11-12  419  	update_stat(vb, idx++, VIRTIO_BALLOON_S_CACHES,
4d32029b8ddb7b Tomáš Golembiovský 2017-11-12  420  				pages_to_bytes(caches));
9646b26e85896e Ladi Prosek        2017-03-28  421  
9646b26e85896e Ladi Prosek        2017-03-28  422  	return idx;
9564e138b1f6eb Adam Litke         2009-11-30  423  }
9564e138b1f6eb Adam Litke         2009-11-30  424  

:::::: The code at line 401 was first introduced by commit
:::::: fdba68d2adf8d9ae680e23e8b8ba79330baa45bc virtio_balloon: separate vm events into a function

:::::: TO: zhenwei pi <pizhenwei@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
