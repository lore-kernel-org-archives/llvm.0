Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A012C81
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 18:41:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id b1so30326424lfs.13
        for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 10:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VvElXszLwjkIoRUsL1wZhCMOi1Cft0lEphidMFxQYiQ=;
        b=tfhCkOcnElZBYRqGQUCSH+dme82Vpni11cDtKi3sPhbkkXAd4xCGYiujsK1sQhWSoq
         ulNOeLM7vRuMSRokD7ZZvQ7O5gnP0N9lZEN9ysei3a0EkPz4mo09Dm3YdgRHgVuiyehn
         YH8BPvQuYg7f7X2WYp1EjztWMGdgtNERicEr22IHuDMEEbPNc5jhkgujxXi7C8mJFaR/
         E5yXBvJUT33JTk6RDh3W4m4jatPtG/XB9nTtluDfDSgnMHmeQfkw0QuvcFo/7AWWzSSN
         O2cgAJGTW/7vF1RfNusft5yTt6hz4uo9+7LT+4cQTQYS3v0P6JJbSVO6/KFeN9Bwhzrv
         iJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VvElXszLwjkIoRUsL1wZhCMOi1Cft0lEphidMFxQYiQ=;
        b=ieU4PVuBCYB+2ocFiDroPCW2lURWr9ogIn+6CIaYpkpHawOJPjpd+CRh6I7CRu9UVt
         1gOjkgi42vwNySsCYQ16TP+TSjCGO9BdDl1fCfAclp09LFHsxtwUysG5MDgfNetwqS/W
         EV6sjBy7/qnUltkB+ae7g8QgE70jO0gkmLL9hpsUmAp1Jl9wgnf+yB6k8oPYUhefd/yr
         2C4qMJXirYgckheCh3AEWS1P3/U2WtrEgroe97gH4QjKygbA8mJJ4kKLYDAF6Wm+63Td
         5rmOB9J4Cr10EWUOI49BFvc/Q5MNyIfrwnRz06BaYYwluAevckD8eHAssOCGSSkGghh4
         bzpA==
X-Gm-Message-State: AOAM530yk9lANwjRWJIpp4xr4wouKX+iIdxVU/4TRXCLNd2RQh7mfLhN
	TR6WtQBWDUut9dJdnzfUmDBqn4sYhp4Hth3sOzCnkQ==
X-Google-Smtp-Source: ABdhPJxhAY1J1WZVxgqU7eTZK7w9CGyzR/q/+PV+sQbqi1Amt65GIAIMyXxlYmcPV99KaJPI6VtBYMiZD8WipHO60P4=
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr25399536lfv.523.1637260895491;
 Thu, 18 Nov 2021 10:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADYN=9+_UU9qZX56uahGXxz00iayqJLRAaQrRXh1CMXTvwSbAg@mail.gmail.com>
 <20211118095852.616256-1-anders.roxell@linaro.org> <CAKwvOdkDVeoH8J1xFDeO5m_5EzNjDWucfyUewhgVSLWi5BN_QA@mail.gmail.com>
