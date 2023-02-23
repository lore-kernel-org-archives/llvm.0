Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17830258F
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 13:36:51 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id b16so5249399iln.3
        for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 05:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sP7OO7pY75acB3j8P2/QK5gFH3RzazXAttowMP569Uc=;
        b=B0wEgD1OktVXylPcjRbi2nRQHBVhpToHa9Bs7dtRBLVtufrGjxxvz645NbsDMVbw6W
         eeb7ylEzAaptkvUpmha7xX4qP7n+5d+skBXS5g0HN7ikUjDE+YZRZtW7s0OfIPXpN1+g
         FdgoDBJp4S9TSdxJs7yNO3KVmb8bTDPdjYKDiHbgSeoHOqbXn4soJni7MIC+ZT8pRWC/
         m4bGNyk3jL8QQYL3J1klGLbUjZfaauQNsSjr5lzbw0pcre8IXpOmCh8x682cnrtaYitG
         MVeatK0sAVwWiV4ZiO346DNslIlpgywLwZxguNiylMUtoLHSF6q5lmoBM7zIRhaObwBS
         jXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sP7OO7pY75acB3j8P2/QK5gFH3RzazXAttowMP569Uc=;
        b=1lAnfo50mrMFhNDBYtzQXz1aYJLJyN4L8VIzUJ/yNVH30teDASnO8fO8qoYIj3gnBN
         QYcAu71FzFtzgS8Vc66cECj7yIEU/uLUDctCT4dncUS1jPgyAC5NIDPXThao+UnA9WeG
         h0aJQywljB6N09IyBWKdwuUaH07esLygVpWBQtwg54rAfOxN/oZfKAAmjvvcbNi1DPtj
         9oeOEdjpQltCX7BdNVlVmaRdfjXIn5bxbvucy1LbB2DOynzNwYC7ROyi92kcu4PPTpOI
         2t0UuT1r7Fr592O1IgU94Z7WdXsm5X8y+HyY0yWC7ooKRhTZanrqz30OfvShxPLJMIDT
         jUXA==
X-Gm-Message-State: AO0yUKVdOtzUvf/6T1nxzMDIZY3QAHgp/tJO123cmurAqixwt35sAFrJ
	pWgfT0EXgPFAsm6OSGAwZFhNIL9W3SW+g9ZNI1U=
X-Google-Smtp-Source: AK7set8z948GTlC8szDcOc8/WvlQxm1HwvJ/L6g9lQOWBvpyyqSSClk3PfhXNX0GkRjSC03LuFlClA==
X-Received: by 2002:a05:6e02:198a:b0:315:4a48:aaf with SMTP id g10-20020a056e02198a00b003154a480aafmr8322244ilf.14.1677159411062;
        Thu, 23 Feb 2023 05:36:51 -0800 (PST)
Received: from [172.16.32.78] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id p12-20020a0566380e8c00b003a2a167e7d9sm3547827jas.96.2023.02.23.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 05:36:50 -0800 (PST)
Message-ID: <380c88ef-eb19-e73e-0ec9-805b8b90e957@landley.net>
Date: Thu, 23 Feb 2023 07:50:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/5] try generic compiler name "cc" before falling back to
 "gcc".
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
 <63c2936e-6bc7-67e3-eaf3-0123333381f8@landley.net>
 <CAK7LNASA+Dpe9nv4afnueFeRj4BZDUccOFGJRPr7_rZQ7ZZKaA@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAK7LNASA+Dpe9nv4afnueFeRj4BZDUccOFGJRPr7_rZQ7ZZKaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/22/23 23:31, Masahiro Yamada wrote:
> On Wed, Feb 22, 2023 at 5:41 AM Rob Landley <rob@landley.net> wrote:
>>
>> Distros like debian install the generic "cc" name for both gcc and clang,
>> and the plumbing already does CC_VERSION_TEXT to include Makefile.clang.
>>
>> Previously: https://lkml.iu.edu/hypermail/linux/kernel/2202.0/01505.html
>> Signed-off-by: Rob Landley <rob@landley.net>
>> ---
>>  Makefile | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 3f6628780eb2..0ac57ae3b45f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -456,7 +456,7 @@ endif
>>  HOSTCC = $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
>>  HOSTCXX        = $(LLVM_PREFIX)clang++$(LLVM_SUFFIX)
>>  else
>> -HOSTCC = gcc
>> +HOSTCC := $(shell cc --version >/dev/null 2>&1 && echo cc || echo gcc)
> 
> 'cc' only makes sense for the host compiler,

It was the generic posix name for "C compiler" until posix decided to put an
expiration date in the command name, which seems as widely honored as the
tar->pax switch or the removal of cpio.

The name "gcc" was like "gmake" and "gawk". (On macos homebrew there's "gsed".)

> which is configured by 'update-alternative'.

Hexagon only has llvm support, not gcc, so I had to add an llvm cross compiler
to my cross compiler set, prefixed hexagon-unknown-linux-musl-*, but the linux
kernel wants to call it as hexagon-unknown-linux-musl-gcc.

The kernel builds find with a "gcc" symlink to clang, but there _is_ a generic
name, which is widely installed.

> I tried it before, but LLVM folks preferred
> using $(LLVM) to choose clang/gcc.

So if we want generic behavior without having to specify, we should create a
"gcc" symlink to clang?

>>  HOSTCXX        = g++
>>  endif
>>  HOSTRUSTC = rustc
>> @@ -503,7 +503,8 @@ OBJDUMP             = $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>>  READELF                = $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>>  STRIP          = $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
>>  else
>> -CC             = $(CROSS_COMPILE)gcc
>> +CC             := $(CROSS_COMPILE)$(shell $(CROSS_COMPILE)cc --version \
>> +                       >/dev/null 2>&1 && echo cc || echo gcc)
> 
> This hunk sets up GCC/binutils.

This is the codepath that's taken when you don't explicitly specify "LLVM=1".
The test there is falling back to (appropriately prefixed) gcc when it can't
find a working (appropriately prefixed) cc.

> So, cc does not make sense.  NACK.

Do you explicitly specify the "gold" linker vs the previous gnu one vs
lld.llvm.org on the kernel build command line?

Rob
