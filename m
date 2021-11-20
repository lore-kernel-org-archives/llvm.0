Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A7672
	for <llvm@lists.linux.dev>; Sat, 20 Nov 2021 00:07:26 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id n66so24781350oia.9
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RvyWEdLax12+25Tnfs7BcEBxdL4WVjlZUdT7aE0GddA=;
        b=LBu+jgvmJe89ZGCaOz+Q+2if7rlFVtigKC9FTLl4QZKpQqcyhlMJFWf/8ugKsgE5xa
         81FpIba0C6Nm6mfJ9bcaS2PD9J/8KpWWkoK4svY0xnqGnwdxF/3x2KsDOPiyVO3dNlS8
         V6myj9JMwUkgJzJeP5GQkEwhcoFDG2uzAwV/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RvyWEdLax12+25Tnfs7BcEBxdL4WVjlZUdT7aE0GddA=;
        b=QZ5DjiKMrZ572ehnNlyJmPuU8uci6Ii/P2SkeXlUpSkQIEh0EG21iElO9qUu6n0XnW
         lhjOiqpCx5F1wiyJpZIhYJr98btKQuqcGZMsYOeM6T75r5ButSwCZ2m2lzn44bYseqAZ
         X02EEhyKIPZxzrFpQh1+hUWAgNZWPwdcWuDQQnolDT/UOqfXvLOv9XWMq/8Fdc0fLeQy
         j+F+2JVCTqsqk03Rd0YdBdiJ62ycaIXtT2hiu0rSsL50gUkFySuzlPVdFPNWTO0ZNCJv
         +PhYm2qTP+joEfATfHBBhV+9CkqQWB2DY1Ev03k7K4rVLoAOQTamdnApB7ikFvulswLk
         PMWQ==
X-Gm-Message-State: AOAM5316VUfHKnN4pR0QXCkyKW6e/JWZFaJ26h6dE+jdDxBu62m/nsKZ
	r50EZehWpXPsjaqlKaX/BZm8OA==
X-Google-Smtp-Source: ABdhPJztKGeV04+obdTEcOPE5iO5kUrpDipowiee/rOrvNzRzKar6xWuiwFlO6Ui4vqOtBg1e2YhSA==
X-Received: by 2002:a05:6808:259:: with SMTP id m25mr3870444oie.40.1637366845298;
        Fri, 19 Nov 2021 16:07:25 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o6sm251911oou.41.2021.11.19.16.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 16:07:24 -0800 (PST)
Subject: Re: [PATCH] selftests: timers: use 'llabs()' over 'abs()'
To: Nick Desaulniers <ndesaulniers@google.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, tglx@linutronix.de, john.stultz@linaro.org,
 nathan@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20211105163403.3330950-1-anders.roxell@linaro.org>
 <CAKwvOdn0vEyj-EPJG0e39v-Vq+oLFptV0oXYfzfzuy=HPzSzOA@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <59bd0880-475e-eb3b-6d2a-25589d5e3a8b@linuxfoundation.org>
Date: Fri, 19 Nov 2021 17:07:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn0vEyj-EPJG0e39v-Vq+oLFptV0oXYfzfzuy=HPzSzOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/5/21 2:44 PM, Nick Desaulniers wrote:
> On Fri, Nov 5, 2021 at 9:34 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>>
>> When building selftests/timers with clang, the compiler warn about the
>> function abs() see below:
>>
>> posix_timers.c:69:6: warning: absolute value function 'abs' given an argument of type 'long long' but has parameter of type 'int' which may cause truncation of value [-Wabsolute-value]
>>          if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>>              ^
>> posix_timers.c:69:6: note: use function 'llabs' instead
>>          if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>>              ^~~
>>              llabs
>>
>> The note indicates what to do, Rework to use the function 'llabs()'.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> 
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> I wonder why tools/testing/selftests/timers/adjtick.c redefines llabs
> when it already includes stdlib.h, and how that doesn't result in some
> kind of compiler diagnostic.
> 

Hmm. The define in /usr/include/stdlib.h is under #ifdef __USE_ISOC99
Maybe be that explains the reason for the definitions in the other two
timers file?

Anders, I would like to understand this before I take this patch. I see
you sent several patches to other tests as well. Would be useful at
least understand why these defines exist.

thanks,
-- Shuah


