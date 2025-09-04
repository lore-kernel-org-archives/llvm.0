Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAD2F3C3F
	for <llvm@lists.linux.dev>; Thu,  4 Sep 2025 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026610; cv=none; b=kZS4+BnYSDo1auLo4SvKgqcYI51cPoNy3wpOzjWaotqaM/kVelqugwvBYfQCzw5ba4zoRnKgqwc4dmkLDQ+3HhGLC+V5IJukM5HLWMGYHIocaEXODtr1RuzY+KkG9Ew2ZdHHdx5BDRCQ8TQdDKoYvaCDSKxRZz+CtEdVEjWv9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026610; c=relaxed/simple;
	bh=JYcdaBsJPM3aXP97DSmZE1zLWV6/mzt9FeGlt4RrHgc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Aq9mkqccDs03z5TI0EgJUkxBduZAjiLp5i+JI6PRYB4iiE2VVjvBfAjpUli57Z3VrxoeIBWMOO4peeCF7VLxnqVDWb7En3DCv5sO+fVwFYY5mH4qiKtZzIrpv+87FH9nBDEIRSU2d6MwN7xsQHtaEgVRA0TWxefPqWlehWJ73fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv2RctZe; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv2RctZe"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e9e137d69aaso38233276.0
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757026608; x=1757631408; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZJsJ6Dias4aJk5oVm4edgReGaNhIOC6r9PNPMsZ5pk=;
        b=cv2RctZeZQeqLNZH3dyhWfGdNvqemfmqCG07TiQ6/YZVTh2ZFpVXnFAbN5wqPCMWbN
         uStwdMlE/aBfxVtxsL8xMWggUo/ccZRFxda00ZFRApFycrAesS4ph+3XDHdj0/X1u2Of
         1X/HEfeWBTtgv1/+kSbK+sngl+Ksqp7CJIVpTTuaWAYGnwBiopv5MKESKtT7RpHe+pLz
         s8FS0rJMiLhIEIeupjHYiqQJsRv1KjYluQSOayp7JgcrkxCCpWKaLIDAurPI/z19KIgp
         Hxxb8KT3GLX3GL6KTt5B/ebgX80YgbJA9+k35/ToBrTK1zHzF75dRTOKHjiFYha96zhY
         NhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757026608; x=1757631408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZJsJ6Dias4aJk5oVm4edgReGaNhIOC6r9PNPMsZ5pk=;
        b=KpJR/Iys5Vm7m4B+T+8mC27xD7lL3B+YysjfvkTJBb82+xdoG/R6TKCajpQnEK4vJw
         ap2NEnxnuCuvPtC5TwLpMXsX4Goz/viNX2yAMTHQ4YzvVvR7LrpKtNPsPkJc42/95WpL
         mpbFETSkGQVNANwqnbif7nTECyqpN8Oc1StOXIHFbdyCmBwP7KfNIKob6/Ze+3Ye4bGp
         SqVBHWKeGdnpwV+GaC7+wMtyiPzjA0L7BFyBEfe6i8Ov+tVtuz0TFbssnyrVGubMDIi0
         uYnaw9rwJjRrGFcqT0tq6v6J0Jf+YN7pZ+t163B6mQ1BVrzmmNjBT2JOWYcqIG+AtpZd
         dhfg==
X-Forwarded-Encrypted: i=1; AJvYcCVerDCuHsVKT8N1L6nqosE0hoiumYd/VzxA7sPMj3sKQ72X1sSRIIRv66SmwhM/URincnlL@lists.linux.dev
X-Gm-Message-State: AOJu0YzYFoHBsx9q9R76yoPdal/NGRiD4hv0e0/AyhEkCoXSkdxuf0oD
	DpB9DWfP84DsVuQ9GibsGY2VfNkERFbIQthZqzAQ60V7igO+cGCOe8lv
X-Gm-Gg: ASbGncs+W8mb68V00+x1J25C8IXfk9yYic7syC7wIgRyE5Bfn+BXSZ802YCyeN4S3yy
	jp3rMAeERW/kEMPKVyXDIeoUE1IfQ4S2/l/znCTwesu1ByYo/Z3ZZf/RGzoDuLqO/E3Hi63QOtH
	Hown6wpV4ZlrBpoIUUjZZgIaeYuUY2SBIvT6lEc2vL4UZ9yhKRzlCkyaW6lHKzqHhxFwBl9Z7PL
	gtFON/UBrBw9JmgoPDXpz4btlMhWO0e41PNcfNeevvPp5EMGAhNDHbdXLNH84QZnNBivwr78Mub
	8sMuhCMDUleCRayg0MYotlh3Z+rTXXOsiQkHheRCVYIt9lnl0tHEoRwiOECgSFrwhHI2eYNpv7c
	/cfOYyV2UcgXn4vq1mwtrpF7vY8cuHdhdykxYQX8w/FrMbz+sJkMVgFU+onmn9+U=
X-Google-Smtp-Source: AGHT+IEHGA0wsG9SM+lLIiJeqw57Hw+stWOBnY10zVsxOztzEXgl10NjAasmizVO1rfQqLWWpmuaDQ==
X-Received: by 2002:a05:690c:6a03:b0:724:c055:3cf3 with SMTP id 00721157ae682-724c0553f47mr40845437b3.14.1757026606920;
        Thu, 04 Sep 2025 15:56:46 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a855a865sm24681447b3.54.2025.09.04.15.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 15:56:46 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Date: Fri, 5 Sep 2025 06:56:35 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
