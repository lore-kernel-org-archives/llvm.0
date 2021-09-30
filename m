Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D582FAF
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 02:32:10 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id z184so5696086iof.5
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 19:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C3icfHV8rziphpmZsPVo5VvYUU+r4uhS/fnY11daDVU=;
        b=BsTyfe3MEXlmmuEqY2A0DBWVcv0KQjH3UQvRb8ylvQxdS36BVtLsKP0cgaKrxAidUp
         DlMFioCBU5rx+XarWdBaMaDbdQNQ+ory9j1MY1WTUqtUfzI+hAX2JqKgATC3HqLy8eIe
         565U9RN9A5bOj+Jxy+QoPe8STtb0kcULmBDw+Nxi64SivK9o6Os3cEUQZEUnJUq3Nef5
         kstwOVz7C1xHXkJjnnydbcySksgU1F11XpF3l/P0YDgVoC/dNFh+ZRdhk6JnP5gm9dwA
         GLC+SmvjYAXoNlpFnBm3p5D1xIu1Ei9qoaJEHAT0H7AMGrlQEiOa0G+/bjDdQ5VS79Fu
         WBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C3icfHV8rziphpmZsPVo5VvYUU+r4uhS/fnY11daDVU=;
        b=1Dqpqn+dUZQOkub1psTJ7zgfGklLwVgS3VgvUb1nSzXa/7EvT4RuQSMSODli21avOI
         FFZ9UEDc7dJjqf+hxA6j/KNbRYw+RVlVR+x1eKJttdcYZeAL03rVw6mZjAUx7WVJ+l1p
         Vaoj7OJDl+y7dHELecq5Ix6XKefH8v2tRYyQO0Rrg91+e36Ugciy9B/x4P19Nkp6hz96
         ZFWhBaJtHrcPjzyj4Fb0k2fOWhZ1jYEsXbd3Xn36b1SY/AQv+r+BPPPnOyeDFTaTeAUG
         Ql4W/HaStLY+LiWMeX1V5Xea/Ir6BFR+SHiWTRvndyxrJ0nrmdY/lZg1pCdF/lm8I2hI
         Ly1w==
X-Gm-Message-State: AOAM5339JqHcNtCFXok2G4UQcdxS2A9LrdZDzqqL4r1HlPcDp6/9r5yB
	ySoCZEzmfmmooOwxlEF9pKrylH7DL6lw8w==
X-Google-Smtp-Source: ABdhPJx7uIPZ0aG5uMZD/IxkKfTuN1Jq6tEKtnFoS3QqqydDwNaNUdWON4uuqSHW5fx72tzKsMax+g==
X-Received: by 2002:a02:cd17:: with SMTP id g23mr2644168jaq.29.1632969129295;
        Wed, 29 Sep 2021 19:32:09 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id o9sm876691iob.15.2021.09.29.19.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 19:32:08 -0700 (PDT)
Subject: Re: [PATCH] nbd: use shifts rather than multiplies
To: Nick Desaulniers <ndesaulniers@google.com>,
 Josef Bacik <josef@toxicpanda.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Pavel Machek <pavel@ucw.cz>,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20210920232533.4092046-1-ndesaulniers@google.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <afad9679-79f2-7a18-0574-28e53b9d7aa3@kernel.dk>
Date: Wed, 29 Sep 2021 20:32:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210920232533.4092046-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/20/21 5:25 PM, Nick Desaulniers wrote:
> commit fad7cd3310db ("nbd: add the check to prevent overflow in
> __nbd_ioctl()") raised an issue from the fallback helpers added in
> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and
> add fallback code")
> 
> ERROR: modpost: "__divdi3" [drivers/block/nbd.ko] undefined!
> 
> As Stephen Rothwell notes:
>   The added check_mul_overflow() call is being passed 64 bit values.
>   COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW is not set for this build (see
>   include/linux/overflow.h).
> 
> Specifically, the helpers for checking whether the results of a
> multiplication overflowed (__unsigned_mul_overflow,
> __signed_add_overflow) use the division operator when
> !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW.  This is problematic for 64b
> operands on 32b hosts.
> 
> This was fixed upstream by
> commit 76ae847497bc ("Documentation: raise minimum supported version of
> GCC to 5.1")
> which is not suitable to be backported to stable.
> 
> Further, __builtin_mul_overflow() would emit a libcall to a
> compiler-rt-only symbol when compiling with clang < 14 for 32b targets.
> 
> ld.lld: error: undefined symbol: __mulodi4
> 
> In order to keep stable buildable with GCC 4.9 and clang < 14, modify
> struct nbd_config to instead track the number of bits of the block size;
> reconstructing the block size using runtime checked shifts that are not
> problematic for those compilers and in a ways that can be backported to
> stable.
> 
> In nbd_set_size, we do validate that the value of blksize must be a
> power of two (POT) and is in the range of [512, PAGE_SIZE] (both
> inclusive).
> 
> This does modify the debugfs interface.

Applied, thanks.

-- 
Jens Axboe

