Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5172
	for <llvm@lists.linux.dev>; Sat, 20 Nov 2021 00:22:22 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id z18so14948445iof.5
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 16:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=45aoiIXLNHX/rElliOua9/jn7RznBxUCcrDpMi0LV+8=;
        b=JCbnJJdfHDf/Ck6Y9dH93bwkVp/YCaWqIXQ/G832da1Y4FRlbORIL/8Ro3C6PDwTnh
         mTLCjDWV03dDzQH1K1sp9GXpu/xlrxYWAOqPi0AyJxfOv2u17vq4GhCBbbrD69neKC6/
         nLDiTmjnO4xe8VRpEoF8jVBAKOYnes9qv+Ipc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=45aoiIXLNHX/rElliOua9/jn7RznBxUCcrDpMi0LV+8=;
        b=kWMyaOiVegN1QLPCQurwa48k4yMo0H5NM5P7vIelfDpq1weHHNjwsOMgPtPMQOFq9P
         7VMmj/znmedOzR6/2kibViMxJb+LqjnVFLY/8Xk5tSanH9Qp9YBZnWym4l4sk4witQyL
         nxDrFAEaXkO4HQDBFpPqonw2Q0A9oZIIgn+VNjPFtV5ffJvy3s31CGy0CIO/Bw3EcwAl
         sUJtNbkBjEb6ftL2mtSCnsPZTMaqABFikmZ+ZwlPCtFzWfFuJg1ZenRmJ9KXpVCLtibX
         2EURJqaWDHbnd3homaSWnjnzNrTBhSq+hu4T7a7mmFNUBM1kynzSRPJePu8m6Abgl825
         Bzsg==
X-Gm-Message-State: AOAM530CdsLRmWZJXFMDq9sD7MnBXUhZAtU1EJU98ZYgfEfAJAm+P7lA
	iXNagSQuAsvHsu9PRPUKQzSYCw==
X-Google-Smtp-Source: ABdhPJxaN5oCOmmGf4TnBvJnw+z3+nee3C+NVAWqPPJAD1cXa/QZx7wbZU4dlQ/jTRbiJcdPEhfJ7A==
X-Received: by 2002:a05:6638:238b:: with SMTP id q11mr31249300jat.43.1637367741713;
        Fri, 19 Nov 2021 16:22:21 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k11sm1093497ilv.66.2021.11.19.16.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 16:22:21 -0800 (PST)
Subject: Re: [PATCH 1/2] selftests: cgroup: build error multiple outpt files
To: Anders Roxell <anders.roxell@linaro.org>, shuah@kernel.org,
 christian@brauner.io
Cc: nathan@kernel.org, ndesaulniers@google.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20211105162530.3307666-1-anders.roxell@linaro.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <61b21c4b-fc26-5e41-3aed-22a7e56b04ba@linuxfoundation.org>
Date: Fri, 19 Nov 2021 17:22:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211105162530.3307666-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/5/21 10:25 AM, Anders Roxell wrote:
> When building selftests/cgroup: with clang the following error are seen:
> 
> clang -Wall -pthread    test_memcontrol.c cgroup_util.c ../clone3/clone3_selftests.h  -o /home/anders/.cache/tuxmake/builds/current/kselftest/cgroup/test_memcontrol
> clang: error: cannot specify -o when generating multiple output files
> make[3]: *** [../lib.mk:146: /home/anders/.cache/tuxmake/builds/current/kselftest/cgroup/test_memcontrol] Error 1
> 
> Rework to add the header files to LOCAL_HDRS before including ../lib.mk,
> since the dependency is evaluated in '$(OUTPUT)/%:%.c $(LOCAL_HDRS)' in
> file lib.mk.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tools/testing/selftests/cgroup/Makefile | 12 +++++++-----
>   tools/testing/selftests/lib.mk          |  2 +-
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/selftests/cgroup/Makefile
> index 59e222460581..745fe25fa0b9 100644
> --- a/tools/testing/selftests/cgroup/Makefile
> +++ b/tools/testing/selftests/cgroup/Makefile
> @@ -11,10 +11,12 @@ TEST_GEN_PROGS += test_core
>   TEST_GEN_PROGS += test_freezer
>   TEST_GEN_PROGS += test_kill
>   
> +LOCAL_HDRS += $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pidfd.h
> +

This looks odd to me. Why are we introducing dependencies between tests?
clone3 includes in cgroup? Looks odd to me.

thanks,
-- Shuah
