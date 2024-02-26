Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56AB4D58A;
	Mon, 26 Feb 2024 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947490; cv=none; b=qJLlBeQi+oGnsukZeqI7HbNhEQRbVU6bgVcaf1EOpj2kisbUogRbKQoCqydJKaXA78rVzbBymCCx8EV3Jc6aIQnp8gtx0adnplcKyq6bJL6foiIEtHF6EbfHaOI4W3J3krJsW8vIn/2RU8BMgITsmvSv4fkA0U6IWIGKP0CSLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947490; c=relaxed/simple;
	bh=EBB+miSoZT8Oa/q94lFR2lRuNLTDTgkxqfS4CcwQNZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IO8EgGJKS21ISmMObFehXUrMjaANe49pbMbQnH4sK36P1ExrG8GvD15IRqHpyZlvZzmVCXODC3D70OZQf6uf+jmAFxFVlyuEm5unh1tH/VTyCuN60e1CfvNe6bzsBLqjFVMMeF2GORCnwSiiSjBQ8HEo5mGbWPkskZv1KlXzLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZW1g3j0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZW1g3j0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708947487; x=1740483487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBB+miSoZT8Oa/q94lFR2lRuNLTDTgkxqfS4CcwQNZw=;
  b=lZW1g3j0cYBJXDwP8iwi15kAD7iDXnW1saENGVmrkpMYnjRdI583GWPr
   9QwfcMf8TXYQh4ILw0xkwWMRKXnB133ojxBrftOlXA7ikPqaAIKSoAwy1
   2EWvQxrk0Ikcl4ZBq3tUA1tLntm5IUSxFShehBwq+MRD5j6iYH8Wii/4O
   3/c2lt+dpL1O04q7aFDP/4hNth+uqtfm9OqB1yg89uJcoNCc/NoDjhFTB
   18i5b7jVZecmHQLiwzjamcFYuiYYGJT02ItmxmEF52g3zYAh9Gt3Upwvi
   izfIuO1aRGjEBnkRqyE1GwEUJMoCxp3kZqQnPPrIc3eHEJ7l9+0n/ebMx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14660555"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="14660555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 03:38:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6632196"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2024 03:38:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reZJ4-000AHT-2h;
	Mon, 26 Feb 2024 11:38:02 +0000
Date: Mon, 26 Feb 2024 19:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Richard Weinberger <richard@nod.at>, Zhang Yi <yi.zhang@huawei.com>
Subject: [linux-next:master 10011/10236] fs/ubifs/journal.c:369: warning:
 expecting prototype for wake_up_reservation(). Prototype was for
 add_or_start_queue() instead
Message-ID: <202402261912.yAxZePRG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8552c902efe7ef670b6961fb8885b67961aeb629
commit: 556c19f563b64dd5463b0030d19c8681f4f7446e [10011/10236] ubifs: Queue up space reservation tasks if retrying many times
config: i386-buildonly-randconfig-001-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261912.yAxZePRG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261912.yAxZePRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261912.yAxZePRG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/journal.c:369: warning: expecting prototype for wake_up_reservation(). Prototype was for add_or_start_queue() instead


vim +369 fs/ubifs/journal.c

   360	
   361	/**
   362	 * wake_up_reservation - add current task in queue or start queuing.
   363	 * @c: UBIFS file-system description object
   364	 *
   365	 * This function starts queuing if queuing is not started, otherwise adds
   366	 * current task in queue.
   367	 */
   368	static void add_or_start_queue(struct ubifs_info *c)
 > 369	{
   370		spin_lock(&c->reserve_space_wq.lock);
   371		if (atomic_cmpxchg(&c->need_wait_space, 0, 1) == 0) {
   372			/* Starts queuing, task can go on directly. */
   373			spin_unlock(&c->reserve_space_wq.lock);
   374			return;
   375		}
   376	
   377		/*
   378		 * There are at least two tasks have retried more than 32 times
   379		 * at certain point, first task has started queuing, just queue
   380		 * the left tasks.
   381		 */
   382		__queue_and_wait(c);
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