Content-Language: en-US
In-Reply-To: <20250904-sterilize-swagger-c7999b124e83@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> One thing - please don't send new versions
> of patchsets in response to earlier versions or other threads. It
> doesn't do you any favours with mailbox visibility.

I apologize for this, I'm pretty much new to mailing lists, so I had 
followed the step "Explicit In-Reply-To headers" [1] in doc. For future 
patches I'll send them alone instead of replying to existing threads.

[1]: 
https://www.kernel.org/doc/html/v6.9/process/submitting-patches.html#explicit-in-reply-to-headers

> Other than Zicsr/Zifencei that may need explicit handling in a dedicated
> option, the approach here seems kinda backwards.
> Individually these symbols don't actually mean what they say they do,
> which is confusing: "recognises" here is true even when it may not be
> true at all because TOOLCHAIN_HAS_FOO is not set. Why can these options
> not be removed, and instead the TOOLCHAIN_HAS_FOO options grow a
> "depends on !RUST || <condition>"?

Yes, it's kinda "backwards", which is intentional, based on the 
following considerations:

1) As mentioned in rust/Makefile, filtering flags for libclang is a 
hack, because currently bindgen only has libclang as backend, and 
ideally bindgen should support GCC so that the passed CC flags are 
supposed to be fully compatible. On the RISC-V side, I tend to think 
that version checking for extensions for libclang is also a hack, which 
could have been accomplished with just the cc-option function, ideally.

2) Rust bindgen only "generates" FFI stuff, it is not involved in the 
final assembly stage. In other words, it doesn't matter so much what 
RISC-V extensions to turn on for bindgen (although it does have a little 
impact, like some macro switches), it's more matter to CC.

Therefore, I chose not to modify the original extension config 
conditions so that if libclang doesn't support the CC flag for an 
extension, then the Rust build is not supported, rather than treating 
the extension as not supported.

Nonetheless, it occurred to me as I was writing this reply that if GCC 
implements a new extension in the future that LLVM/Clang doesn't yet 
have, this could once again lead to a break in GCC+Rust build support if 
the kernel decides to use the new extension. So it's a trade-off, you 
guys decide, I'm fine with both.

Regarding the name, initially I named it "compatible", and ended up 
changed it to "recognize" before sending the patch. If we continue on 
this path, I'm not sure what name is appropriate to use here, do you 
guys have any ideas?

> What does the libclang >= 17 requirement actually do here? Is that the
> version where llvm starts to require that Zicsr/Zifencei is set in order
> to use them? I think a comment to that effect is required if so. This
> doesn't actually need to be blocking either, should just be able to
> filter it out of march when passing to bindgen, no?

libclang >= 17 starts recognizing Zicsr/Zifencei in -march, passing them 
to -march doesn't generate an error, and passing them or not doesn't 
have any real difference. (still follows ISA before version 20190608 -- 
Zicsr/Zifencei are included in base ISA). I should have written a 
comment there to avoid confusion.

Reference commit in LLVM/Clang 22e199e6af ("[RISCV] Accept zicsr and 
zifencei command line options")
https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16

> What about the case where TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not
> set at all? Currently your patch is going to block rust in that case,
> when actually nothing needs to be done at all - no part of the toolchain
> requires understanding Zicsr/Zifencei as standalone extensions in this
> case.

This is a bug, I missed this case. So it should be corrected to:

    config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
         def_bool y
         depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC ||
    !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI ||
    RUST_BINDGEN_LIBCLANG_VERSION >= 170000


> The TOOLCHAIN_NEEDS_OLD_ISA_SPEC handling I don't remember 100% how it
> works, but if bindgen requires them to be set to use the extension
> this will return true but do nothing to add the extensions to march?
> That seems wrong to me.
> I'd be fairly amenable to disabling rust though when used in combination
> with gcc < 11.3 and gas >=2.36 since it's such a niche condition, rather
> doing work to support it. That'd be effectively an inversion of your
> first condition.

The current latest version of LLVM/Clang still does not require explicit 
Zicsr/Zifence to enable these two extensions, Clang just accepts them in 
-march and then silently ignores them.

Checking the usage of CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC:

    ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
    KBUILD_CFLAGS += -Wa,-misa-spec=2.2
    KBUILD_AFLAGS += -Wa,-misa-spec=2.2
    else
    riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=
    $(riscv-march-y)_zicsr_zifencei
    endif

It just uses -Wa to force an older ISA version to GAS. So the 
RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI I corrected above should 
be fine now I guess? Or would you still prefer your idea of blocking 
Rust if TOOLCHAIN_NEEDS_OLD_ISA_SPEC is true?

(To be clear, the breaking changes regarding Zicsr/Zifence are since ISA 
version 20190608, and versions 2.0, 2.1, 2.2 are older than 20190608)

The only thing I'm confused about is that according to the comment of 
TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI, GCC-12.1.0 bumped the default 
ISA to 20191213, but why doesn't the depends-on have condition || 
(CC_IS_GCC && GCC_VERSION >= 120100)?

Thanks for your detailed review.
