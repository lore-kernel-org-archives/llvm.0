Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95D62C81
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 18:43:15 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id r26so16258134oiw.5
        for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 10:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsHgrt3f1EilcZuTcpPj1Uibbk6NZSW0KCEvWuPSgaA=;
        b=dfb4NHDvEkj3BC0fHWPSnJOucM9uBQPYun5TISX7bpUpB0jCAJwUVcP5N9FTAKhQe5
         3bT/dFWcq+5RZJY8na+AdpyJt6bvMK3CAxHElXXCraHes83ilGYVcaIw0NRDLjZllGME
         9rOj5iWZgQF1lvJ0+c/c2AgdOds4WnUYGL6/jE9MNLmiSKbBexf7yej741WRfqi/sHie
         1ROChNXPDL1LLWq+RrR1gHEwwfTy1kh4+KGx1workcrW3ZpqK/gz5TTnrr2Y9dgVeLBo
         +bUq6ZnYvYiMFnye2VqGFtkt+RF8fWOG6fE8xtDUWqe6OgLEhg6tMN6/GcBDZOoGwx5d
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsHgrt3f1EilcZuTcpPj1Uibbk6NZSW0KCEvWuPSgaA=;
        b=oQqchJYrwNb82FuW/f5Bkbdes7v4ea2tWS1gAiW/3p9+zubOb6HkDtaPY2efQ/q+GF
         NGW9aMVJByiOz1nFTNHS8IA8x/3wfaf8zW07UHypVm061rzbeCKEa/LhSj32Rh1HZrqg
         OUhRARo8LvvHq6EPQfLqI7hd+T6EOfy3nZVuwLwoLPi2Puujum/49R3+idK7Py72yRX6
         afMiOf6sqNc46mGQ5GTfIjbsGXeDGwUuMERV9RZsEIoD4SVY8A1Qi0y81cug+DAXPrnf
         gzM65n1QCT0lzXzgPvqvSpN5ZotxpQQMyzNDlKOCUUOL+cR687TbXR6aRZ8xmSJyXX6T
         pe2g==
X-Gm-Message-State: AOAM533+8GG5l2PFEGlc5Ds+L9K5cgGi4wf4nn7avV4qDtQ6m4gwhWiU
	tpI4XFfEScOZxO4x+9db9jt97mSN9vn/zEO2hhFxGw==
X-Google-Smtp-Source: ABdhPJw6w0Zi8W9bt5228Ldv0ZCK8SRbrpkPWfvrUH89RTZAP9oilxdXqZv6iwBHs+Ol+3+gMO/PVdwFbqZjbjRk+f4=
X-Received: by 2002:a05:6808:3012:: with SMTP id ay18mr10076246oib.88.1637260994768;
 Thu, 18 Nov 2021 10:43:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADYN=9+_UU9qZX56uahGXxz00iayqJLRAaQrRXh1CMXTvwSbAg@mail.gmail.com>
 <20211118095852.616256-1-anders.roxell@linaro.org> <20211118095852.616256-2-anders.roxell@linaro.org>
 <CADYN=9+drOj6rVjBhB-jVQ+UXgw3ue0tz04ejHih7qRhL6Km1A@mail.gmail.com>
In-Reply-To: <CADYN=9+drOj6rVjBhB-jVQ+UXgw3ue0tz04ejHih7qRhL6Km1A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 18 Nov 2021 10:43:02 -0800
Message-ID: <CAKwvOdmKebwN436byQd4FY=wCBmrHdE=R4g-y=1ENKV5Mdw7MA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] selftests: clone3: simplify return logic in clone3_set_tid()
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	john.stultz@linaro.org, tglx@linutronix.de, akpm@linux-foundation.org, 
	nathan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	christian@brauner.io
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 2:03 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> On Thu, 18 Nov 2021 at 10:58, Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > Use ksft_exit_* and exit instead of using goto.
> >
>
> I'm sorry, I should have added Nick to this patch, since he suggested it.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Cheers,
> Anders
>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> > ---
> >  tools/testing/selftests/clone3/clone3_set_tid.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
> > index a755fcd3af89..1b950c3c3b7c 100644
> > --- a/tools/testing/selftests/clone3/clone3_set_tid.c
> > +++ b/tools/testing/selftests/clone3/clone3_set_tid.c
> > @@ -250,7 +250,8 @@ int main(int argc, char *argv[])
> >                  * that all those tests are skipped as non-root.
> >                  */
> >                 ksft_cnt.ksft_xskip += ksft_plan - ksft_test_num();
> > -               goto out;
> > +               ksft_exit_skip(
> > +                       "Please run the remaining tests as root - Exiting.\n");
> >         }
> >
> >         /* Find the current active PID */
> > @@ -371,9 +372,7 @@ int main(int argc, char *argv[])
> >         close(pipe_2[1]);
> >
> >         if (waitpid(ns_pid, &status, 0) < 0) {
> > -               ksft_print_msg("Child returned %s\n", strerror(errno));
> > -               ret = -errno;
> > -               goto out;
> > +               ksft_exit_fail_msg("Child returned %s\n", strerror(errno));
> >         }
> >
> >         if (!WIFEXITED(status))
> > @@ -390,10 +389,6 @@ int main(int argc, char *argv[])
> >                 ksft_test_result_fail(
> >                         "PIDs in all namespaces not as expected (%d,%d,%d)\n",
> >                         ns3, ns2, ns1);
> > -out:
> > -       ret = 0;
> >
> > -       if (ret)
> > -               ksft_exit_fail();
> >         ksft_exit_pass();
> >  }
> > --
> > 2.33.0
> >



-- 
Thanks,
~Nick Desaulniers
