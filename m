Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F381D2A8
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 09:25:40 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4572fc781daso906091e0c.2
        for <llvm@lists.linux.dev>; Tue, 23 May 2023 02:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684833939; x=1687425939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uN17lpJppLHyVvY0f+t4p7dd0oKu5S+/bhEzLex37ec=;
        b=bjDycL63N88EGlG+VX8Yx8Montns5WyvjfTAETehrRtpMHEdbJ9l5ha5ciCAWI5yEF
         c/Gae83DGvRDomSt0mP9Dh5YizBIcdkDGwpOjGKSEsnKrzQJ/lfcLoxnjJLK4r5rlVG3
         n0g4Ga9qLHcSnPOAueKzgXPaY63+fihE9RVTrx3jCrvwXkuZ787f5RI8JEDKmsPyAOJ2
         nbZCz1ItMzhQZwfheO/z7HA/GgaM56Go/jDV15kQfGyHPRp3aHijezl3djSLN2jqmlY/
         mMh7Hgay2ZxvLPSm8Ip2L9/ZYcpMmpahhMw//++tG2BYqVPQdTvANjoljJ9dw9NEZB2B
         Pg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833939; x=1687425939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN17lpJppLHyVvY0f+t4p7dd0oKu5S+/bhEzLex37ec=;
        b=FiuByT/IjfnrNmXOYsj1ZoD4MANEZAauD35WJklktqv0Ff0IPFqcbBAt073tNjwwr9
         b6mC+Z/BTuzsu4oaQnBxEzMVV6Bvf6R6SaA8q0rwgRLAYzF7i/m7nE5Nn5UUZt9N/7rB
         IMOSurwE/7aS2eNS1BtyEG0XyOOnJ7PprFpgWQhhbUyEVf6+C0kb5MO7BY6p7yDeyCjG
         +mPwy9JWLX3twTdOmiHNMD5l7GLgH8WlU1NwG3gp1Zv92R2LKzSq7K3VIyPZOOKDqwz8
         23xBwocDeRcqlffgdV16glMBmgVRwYNa+E3K1AUVOCh/6j2swaws4b5na16VUIP5D/9D
         FemA==
X-Gm-Message-State: AC+VfDzImrld5k1y+B3XUVNs2k6SiyYA/sYrVjFcpWeQjd+Mzb91twRC
	NIn6LXHP7HDbn6TEl4MuaSlH/YaLGZoiGrdXZhcL3A==
X-Google-Smtp-Source: ACHHUZ7ny/5EqZ30sVNJAfPXNTsNLZu4nr4f64yMukVnu/zcnPUCISy1uz6X5BezKtD1XxrPR6AVVXA83L9hha8txto=
X-Received: by 2002:a1f:3f88:0:b0:457:1a8:9ea4 with SMTP id
 m130-20020a1f3f88000000b0045701a89ea4mr4738542vka.3.1684833939092; Tue, 23
 May 2023 02:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYud2YH1c9Hxekd-pi8VsD4HmA4v9g-mr-vRPqaRQd2F5w@mail.gmail.com>
 <CALm+0cXew-QX9gkHkL7majJuENP1C_WLVG=pQ_6RGZ1UgQ79Eg@mail.gmail.com>
 <ZGuydp0KToLf55vY@slm.duckdns.org> <ZGvap5qi0OKAOfqX@slm.duckdns.org>
In-Reply-To: <ZGvap5qi0OKAOfqX@slm.duckdns.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 May 2023 14:55:27 +0530
Message-ID: <CA+G9fYs8Oa8sS97H8LdAOv=k9tJVuikekbqh_E57vEUVcvk_4A@mail.gmail.com>
Subject: Re: next: WARNING: CPU: 0 PID: 63 at kernel/workqueue.c:1999 worker_enter_idle+0xb2/0xc0
To: Tejun Heo <tj@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
Cc: Z qiang <qiang.zhang1211@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 May 2023 at 02:42, Tejun Heo <tj@kernel.org> wrote:
>
> On Mon, May 22, 2023 at 08:20:38AM -1000, Tejun Heo wrote:
> > Hello,
> >
> > On Mon, May 22, 2023 at 09:24:09PM +0800, Z qiang wrote:
> > > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > > index 9c5c1cfa478f..f8d739fef311 100644
> > > --- a/kernel/workqueue.c
> > > +++ b/kernel/workqueue.c
> > > @@ -1060,10 +1060,9 @@ void wq_worker_running(struct task_struct *task)
> > >          * and leave with an unexpected pool->nr_running == 1 on the newly
> > > unbound
> > >          * pool. Protect against such race.
> > >          */
> > > -       preempt_disable();
> > > +       local_irq_disable();
> > >         if (!(worker->flags & WORKER_NOT_RUNNING))
> > >                 worker->pool->nr_running++;
> > > -       preempt_enable();
> > >
> > >         /*
> > >          * CPU intensive auto-detection cares about how long a work item
> > > hogged
> > > @@ -1072,6 +1071,7 @@ void wq_worker_running(struct task_struct *task)
> > >         worker->current_at = worker->task->se.sum_exec_runtime;
> > >
> > >         worker->sleeping = 0;
> > > +       local_irq_enable();
> > >  }
> >
> > Ah, yeah, this is correct. Now we're modifying nr_running from timer tick
> > too, so if don't block irq, the timer tick can ruin the not-irq-protected
> > read-write-modify nr_running update from wq_worker_running(). Naresh, can
> > you please confirm the fix?
>
> Z qiang, while waiting for Naresh's test result, can you send the fix as a
> proper signed-off-patch?


The proposed patch applied on top of Linux next and boot tested for
more than 100 times and is still running in a loop by Anders.

The reported warning did not reproduce again.

Tested-by: Anders Roxell <anders.roxell@linaro.org>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


- Naresh


>
> Thanks.


>
> --
> tejun
