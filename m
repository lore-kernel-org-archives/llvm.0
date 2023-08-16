Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B0210D
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 05:34:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe5c0e5747so36375315e9.0
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692164096; x=1692768896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5ksSrfoQhUw1ZEBLOq6q8yMh3Ah7S6SGizLhXtxXU4=;
        b=edpuAYQXEQ9OEdOp2KZdnwWqRhLG0RH8xS8zwxGuc6hPqsw3/tTqD43TISmtxNI3zY
         3NqNqIX5YOpcIke3Yb9LLrVuErwNXKBLXFqBPe1R30V59HZaSwm1LfiSZK/AMLkgDZBb
         kk+CaQsjS32+fhWiplRVwcYSAo6N9sFNCTCQ0e82fBAfZdgvPoBS8Qg/MlSzV2lO0dTU
         2hN149zs2tA0+Uv0eBRa1xQ4trlAoaI2FV5JDeiN9p/dm17XRLiSYbxPo7bol2zx0/+Z
         cipG8ZIOEnGz79d/KpNobRcQb78NFmG0XB+x8xeY5zBmax8TxuMy+/u4hofd27tm78fG
         OEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164096; x=1692768896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5ksSrfoQhUw1ZEBLOq6q8yMh3Ah7S6SGizLhXtxXU4=;
        b=MFYx7ll4ukY9BhhZiPk/BufT4KRJfgKse/4gjMayNn+KrNiRpcC08gD3uQ+N4QtHmW
         jYBEMZC1C1JWhSb/HNGViqMcgt0r8SJUY14LYjTMUneZSZtm0OEqlit8XKZXa2hwP0FJ
         ymk054xlweiJh22HBPr0VBCKs4wdkdsSs+fKMd8ojGHs1izhomoinHVAOEKUsUpHOR4Z
         MOKr/9zl1XeFdpdIlA10pMTxmNVEtESxG+1ZLSZicYFl34dkTfttdd329BYXDWf1Hqnl
         ukR+P84a2mKQUUw9JpCUiFDIqUqQxWaFslRVqY9nEDwRhPEBI11vdrPZ5fQFqrsKR5rx
         o/3A==
X-Gm-Message-State: AOJu0YzAzZjS7DLePzzqxOF+HlLVY1j96xvrKGbRh20rtTdLJeYXOjPp
	WBkY+pJ+Li4qZ4kDRmsB1YXvLA==
X-Google-Smtp-Source: AGHT+IGLA5lowKwKuCnX8UwxKBq+NtEWMT+CcurCefj4vhebQX0LZ+LoJXhsNlYcgDdsDgX6fzbbWQ==
X-Received: by 2002:a7b:c7c7:0:b0:3fd:2e87:aa28 with SMTP id z7-20020a7bc7c7000000b003fd2e87aa28mr695024wmk.15.1692164096117;
        Tue, 15 Aug 2023 22:34:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e7-20020a05600c218700b003fe3674bb39sm20034014wme.2.2023.08.15.22.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:34:55 -0700 (PDT)
Message-ID: <1c4aa5ce-df78-b69c-0dc2-2859b0c1c3df@linaro.org>
Date: Wed, 16 Aug 2023 07:34:53 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
To: Justin Stitt <justinstitt@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
 <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
 <CAFhGd8rTU0o8uiGT1qUKbsOZTgqLR7Sw5h-+07y4SJ6QOd9KsA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFhGd8rTU0o8uiGT1qUKbsOZTgqLR7Sw5h-+07y4SJ6QOd9KsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/08/2023 01:06, Justin Stitt wrote:
> On Tue, Aug 15, 2023 at 2:15 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/08/2023 23:11, Justin Stitt wrote:
>>> When building with clang 18 I see the following warning:
>>> |       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
>>> |               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>>> |         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;
>>>
>>> This is due to the fact that `devid->data` is a void* while `enum
>>> versatile_flashprot` has the size of an int. This leads to truncation
>>> and possible data loss.
>>
>> Cast does not solve truncation. This part of commit msg suggests that
>> you actually fix real issue... and that is an issue, because then
>> AUTOSEL will grab it. This is just compiler warning silencing and rather
>> coding standard correctness, no real fix, so please drop the sentence.
> OK, makes sense about this not technically solving an issue and thus
> AUTOSEL may pick it up. Can you elaborate, though, on how the cast
> doesn't solve truncation. 

Because that is no how the C language work?

Casting UINTMAX+1 to unsigned int, does not magically change the
unsigned int into something else...


> Is the initial implementation not a
> pointer-width down to int-width cast?

These are different widths, so cast cannot solve truncation.


> Surely we're losing the top half
> of bits. 

If we are losing top half then how is the truncation and data loss solved?

> I'm still not saying there's data loss, to be clear. Just
> that the compiler is warning because of the truncation.

Sorry, what truncation? The one which will happen always regardless of
the cast and warning?

Best regards,
Krzysztof

