Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626EB24819D
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739030329; cv=none; b=nT5rj4bMYKKFWj5k/iNifpDAtWoWxWurwJg5edSdVFbqE9f5Hb1JbmHfnxbDNJUY6AlkcM0NG9f2210Vq+lO59I+aLNgXFJzR4Sa/mzkZLYT8knkbd5f5Glro9QnZUWqWVMSryL77ROVuUivpfNOkDDMBA7ru2uqmZzCaAVrjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739030329; c=relaxed/simple;
	bh=VruUlVMVabBGJe6x03ULqVMChydUyEZ5333+XkGxjCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0BGQwhuENNeqk8tB+He3qy80PL8++V70sghrFEW+0XRboxj2BEyTACg4asOuHBxFqU/VgdI3sTAhxIq6TiIwEz/fWzCFt1NNJue4x7ItLdor7tt5D0kw32zGrVYObYDgveng3YqsOVs83K29Q8s2KYDuBi6uPsDtV1FIVkObAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Tl7yo42d; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Tl7yo42d"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fa0f70bfecso618188a91.2
        for <llvm@lists.linux.dev>; Sat, 08 Feb 2025 07:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739030326; x=1739635126; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnldKxmzBqwKinjZR1oDYDVj5xkQePqA06ZEDoTPiUQ=;
        b=Tl7yo42dcB09oSvdFeaxo6yCQTqT3BDxFeLP6w5mSWQhPZSsdsn1gEygNrwxZITKzk
         JhZg3f6FPDrgwIOxDNxtS6U73kjTvDHbd+QLZjv909iaNBrdepUlnYl2dGm7vDG5A2Jq
         dzXy0rS0EjyAaRMNb3tD+8BN6iCS/smyGmvcSrbT+AZVEAPqaA8/3aRo1Vc0YKL611gF
         YzSm6E90wpPUiJu2hFBE7LJoe18G7fBt5anKLE9sZpARQw4QwlY7X6/+2kgi3QzpCUwz
         OzX6S81gUOTGOWawfnGfCaDRRWht8lzZku5NEDsB+Aj8BCmx5+P51lHqRQCuSDSwiAXP
         AQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739030326; x=1739635126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnldKxmzBqwKinjZR1oDYDVj5xkQePqA06ZEDoTPiUQ=;
        b=uQDRvaRPfiDHcp4MK5pnlCAhdWLxMX9OF5Q0BvfZQ5diZlrEmjW9/v37OhlUbzhABT
         l1Apl9zY8RRT+Id0I5fxREHyr6IzXeUd+VlsvLj/TcTy7LLK3kOVwvxZ9rEaJD51frLQ
         mmIBb+D0jfGxJ6ia/H05ityxbqdWpOZFeXv1mnJQc1YTECFZzCQRkMVbzwnYHRskOv+V
         dkDwtmDacYGi8CFhZI1OeVGBkOF67mtZtMYo5a71DAsxVL4ZApbANG76zzZ/nVT8VzNu
         9RalaN9aEk/lo2vd+eJA/QBk86sNWsPoIg5opl+6J9kiq768+50rweUZ3ROhqQTKpLk4
         /BKQ==
X-Gm-Message-State: AOJu0Yy71wgG4ZSkdXSyalMKkEskI/xmpKWGogCt1B5sBdDc1Q6PYexZ
	X9P9m2Q9VOnhLDTEvPyL+JqhYw/xRE3RhcEnPY+g4ZdTocbZ/kTyQVZZAl/Ovb0=
X-Gm-Gg: ASbGncswsBNtCLm72znOEhCuJPdK9hODVWqGWwL87TMd/8uYbvt85z6orerF2nmNxmO
	0ZyW8xggUXBb/Ujc5SgR+nGbd84HO+L/0zD8+YQgdPFhD1GeT7WszMF807FLgOGUtrk9l+8dJII
	jzBZvmUnLHkwFuv0D5jx1M/kFqW2QawH1h+j4Pbgk0aM84aifHCWPw7aSGhB2X4/cVF1/32N31A
	4f+h/a5nV1lSykfNzHekPF2+jPEE7iMtcE/tbbHyyfGW4hDPTiC6gOBscxgOUE9svPXgXGrHMeI
	L1eia4yIni//9170T+GukCquqv2Vec41f2EJ
X-Google-Smtp-Source: AGHT+IEp3jhINNJbAaq0fhtM3ghHgJhMNzOT+lO6NXSocYRA+5prw0KJxYLU6aLGqfrWgIWd9yeIDQ==
X-Received: by 2002:a17:90b:2243:b0:2ee:d9f2:2acd with SMTP id 98e67ed59e1d1-2fa245452bdmr4474697a91.6.1739030326531;
        Sat, 08 Feb 2025 07:58:46 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad53bff9c82sm1231302a12.37.2025.02.08.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 07:58:45 -0800 (PST)
Message-ID: <f37da359-bad1-4685-aa68-1d2a2d0f8bf3@bytedance.com>
Date: Sat, 8 Feb 2025 23:58:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v3 2/2] cgroup/rstat: Add run_delay accounting for
 cgroups
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Bitao Hu <yaoma@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Chen Ridong <chenridong@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 "(open list:CONTROL GROUP (CGROUP))" <cgroups@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250207041012.89192-3-wuyun.abel@bytedance.com>
 <202502081318.c9fYNNx8-lkp@intel.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <202502081318.c9fYNNx8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/8/25 1:47 PM, kernel test robot Wrote:
> Hi Abel,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tj-cgroup/for-next]
> [also build test ERROR on tip/sched/core akpm-mm/mm-everything linus/master v6.14-rc1 next-20250207]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Wu/cgroup-rstat-Fix-forceidle-time-in-cpu-stat/20250207-121257
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
> patch link:    https://lore.kernel.org/r/20250207041012.89192-3-wuyun.abel%40bytedance.com
> patch subject: [PATCH v3 2/2] cgroup/rstat: Add run_delay accounting for cgroups
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250208/202502081318.c9fYNNx8-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081318.c9fYNNx8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502081318.c9fYNNx8-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from kernel/sched/build_policy.c:19:
>     In file included from include/linux/sched/isolation.h:5:
>     In file included from include/linux/cpuset.h:17:
>     In file included from include/linux/mm.h:2224:
>     include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       505 |                            item];
>           |                            ~~~~
>     include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       512 |                            NR_VM_NUMA_EVENT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       525 |                            NR_VM_NUMA_EVENT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~~
>     In file included from kernel/sched/build_policy.c:59:
>>> kernel/sched/cputime.c:254:22: error: no member named 'rq_sched_info' in 'struct rq'
>       254 |         return cpu_rq(cpu)->rq_sched_info.run_delay;
>           |                ~~~~~~~~~~~  ^
>     3 warnings and 1 error generated.

Oops.. SCHED_INFO can be selected by either TASK_DELAY_ACCT or SCHEDSTATS.
Will fix. Thanks a lot!

> 
> 
> vim +254 kernel/sched/cputime.c
> 
>     251	
>     252	u64 get_cpu_run_delay(int cpu)
>     253	{
>   > 254		return cpu_rq(cpu)->rq_sched_info.run_delay;
>     255	}
>     256	#endif
>     257	
> 

