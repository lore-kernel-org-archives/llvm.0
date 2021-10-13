Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EDF2C81
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 06:18:50 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id s3so1532292ild.0
        for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 23:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2Vb9i/PJ7w2kwE75H5UZs8Spnuuytnn4odzwjotJmY=;
        b=HBrrRoV6b/HfdG2UOPggH8S8KCDaj1WWPMVafGBe/8Q59pxiC/Jj5XIOIS9sVm3C9c
         694X/sdc0Loy2JcTBl+qLxcH9elOpwIugBv7i6kVl89QyqOroaEZkD8TwPmdbpUWv6F1
         FxpSNRtABHzHKIdjKFJjo75h6/QFcQpHRQ//ICfURQVoYJ8HV/4WXIBo4Pw/fhVs1dwS
         AIT2THjJ5bN6Z8HcHvRNUJTvQrp8Ca9MQNunI7gkW+nl9Ad+EqluRQC60ShF4HiSXL0/
         zv0ABMvKJOs3LnQEev20N5v7X8yc7BWK84QJfgviuifqWDMlx9fmpCTchSCmztpzXcEt
         x48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2Vb9i/PJ7w2kwE75H5UZs8Spnuuytnn4odzwjotJmY=;
        b=lgkRjSI3ihvJnDhYW7lOTGFz0ZRm8bnXijv2RxtLawSolNorfd1XhhXhNrsiB5oXv8
         rWAKj9LCGhI3+AY5Dnj4BUnNm4S0uJnAOdGgFiV0hFuYrH8fhYbybFvuqfwyNgMkMWJT
         7iEAMaxmrKyU+6+arex4Y97eXgoCnisI0QyrsFkbtCDHETxQSH1ClzLi+R9G6X88oaAS
         7ewpAv3WbnxPXBEq60jGC891kp6IChhMS0Cgxjv0Cwx0+7fd8eZNZNrKxwV1GN6Mm7hq
         nhfCJ9xitlUTghPuhqVIO9kP6JpHHdKSCOiN8avuy/WJfB5QrVG7wCCH0QATB41dO79H
         rHqg==
X-Gm-Message-State: AOAM531G3OAcQnUjwWmNiRQvuy7fKJ3TzFRiokvxe/kdiwMDFK/SwQFW
	g7+CItm1F5BkFEJPBZ4tYb+R6QYaKJhVlc9U3Sc=
X-Google-Smtp-Source: ABdhPJyPhvVd5LK+pODg3+wLQ9oQmq6s5LWY9R5KLOxEu65VNkSbHrHPMNrGt1xNtn2yHIC9Hzv5FHkXh6ekPPvHM4I=
X-Received: by 2002:a92:c009:: with SMTP id q9mr13987273ild.131.1634105928954;
 Tue, 12 Oct 2021 23:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110121132.N2z9JrD0-lkp@intel.com> <YWVw/oVd5ztGZDAK@hirez.programming.kicks-ass.net>
 <YWWPLnaZGybHsTkv@hirez.programming.kicks-ass.net>
In-Reply-To: <YWWPLnaZGybHsTkv@hirez.programming.kicks-ass.net>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 13 Oct 2021 14:18:13 +0800
Message-ID: <CALOAHbDkBn3LDsNvSXujMiQXrLHdRsfvJUqJv_eTh4s63osuTw@mail.gmail.com>
Subject: Re: [tip:sched/core 14/47] kernel/sched/fair.c:893:22: error:
 variable 'p' set but not used
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	LKML <linux-kernel@vger.kernel.org>, x86 <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 9:35 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Oct 12, 2021 at 01:26:54PM +0200, Peter Zijlstra wrote:
>
> > Again, I have absolutely no intention of fixing this. IMO this is the
> > compiler being a total pain in the arse.
> >
> > Please stop reporting this.
>
> How's this then?
>
> diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
> index 978fcfca5871..b0d9121c5dce 100644
> --- a/kernel/sched/Makefile
> +++ b/kernel/sched/Makefile
> @@ -3,6 +3,10 @@ ifdef CONFIG_FUNCTION_TRACER
>  CFLAGS_REMOVE_clock.o = $(CC_FLAGS_FTRACE)
>  endif
>
> +# The compilers are complaining about unused variables inside an if(0) scope
> +# block. This is daft, shut them up.
> +ccflags-y += -Wno-unused-but-set-variable
> +
>  # These files are disabled because they produce non-interesting flaky coverage
>  # that is not a function of syscall inputs. E.g. involuntary context switches.
>  KCOV_INSTRUMENT := n

After this diff, the warnings disappear.

Tested-by: Yafang Shao <laoar.shao@gmail.com>

-- 
Thanks
Yafang
