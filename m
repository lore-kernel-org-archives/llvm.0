Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22BF1855
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 10:18:07 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s14so2068580ljs.3
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIolBCU7gcHiWTJ7Gpz8DTqiA6rqBEHvQmHzGRqousg=;
        b=Tsu50rHkMeDdYBlop1NXOkXacqld+/mROcbAkLLL9IKpVpS0O3IMeEC6FDNB9QY+Cp
         cpVOpFWBaz9xIVZjtXFyQBP4RcWq7dtN/dMivs5vyH0EiZItaddL0DTr+mlDqx4HRBcV
         gjNgyNT2mAKgIRG+ywfq4XeeqVHO4HGodUM5fPjc0rEaFB+Kw5XeQsMbbNuuC/4kLguA
         eRrc6ZZkUt6ZCDHu/b/5XUr9OJalXfaYStCIapCM2GkCXVxYKUu/sJKlGg7o18UvQQXh
         EKVzTOymN4rDUGUQPsqDOljADJSq9ZN3tOlLt3W4YJxchaCvp38lp+XkUv/tTuYyhrsw
         XGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIolBCU7gcHiWTJ7Gpz8DTqiA6rqBEHvQmHzGRqousg=;
        b=cFlv91sdAp5lKkQMVExIMg/09uc4vycAVuGugP4IiBdcGEXgtGuccUkFg6Qwl/5PGx
         jAdP0lIkVZ8EMkn825jYL+HaYd7VCApxRbh5E/BwL5x/7DHld6QxDihwRhu5DIKxU2KK
         lDBBt3HldVRgrdrUdKDuEWI3ORHOryO78pUxy3gcpDdkNiXsT+XmLHo0j94MN+q5Fhtp
         MSlpzl5VM8OoiTzEkGddJxeJ0Arpa8JNXHeAlPH9HwsoMYnduiC5RpV+UpSh6hP/FABu
         u5NViXfGhALhfgagKKbDieQ7O8gHDENYG6RyVhPmRCtjkeh63mTmXxQRuD1evyyjIAsE
         QedQ==
X-Gm-Message-State: AJIora8FAbWN9pBhF+67McOkpGnG31lHoyXLqJMN7qYLTWlFYbR9Sh8T
	FjOGcSMXftVRS+zoUjrjMV8JrJP5lK275beS1VU1
X-Google-Smtp-Source: AGRyM1t3lOfOZoHXwVnMDWhboz8bguGORAaLuR/2mXXUBqIljjrfUi+TFS8tmnoskTXPHfF5tw9dISFc3NVLOay3d08=
X-Received: by 2002:a2e:8794:0:b0:25a:69cc:382d with SMTP id
 n20-20020a2e8794000000b0025a69cc382dmr7582956lji.424.1656670685813; Fri, 01
 Jul 2022 03:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
 <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
 <87mtf7z0rt.fsf@gnu.org> <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
 <CAKwvOdm=_YqBpuBzouqoWHYNe6MMUE10vqF0PUkU=hcOj+UqrQ@mail.gmail.com>
 <B0A01DE7-1B50-479A-92DF-DAFAB3F06E0F@oracle.com> <878rpgpvfj.fsf@gnu.org> <Yr638aOIaaEBPICy@worktop.programming.kicks-ass.net>
In-Reply-To: <Yr638aOIaaEBPICy@worktop.programming.kicks-ass.net>
From: Bill Wendling <morbo@google.com>
Date: Fri, 1 Jul 2022 03:17:54 -0700
Message-ID: <CAGG=3QWbW-Dang49Jx3fyNExWtL8syuMkMJmcPHA7J25cHQ0zw@mail.gmail.com>
Subject: Re: plumbers session on profiling?
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, Ruud van der Pas <ruud.vanderpas@oracle.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Vladimir Mezentsev <vladimir.mezentsev@oracle.com>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Wenlei He <wenlei@fb.com>, 
	Hongtao Yu <hoy@fb.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>, elena.zannoni@oracle.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 1, 2022 at 2:02 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jun 28, 2022 at 07:08:48PM +0200, Jose E. Marchesi wrote:
> >
> > [Added linux-toolchains@vger in CC]
> >
> > It would be interesting to have some discussion in the Toolchains track
> > on building the kernel with PGO/FDO.  I have seen a raise on interest on
> > the topic in several companies, but it would make very little sense if
> > no kernel hacker is interested in participating... anybody?
>
> I know there's been a lot of work in this area, but none of it seems to
> have trickled down to be easy enough for me to use it.

We use an instrumented kernel to collect the data we need. It gives us
the best payoff, because the profiling data is more fine-grained and
accurate. (PGO does much more than make inlining decisions.)

If I recall correctly, you previously suggested using sampling data.
(Correct?) Is there a document or article that outlines that process?

-bw
