Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B272
	for <llvm@lists.linux.dev>; Sat, 20 Nov 2021 00:18:43 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id k22so14822904iol.13
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 16:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j4HsihesuWRn6Y6XmUNEckNuiN/kPKd9OIJTos8r0uI=;
        b=NLLJA18B1Pvq1l2kHr0pA08D8bG8XKABcsHGET5ib4U6TRJCY5vco16fd8kKFa8yqn
         IK56lQ7vlrPKQ9u9b73rdjR5fsi9/MFH8Y4jNqp20kwbBdsqIScp85ZhZquotuqu66Gf
         DSQ5xfEzleUC2VUdZxZ1C08685XDALpR7tvB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j4HsihesuWRn6Y6XmUNEckNuiN/kPKd9OIJTos8r0uI=;
        b=SApB9uZeSt7AaCHXdf9O7xvbUG0dNae6uXtvvo+u/HnfZAyHTH45aD/aRmO4bpQlSh
         G8IqphS7sMdkYzuoPUqNI15RE0LKFNS/SIAJQwAtKr1Tp1vxjALVDvCcpbFnhvu8+0Zz
         Tx6pjoGp+9N4O4y0S0PmYRjzJer/7Hm31aO4pj6VlK4EDEQS9CQxKAGd8yVqgwplfcby
         vyfACWQ0LDdQhobWBCzeMwWmlJMfKc9rbD/8RIj980ojZ+zr0KkbVg5RQkqaz1vQ/+u3
         tSNnb7T2MYCHzRnT5rwyT5PVM6qsH+k4y9YP+EslUSC6XK8wffwni8aqL2D+jzkBCny+
         +Ihw==
X-Gm-Message-State: AOAM533s8ssKD1gm8oVaIcKLzLTzSffFICmtse2FJL1WQ3i11pHs8PB8
	IQTC2wVI9XsRDb7B0BA/NmRArg==
X-Google-Smtp-Source: ABdhPJzVuqx0rS8ssjTqrGq2F/gxOgBgc4ZNkzigizQCHP4xSFn+Gc83wKA0lrn5Ij4qOhx4lnYpZg==
X-Received: by 2002:a05:6602:486:: with SMTP id y6mr8499566iov.104.1637367521461;
        Fri, 19 Nov 2021 16:18:41 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id ay13sm757870iob.37.2021.11.19.16.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 16:18:41 -0800 (PST)
Subject: Re: [PATCH 1/2] selftests: timens: use 'llabs()' over 'abs()'
To: Nick Desaulniers <ndesaulniers@google.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, nathan@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20211105163137.3324344-1-anders.roxell@linaro.org>
 <CAKwvOdnge-hBmoFH-CHZmbh7DTq8bQiyhbfEOWkBt447=e6QGA@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4de8c09f-df5e-8d7e-a19e-98424e939b81@linuxfoundation.org>
Date: Fri, 19 Nov 2021 17:18:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnge-hBmoFH-CHZmbh7DTq8bQiyhbfEOWkBt447=e6QGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/5/21 2:26 PM, Nick Desaulniers wrote:
> On Fri, Nov 5, 2021 at 9:31 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>>
>> When building selftests/timens with clang, the compiler warn about the
>> function abs() see below:
>>
>> timerfd.c:64:7: error: absolute value function 'abs' given an argument of type 'long long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
>>                  if (abs(elapsed - 3600) > 60) {
>>                      ^
>> timerfd.c:64:7: note: use function 'llabs' instead
>>                  if (abs(elapsed - 3600) > 60) {
>>                      ^~~
>>                      llabs
>>
>> The note indicates what to do, Rework to use the function 'llabs()'.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> 
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
>> ---
>>   tools/testing/selftests/timens/timer.c   | 2 +-
>>   tools/testing/selftests/timens/timerfd.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/timens/timer.c b/tools/testing/selftests/timens/timer.c
>> index 5e7f0051bd7b..5b939f59dfa4 100644
>> --- a/tools/testing/selftests/timens/timer.c
>> +++ b/tools/testing/selftests/timens/timer.c
>> @@ -56,7 +56,7 @@ int run_test(int clockid, struct timespec now)
>>                          return pr_perror("timerfd_gettime");
>>
>>                  elapsed = new_value.it_value.tv_sec;
>> -               if (abs(elapsed - 3600) > 60) {
>> +               if (llabs(elapsed - 3600) > 60) {
>>                          ksft_test_result_fail("clockid: %d elapsed: %lld\n",
>>                                                clockid, elapsed);
>>                          return 1;
>> diff --git a/tools/testing/selftests/timens/timerfd.c b/tools/testing/selftests/timens/timerfd.c
>> index 9edd43d6b2c1..a4196bbd6e33 100644
>> --- a/tools/testing/selftests/timens/timerfd.c
>> +++ b/tools/testing/selftests/timens/timerfd.c
>> @@ -61,7 +61,7 @@ int run_test(int clockid, struct timespec now)
>>                          return pr_perror("timerfd_gettime(%d)", clockid);
>>
>>                  elapsed = new_value.it_value.tv_sec;
>> -               if (abs(elapsed - 3600) > 60) {
>> +               if (llabs(elapsed - 3600) > 60) {
>>                          ksft_test_result_fail("clockid: %d elapsed: %lld\n",
>>                                                clockid, elapsed);
>>                          return 1;
>> --
>> 2.33.0
>>
> 
> 

Same comment on llabs() define in stdlib.h made earlier in the context
of timer test changes.

thanks,
-- Shuah


