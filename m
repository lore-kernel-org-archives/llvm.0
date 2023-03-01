Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDD10EE
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 09:02:26 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l25so12438634wrb.3
        for <llvm@lists.linux.dev>; Wed, 01 Mar 2023 01:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677661345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekZ4DgBz/58XVt2GqkwjhmN0aRNTOhzU+bBWwyMlb+U=;
        b=c1OWNeMO84VA6eVvCvNVbpXjP6fzotm0PAwX14XvWBKtB8g4wkaOcsPZOrvjO4JxwZ
         lUUoCvQM0Cc3yHwsZk0Hra3f2p7KxFtxsj6R24OQ/13UTrYg7pJP0/i+bx9FQbWDmFSB
         RHY2dRtPQBugNAIuHeJt46/msPZZ4t+GqGFqzIwXXLpNtfteIIcKosMy5102QCm/QBv2
         O0WxUsv3NvNx5mAUBAhFAh1WfHe5y8SS3lw1rzaRyxxqD5rUvFp5eCyj18upgwjGbRkP
         4wDTckzz9WSvg+T94CRo20T74jiGkZaGTN2hX0BJaItILIfpEu7pXqYU605nNX5yFuLD
         2pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekZ4DgBz/58XVt2GqkwjhmN0aRNTOhzU+bBWwyMlb+U=;
        b=LkbAChE2kv6xmtWl6ymZwAETS78KAV554VUsrPZ+Ibuv45mTeFSqNQweToYVnfBH0D
         Ad7B3d3BA8VfL4NnTMNIkwrpDSNnejPz/1pSjvbBGpbhUO+mFRXmrvX/G4iRRJlm97PN
         80pWJwianO3ARuhMLZartVWj9e+FhZIUJgKQqeTNiLQNBND3TA1wl98LRgxibp3dnng0
         4z+9ukQqz3neVtUfFZ/dHihSuSO8TIFViLIybbGBgbKOc6MtfbLfLMDX3Zu0hNHcF/xx
         YXLhppwAzUM+Bw0dqljRykAVjjsYhp3edluU3iGdZkEml+gxeH5Eh84bdlKzkZGYZWFh
         e3Fw==
X-Gm-Message-State: AO0yUKWoltcpHWXmUn5+q6t0fjnj4OQx1Sktv1RsYAq7Oi4PkgcZj0dN
	C5Rwk1/0w83fbU1Gb9SzJg5SAg==
X-Google-Smtp-Source: AK7set+NsBzCNYKPvWP7ij2i03S5Y3cTBtF/dYzRY0sFngDo55yw34iZwfYt8/GBdtP6Au6jnsondA==
X-Received: by 2002:a5d:5967:0:b0:2c7:17db:bf5c with SMTP id e39-20020a5d5967000000b002c717dbbf5cmr4109821wri.25.1677661344971;
        Wed, 01 Mar 2023 01:02:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id ja13-20020a05600c556d00b003eb596cbc54sm1168581wmb.0.2023.03.01.01.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 01:02:24 -0800 (PST)
Message-ID: <af50f94a-467e-5367-584c-62a3241ae060@linaro.org>
Date: Wed, 1 Mar 2023 10:02:22 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3] MIPS: Workaround clang inline compat branch issue
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de, nathan@kernel.org, llvm@lists.linux.dev
References: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/2/23 20:34, Jiaxun Yang wrote:
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
> 
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
> 
> Fix boot on boston board.
> 
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> v2: Add Link tag to LLVM bug
> v3: Docuement issue link in Kconfig as well
> ---
>   arch/mips/Kconfig           | 4 ++++
>   arch/mips/include/asm/asm.h | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

