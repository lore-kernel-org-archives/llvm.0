Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D180514E2E9;
	Fri, 30 Aug 2024 17:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040518; cv=none; b=fY74x+GmEdNbAHUJuPw1LBUbdaMyOA+nUEHRiQhwsoz31uUHRB/tLgb2X4ui2HWlYf11C9WOrz/NIYr8RI8UZ9Dh/jQ8B7Jg94uDqj5yPK78PpoHOaBwvcecfyTNu95t6jDStqqWBUBcbgs+wtsG1RkfRUmb6m0MLC/s6i8hKig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040518; c=relaxed/simple;
	bh=f3THC0pBTuv9SAl7dOz57STAiV+tmA1lLWhuX8fg/Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/cOd660UJplb/JgHwnp3qXt/grRLZz8ineClIojOZIRyouhQCkr2fNS+mtYALs3VwX59raAm5T5To7GwtiEie4sQGK4WlrzuQ2CCE0zfXhdbu6AMXTvHJMTCmHEL2tQ0u4UWBsa8hcL0Wo5Pwa/bYb+6ZPKI/e4FVk6v64FrlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4CWd+3S; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4CWd+3S"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7cf6641765dso1603501a12.1;
        Fri, 30 Aug 2024 10:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725040516; x=1725645316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ762szQ1qEpWPo0O5KQwapOAPZbS/knJpSelWgCLe8=;
        b=B4CWd+3S9tySTaTPgmnNoTLwkqfz2Ny2cz8P0b1HWnaD36shDHb90XO4/A6aeKyzvp
         hhXMX5QoyBhaaifsnvWWUQxVo2l0Zj/XmtP1NJ9Dy4px4E2N6vfqSGoYDqSR8Mn9LGZ1
         rQQ7hBlIP2YYWsXhndAcjhxpzUgU6MH1hUq4N3/U0Ms/abil35WdqrtP/UNkXaTS28u/
         tkTBm6mFCWN3zJVjykF5l/Gv3QBpcUT9Ep/KQmFseFgO9WVWmdmMjR3n5Rb/slR3zTUo
         0uWSX0v6c7N0teU6VW6prQFsZr2RWRNgY9JyTz4nwKNuJSAQX3PAfyfW+VKVtICssPY6
         EnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725040516; x=1725645316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZ762szQ1qEpWPo0O5KQwapOAPZbS/knJpSelWgCLe8=;
        b=pTRD0RbPVvhpozwnT3xVV4khXHjGZ8pyYstIpRve6u6f6aTI/smxYAFVJKHXZgY2op
         nATsVIbBGCIx7Z4ERdsvkA50AUQf8txbwqKm3qUsVtbYccqWeuTH48qC40KrxZgVIJgi
         NxnBo9sZmu5X7LKJPAEWdI5S9XB6L1lL8dNTAuJnluBHKJh95kzC7VEsqnN03Vc7hAQu
         pIadGIU49/4HGiTcVG0e2Mz9+VLF7LblZnwOsOyTvlp5ejBeMdmClPgWdoheGW/hNMH+
         3kfGr4rfPHqz6Vf5rJRpEn11CGlZXPDnpxfL4kr1S9Ed+Z4QwlpTM37kn2eClA9SlEsj
         OOsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJJAyLzuwErSTqoYIePbLxM3bFG4EbgZdu6fThdG58tikJm55jTY4t4uGVjtHMMV5GyCWg@lists.linux.dev, AJvYcCXcYxXhFphIJlw/u1WMmHzn1JuZNfCdN4m0oXS5WoQhilut26ZzOzMyZeRncr1BtTrDL90AnnjSV13TedNuIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxF7kIBY0JqGOHcAq9+etNeftNc8qM0jvueqIkv43hFN4LKS/aM
	JbJm4Y7Smg3QEPw3WDsiQabpBzUlyzOWn+rdjuQ2HtEtimtPMPP8PGeCtQaZlIVnwwLo4CbSQtk
	HODSds2abKlA+4NtBLIUGnQSXVzQ=
X-Google-Smtp-Source: AGHT+IHtJjX1Gwk7q65iKPb2jj2ZTbFe6Gbjk0MA9s/QRUze7TuxIpE1CDYdoK+SEpOHhavyYH0EIzF6ReAgjG7xuJ8=
X-Received: by 2002:a17:90a:ce90:b0:2d8:6f73:55a with SMTP id
 98e67ed59e1d1-2d86f7305edmr2818362a91.25.1725040515970; Fri, 30 Aug 2024
 10:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240829183741.3331213-9-andrii@kernel.org> <202408310130.t9EBKteQ-lkp@intel.com>
In-Reply-To: <202408310130.t9EBKteQ-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Aug 2024 10:55:04 -0700
Message-ID: <CAEf4BzYiSfyZky+Axab6BwN55cyoY9N-0p7DA9R2OFr=ZdjS5Q@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] uprobes: switch to RCU Tasks Trace flavor for
 better performance
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, linux-trace-kernel@vger.kernel.org, 
	peterz@infradead.org, oleg@redhat.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rostedt@goodmis.org, mhiramat@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, jolsa@kernel.org, 
	paulmck@kernel.org, willy@infradead.org, surenb@google.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 10:42=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Andrii,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/perf/core]
> [also build test ERROR on next-20240830]
> [cannot apply to perf-tools-next/perf-tools-next perf-tools/perf-tools li=
nus/master acme/perf/core v6.11-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/up=
robes-revamp-uprobe-refcounting-and-lifetime-management/20240830-024135
> base:   tip/perf/core
> patch link:    https://lore.kernel.org/r/20240829183741.3331213-9-andrii%=
40kernel.org
> patch subject: [PATCH v4 8/8] uprobes: switch to RCU Tasks Trace flavor f=
or better performance
> config: i386-buildonly-randconfig-004-20240830 (https://download.01.org/0=
day-ci/archive/20240831/202408310130.t9EBKteQ-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a=
15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240831/202408310130.t9EBKteQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408310130.t9EBKteQ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> kernel/events/uprobes.c:1157:2: error: call to undeclared function 'sy=
nchronize_rcu_tasks_trace'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>     1157 |         synchronize_rcu_tasks_trace();
>          |         ^
>    kernel/events/uprobes.c:1157:2: note: did you mean 'synchronize_rcu_ta=
sks_rude'?
>    include/linux/rcupdate.h:206:6: note: 'synchronize_rcu_tasks_rude' dec=
lared here
>      206 | void synchronize_rcu_tasks_rude(void);
>          |      ^
>    1 error generated.

Missing #include <linux/rcupdate_trace.h>, will add.

>
>
> vim +/synchronize_rcu_tasks_trace +1157 kernel/events/uprobes.c
>
>   1145
>   1146  void uprobe_unregister_sync(void)
>   1147  {
>   1148          /*
>   1149           * Now that handler_chain() and handle_uretprobe_chain() =
iterate over
>   1150           * uprobe->consumers list under RCU protection without ho=
lding
>   1151           * uprobe->register_rwsem, we need to wait for RCU grace =
period to
>   1152           * make sure that we can't call into just unregistered
>   1153           * uprobe_consumer's callbacks anymore. If we don't do th=
at, fast and
>   1154           * unlucky enough caller can free consumer's memory and c=
ause
>   1155           * handler_chain() or handle_uretprobe_chain() to do an u=
se-after-free.
>   1156           */
> > 1157          synchronize_rcu_tasks_trace();
>   1158  }
>   1159  EXPORT_SYMBOL_GPL(uprobe_unregister_sync);
>   1160
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
