Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453B650
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 00:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659660116; x=1691196116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/VEyLkxeq77TQnF1fntRymq2bZdRxvN59tAQlnS5Qdg=;
  b=Dk+nFsH3hAbNKoIchppGrpuIaK2NR5BFwaSs+Q70B779RDyckwqac4QX
   AW21UsYyevPFNYMeRPgfJCGsozsYUuaXRaE2kSriz84exrmVodCnxbIFZ
   Y2hAWitMs+y6qccBP+ufpmoG/4fAqnpiSpN/a20m6l4ldvatKrMsyPZxl
   XsLlIv+h8EzBZuX/BnrszTPrXAzh3wNzx5HzTN72RYRk5oo6YVatUC4CU
   Yfj2DhPf2XIhxuvvxrcOLrTnPIvt8npw05meybcsk/B7jyIWKsL9qQjv4
   2TA2+Wsbg6Fq+7TMcAV2+Q1XbJbKv5WuOioS4+qMMaGdXKoZD2/YnabaZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="273134560"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="273134560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 17:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="636308499"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2022 17:41:51 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJlPT-000IzX-0I;
	Fri, 05 Aug 2022 00:41:51 +0000
Date: Fri, 5 Aug 2022 08:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Jihong <yangjihong1@huawei.com>, rostedt@goodmis.org,
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, yangjihong1@huawei.com
Subject: Re: [PATCH] perf/core: Fix syzkaller reported issue "Internal error
 in read_pmevcntrn"
Message-ID: <202208050845.V2B12mSf-lkp@intel.com>
References: <20220804105918.113833-1-yangjihong1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804105918.113833-1-yangjihong1@huawei.com>

Hi Yang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on linus/master v5.19 next-20220804]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Jihong/perf-core-Fix-syzkaller-reported-issue-Internal-error-in-read_pmevcntrn/20220804-190347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 326ecc15c61c349cd49d1700ff9e3e31c6fd1cd5
config: arm-randconfig-r004-20220804 (https://download.01.org/0day-ci/archive/20220805/202208050845.V2B12mSf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/9c758a8d3d13d1ac89f651850b79d91b23b41b02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yang-Jihong/perf-core-Fix-syzkaller-reported-issue-Internal-error-in-read_pmevcntrn/20220804-190347
        git checkout 9c758a8d3d13d1ac89f651850b79d91b23b41b02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/events/core.c:6942:20: error: use of undeclared identifier 'flags'
           local_irq_restore(flags);
                             ^
>> kernel/events/core.c:6942:20: error: use of undeclared identifier 'flags'
   2 errors generated.


vim +/flags +6942 kernel/events/core.c

  6896	
  6897	static void perf_output_read_group(struct perf_output_handle *handle,
  6898				    struct perf_event *event,
  6899				    u64 enabled, u64 running)
  6900	{
  6901		struct perf_event *leader = event->group_leader, *sub;
  6902		u64 read_format = event->attr.read_format;
  6903		u64 values[6];
  6904		int n = 0;
  6905	
  6906		values[n++] = 1 + leader->nr_siblings;
  6907	
  6908		if (read_format & PERF_FORMAT_TOTAL_TIME_ENABLED)
  6909			values[n++] = enabled;
  6910	
  6911		if (read_format & PERF_FORMAT_TOTAL_TIME_RUNNING)
  6912			values[n++] = running;
  6913	
  6914		if ((leader != event) &&
  6915		    (leader->state == PERF_EVENT_STATE_ACTIVE))
  6916			leader->pmu->read(leader);
  6917	
  6918		values[n++] = perf_event_count(leader);
  6919		if (read_format & PERF_FORMAT_ID)
  6920			values[n++] = primary_event_id(leader);
  6921		if (read_format & PERF_FORMAT_LOST)
  6922			values[n++] = atomic64_read(&leader->lost_samples);
  6923	
  6924		__output_copy(handle, values, n * sizeof(u64));
  6925	
  6926		for_each_sibling_event(sub, leader) {
  6927			n = 0;
  6928	
  6929			if ((sub != event) &&
  6930			    (sub->state == PERF_EVENT_STATE_ACTIVE))
  6931				sub->pmu->read(sub);
  6932	
  6933			values[n++] = perf_event_count(sub);
  6934			if (read_format & PERF_FORMAT_ID)
  6935				values[n++] = primary_event_id(sub);
  6936			if (read_format & PERF_FORMAT_LOST)
  6937				values[n++] = atomic64_read(&sub->lost_samples);
  6938	
  6939			__output_copy(handle, values, n * sizeof(u64));
  6940		}
  6941	
> 6942		local_irq_restore(flags);
  6943	}
  6944	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
