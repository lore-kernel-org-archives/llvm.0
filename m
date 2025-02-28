Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A0B2571B6
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735607; cv=none; b=cTbAS3jf73F9P08tVVWEvTkxA66kaSIKe5JUuROO5lwQYuYHqa1Giir7OFYCk8HUte4bisWT6Z6y5Y7b+v75KkY4PMFCQx5UlfxnukK2GEqZ4I6NU4bGOsFEkE3rZ1j387nQC1Yr4qBX1gF70sZ5LqMLpox7Wo1WUsutSmfDti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735607; c=relaxed/simple;
	bh=jhz82RvVzyiQLMtJQTWrNZtw1IYfqIhWh8BJ5W61178=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXoKG+f3xPqy8FZjaLZ+g2iuOeZQCvtkL5XMbUL1k5jeANvqGLuir/1VUFEU1S1FAheXMShbWA5OzrXu+cO/WQYMDdbp+opSZatOg22i6CHRbqV2uIpHjlBwtISUFas8BBfYsnvxI4DoCiS7Xbrj3QZDfoJ2b3221R9s5M0V5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=BUHkVzx0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="BUHkVzx0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220d132f16dso26973495ad.0
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1740735604; x=1741340404; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qkbc9XEy6C+0jcTwS61uK3JCiWkcPjp4DERglnhfPgg=;
        b=BUHkVzx0CIFDN2b8z2E2SKrZJEEnojWwRn6kX9Gfq48+flAb9GyLRjxh1IM64+9lfk
         Hr6+upeqQinaFXjZvZQ+46EmwODm+SimPGMm5zTswiXKtd5w+XcI3zs7wChmU514kR73
         SFIkE7XJrl0pTyFI6HIQcBuP4iHAHcfghtVRQFx7RrtLC5UekAv9vlCumCYofUHdol7D
         U994vySMibFtt6ebcYZwsslq5Y6EHm2cA3vIvMmaTtajKKHM47CTLHdyZW4Z7q24Sd/F
         AsQaiuhzBnVH/nyar2XeTWKngWQwRqB9Eg94g3bqwBXfwde53gkCowxbLpD/AYxlL1+y
         wVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735604; x=1741340404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qkbc9XEy6C+0jcTwS61uK3JCiWkcPjp4DERglnhfPgg=;
        b=Sn5fR5/NUmrekhAmBZebBw4r94DFwF1PvKtH10pYkfBo8LSfv/mFjoT7QEe1etf0er
         uN/FF+UeGORaw6SF2Yf3hMXUoc4O2F3Jww1uXfgb9WCeRH8UpoFYGi1DZMl5IDPKH8EQ
         7oCkv44lJpl1QLvviFE4B3XeYttN6+SjszE2hs6vshFXaG5QbPMKuM2+VBuo4id295Aj
         YJ940jbsVKipJRpYYJOvnmglKDiD2gTv9tuZfskPHij1RVJPoe6FCgoEDmexuoN6BQsm
         ezFoUnZC+dnPo/V6EVSABCvGHOhBOkjeI6RPrbr9lSCr50CVq4DpO0VMV/fcST7QDauN
         sJ/Q==
X-Gm-Message-State: AOJu0YweHuVK0LUIcath22y2F1nWSzd9XOSPwunXlE9+Mji8ZUJRZsCO
	huPpwjnGXNxUncgseHeBE8aNeBX3vI0Bf64zK7cnTQ913srqxWxY4EnalgRDi70=
X-Gm-Gg: ASbGncufG8e5lOKh0422mCdqeCW98OxIhzCQMFXsWpZkai/xRCvFktP3gCxArQWdrPL
	hmThinI3wJpYyxN7CNGTfmDS4Sd1/p2agcx1Dqg2Ly4BsyJL6yZEpFAhmY6jepBNenZqkxD4/BG
	9fwrFFbaAzvGPZznTdxFn2a1ggsMDQ+Tv9MmXK1WeyCZfO6d/zAYaH6712jsCWXX7kX3kpeYbYB
	q9dKgZ7fLKgdU6nnuv/5Sq/i0iMg8iSkvTl4/eoF9d+j4GMYftZxGQNlSwIgu/ARyZdcbBjzgcH
	8BygoTG8DuEeqI3B1mqbiwcQM/0+fvSLcd9IZQAMqEY3d3bKuxrlgoxMaILiN8kNre1S/VR/C+s
	NJGmdV/DUew==
