Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913391FC6
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 15:19:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x17so23679629lfa.10
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PSN/G7KoRGQAWHR4F43xGgEd8OPfGRRXsI08IvJD1iw=;
        b=i4SdmqPVAwCqWESWwmY6MXcUpY1VZFR2pdu7XSUg9+IOVt1o0bHs7m+/oz32NtwrhY
         j2CHxlntzJri+QTf/5esfdtWT/Yjqdm4ODWzvSF7QMOhavynjxTqRzr21KJX4y0Peofe
         MF7PxvB7w8bI1SiInG0DYbec8i/KE90EyWy7N4luk1pdmwYFwilKMQzVtHCyZXoMMQtc
         YVStWP97a8WXTff+ptMrI6pMRKxCBYQ1N88CPkx7lfgFAk5/ZUyDq9GyxYBCjmGJRxwm
         UIfihpHfVeOAILqaUlv5Sf8nnK+H6bwHondzj6rQjSIO0/rmF8PYofc9gwUsoAKnfGtt
         J9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PSN/G7KoRGQAWHR4F43xGgEd8OPfGRRXsI08IvJD1iw=;
        b=d4Dns8g1pKtaxxKTo2ep687d0I9Rmu6im9VBTnHAb+2QKTavmLWq5ZiNsMFANlPysx
         4tp4vCmKVCs0wICImRknSZ3+RHUt+8ZkodJBooKGI37AEAoy3I+gL/4uQ4RAL9q6huE5
         78TlRd1JbuFFa9ac28yspt5BUZg4kZxXNOFOpYLLidNSUBSKHFLDMCL1K20yvtBUSMft
         26FTEiDGCTi5SpJgCGCZIwL1+1H43adeGHW1CF2IaocmQQ/nPOEXVuOMsOYo7U03eEkk
         HROB879B70Sd0VqEtGsyxtEfd53AXEFCuItAEOC+U7dvRU5wDn0/d0sa6fzFZSz/+6dD
         nC2A==
X-Gm-Message-State: AOAM53179J27fjsbCgrAYvLScHdfHBAGgS2BOfwHEDvx48IYxGDGxHNq
	4MOsP0hrQg06nOypIxYsjyg=
X-Google-Smtp-Source: ABdhPJxCm/oN52YYKUHdQ98NAwlPo+Q75+UZ/FEhNqLjr1fqzc6EKelA9yoG80pZqkUHXfy/qTduPQ==
X-Received: by 2002:a05:6512:c01:b0:448:6aec:65c5 with SMTP id z1-20020a0565120c0100b004486aec65c5mr26121654lfu.193.1649776768427;
        Tue, 12 Apr 2022 08:19:28 -0700 (PDT)
Received: from [192.168.31.104] (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id l13-20020a19494d000000b0046ba0e38750sm876671lfj.3.2022.04.12.08.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 08:19:27 -0700 (PDT)
Message-ID: <7d6893a9-01d2-e1ab-06c2-745aa8bcd2b0@gmail.com>
Date: Tue, 12 Apr 2022 17:19:25 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ipc/sem: Remove redundant assignments
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>
References: <20220409101933.207157-1-michalorzel.eng@gmail.com>
 <YlRNmXucZwNasoFq@thelio-3990X>
From: Michal Orzel <michalorzel.eng@gmail.com>
In-Reply-To: <YlRNmXucZwNasoFq@thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

On 11.04.2022 17:47, Nathan Chancellor wrote:
> Hi Michal,
> 
> On Sat, Apr 09, 2022 at 12:19:31PM +0200, Michal Orzel wrote:
>> Get rid of redundant assignments which end up in values not being
>> read either because they are overwritten or the function ends.
>>
>> Reported by clang-tidy [deadcode.DeadStores]
>>
>> Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
> 
> Thank you for the patch! This should go through Andrew Morton, now CC'd.
> 
> For the future, having some history behind the origin of these warnings
> would make review a little easier. I'll comment on each below.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
Thanks,
I will keep that in mind when sending other patches fixing static analyzer findings.

Cheers,
Michal
