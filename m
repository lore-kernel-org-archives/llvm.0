Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793AE4E0B80
	for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665350; cv=none; b=AaS9RAg8PzH/HoiS25VXgQLyOg4qdLz0cCrfOc/oLlV93OQCyqiHuz4C8unNaa17aotaq/xMp4ztgg0BFAoqQTDkl8ZReCyKWi2HaErtFMvqOMYtYwAd5Huip7zponeHgE2VTKxeOK6jv2243ciQprxC6h49x5/Y+ze320JOz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665350; c=relaxed/simple;
	bh=biPMv+ofFeAlNkpuoiheHfcM5OSqeT3TWtGH022bAOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7Qp8nYtu3u9JXwr8qFfxnMKs97s+JNgFTDCYjtZZascV9rum6Hx16llDH8UStwUPldhY0oHBj9Ljlk6oP0SU/TphAxVbNY8NRkoeQcKJzrGaTu5qrxjzgQBSjMlN2Y85XWXc/JK6Jy0YXLgiBfYT+C+LZ+RaH8GnWkYLRmJXzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KiL+6UJr; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KiL+6UJr"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso1605783a12.3
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789665346; x=1790270146; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=KiL+6UJrbBOfgaATUVh7x/JYI8rhhfZQnZzA/euJiN+xb6QCuAYQtQpMOhaMqTgLIu
         fxIrL7ou6upxCziNU843Yh8EAVssMxv9PF5xPWqkZmkBpQyQPuA3wiQHT7fsC1ESg2wM
         dS2vrN/rk1od1gfvxUrkid9JwPAB0WfNQRjTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665346; x=1790270146;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=BcYQTGEEt8HI6tCsRiaDVFtwa/tOh5gHsNd2Uga8w2ooCvGoDQYMID30HQMNOetKvS
         tOu9yUCujYzXl3OqQ5z4ru3LY2yrV8CiJkwvFYku+EvmkDY1Np8MMQCXbknc/ztUGpZN
         AvlMT9ejeAR3NpIJtxgEiMUct8IvLJXaphKDtCOeBWJMDNDkHnfLTZ/Udu/7WNB7qAwI
         zO8UI0rRCoXE6YNiFmHqyrVKXicTnSPBlg7aZRgHSjiFnOlRQJlPbAnE4PoNe7k37nJE
         GAPgUIcGMG/nZnZEOKTQmsei9pefbq0aw4PdG0mZooe5HLzhyh9Og240D5CGkz2+iuiz
         ESuA==
X-Forwarded-Encrypted: i=1; AKwUvByblk8Bvgv2l5N/lmSZKHmkxXbZFa4BCDIZSoFE++alLN95QLCfiCpFGNbjDBT+wiAFOGCQ@lists.linux.dev
X-Gm-Message-State: AFuF++nHCVqG2fXdymQ6/AiMrspSwCplVL3Fhq/jlYj4eOZkgt1pMewL
	1rKhFlbexR2QOcNgpBukqMLJNoJ7VH2cYbY6Yv/zTp0uaHIT/IYJBfGXFGkl0IqnNoUu/JbLutI
	JDcA5q80=
X-Gm-Gg: AYBFou3hCboosTaGxb+6vJVt6/Fd8BT1TfqyeINW8h2Ni8nnEIGEIlLtGfkQyO/h4bH
	JU7GX1c5GbeqEq8I8fdcnNNj6AXHCMaILzzJFq7h0u0F1agsSbIQ/Ul0hj5K2hd896YjYBu3yfE
	YQy+gZF7Rt7qWAzApxT/v9uJIMxdv87EnScmQiBfv2/+E4Xl9VKdoWRUBDczlK/Tl6LyOKGXTGe
	+R/i3ByO+cFhEG9SRlaB21aviptERQ26svb+XU8o7ClYAdAULq1cmWEqk6a2AjViiLsdl4offZX
	+Y8Am0IHPAHRSWScjNDnzbmD9Yx9zwwYmEFFqhfU5E0YHk2yKW/lpYdMLIk/L2uMhyzCrhfJuMA
	3l7/Q+BCC/xqbXQQkIcgzCKgDhNmJ8fOhmfPCWhrHQmtfCyd4VBzUzXn5Vk9lZbwQRr1g6Z9owY
	1CkL0VoQbuwubiHY+7Bb+82oHtnKqrmQb2kDP+AqyK+94khORJRVHRDGAAd/0UguheBzqgoLITX
	WXfN2hs0usMmq08SL3/sg3Q2qSOaHms1DNe/FDdHksWuSEP1w==
X-Received: by 2002:a17:907:c48b:b0:c29:3838:dd65 with SMTP id a640c23a62f3a-c29e5347afbmr550249766b.41.1789665345595;
        Thu, 17 Sep 2026 10:15:45 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de6933e3sm327858266b.61.2026.09.17.10.15.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:15:44 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so162622466b.3
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 10:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGCCd31OXQW4HVkuXRRiGcoqFGbW4HsT525U4eknpebX8agX2sHUAtE4nduJk9esd4sxRz@lists.linux.dev
X-Received: by 2002:a17:907:c1f:b0:c12:e178:9e68 with SMTP id
 a640c23a62f3a-c29e5237e9amr501417166b.19.1789665344119; Thu, 17 Sep 2026
 10:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Sep 2026 10:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1VkAmOFPymjE_dcKSWc6Q8Z4LvlbW-9yRGSGQmATfVxYq3jdlUQ82g4gXM
Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
>                 == defconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> M2, clang               634.5s   569.4s    -65.1s (-10%)

There's something odd going on with that M2 gcc build. Why is it such
an odd duck?

             Linus
