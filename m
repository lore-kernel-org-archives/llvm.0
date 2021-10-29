Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A762C82
	for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 22:23:04 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id y17so12119502ilb.9
        for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p7UKH93nqJbnjgzvxtzNJ+VSIOto15SRM0Q3/xyJtUY=;
        b=UQpUd8XdbcbkVLI6okUt3F/7VRB6A4TEUtSGndWNft3ohARwNu0RfycSz6ymvo7ogl
         hjmQCJuTukPQZvnajmoOFhB1m9sz43UCNATDW/Vmz8B9QxZmu9th2wzVlV3I+cADgksN
         QDOP65GK0/77RXP9qoMA3iyaK5SPLtdSWF77I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p7UKH93nqJbnjgzvxtzNJ+VSIOto15SRM0Q3/xyJtUY=;
        b=Q4R01o7PmRz7MXMSV9N0swyNAKg132kI3Xj6jI774Tx4bxPb526ZkNJN/z3R+Xsc43
         8scGsgj4oOopvFBDpJsdpzGUIA+U8oVRpYS0rcCEfxIvQbhs5GDtquDOHrkcdqfTmtaB
         caYiEURLGuwwta4TnGGEFAnho5gkieUhxymZfci9CPAC97NYp0p45QlQp3WPBlqdld4k
         Vqetz+CTYxN6f7NpCZM/jFOEygbcUg6oX+3JHvRGWGyMLfKqXYOGCTeSjO/vRFKvEyk1
         z+11agfsT1Nfb4VlJVhxkko+UFXPTzw226SFwwjmmYT2cMsbfTz97rmZVJ7/OlIr4MLC
         g3qA==
X-Gm-Message-State: AOAM530FzyBaBeZluRdRarGJ59Znm9OdANvUqZ1KmavQWUtBtGlYXdb0
	aHwybOJHfUPYiGwlU0K9qIlUtw==
X-Google-Smtp-Source: ABdhPJx+HOeT+MydkmuJ4CJ7iIG9afL2dqYnp3PVn5b6tu3j8GQvdeJblZHo4tkQzShaw9+xYY72aw==
X-Received: by 2002:a05:6e02:1aa5:: with SMTP id l5mr8992834ilv.268.1635546182922;
        Fri, 29 Oct 2021 15:23:02 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l14sm4354841iow.27.2021.10.29.15.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 15:23:02 -0700 (PDT)
Subject: Re: [PATCH] selftests: kselftest.h: mark functions with 'noreturn'
To: Nick Desaulniers <ndesaulniers@google.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, fenghua.yu@intel.com, reinette.chatre@intel.com,
 john.stultz@linaro.org, tglx@linutronix.de, akpm@linux-foundation.org,
 nathan@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20211029114312.1921603-1-anders.roxell@linaro.org>
 <834d18b6-4106-045f-0264-20e54edf47bc@linuxfoundation.org>
 <CAKwvOdk8D5=AxzSpqjvXJc4XXL8CA7O=WY-LW0mZb3eQRK_EWg@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0beef0a1-cfa0-b653-fbc6-41ba707c2926@linuxfoundation.org>
Date: Fri, 29 Oct 2021 16:23:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdk8D5=AxzSpqjvXJc4XXL8CA7O=WY-LW0mZb3eQRK_EWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/21 4:08 PM, Nick Desaulniers wrote:
> On Fri, Oct 29, 2021 at 11:19 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 10/29/21 5:43 AM, Anders Roxell wrote:
>>> When building kselftests/capabilities the following warning shows up:
>>>
>>> clang -O2 -g -std=gnu99 -Wall    test_execve.c -lcap-ng -lrt -ldl -o test_execve
>>> test_execve.c:121:13: warning: variable 'have_outer_privilege' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>>>           } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
>>>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> test_execve.c:136:9: note: uninitialized use occurs here
>>>           return have_outer_privilege;
>>>                  ^~~~~~~~~~~~~~~~~~~~
>>> test_execve.c:121:9: note: remove the 'if' if its condition is always true
>>>           } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
>>>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> test_execve.c:94:27: note: initialize the variable 'have_outer_privilege' to silence this warning
>>>           bool have_outer_privilege;
>>>                                    ^
>>>                                     = false
>>>
>>> Rework so all the ksft_exit_*() functions have attribue
>>> '__attribute__((noreturn))' so the compiler knows that there wont be
>>> any return from the function. That said, without
>>> '__attribute__((noreturn))' the compiler warns about the above issue
>>> since it thinks that it will get back from the ksft_exit_skip()
>>> function, which it wont.
>>> Cleaning up the callers that rely on ksft_exit_*() return code, since
>>> the functions ksft_exit_*() have never returned anything.
>>>
>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>
>> Lot of changes to fix this warning. Is this necessary? I would
>> like to explore if there is an easier and localized change that
>> can fix the problem.
> 
> via `man 3 exit`:
> ```
> The  exit() function causes normal process termination ...
> ...
> RETURN VALUE
>         The exit() function does not return.
> ```
> so seeing `ksft_exit_pass`, `ksft_exit_fail`, `ksft_exit_fail_msg`,
> `ksft_exit_xfail`, `ksft_exit_xpass`, and `ksft_exit_skip` all
> unconditional call `exit` yet return an `int` looks wrong to me on
> first glance. So on that point this patch and its resulting diffstat
> LGTM.
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
> 

Right. This is another concern I have that the tests will return
a different values and the wrapper will interpret them as failures.

So his doesn't look like the right change to fix the problem.

thanks,
-- Shuah
