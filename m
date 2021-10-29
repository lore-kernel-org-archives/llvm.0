Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB632C83
	for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 18:19:28 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id i12so5356650ila.12
        for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PKl/teME9E7ldDK1IbEidgw7hYOus61rL2borMcVRE0=;
        b=R/PBEucrRJH7/D2UWFg+7WvnzBfb/8gyzY6ZHAVd2FUL/ZueEynhhJ+B1vlmOTpVUl
         ysWPx/Sk8tJsQtejIBdE94dp77v1qVp7bw3GjT4n6Ts2JHH2wl4Ah7bNVnBephwzwjjS
         a5M0UUcRoWafnHr7fMmbukdNzje+AK2lP7tpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PKl/teME9E7ldDK1IbEidgw7hYOus61rL2borMcVRE0=;
        b=udmF5yufALik937A2dAOj/vh0/Dem2MIM9+hvyxlvMJztBJEkk68SF0sdQDGD/PUPJ
         gMm1X0XeuWeK2KWtD8ROksGf9dmqPPPpBUsImN5GjoSDJZvSuUZqFEADkXLibzAv3iSQ
         ZjRjzOx+ROBhOTYo33Jo5X+tEl65xbOXTG315lDJXXW3vnyD6+xqz/hWfknsdVcpCBdo
         mZt+pQdDDuli4KVrMPmZgXw0ehuazPJ2/hHKu98j2Hi+U7l/Sh6D8jw2onEbnJsXgYk1
         SjeQSFm7I1QxS1JxL4qwAGZvKSf6gdY7bnWi8GLGTjwxGIEaNpibtlJ6pK/0oST9+mtb
         apZQ==
X-Gm-Message-State: AOAM530t/fQdqRLYAs4xi/UQv/3VMZFAwGNUOeNrCAAALIP5ZapKIlhD
	ZN3+YgNEewlUvZwUZMVFwrDqgg==
X-Google-Smtp-Source: ABdhPJxeqa5BfULHc0fSZ0/jdCvx2zQe/fLQ0wiFfsYyjhKZ0IeXpZcwvg2jh56WnLlBJsQlhFcqgw==
X-Received: by 2002:a92:c04c:: with SMTP id o12mr8407189ilf.206.1635531567577;
        Fri, 29 Oct 2021 11:19:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e8sm3732277ilu.17.2021.10.29.11.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 11:19:27 -0700 (PDT)
Subject: Re: [PATCH] selftests: kselftest.h: mark functions with 'noreturn'
To: Anders Roxell <anders.roxell@linaro.org>, shuah@kernel.org
Cc: fenghua.yu@intel.com, reinette.chatre@intel.com, john.stultz@linaro.org,
 tglx@linutronix.de, akpm@linux-foundation.org, nathan@kernel.org,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20211029114312.1921603-1-anders.roxell@linaro.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <834d18b6-4106-045f-0264-20e54edf47bc@linuxfoundation.org>
Date: Fri, 29 Oct 2021 12:19:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211029114312.1921603-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/21 5:43 AM, Anders Roxell wrote:
> When building kselftests/capabilities the following warning shows up:
> 
> clang -O2 -g -std=gnu99 -Wall    test_execve.c -lcap-ng -lrt -ldl -o test_execve
> test_execve.c:121:13: warning: variable 'have_outer_privilege' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>          } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> test_execve.c:136:9: note: uninitialized use occurs here
>          return have_outer_privilege;
>                 ^~~~~~~~~~~~~~~~~~~~
> test_execve.c:121:9: note: remove the 'if' if its condition is always true
>          } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> test_execve.c:94:27: note: initialize the variable 'have_outer_privilege' to silence this warning
>          bool have_outer_privilege;
>                                   ^
>                                    = false
> 
> Rework so all the ksft_exit_*() functions have attribue
> '__attribute__((noreturn))' so the compiler knows that there wont be
> any return from the function. That said, without
> '__attribute__((noreturn))' the compiler warns about the above issue
> since it thinks that it will get back from the ksft_exit_skip()
> function, which it wont.
> Cleaning up the callers that rely on ksft_exit_*() return code, since
> the functions ksft_exit_*() have never returned anything.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Lot of changes to fix this warning. Is this necessary? I would
like to explore if there is an easier and localized change that
can fix the problem.

thanks,
-- Shuah
