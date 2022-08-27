Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC097C
	for <llvm@lists.linux.dev>; Sat, 27 Aug 2022 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661583909; x=1693119909;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=MeyfiG1WV/G+fVqDdCE4FjaLpNOunPp15e4AIulnecM=;
  b=HVygoC3m4uhg1emZBoALA+pa/DoOuPfDVgx4dltTpiHjD3XFdUF6aXPu
   R/JuOwQghgUX1R6lvfDowZfhrYQ/PuDmkpzjBIgTTAg5+5d1JNXCQYJEr
   ZsVJmvUYUCOZ73MKUbRwhz5BxFVbgTW8Hzru9zZc0WK2FdEf2HKob23z9
   nZwrfKJcKzySvFv8ecs8Wxvjk+hZ3zeFhvrPFroOOHfUIRW1ULM2vX/5w
   pIQKsaOPuBJUKKr6J1ODeZ5hPZLZodB9PK+hSmZDIwgGTcGHPiS0wSeFB
   jgdIHoC6soK1b+zcoZDj1OJS3rOcbLPPhdDAT3QAAZM6ozxWCP1xrtVl7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="380946311"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="380946311"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2022 00:05:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="671745348"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.52.233])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2022 00:04:48 -0700
Message-ID: <0026becb-4e17-9e5f-0f59-9796d689c238@intel.com>
Date: Sat, 27 Aug 2022 10:04:44 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v4 00/18] Mutex wrapper, locking and memory leak fixes
Content-Language: en-US
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria
 <ravi.bangoria@amd.com>, Dario Petrillo <dario.pk1@gmail.com>,
 Hewenliang <hewenliang4@huawei.com>, yaowenbin <yaowenbin1@huawei.com>,
 Wenyu Liu <liuwenyu7@huawei.com>, Song Liu <songliubraving@fb.com>,
 Andrii Nakryiko <andrii@kernel.org>, Dave Marchevsky
 <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>,
 Kim Phillips <kim.phillips@amd.com>,
 Pavithra Gurushankar <gpavithrasha@gmail.com>,
 Alexandre Truong <alexandre.truong@arm.com>,
 Quentin Monnet <quentin@isovalent.com>, William Cohen <wcohen@redhat.com>,
 Andres Freund <andres@anarazel.de>, =?UTF-8?Q?Martin_Li=c5=a1ka?=
 <mliska@suse.cz>, Colin Ian King <colin.king@intel.com>,
 James Clark <james.clark@arm.com>, Fangrui Song <maskray@google.com>,
 Stephane Eranian <eranian@google.com>, Kajol Jain <kjain@linux.ibm.com>,
 Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>,
 Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Zechuan Chen <chenzechuan1@huawei.com>, Jason Wang <wangborong@cdjrlc.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
References: <20220826164027.42929-1-irogers@google.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20220826164027.42929-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/22 19:40, Ian Rogers wrote:
> When fixing a locking race and memory leak in:
> https://lore.kernel.org/linux-perf-users/20211118193714.2293728-1-irogers@google.com/
> 
> It was requested that debug mutex code be separated out into its own
> files. This was, in part, done by Pavithra Gurushankar in:
> https://lore.kernel.org/lkml/20220727111954.105118-1-gpavithrasha@gmail.com/
> 
> These patches fix issues with the previous patches, add in the
> original dso->nsinfo fix and then build on our mutex wrapper with
> clang's -Wthread-safety analysis. The analysis found missing unlocks
> in builtin-sched.c which are fixed and -Wthread-safety is enabled by
> default when building with clang.
> 
> v4. Adds a comment for the trylock result, fixes the new line (missed
>     in v3) and removes two blank lines as suggested by Adrian Hunter.
> v3. Adds a missing new line to the error messages and removes the
>     pshared argument to mutex_init by having two functions, mutex_init
>     and mutex_init_pshared. These changes were suggested by Adrian Hunter.
> v2. Breaks apart changes that s/pthread_mutex/mutex/g and the lock
>     annotations as requested by Arnaldo and Namhyung. A boolean is
>     added to builtin-sched.c to terminate thread funcs rather than
>     leaving them blocked on delted mutexes.
> 
> Ian Rogers (17):
>   perf bench: Update use of pthread mutex/cond
>   perf tests: Avoid pthread.h inclusion
>   perf hist: Update use of pthread mutex
>   perf bpf: Remove unused pthread.h include
>   perf lock: Remove unused pthread.h include
>   perf record: Update use of pthread mutex
>   perf sched: Update use of pthread mutex
>   perf ui: Update use of pthread mutex
>   perf mmap: Remove unnecessary pthread.h include
>   perf dso: Update use of pthread mutex
>   perf annotate: Update use of pthread mutex
>   perf top: Update use of pthread mutex
>   perf dso: Hold lock when accessing nsinfo
>   perf mutex: Add thread safety annotations
>   perf sched: Fixes for thread safety analysis
>   perf top: Fixes for thread safety analysis
>   perf build: Enable -Wthread-safety with clang
> 
> Pavithra Gurushankar (1):
>   perf mutex: Wrapped usage of mutex and cond

For all patches except 9 and 16

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

