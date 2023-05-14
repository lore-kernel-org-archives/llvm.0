Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E34110B
	for <llvm@lists.linux.dev>; Sun, 14 May 2023 01:39:56 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6463185f761so1524094b3a.0
        for <llvm@lists.linux.dev>; Sat, 13 May 2023 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1684028396; x=1686620396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKt1LzqC9JJ0Xe6yYnzJlUisPwLdy3pufUyPL32XOaM=;
        b=nECaR3gjPwh6MtV/ocnAfi0i76b2pKNm80xPlzQjU5bUU2VqhDkk3LKd09aHbeotEZ
         m1UthZI8Q2RHwFokq+b9tj5iRlU5qZRPzzcXdyVt2BGgwaCnCt6cDu33wB+bQ24YKqEK
         oMeCKIzQLuw868KYYWHt8QK9F6WW+vTnpDQrre36VmMH4yxxvR175ogoGc0ppJmhbp8Q
         YamdM6zT3xaf68GnsT8kiPmHa8LCp492EdyCuGJlOgiMuVa9P1jMZu2ikvkmQQOG70+I
         zZHwKeAw/Map8dp6rc4aPQsXeIgB8UUa2XDR2bDbsY/BlJopHyP24kQ+jUJBfa6mm0xq
         IfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684028396; x=1686620396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKt1LzqC9JJ0Xe6yYnzJlUisPwLdy3pufUyPL32XOaM=;
        b=ORMAYOZOzPL22qD2IdWIzxKfXfTRulV6jQk9HFBh2SqCxcx0sb/xneFvKYmNoyh+gX
         pBvpdIFKq3sJdnsPNyjxzdfi5lBRtW2wDxxQ/U9sq+DdRzNd73VyEzjG8xInDUb8QNgB
         lDdtnYpfj8slI9ZiDk4jQkMjRmWmlNXi6rzTcx8rvS4w0e2w6KgZz1bVpe3zTPZO/0/N
         1TKSHDqiiT7YLVNtM/scyj1peP0qJfW56fmf9/U5pw2rZB4ReEO4Ws+boN/I5b//3IlB
         Z2yvBDjvKokz1Wam0vHm05aogwgevn9SHxswKTKKJbdtTYivcExo8pQp8xGeHicqLCzz
         zmhQ==
X-Gm-Message-State: AC+VfDz8Km506lWNhQz9A3HD/V8yrtGh9Au09so3oC4Xm11WzPo6L1rI
	KVvwbZrkyeaDclQAp4iaRdUcig==
X-Google-Smtp-Source: ACHHUZ7+n1rNhr7BvicPANiiQIqOjnF0OlLgFLES77MbyHHld7HARnW7PRPPTPJEa16G0RVe9R6yrw==
X-Received: by 2002:a05:6a00:4c99:b0:637:434a:75df with SMTP id eb25-20020a056a004c9900b00637434a75dfmr28759474pfb.0.1684028396366;
        Sat, 13 May 2023 18:39:56 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id o33-20020a635a21000000b0052871962579sm8880012pgb.63.2023.05.13.18.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 18:39:55 -0700 (PDT)
Message-ID: <a685e5d2-5da8-2ff2-c53d-dbf77fa9609d@kernel.dk>
Date: Sat, 13 May 2023 19:39:54 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Content-Language: en-US
To: Tian Lan <tilan7663@gmail.com>
Cc: horms@kernel.org, linux-block@vger.kernel.org, lkp@intel.com,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tian.lan@twosigma.com
References: <892f5292-884b-42ef-fe24-05cfac56e527@kernel.dk>
 <20230513221138.497270-1-tilan7663@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230513221138.497270-1-tilan7663@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/13/23 4:11 PM, Tian Lan wrote:
> Thanks Simon and Jens, I will remove the unused reference. 
> 
> And I'm sorry again, I'm very fresh in kernel development and still 
> trying to learn the whole process. Hopefully this is the last time I will 
> have to make the change (previously, I was compiling the entire kernel and
> missed the warning message). Thank you all for being patient with me and 
> tolerate all the silly mistakes.

There should be zero warnings when compiling, so the easiest way to
check and catch it would be:

$ make -jX -s

as that will be quiet unless a warning or error is triggered.

-- 
Jens Axboe


