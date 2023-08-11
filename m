Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9F329A7;
	Fri, 11 Aug 2023 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691788568; x=1723324568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r3gM2YsGq24wLI63levM/2uhpcljlyD/xcFHlYhLSl8=;
  b=eRDAHniIlu8Lv9hokLEggnfLJHvUNBhDu4USdFudplPzeij0fr2Uu5Ck
   lwCcKQaSxMtBef9G7q5NBSZYzhFvGSQ1oJ7g8Jejwv5jNMcyFKqpnVkqW
   atpwLabKXbp3ViB8bQo9SPnW5Kv2Jk5E8bnW7OjW8He6o99xG/YAvw8lX
   e7Xh4/97Ockdfx+d85UQt8vwR+AhH2EtExwNUePTtJGjlVYNIEgNQ8o1R
   9+byGJlC7KPvHr5KbtX6Cr599Z69u5Zn4WKR13yXU7ZbArwTstX6aQorr
   FZIxYihlXZFCl3hTe002zWrwazPfRcjaqJQVC3Jl+BatpQJDD9uKEQYYS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438098262"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="438098262"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802817157"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="802817157"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2023 14:15:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZU8-00082u-06;
	Fri, 11 Aug 2023 21:15:52 +0000
Date: Sat, 12 Aug 2023 05:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nitesh Shetty <nj.shetty@samsung.com>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	martin.petersen@oracle.com, mcgrof@kernel.org, dlemoal@kernel.org,
	gost.dev@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Vincent Fu <vincent.fu@samsung.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v14 11/11] null_blk: add support for copy offload
Message-ID: <202308120529.EW7DuUW7-lkp@intel.com>
References: <20230811105300.15889-12-nj.shetty@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811105300.15889-12-nj.shetty@samsung.com>

Hi Nitesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on f7dc24b3413851109c4047b22997bd0d95ed52a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitesh-Shetty/block-Introduce-queue-limits-and-sysfs-for-copy-offload-support/20230811-192259
base:   f7dc24b3413851109c4047b22997bd0d95ed52a2
patch link:    https://lore.kernel.org/r/20230811105300.15889-12-nj.shetty%40samsung.com
patch subject: [PATCH v14 11/11] null_blk: add support for copy offload
config: hexagon-randconfig-r032-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120529.EW7DuUW7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120529.EW7DuUW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120529.EW7DuUW7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_nullb_copy_op
   >>> referenced by atomic-arch-fallback.h:444 (include/linux/atomic/atomic-arch-fallback.h:444)
   >>>               drivers/block/null_blk/main.o:(null_process_cmd) in archive vmlinux.a
   >>> referenced by atomic-arch-fallback.h:444 (include/linux/atomic/atomic-arch-fallback.h:444)
   >>>               drivers/block/null_blk/main.o:(null_process_cmd) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __traceiter_nullb_copy_op
   >>> referenced by trace.h:71 (drivers/block/null_blk/trace.h:71)
   >>>               drivers/block/null_blk/main.o:(null_process_cmd) in archive vmlinux.a
   >>> referenced by trace.h:71 (drivers/block/null_blk/trace.h:71)
   >>>               drivers/block/null_blk/main.o:(null_process_cmd) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
