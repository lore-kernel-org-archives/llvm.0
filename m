Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E897E8
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651825163; x=1683361163;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Lm7OY7xqsAGK/gyvVmNKpT9HQT/aYergg3VWU9Ymv/Q=;
  b=KqLtQICPmfSPHb8Ryh/mcHRqqMoRkpS3yFwt7f9689GnRBi4cQd+OYLz
   7NiPLpHUWJkCftSkZixI9Ou/oy72959/Dp/YSukxwzUbexKKTq0pqgp6l
   DVplEzO3HstDXqK4cy7LS9RxRjVw/0iu+08EBYoSAVFroyWcO8EQZ5lWr
   Q1LSDC2ZEUEX0CQeVNrXLE5hH9aJNyK6GPvdNUqKhjNbLl62tS01KYlxx
   K9KDHmvg+71RNavnCVWWWG4fvqsDVWfvL3NTe/PnMdBLEpTU06k4Cwfx7
   q4FHxXWbpCGdnZOlovoJFyNDrx6USfMgMZ0U+BgL6YREs7S/TpQwDA/91
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331379820"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="331379820"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 01:19:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="585850946"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.170.35]) ([10.249.170.35])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 01:19:21 -0700
Subject: Re: [kbuild-all] Re: [PATCH] mm/damon/sysfs: fix pid leak under
 fvaddr ops use case
To: SeongJae Park <sj@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <20220504171601.106690-1-sj@kernel.org>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <a6456427-8b47-a0f5-967f-936d2cce0d20@intel.com>
Date: Fri, 6 May 2022 16:19:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220504171601.106690-1-sj@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/5/2022 1:16 AM, SeongJae Park wrote:
> On Wed, 4 May 2022 10:53:47 +0800 kernel test robot <lkp@intel.com> wrote:
> 
>> Hi SeongJae,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on hnaz-mm/master]
> 
> This patch is on top of mm-unstable branch of akpm's mm tree.  More
> specifically, this patch depends on a commit[1] on the tree.  So, this error
> shouldn't occur on top of the tree.

Hi SJ,

Thanks for your feedback, it's helpful to improve our system.

Best Regards,
Rong Chen

> 
> If I'm missing something, please let me know.
> 
> [0] git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-unstable&id=cb52aff4ed86a5992309bc7efc228303a7dc084d
> 
> 
> Thanks,
> SJ
> 
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/SeongJae-Park/mm-dam=
>> on-sysfs-fix-pid-leak-under-fvaddr-ops-use-case/20220504-060657
>> base:   https://github.com/hnaz/linux-mm master
>> config: hexagon-randconfig-r045-20220501 (https://download.01.org/0day-ci/a=
>> rchive/20220504/202205041011.jv6vuDe4-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a=
>> 645a1e30011cc8da624f13dac5fd915628)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
>> make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/intel-lab-lkp/linux/commit/60cfe4571b04ef4ca2e=
>> 34793fbad737bb43dc0c6
>>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review SeongJae-Park/mm-damon-sysfs-fix-p=
>> id-leak-under-fvaddr-ops-use-case/20220504-060657
>>          git checkout 60cfe4571b04ef4ca2e34793fbad737bb43dc0c6
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
>> 1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash mm/damon/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> mm/damon/sysfs.c:2089:20: error: use of undeclared identifier 'DAMON_OPS=
>> _FVADDR'; did you mean 'DAMON_OPS_VADDR'?
>>                                     ctx->ops.id =3D=3D DAMON_OPS_FVADDR)
>>                                                    ^~~~~~~~~~~~~~~~
>>                                                    DAMON_OPS_VADDR
>>     include/linux/damon.h:267:2: note: 'DAMON_OPS_VADDR' declared here
>>             DAMON_OPS_VADDR,
>>             ^
>>     mm/damon/sysfs.c:2206:55: error: use of undeclared identifier 'DAMON_OPS=
>> _FVADDR'; did you mean 'DAMON_OPS_VADDR'?
>>             if (ctx->ops.id !=3D DAMON_OPS_VADDR && ctx->ops.id !=3D DAMON_O=
>> PS_FVADDR)
>>                                                                  ^~~~~~~~~~~=
>> ~~~~~
>>                                                                  DAMON_OPS_V=
>> ADDR
>>     include/linux/damon.h:267:2: note: 'DAMON_OPS_VADDR' declared here
>>             DAMON_OPS_VADDR,
>>             ^
>>     2 errors generated.
>>
>>
>> vim +2089 mm/damon/sysfs.c
>>
>>    2082
>>    2083  static void damon_sysfs_destroy_targets(struct damon_ctx *ctx)
>>    2084  {
>>    2085          struct damon_target *t, *next;
>>    2086
>>    2087          damon_for_each_target_safe(t, next, ctx) {
>>    2088                  if (ctx->ops.id =3D=3D DAMON_OPS_VADDR ||
>>> 2089                                  ctx->ops.id =3D=3D DAMON_OPS_FVADDR=
>> )
>>    2090                          put_pid(t->pid);
>>    2091                  damon_destroy_target(t);
>>    2092          }
>>    2093  }
>>    2094
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
>>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
