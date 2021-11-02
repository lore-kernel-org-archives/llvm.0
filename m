Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ECF2C99
	for <llvm@lists.linux.dev>; Tue,  2 Nov 2021 22:04:48 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 5so2387250edw.7
        for <llvm@lists.linux.dev>; Tue, 02 Nov 2021 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n4F13XQgVfHrFjDyFI3dMs7NsVDxr8/9oSk7fc0QDng=;
        b=P4nJjt/fXf671D9eUvZ9+y2bS+QDywI1rCVkTQODwOQV83TwA4krXZ7DTRv5643PYu
         nMXoWLhAOqQBTli5Xrp/KuciRht6NbwzCpTkhpKUxgRFTYGZqdUrZatUog5rJSs2lgfX
         H6N6qANOFFyiXZvTthW1CuCVJ0KXY4zPBZuHt48oUWyz7Ayj3g9Ooc4FgS6CFJV6h5CY
         Lbmoz5D1O8xBo+glIM6hvtuQctVF6/T2kHB1n8bmxK8tALLMaAH9NRZb2/MkJ+mLParS
         RIDHAd2t3NPegMZM91FO1Zejd4HVII8jRLkmTu7iNKMf59bppokv5o2c09jEw+LX5pn8
         v4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n4F13XQgVfHrFjDyFI3dMs7NsVDxr8/9oSk7fc0QDng=;
        b=cQdMiRYoyp/mDJ3ig8nAvdkNSu5vwd0IxhBI0OP7TRcJw/HqfWtUAlvF83v97VOyBv
         YYwvhNCEe6hFAu1PRV2PZC6/HFTbSsU3vJgRWd1HusBVHXoOwFoDK5ox20ud1uQvwuXp
         rixhHMztkjmcEnMJYLUbel5I/ivvQKaSJ2Aey3FnTjM6r4MjybvC5R9VyNRPpjIwoZuN
         d8fAHQurjn/b6j6J58muyJtF7/MYtgZnEk2puhGISPKWTMhnBvOFsAZejVzKXQHOoinZ
         WSItLBZyWGEw2qnkyWUfv/Hx3+qvGo4iNf7ZfoHZJ1yL88BQUFiEDOf8YJ+zKPjHpEUT
         KHlw==
X-Gm-Message-State: AOAM533bM33EQUarK0yelLIYzjABiXuFyTi8DvETeuuyN9cfBSkX/KVY
	2ObDOJT0Gqf/KtiV1078XE7U9b8YkVdeUlJtcftnrA==
X-Google-Smtp-Source: ABdhPJzTazRGBk5tHZ5IA/YT481aZrqOv2RHiiBDcFVRQOVYSiPeM5kCIsHtyEdCdFkGD1Yr28LrnfqmQq+gR6UCRoM=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id f14mr20147051edf.250.1635890686722;
 Tue, 02 Nov 2021 15:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211029114312.1921603-1-anders.roxell@linaro.org>
 <834d18b6-4106-045f-0264-20e54edf47bc@linuxfoundation.org> <CAKwvOdk8D5=AxzSpqjvXJc4XXL8CA7O=WY-LW0mZb3eQRK_EWg@mail.gmail.com>
In-Reply-To: <CAKwvOdk8D5=AxzSpqjvXJc4XXL8CA7O=WY-LW0mZb3eQRK_EWg@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 2 Nov 2021 23:04:35 +0100
Message-ID: <CADYN=9+iueC3rJ4=32OM9rOUDLLmvcKY-y_By4hwAj1+9gxRiQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest.h: mark functions with 'noreturn'
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org, fenghua.yu@intel.com, 
	reinette.chatre@intel.com, john.stultz@linaro.org, tglx@linutronix.de, 
	akpm@linux-foundation.org, nathan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Oct 2021 at 00:08, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Fri, Oct 29, 2021 at 11:19 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
> >
> > On 10/29/21 5:43 AM, Anders Roxell wrote:
> > > When building kselftests/capabilities the following warning shows up:
> > >
> > > clang -O2 -g -std=gnu99 -Wall    test_execve.c -lcap-ng -lrt -ldl -o test_execve
> > > test_execve.c:121:13: warning: variable 'have_outer_privilege' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> > >          } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
> > >                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > test_execve.c:136:9: note: uninitialized use occurs here
> > >          return have_outer_privilege;
> > >                 ^~~~~~~~~~~~~~~~~~~~
> > > test_execve.c:121:9: note: remove the 'if' if its condition is always true
> > >          } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
> > >                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > test_execve.c:94:27: note: initialize the variable 'have_outer_privilege' to silence this warning
> > >          bool have_outer_privilege;
> > >                                   ^
> > >                                    = false
> > >
> > > Rework so all the ksft_exit_*() functions have attribue
> > > '__attribute__((noreturn))' so the compiler knows that there wont be
> > > any return from the function. That said, without
> > > '__attribute__((noreturn))' the compiler warns about the above issue
> > > since it thinks that it will get back from the ksft_exit_skip()
> > > function, which it wont.
> > > Cleaning up the callers that rely on ksft_exit_*() return code, since
> > > the functions ksft_exit_*() have never returned anything.
> > >
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> >
> > Lot of changes to fix this warning. Is this necessary? I would
> > like to explore if there is an easier and localized change that
> > can fix the problem.
>
> via `man 3 exit`:
> ```
> The  exit() function causes normal process termination ...
> ...
> RETURN VALUE
>        The exit() function does not return.
> ```
> so seeing `ksft_exit_pass`, `ksft_exit_fail`, `ksft_exit_fail_msg`,
> `ksft_exit_xfail`, `ksft_exit_xpass`, and `ksft_exit_skip` all
> unconditional call `exit` yet return an `int` looks wrong to me on
> first glance. So on that point this patch and its resulting diffstat
> LGTM.

I'll respin the patch with these changes only.

>
> That said, there are many changes that explicitly call `ksft_exit`
> with an expression; are those setting the correct exit code? Note that
> ksft_exit_pass is calling exit with KSFT_PASS which is 0.  So some of
> the negations don't look quite correct to me.  For example:
>
> -       return !ksft_get_fail_cnt() ? ksft_exit_pass() : ksft_exit_fail();
> +       ksft_exit(!ksft_get_fail_cnt());
>
> so if ksft_get_fail_cnt() returns 0, then we were calling
> ksft_exit_pass() which exited with 0. Now we'd be exiting with 1?

oh, right, thank you for your review.
I will drop all the 'ksft_exit()' changes, they should be fixed and go
in as separete patches.


Cheers,
Anders
