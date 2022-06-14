Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCCD1FB0
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 17:21:56 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id w16so12426110oie.5
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ywm3mNyiKeLVTgO84COA1L5/j176F2hvLnvyrxiZpk=;
        b=AWkMw8qDDxUsyjkc8/EdDf0vDUNZI4+1avXvECNWeq65H7wYaV4MeZ7v1OOHLMhMj4
         FLzKW+OKYNmbUaKtFTWofkfTtgV129jDjarxpLM2bUCsQZEJhSLUpDJXEL1nc94wUk6Q
         JKafkc/wNofuOHkWC95WULU92xyVIeZA23cc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ywm3mNyiKeLVTgO84COA1L5/j176F2hvLnvyrxiZpk=;
        b=jgMiPQ51Isrw7T0+e6S8vJj0de7d7MJsVcGMZ4x9ubkus+8SoDpDE7KHfBjurfz/Wu
         l3jPTlkW3mW4O85pzlLXYuns0zHjcqfSx0S7dhmwiY6DN4iZQl4tSNBE+plw7K2QEPuT
         qVmH/R5ycX1MV5LeS8pCVDoEwTRVIMmjYSlGF7uRVi9lcqrr69w3b+JmGrGYt6voOd5e
         VBW43hbngN321IhTJsCmHN8Exk187ssrGTVi+l+TmCScInG+/89+j/BHXkxB4rUDbBol
         h/oNPtOqEwz4mqUYCbA6y5ov3BuoxuM3R1sAJptRBOjeKQy97Do5oHqsjvu3UCkS5hGH
         tjxw==
X-Gm-Message-State: AOAM533uuBKkIPrWjhi3VnyUi+KukojUqj/oCyMOiMsZ3clJ5nVj/zfI
	CZuiiWrUyIzLX1pESMipHGJb+A==
X-Google-Smtp-Source: ABdhPJyyL3I7o6YWcvJMsSOx0GWGShRXku1QmIK25GsYA4K+0gPS+KzviOpXpB43NXZuolmRy3EWsQ==
X-Received: by 2002:a05:6808:10d3:b0:32f:51ae:6245 with SMTP id s19-20020a05680810d300b0032f51ae6245mr2636903ois.125.1655227315718;
        Tue, 14 Jun 2022 10:21:55 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id p7-20020a056830318700b0060bfb4e4033sm4914235ots.9.2022.06.14.10.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 10:21:55 -0700 (PDT)
Subject: Re: [PATCH] selftests: Fix clang cross compilation
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20220614121045.1046475-1-broonie@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b4965ab7-c619-16b9-c027-aeb6986f76b7@linuxfoundation.org>
Date: Tue, 14 Jun 2022 11:21:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220614121045.1046475-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/14/22 6:10 AM, Mark Brown wrote:
> Unlike GCC clang uses a single compiler image to support multiple target
> architectures meaning that we can't simply rely on CROSS_COMPILE to select
> the output architecture. Instead we must pass --target to the compiler to
> tell it what to output, kselftest was not doing this so cross compilation
> of kselftest using clang resulted in kselftest being built for the host
> architecture.
> 
> More work is required to fix tests using custom rules but this gets the
> bulk of things building.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/lib.mk | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 

Thank you. I will apply this for the next rc.

thanks,
-- Shuah

