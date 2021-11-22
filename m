Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E622C82
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:32:27 +0000 (UTC)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 945923F1C0
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637573544;
	bh=6sbqD1+5Siu68STzvxvEowqyfmYjVmX0yjDAVo+n4mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=oFKRQ73/EEACWJuHrfsPSzvVl1AE0nGZLPJvMHXQovnhLcnYjv2ZqcP4C/7oEaabk
	 sboYCR+/Pzbn8dsLSC3c6WkrbPiiZa0Hm94diSqbPLGeP8gTDaX5UGZDX7jx3NTNpK
	 VNJwIbsj3x0rVRYl3xuKcAwS74WVsxfRumsiGKkxeK7CWnUZat2SuXn7Igdgw84Cu6
	 AaxEEu+PPCP5VBWtl9r6zMfguniYv0ewo7TTuMQtOu/qkwExfPs17G262JB0ifDgsm
	 LHgau2I8Y4qn28dbwtZhgxuvtqDpFWdCVK9OCg4SgaVAdxO31hvLpBVnyNGdY1jj18
	 sq2QeDsjgXAiQ==
Received: by mail-lf1-f72.google.com with SMTP id c14-20020a056512104e00b004036d17f91bso11770607lfb.17
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 01:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6sbqD1+5Siu68STzvxvEowqyfmYjVmX0yjDAVo+n4mU=;
        b=PFl6i8F6pLEzMJsTUyVeo4dXGM9h07+xxj9YtRoVG8wOSi4xKW2DxcGIXfr92B0ROI
         9+THAGzelj7viM+Iz3QViUENrKZTckXrd82m9Gsmr9mXGwcmE6SRZ7M5eMwU6DwtbSCm
         usHxUJGTtns75yswtZjJzfO6mYd83mvkVhvxUbdx1+g/Z3p1acAYbqnwzrpA9Veqt+5c
         j2ssjO0B8JKd7+iSHdsdA5oSvVsnHecarmDGn78JqqCVGik3ws1Xyd0I1bPkHeURT1mr
         YxvRTqyzSdAEmZydc4UwBFzckTlbNbJWYJSJ+IPKwYVU+VKDo/5ukAY5iNxJI4kuqESo
         i0eQ==
X-Gm-Message-State: AOAM5321T3fD+za8Ma8WuEjs/7O3DUfDU612palSkeAWa3gxfIsHJtY7
	NSIoITqx998iQxoUJJfV7sjYNIjCNXAECdaYH3FDATtjb+aKs8V9UZLlqqsoCc/eKpgp5M6/Nrh
	JA48K/UO/3nLW4bdcKbVv3o6gkiTGCpE=
X-Received: by 2002:a2e:a314:: with SMTP id l20mr52899064lje.86.1637573543959;
        Mon, 22 Nov 2021 01:32:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQpfyjBTtEprk7qBKeyvZ3vNul843lbt9yNFPYmiwteRd4nScQ4+hV7xfxkfQojpZN84GYgg==
X-Received: by 2002:a2e:a314:: with SMTP id l20mr52899034lje.86.1637573543744;
        Mon, 22 Nov 2021 01:32:23 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c6sm897368ljn.84.2021.11.22.01.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 01:32:23 -0800 (PST)
Message-ID: <7eeeb5d0-3ef1-35cd-e7e2-cdeeb979b83b@canonical.com>
Date: Mon, 22 Nov 2021 10:32:22 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
 <CA+V-a8sGA4=oxwp87VonC6zdPYT5-BHmsVoV8L1ggTUV8m4ooA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CA+V-a8sGA4=oxwp87VonC6zdPYT5-BHmsVoV8L1ggTUV8m4ooA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2021 09:46, Lad, Prabhakar wrote:
> Hi Geert,
> 
> Thank you for the review.
> 
> On Mon, Nov 22, 2021 at 7:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Prabhakar,
>>
>> On Sun, Nov 21, 2021 at 7:05 PM Lad Prabhakar
>> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>> This patch silences the following clang warning:
>>>
>>> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
>>> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>>> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
>>> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>>> --- a/drivers/memory/renesas-rpc-if.c
>>> +++ b/drivers/memory/renesas-rpc-if.c
>>> @@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
>>>                 return PTR_ERR(rpc->dirmap);
>>>         rpc->size = resource_size(res);
>>>
>>> -       rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
>>> +       rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);
>>
>> While correct, the cast to "enum rpcif_type" is not stricly needed anymore.
>>
> Agreed.
> 
> @Krzysztof, let me know if you want me to resend the patch with the
> cast to "enum rpcif_type" dropped.

I can fix it when applying, thanks!


Best regards,
Krzysztof