In-Reply-To: <CAKwvOdkDVeoH8J1xFDeO5m_5EzNjDWucfyUewhgVSLWi5BN_QA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 18 Nov 2021 10:41:23 -0800
Message-ID: <CAKwvOdm9HuXyw64ECVVhROxc3R9LL-FT3KbO_e5XzfE4=Q-UoA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] selftests: kselftest.h: mark functions with 'noreturn'
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	john.stultz@linaro.org, tglx@linutronix.de, akpm@linux-foundation.org, 
	nathan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	christian@brauner.io
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 10:40 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Nov 18, 2021 at 1:58 AM Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > When building kselftests/capabilities the following warning shows up:
> >
> > clang -O2 -g -std=gnu99 -Wall    test_execve.c -lcap-ng -lrt -ldl -o test_execve
> > test_execve.c:121:13: warning: variable 'have_outer_privilege' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >         } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
> >                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > test_execve.c:136:9: note: uninitialized use occurs here
> >         return have_outer_privilege;
> >                ^~~~~~~~~~~~~~~~~~~~
> > test_execve.c:121:9: note: remove the 'if' if its condition is always true
> >         } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > test_execve.c:94:27: note: initialize the variable 'have_outer_privilege' to silence this warning
> >         bool have_outer_privilege;
> >                                  ^
> >                                   = false
> >
> > Rework so all the ksft_exit_*() functions have attribue
> > '__attribute__((noreturn))' so the compiler knows that there wont be
> > any return from the function. That said, without
> > '__attribute__((noreturn))' the compiler warns about the above issue
> > since it thinks that it will get back from the ksft_exit_skip()
> > function, which it wont.
> > Cleaning up the callers that rely on ksft_exit_*() return code, since
> > the functions ksft_exit_*() have never returned anything.
> >
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  tools/testing/selftests/clone3/clone3.c              |  4 +++-
> >  .../testing/selftests/clone3/clone3_clear_sighand.c  |  2 +-
> >  tools/testing/selftests/clone3/clone3_set_tid.c      |  4 +++-
> >  tools/testing/selftests/ipc/msgque.c                 | 10 +++++-----
> >  tools/testing/selftests/kcmp/kcmp_test.c             |  2 +-
> >  tools/testing/selftests/kselftest.h                  | 12 ++++++------
> >  .../membarrier/membarrier_test_multi_thread.c        |  2 +-
> >  .../membarrier/membarrier_test_single_thread.c       |  2 +-
> >  tools/testing/selftests/pidfd/pidfd_fdinfo_test.c    |  2 +-
> >  tools/testing/selftests/pidfd/pidfd_open_test.c      |  4 +++-
> >  tools/testing/selftests/pidfd/pidfd_poll_test.c      |  2 +-
> >  tools/testing/selftests/pidfd/pidfd_test.c           |  2 +-
> >  tools/testing/selftests/resctrl/resctrl_tests.c      |  6 +++---
> >  tools/testing/selftests/sync/sync_test.c             |  2 +-
> >  tools/testing/selftests/timers/adjtick.c             |  4 ++--
> >  tools/testing/selftests/timers/alarmtimer-suspend.c  |  4 ++--
> >  tools/testing/selftests/timers/change_skew.c         |  4 ++--
> >  tools/testing/selftests/timers/clocksource-switch.c  |  4 ++--
> >  tools/testing/selftests/timers/freq-step.c           |  4 ++--
> >  tools/testing/selftests/timers/inconsistency-check.c |  4 ++--
> >  tools/testing/selftests/timers/leap-a-day.c          | 10 +++++-----
> >  tools/testing/selftests/timers/leapcrash.c           |  4 ++--
> >  tools/testing/selftests/timers/mqueue-lat.c          |  4 ++--
> >  tools/testing/selftests/timers/nanosleep.c           |  4 ++--
> >  tools/testing/selftests/timers/nsleep-lat.c          |  4 ++--
> >  tools/testing/selftests/timers/posix_timers.c        | 12 ++++++------
> >  tools/testing/selftests/timers/raw_skew.c            |  6 +++---
> >  tools/testing/selftests/timers/set-2038.c            |  4 ++--
> >  tools/testing/selftests/timers/set-tai.c             |  4 ++--
> >  tools/testing/selftests/timers/set-timer-lat.c       |  4 ++--
> >  tools/testing/selftests/timers/set-tz.c              |  4 ++--
> >  tools/testing/selftests/timers/skew_consistency.c    |  4 ++--
> >  tools/testing/selftests/timers/threadtest.c          |  2 +-
> >  tools/testing/selftests/timers/valid-adjtimex.c      |  6 +++---
> >  tools/testing/selftests/vm/madv_populate.c           |  2 +-
> >  35 files changed, 80 insertions(+), 74 deletions(-)
> >
> > diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
> > index 42be3b925830..ede5da0c67b4 100644
> > --- a/tools/testing/selftests/clone3/clone3.c
> > +++ b/tools/testing/selftests/clone3/clone3.c
> > @@ -191,5 +191,7 @@ int main(int argc, char *argv[])
> >         test_clone3(CLONE_NEWPID, getpagesize() + 8, -E2BIG,
> >                         CLONE3_ARGS_NO_TEST);
> >
> > -       return !ksft_get_fail_cnt() ? ksft_exit_pass() : ksft_exit_fail();
> > +       if (ksft_get_fail_cnt())
> > +               ksft_exit_fail();
> > +       ksft_exit_pass();
> >  }
> > diff --git a/tools/testing/selftests/clone3/clone3_clear_sighand.c b/tools/testing/selftests/clone3/clone3_clear_sighand.c
> > index 47a8c0fc3676..dcd9448eaeec 100644
> > --- a/tools/testing/selftests/clone3/clone3_clear_sighand.c
> > +++ b/tools/testing/selftests/clone3/clone3_clear_sighand.c
> > @@ -124,5 +124,5 @@ int main(int argc, char **argv)
> >
> >         test_clone3_clear_sighand();
> >
> > -       return ksft_exit_pass();
> > +       ksft_exit_pass();
> >  }
> > diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
> > index 0229e9ebb995..a755fcd3af89 100644
> > --- a/tools/testing/selftests/clone3/clone3_set_tid.c
> > +++ b/tools/testing/selftests/clone3/clone3_set_tid.c
> > @@ -393,5 +393,7 @@ int main(int argc, char *argv[])
> >  out:
> >         ret = 0;
> >
> > -       return !ret ? ksft_exit_pass() : ksft_exit_fail();
> > +       if (ret)
> > +               ksft_exit_fail();
> > +       ksft_exit_pass();
>
> err...did you update clone3_set_tid as Shuah requested in v3?
> Otherwise what changed from v2 -> v3?

Ah, this was part of a series. Sorry I missed that; gmail keeps the
original subject line when --in-reply-to is used even when the subject
changes.

-- 
Thanks,
~Nick Desaulniers
