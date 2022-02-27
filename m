Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE344C91
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 23:57:56 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id d19so12993239ioc.8
        for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 15:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TYixXH/oSVNIYPjWy8IDeErfQMBt7NeciGEbuByoJUQ=;
        b=VA7Y7/hwNTpAG0EJBvjzNcqWEEoLvSuaQCNj01nO45OyMQcgooOoCeTcGzsvRipjXT
         GR51Exj8tHYQvvBj7rj4BWHnSURg64uycJzHdUCB+hGxEtEhlwx2pPdKlhw0XhHwjAE/
         I4bLKsSa7ST5UvIHRTX2rxKh1qtw9ZBdmZ77wJDCw6OPEltA1/Pz2/7JbQRL0duYZ4ct
         a7VUK+N8cmAKsjrWIe0Rajg2EbIFsIgRyubHIXT65zHok28ikdqymV+/J+ecIosK77WB
         vpTaCXz61HY+ci7o/cRo3ZW5ylwVRVT+7wiyD0oTOFySlCVCR7thfpDnSjzQN84bD+HM
         seNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TYixXH/oSVNIYPjWy8IDeErfQMBt7NeciGEbuByoJUQ=;
        b=pbxG6tXVyeNA1tSHTDXWJ36Hs4PJsS07bK/ccbVMiEBNY9469zgf2yLmER1QHnfsZm
         R8Ks/Rp4bN/13dA7ppBr9Jc/4eRO+U6gfuHgbVedBflE1IE9Fp4aJFk/7ysTKit8z26h
         K6NSJ7vCJB/iuAt3C6KTtSsv74nahedgs6b95P0SOYIZboW27dM5sPE3bb09F878S0On
         icUU0LAsdvrvm4kHv4cQU90BAlvm0rraT/6wH/qCLWr0YiGoYycYeCqbNnTJ8Vkr3b3c
         Ih+GkZgHk5ckLY2aNGTgdjS28OodDTRbeQyxa2pGqRD19+or9+HBqa+doLp8iKE9FMbP
         pxXw==
X-Gm-Message-State: AOAM530m0IRLorqo+5gjYz89bDBs7vZvfkOooerZpLww9dBdMsHfFkzV
	fGdf1XxhxZEQ5ZOcTieSqHkpMg==
X-Google-Smtp-Source: ABdhPJyPtYXXq4eTx/zm7hkEn1uc7x7ywQuCdrH5tLSdhR5RU9smY5dt5X0iXebRMULNf0pZ7UBpzA==
X-Received: by 2002:a02:c64e:0:b0:311:b1b4:1a08 with SMTP id k14-20020a02c64e000000b00311b1b41a08mr14572997jan.230.1646006275352;
        Sun, 27 Feb 2022 15:57:55 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id n7-20020a056602340700b006409737fa99sm5093280ioz.27.2022.02.27.15.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 15:57:54 -0800 (PST)
Message-ID: <72ff1b04-4f37-9851-a6e6-aded72b46c83@linaro.org>
Date: Sun, 27 Feb 2022 17:57:52 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler
 arguments
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>,
 Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
References: <20220227215408.3180023-1-arnd@kernel.org>
 <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
 <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/22 5:11 PM, Linus Torvalds wrote:
> On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>>
>> Glancing at the Greybus code, I don't believe there's any
>> reason it needs to shift a negative value.  Such warnings
>> could be fixed by making certain variables unsigned, for
>> example.
> 
> As mentioned in the original thread, making things unsigned actually
> is likely to introduce bugs and make things worse.

Understood.  What I meant is that the shifts were producing
single-bit masks from plain int values that range from 0 to 10
or something (in a for loop).  Looking again though, that it's
not so simple.  Regardless, your point about the warning is
good and I won't plan to "fix" this.

Thanks.

					-Alex
> 
> The warning is simply bogus, and the fact that it was enabled by
> -Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
> be fixed in gcc.
> 
> So don't try to "fix" the code to make any possible warnings go away.
> You may just make things worse.
> 
> (That is often true in general for the more esoteric warnings, but in
> this case it's just painfully more obvious).
> 
>                Linus