X-Google-Smtp-Source: AGHT+IFRvcDz6r7R/xMUnjhtV5WGhBE599lKZUBAJlYVzrjEDsERuXhyjBPqQoU2LaxGFCl5e4C8HA==
X-Received: by 2002:a17:902:f711:b0:221:7e36:b13e with SMTP id d9443c01a7336-22368fbe9fbmr48242245ad.12.1740735604436;
        Fri, 28 Feb 2025 01:40:04 -0800 (PST)
Received: from [10.54.24.77] (static-ip-148-99-134-202.rev.dyxnet.com. [202.134.99.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505336f9sm29370095ad.245.2025.02.28.01.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:40:03 -0800 (PST)
Message-ID: <8c7ec350-9576-4291-915a-1224086e0922@shopee.com>
Date: Fri, 28 Feb 2025 17:40:00 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] io_uring: fix the dead lock between io_uring and core dump
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20250226113936.385747-1-haifeng.xu@shopee.com>
 <202502280245.WT5bW0xf-lkp@intel.com>
From: Haifeng Xu <haifeng.xu@shopee.com>
In-Reply-To: <202502280245.WT5bW0xf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/2/28 02:24, kernel test robot wrote:
> Hi Haifeng,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on brauner-vfs/vfs.all linus/master v6.14-rc4 next-20250227]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Haifeng-Xu/io_uring-fix-the-dead-lock-between-io_uring-and-core-dump/20250226-194045
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20250226113936.385747-1-haifeng.xu%40shopee.com
> patch subject: [RFC] io_uring: fix the dead lock between io_uring and core dump
> config: i386-buildonly-randconfig-003-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280245.WT5bW0xf-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280245.WT5bW0xf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280245.WT5bW0xf-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/core.c:10:
>    In file included from include/linux/highmem.h:8:
>    In file included from include/linux/cacheflush.h:5:
>    In file included from arch/x86/include/asm/cacheflush.h:5:
>    In file included from include/linux/mm.h:2224:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/sched/core.c:6791:40: error: no member named 'io_uring' in 'struct task_struct'
>     6791 |         struct io_uring_task *io_uring = tsk->io_uring;
>          |                                          ~~~  ^
>    2 warnings and 1 error generated.
> 
> 

The CONFIG_IO_URING isn't enables, so 'io_uring' can't be found in 'struct task_struct'.
I'll post a new version later.

> vim +6791 kernel/sched/core.c
> 
>   6786	
>   6787	static inline void sched_submit_work(struct task_struct *tsk)
>   6788	{
>   6789		static DEFINE_WAIT_OVERRIDE_MAP(sched_map, LD_WAIT_CONFIG);
>   6790		unsigned int task_flags;
>> 6791		struct io_uring_task *io_uring = tsk->io_uring;
>   6792	
>   6793		/*
>   6794		 * Establish LD_WAIT_CONFIG context to ensure none of the code called
>   6795		 * will use a blocking primitive -- which would lead to recursion.
>   6796		 */
>   6797		lock_map_acquire_try(&sched_map);
>   6798	
>   6799		task_flags = tsk->flags;
>   6800		/*
>   6801		 * If a worker goes to sleep, notify and ask workqueue whether it
>   6802		 * wants to wake up a task to maintain concurrency.
>   6803		 */
>   6804		if (task_flags & PF_WQ_WORKER)
>   6805			wq_worker_sleeping(tsk);
>   6806		else if (task_flags & PF_IO_WORKER)
>   6807			io_wq_worker_sleeping(tsk);
>   6808		else if ((task_flags & PF_DUMPCORE) && io_uring) {
>   6809			struct io_wq *wq = io_uring->io_wq;
>   6810	
>   6811			io_wq_cancel_tw_create(wq);
>   6812		}
>   6813	
>   6814		/*
>   6815		 * spinlock and rwlock must not flush block requests.  This will
>   6816		 * deadlock if the callback attempts to acquire a lock which is
>   6817		 * already acquired.
>   6818		 */
>   6819		SCHED_WARN_ON(current->__state & TASK_RTLOCK_WAIT);
>   6820	
>   6821		/*
>   6822		 * If we are going to sleep and we have plugged IO queued,
>   6823		 * make sure to submit it to avoid deadlocks.
>   6824		 */
>   6825		blk_flush_plug(tsk->plug, true);
>   6826	
>   6827		lock_map_release(&sched_map);
>   6828	}
>   6829	
> 

