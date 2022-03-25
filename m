Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527628E4
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 19:50:12 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id e25-20020a0568301e5900b005b236d5d74fso6274498otj.0
        for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ofQyyG4WMeOqTiRCxXPOTx0/Wivov5xRx7qheRvM/dU=;
        b=BTLrQc+pAf4GklQAuYbgpvaE5IYRRYpws9LxKmgbafhhKqWOaBUlZ1kY/PXDiEpsMq
         IEPQ3wqmWivLAUs2jTzh1qeNenL6XV9D70b0I+pAEtuxNCS/BVaFrYeETTfp1FhkSq/H
         HZRyRj7J2wnOX45stHVB7hpDU5NLeFcL5MyzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ofQyyG4WMeOqTiRCxXPOTx0/Wivov5xRx7qheRvM/dU=;
        b=eNvrdBXEmhlmfBpaEzGpB5TiyL/yD/wBhImY6+36CoOVB2j5d3cZ9K2jwv3cyjpf8K
         dxUX+NDxUnZZsWxw7RUAEBBv2gX1w2y0v7l+vtrDGMn8vXfzxiLZoDLnoKAwlmVefYvC
         GnmohxE9XyxDvIBWzQOt7FdNZGvQbCUITIg6hXWofLXEuKyzHo6izFqKe9KSretsSRvh
         +KBi8becJDpGMX4jyuNsOITiuDfq9jWS/4L0SnVW/fJhHBNcgNB1t7YFmiWKk9+OPxs9
         0MyUINo6Xz89SccPch0ruYE4wJo+ZKpZprVO31X6gthO4CCVXdjP49NaEBd8ffv/jdX1
         lZCA==
X-Gm-Message-State: AOAM533aQk9Mfs5qk2B/oPibRMbUW3fFGydy3X8CSaWxM7RuDGmbOnYl
	cm90QqCMkrP40S2eEoMYvT6cRQ==
X-Google-Smtp-Source: ABdhPJwP3eYIiKNUU8RG4VjsD8Eaq3hNhzdfy5M2puZwXKfZ42MjKCjobbrF6RFOi5BsoaaUw58PxA==
X-Received: by 2002:a9d:67d4:0:b0:5b2:2644:7696 with SMTP id c20-20020a9d67d4000000b005b226447696mr5224826otn.322.1648237810859;
        Fri, 25 Mar 2022 12:50:10 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id r129-20020acac187000000b002ef358c6e0esm3198399oif.49.2022.03.25.12.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 12:50:10 -0700 (PDT)
Subject: Re: [PATCH 1/2] selftests: fix header dependency for pid_namespace
 selftests
To: Axel Rasmussen <axelrasmussen@google.com>,
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20220324223929.1893741-1-axelrasmussen@google.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8fc440d2-2278-b554-3f56-18daa47aef85@linuxfoundation.org>
Date: Fri, 25 Mar 2022 13:50:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220324223929.1893741-1-axelrasmussen@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/24/22 4:39 PM, Axel Rasmussen wrote:
> The way the test target was defined before, when building with clang we
> get a command line like this:
> 
> clang -Wall -Werror -g -I../../../../usr/include/ \
> 	regression_enomem.c ../pidfd/pidfd.h  -o regression_enomem
> 
> This yields an error, because clang thinks we want to produce both a *.o
> file, as well as a precompiled header:
> 
> clang: error: cannot specify -o when generating multiple output files
> 
> gcc, for whatever reason, doesn't exhibit the same behavior which I
> suspect is why the problem wasn't noticed before.
> 

Thank you fixing this.

> This can be fixed simply by using the LOCAL_HDRS infrastructure the
> selftests lib.mk provides. It does the right think and marks the target
> as depending on the header (so if the header changes, we rebuild), but
> it filters the header out of the compiler command line, so we don't get
> the error described above.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> ---
>   tools/testing/selftests/pid_namespace/Makefile | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/pid_namespace/Makefile b/tools/testing/selftests/pid_namespace/Makefile
> index dcaefa224ca0..edafaca1aeb3 100644
> --- a/tools/testing/selftests/pid_namespace/Makefile
> +++ b/tools/testing/selftests/pid_namespace/Makefile
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
>   CFLAGS += -g -I../../../../usr/include/
>   
> -TEST_GEN_PROGS := regression_enomem
> +TEST_GEN_PROGS = regression_enomem
>   
> -include ../lib.mk
> +LOCAL_HDRS += $(selfdir)/pidfd/pidfd.h
>   
> -$(OUTPUT)/regression_enomem: regression_enomem.c ../pidfd/pidfd.h
> +include ../lib.mk
> 

Will apply this for Linux 5.18-rc2

thanks,
-- Shuah
