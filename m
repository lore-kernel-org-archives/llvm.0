Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32472
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 23:35:32 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id bf8so24717293oib.6
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 15:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XRzO0YvFGAtk5YREG47xrVTYPSFw40hn1uKe/8jJr+k=;
        b=ApZC2sLye9kxqGuPPP3rFlzbGoT4LoJhYKWVJAXC0aFTIRQNWKmpCp/ld3fNP9zQU1
         c/fucWMqyWFKXfXOXrnHk8ML/iSWCIOoDn2OJn9EAHQPdftRyf1EiuM2OKsV7Mzdatm/
         rEWWnx1qUxOgVjteffpcWfHsILng4QueB1tFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XRzO0YvFGAtk5YREG47xrVTYPSFw40hn1uKe/8jJr+k=;
        b=UCgQYp+PWf+T0Uy+IArNZL6jwxA604sLYsuQgNPAwujKvGXA/iEK37AKbarzFeoZpO
         YtGFmYNjU3KCJlClvkjPwmry2HwtKc1SJI16THBAaq6gait+yn42QIFkiNqu03n9YD8E
         MTI1exbsQe3rb9OrwjUqOHFTV4GovxY6CsIOsdW2OAjNDmadhX6em715VXuRgVG8Synm
         yPIhY86So1irZTvWe5TAbWbnchKtSFhOFB9Y99HoXP8baIN2RdG8qPbbR2LsRrfPngno
         nFIpxGPYuA0XUaZZ2+bl0Qx1d8J7HBctamn/Bvjh5aC+YBaev0r+3Stv3B4WJKRSAA1K
         6bzg==
X-Gm-Message-State: AOAM530eNXIhPGO7WmmEgWrQ693M9SsHJiVvEgBeyMVnUuyxyjLizLng
	Vh6ROZNM/lPxPa4IBLd/+kUe9g==
X-Google-Smtp-Source: ABdhPJw67Npt7XkzT6Hjk/qatZCYLdRp17IOT0NWtd9/vmynrsOX2X4guiM/e1r1V1/iqrkJ5LsODw==
X-Received: by 2002:aca:d05:: with SMTP id 5mr3476846oin.142.1637364931960;
        Fri, 19 Nov 2021 15:35:31 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c9sm271619oog.43.2021.11.19.15.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 15:35:29 -0800 (PST)
Subject: Re: [PATCH v3 1/2] selftests: kselftest.h: mark functions with
 'noreturn'
To: Anders Roxell <anders.roxell@linaro.org>, shuah@kernel.org
Cc: fenghua.yu@intel.com, reinette.chatre@intel.com, john.stultz@linaro.org,
 tglx@linutronix.de, akpm@linux-foundation.org, nathan@kernel.org,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 christian@brauner.io, Shuah Khan <skhan@linuxfoundation.org>
References: <CADYN=9+_UU9qZX56uahGXxz00iayqJLRAaQrRXh1CMXTvwSbAg@mail.gmail.com>
 <20211118095852.616256-1-anders.roxell@linaro.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <02a096ba-ed6e-4728-c6c1-1b6597ec062f@linuxfoundation.org>
Date: Fri, 19 Nov 2021 16:35:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211118095852.616256-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/18/21 2:58 AM, Anders Roxell wrote:
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

won't be

> any return from the function. That said, without
> '__attribute__((noreturn))' the compiler warns about the above issue
> since it thinks that it will get back from the ksft_exit_skip()
> function, which it wont.
> Cleaning up the callers that rely on ksft_exit_*() return code, since
> the functions ksft_exit_*() have never returned anything.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

My commit script failed due to checkpatch warns. Run checkpatchp.l --strict
to find the problems and send me v4

thanks,
-- Shuah
