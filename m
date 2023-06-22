Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD663E
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 00:50:57 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b520c77de0so32913485ad.0
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 17:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687395057; x=1689987057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YNnfLof80DYRhJzNzeXS0S7oXvTEkEp18dIa/GFxd8U=;
        b=O+N9o0Xn9Ur3aYZ+8k6IZyPyQ/ODYR5uUlT/tmJx4rKO/eGGdN8F5nCfOWV3ZAq8gr
         R8n6VOGMhTpJaafQAh5401KAVo/A8p4ErmOylXNQDvjF/qoeuOziVzBjXKt9UaRZRUYK
         W2wK3aUBB0RElMIhL9Dct03zwUucBpD/rlhUFXtcJcAFDbWTUb9MiVX/UyvAdfxcTGJl
         WnFDgqymWyNfGTqoW6WUiSJrBtMpkPRXcGRIxGTc1vTiXAZMtGTsD+ZSYnNiE4dprcGk
         0tImjvth0+TxSnxUeSq6gfyf9CoaYh6ivLVjgYrJ/+QlPl801WP20cVXwQ0onRV+5gog
         NpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687395057; x=1689987057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNnfLof80DYRhJzNzeXS0S7oXvTEkEp18dIa/GFxd8U=;
        b=Lvpgg5rcifNKhX4bc3b+tpAwqaRIGDnqdNrItwFUC6fIXGqtpfn1Cq1QODv3ofoZ1Y
         kivp7+UtHkSUEauF/EPh2all9V/B5Z9scRyvhDKb5JcfaPlgi2h4ePHjUlxPhZWUMrbC
         QQ1fnvMlfGqfsA7g9NRiqFUBfuFvdNTkdy+z2/MfOnsfVS3/E7LC2QTp8Pl7seWIB30B
         MVLMTLz/8qDsHX4JSEfdRzETY10ZzzQnzptSW8oYUpBRn+EFL44eUGNEMpykMTVUczbo
         NQvYe1xBFwe3HVMJjXYSqFvnT0Rl/L9EQQoDovLgszYmoedOamWE18OD1XXajygVH6Fi
         TaVg==
X-Gm-Message-State: AC+VfDxFekP+c2WmhZwIvyIh0XgX53Gh0/GY6GwVEOkO0lQs2FM6OrB6
	oIYdroDlZX3PESflJukYMKA=
X-Google-Smtp-Source: ACHHUZ59/kLruU5N+IKAtTqbHgrt1BPIyAQdjeF0dVqOKxHz27D9SmufuvJNkxrPeSLkKJr08V1brA==
X-Received: by 2002:a17:903:24c:b0:1b0:f727:bc41 with SMTP id j12-20020a170903024c00b001b0f727bc41mr7747529plh.42.1687395056754;
        Wed, 21 Jun 2023 17:50:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b001ab061e352bsm4051896plg.195.2023.06.21.17.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 17:50:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5fbe4977-c56d-2d97-bea3-28148807b5d9@roeck-us.net>
Date: Wed, 21 Jun 2023 17:50:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] ubsan: Tighten UBSAN_BOUNDS on GCC
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: Marco Elver <elver@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20230405022356.gonna.338-kees@kernel.org>
 <07dea91f-9b93-4227-9fec-728a9e7a0d55@roeck-us.net>
 <202306211051.1D4038323@keescook>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202306211051.1D4038323@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/21/23 10:52, Kees Cook wrote:
> On Wed, Jun 21, 2023 at 09:42:01AM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Tue, Apr 04, 2023 at 07:23:59PM -0700, Kees Cook wrote:
>>> The use of -fsanitize=bounds on GCC will ignore some trailing arrays,
>>> leaving a gap in coverage. Switch to using -fsanitize=bounds-strict to
>>> match Clang's stricter behavior.
>>>
>>> Cc: Marco Elver <elver@google.com>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Nathan Chancellor <nathan@kernel.org>
>>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>>> Cc: Nicolas Schier <nicolas@fjasle.eu>
>>> Cc: Tom Rix <trix@redhat.com>
>>> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
>>> Cc: Miroslav Benes <mbenes@suse.cz>
>>> Cc: linux-kbuild@vger.kernel.org
>>> Cc: llvm@lists.linux.dev
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>
>> This patch, presumably as side effect, enables CONFIG_ARCH_STM32
>> for arm64:allmodconfig. As consequence, CONFIG_STM32_RPROC is enabled
>> as well. This in turn results in the following build error.
>>
>> Building arm64:allmodconfig ... failed
>> --------------
>> Error log:
>> In file included from include/linux/printk.h:564,
>>                   from include/asm-generic/bug.h:22,
>>                   from arch/arm64/include/asm/bug.h:26,
>>                   from include/linux/bug.h:5,
>>                   from include/linux/fortify-string.h:5,
>>                   from include/linux/string.h:254,
>>                   from include/linux/dma-mapping.h:7,
>>                   from drivers/remoteproc/stm32_rproc.c:9:
>> drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_mem_alloc':
>> drivers/remoteproc/stm32_rproc.c:122:22: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t'
>>
>> I did not try to understand what is going on, but reverting this
>> patch fixes the problem.
> 
> Well that is really weird! I will investigate... this patch should be
> pretty self-contained...
> 
Meh, it is. Sorry for the noise. My bisect script was wrong.

Guenter

