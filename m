Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87F285CB6;
	Thu, 30 Oct 2025 08:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761811276; cv=none; b=B9nYoMUzyPBODdB+7LitFZ2LiBAdCvKyGyGFMqYRzI+vh/Dk0qovFQQuw8DPo/0yh8qmmy6HFUvj7d6QR7keTHU4lUD6E4YSBd1VY0LZZ8Txeed65ofcdqqnrxvHNrN8GZppwJs6a/p6ldhbkajHRmYiXxf6drpx29WT49T5B8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761811276; c=relaxed/simple;
	bh=zL4x0aytllDKyQ480EA85utMG7zd0hOyD92Tk+FuQng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZToIwA0IQt2uaF9VqlTaghb8TFEf8u+ETwiJwMhsxp84oqhWcN1369owaBpRV5EqlYhfOzsjO78GiiY2uUZRTzfwZDdZF9UBSjn7oZafbJScG668nXA3+uK5vHylBI+XeVweppCmErJFZ5fjwiTURUdmLRLth7QOpsPShRUNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elc23fl6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elc23fl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761811266; x=1793347266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zL4x0aytllDKyQ480EA85utMG7zd0hOyD92Tk+FuQng=;
  b=elc23fl6j9TyvGeSMTKZiDpKKkQ1hdN8tJDzsbrAgIfFgt6wKoyl42Jn
   yi3m0UAcrJgdddsXN0wgDFxjGFOI3OA5ag4n8eT83c5uVXnCD1sjzwXDf
   J3Ohs75MPYtSQkky/EbnlWkqSL6kyFXtBXWM+VTh2pM4i0za2jqulok+R
   m0pJ4ecDEBDvGgMs3drK4WbtXIczJnsp3gMnW1EiM39eOPV5OiFl72LJ5
   2D46ImJXuV+hDEsxJyk1P/NWLz9aYWFOa23DpT6vBPcfdR7Vijp1l4uMq
   0anGuVoOGPBUCl26bGf6ndHCdttRlPjfjE7bWNv1e5fgiZVfRbIIKiLnG
   g==;
X-CSE-ConnectionGUID: ciik9EhkRO6fMPJqE7k6IA==
X-CSE-MsgGUID: OXWdz1AHRymkdBXepZmWZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63643541"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63643541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:01:05 -0700
X-CSE-ConnectionGUID: dA4ejGpzShyyva6Yt5qQ3g==
X-CSE-MsgGUID: /25qR0c7QG21poflIYueaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190222296"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2025 01:01:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vENaf-000Lgm-0d;
	Thu, 30 Oct 2025 08:01:01 +0000
Date: Thu, 30 Oct 2025 16:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Uday Shankar <ushankar@purestorage.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH V3 2/5] ublk: implement NUMA-aware memory allocation
Message-ID: <202510301522.i47z9R95-lkp@intel.com>
References: <20251029031035.258766-3-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029031035.258766-3-ming.lei@redhat.com>

Hi Ming,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on shuah-kselftest/next shuah-kselftest/fixes linus/master v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/ublk-reorder-tag_set-initialization-before-queue-allocation/20251029-111323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20251029031035.258766-3-ming.lei%40redhat.com
patch subject: [PATCH V3 2/5] ublk: implement NUMA-aware memory allocation
config: x86_64-randconfig-074-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301522.i47z9R95-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301522.i47z9R95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301522.i47z9R95-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/ublk_drv.c:240:49: error: 'counted_by' argument must be a simple declaration reference
     240 |         struct ublk_queue       *queues[] __counted_by(dev_info.nr_hw_queues);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:62: note: expanded from macro '__counted_by'
     346 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                                                       ^~~~~~
   1 error generated.


vim +/counted_by +240 drivers/block/ublk_drv.c

   208	
   209	struct ublk_device {
   210		struct gendisk		*ub_disk;
   211	
   212		struct ublksrv_ctrl_dev_info	dev_info;
   213	
   214		struct blk_mq_tag_set	tag_set;
   215	
   216		struct cdev		cdev;
   217		struct device		cdev_dev;
   218	
   219	#define UB_STATE_OPEN		0
   220	#define UB_STATE_USED		1
   221	#define UB_STATE_DELETED	2
   222		unsigned long		state;
   223		int			ub_number;
   224	
   225		struct mutex		mutex;
   226	
   227		spinlock_t		lock;
   228		struct mm_struct	*mm;
   229	
   230		struct ublk_params	params;
   231	
   232		struct completion	completion;
   233		u32			nr_io_ready;
   234		bool 			unprivileged_daemons;
   235		struct mutex cancel_mutex;
   236		bool canceling;
   237		pid_t 	ublksrv_tgid;
   238		struct delayed_work	exit_work;
   239	
 > 240		struct ublk_queue       *queues[] __counted_by(dev_info.nr_hw_queues);
   241	};
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
