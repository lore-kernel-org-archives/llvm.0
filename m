Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17815CA
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 01:26:37 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-79fb8f60374so45090239f.1
        for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 18:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695777996; x=1696382796; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0LsinjnQ0psiRqDV4BJbkShjH1QSE7MgPkz+IEjFHc=;
        b=hHkVyV9FaQNgxMIa7PAz3BmQZw+/IYjf2yLyaqsLccMDstMoMQ9tJRSVr3O6DVCef0
         UeclPwAtq5ibzRsyhorm6G3SXp6GAnuMEqUjwV4RwKazl5XebB54Gr7DG7Dbqwl7Bo0b
         I6a4p0MkrlQ/V4WnX0dVSAJObeoVLzW3Ifx94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695777996; x=1696382796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0LsinjnQ0psiRqDV4BJbkShjH1QSE7MgPkz+IEjFHc=;
        b=hzQhAmR159D2VamdWVN0J+r68+WQNEIuzWcr+6LhfI1ZH9bw5tzW4rivVCRFDesj86
         oXJ+o2AcL2J78Z44BjbYKbPagcJa3dR8a8fFXKc4SUINGxKRSQfFKerea77pBEloVjLC
         jsD/arXXVzZw558e2ke6KzzD3uWrKhDNb7xX4/7jACm3kItWeU2tHPUjqJlmLMQfKUGJ
         7RrMuYTanM0sMbCOJDh3IP4Uesq2cMRGnzKfqGex0s7p9s4+ayyMZEljZW0phInQ0v7H
         0h1ZcDTHXolOWnIXMKMd/HscGIyjUxyxANwmf2hMWLk3kiyEp5m7YtE5dtoJp4eCbWjN
         oNTA==
X-Gm-Message-State: AOJu0YzHBgcfc/g+NNHwDt9s4jclocaHEoPjMRBJWH7dVmX2c1KQw1iN
	RdVtV06eKSROzFZ8Ukpa90ilEg==
X-Google-Smtp-Source: AGHT+IFCOJWMcvH/PMk6PXaOABE9naegOE1OjxmKKpTl8Tq0vbJU2EbQZCuBXNzabPcsOTBAqRoEHA==
X-Received: by 2002:a92:cac7:0:b0:351:54db:c1c9 with SMTP id m7-20020a92cac7000000b0035154dbc1c9mr594374ilq.1.1695777996416;
        Tue, 26 Sep 2023 18:26:36 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id y3-20020a92d203000000b0034f3220c086sm2393099ily.12.2023.09.26.18.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 18:26:35 -0700 (PDT)
Message-ID: <cd11111a-321e-3b29-3d7b-8844189f791e@linuxfoundation.org>
Date: Tue, 26 Sep 2023 19:26:34 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] selftests/rseq: fix kselftest Clang build warnings
Content-Language: en-US
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Justin Stitt <justinstitt@google.com>, Peter Zijlstra
 <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20230912-kselftest-param_test-c-v1-1-80a6cffc7374@google.com>
 <CAFhGd8on9_DJUZqT5uKgPzOtJNn99sY3TprcPzD5pm3GmYx8oQ@mail.gmail.com>
 <eabe9db0-c934-af2d-e5a9-9d644593851c@efficios.com>
 <63dd7222-99dc-8e11-3a51-b132e4115ac5@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <63dd7222-99dc-8e11-3a51-b132e4115ac5@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/26/23 14:39, Shuah Khan wrote:
> On 9/26/23 13:02, Mathieu Desnoyers wrote:
>> On 9/26/23 08:20, Justin Stitt wrote:
>>> Ping.
>>>
>>> Looking to get this patch and [1] slated for 6.7 which fixes some
>>> kselftest builds on older kernels.
>>>
>>> On Wed, Sep 13, 2023 at 6:03 AM Justin Stitt <justinstitt@google.com> wrote:
>>>>
>>>> When building with Clang, I am getting many warnings from the selftests/rseq tree.
>>>>
>>>> Here's one such example from rseq tree:
>>>> |  param_test.c:1234:10: error: address argument to atomic operation must be a pointer to _Atomic type ('intptr_t *' (aka 'long *') invalid)
>>>> |   1234 |         while (!atomic_load(&args->percpu_list_ptr)) {}
>>>> |        |                 ^           ~~~~~~~~~~~~~~~~~~~~~~
>>>> |  /usr/local/google/home/justinstitt/repos/tc-build/build/llvm/final/lib/clang/18/include/stdatomic.h:140:29: note: expanded from macro 'atomic_load'
>>>> |    140 | #define atomic_load(object) __c11_atomic_load(object, __ATOMIC_SEQ_CST)
>>>> |        |                             ^                 ~~~~~~
>>>>
>>>> Use compiler builtins `__atomic_load_n()` and `__atomic_store_n()` with
>>>> accompanying __ATOMIC_ACQUIRE and __ATOMIC_RELEASE, respectively. This
>>>> will fix the warnings because the compiler builtins do not expect their
>>>> arguments to have _Atomic type. This should also make TSAN happier.
>>>>
>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1698
>>>> Link: https://github.com/ClangBuiltLinux/continuous-integration2/issues/61
>>>> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>>>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>>
>> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>>
>> Peter, should this go through tip ?
>>
>> Shuah, should to go through selftests ?
>>
> 
> I can take this through selftests and apply it - hoping there
> are no conflicts with what's in Peter's tree.
> 

Applied to linux-kselftest next for Linux 6.7-rc1

thanks,
-- Shuah

