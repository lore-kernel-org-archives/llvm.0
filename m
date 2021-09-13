Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A653FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 14:33:36 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id g4-20020a4ab044000000b002900bf3b03fso3470109oon.1
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XUePaOFAdB0VXNdn0M/EZEaFLP4il2XD0ts+H5PH8PQ=;
        b=jvxav826u7+YbApk1RbeOlY7+A0oJEMn0vmZN7A6Ve1CJNpxHWRPTLQlGD/PDPkPL8
         zB2xBAnWvgv/ZTqY5ZrLdR1RkHQgcjy5c6hTyEPzCzlXDcXHTDbaJHrCAqZoQWPn9+uO
         /Ic/fvpf8qRg9yRjP8i6wnqMHSI5YK+9WlvDJ7UINjYwUeXCR3KXask393vrk2fgqYdK
         E33bmtr0tmfRMo8xN3bszBq99uma3sSgVpZofVLy4306y5jkc//ghaZNMKa5416qeUXb
         aju2zufOoJIIN5KBdTcxFwLJ25yqpIWPSppBGsTU8YkJ+uxGgZ2j7xlwjEE2+1ON/rcd
         WduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XUePaOFAdB0VXNdn0M/EZEaFLP4il2XD0ts+H5PH8PQ=;
        b=LfD9iBgpLNqb8oedG9XL0lhEv8m5yGxpMuTKQ6caRyYbUN2H8OYVEg9MfkIjMj8RA3
         vMoV0hFFBng9Z1buo2UMYsigZ/m7k9P5BGv22ZbXt7Kn9AkYVKww0oflIPQPw3oey4aJ
         pSdFFnedKWFJOovKMyj78XvqXORLSC9bW2bzMR4p5X94k3v7pA0jX2sUlRAzq2BXrhp4
         qJH2t6zjsB76TkqQVXPAS9FbV1mIhZcJmzvpGM6ckIgpHopUMuDi4M3PDJ3TIZUnzLL1
         ThwILMW8IB1hPzZdbWjs2YOosojTQnne/65pB+SpEScXkKAR9XFBMquektEfBtEC0/pC
         Pu9Q==
X-Gm-Message-State: AOAM530DJUXOdxQdrAmVrpKuq5iw6p+FT4EGVDUBXLffraYsOEL/5uFn
	Mi92/G9qhgBlC1rf2b57sTA=
X-Google-Smtp-Source: ABdhPJyF+2Z9z/XFqRvANUemzJMbtHjkk9GypcMxmGa0E4m13O0vPoiaDgLsezFcw91jm4YhvuQpBQ==
X-Received: by 2002:a4a:4b42:: with SMTP id q63mr9739186ooa.78.1631543615431;
        Mon, 13 Sep 2021 07:33:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10sm1900359otp.25.2021.09.13.07.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 07:33:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
To: Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>,
 linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma
 <vipinsh@google.com>, Chris Down <chris@chrisdown.name>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
 <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
 <20210913093256.GA12225@amd>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <62c6b091-12ad-a1f0-637c-f696c7dae325@roeck-us.net>
Date: Mon, 13 Sep 2021 07:33:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210913093256.GA12225@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/13/21 2:32 AM, Pavel Machek wrote:
> Hi!
> 
>>>>   config WERROR
>>>>          bool "Compile the kernel with warnings as errors"
>>>> -       default y
>>>> +       default COMPILE_TEST
>>>
>>> That seems reasonable. It very much is about build-testing.
>>
>> That and 2 more things IMO:
>>
>> a. having developers be responsible for build warnings, not just
>>     build errors
>>
>> b. having maintainers merge them more like they are build errors
>>     and not just some warnings that can be overlooked.
>>
>> I don't see enough of a. or b.  :(
> 
> Do we really want developers treat warnings as errors? When the code
> is okay but some random version of gcc dislikes it...
> 
> Plus, there's question of stable. We already get ton of churn there
> ("this fixes random warning"). WERROR will only encourage that...
> 

All Chrome OS builds are already done with -Werror enabled. Having it
enabled in the incoming stable releases will reduce our workload when
backporting stable releases. I am actually working on making at
least chromeos-5.10 "clean" for allmodconfig builds on arm, arm64,
and x86 (everything else is hopeless, and even arm may be futile,
but arm64 and x86 seem to be doable).

I'd rather have warnings fixed in incoming stable releases than having
to pull additional patches into our kernels.

Guenter
