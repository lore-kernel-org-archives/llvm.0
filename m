Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F315670
	for <llvm@lists.linux.dev>; Fri, 21 Apr 2023 15:10:54 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-505035e3368so3008034a12.0
        for <llvm@lists.linux.dev>; Fri, 21 Apr 2023 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682089852; x=1684681852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U9T8AS9cjrS3s9uITV3twM/U96KCqFNw0iG6buaIPE=;
        b=zmhDusaW8TTAW6Vr95DNpJ5jqHZ5HwnfZEdA9VP2+WDvNqA23UvxwzQv8h8V1mBMYF
         8biWtA8zCbdwRDNRXP80CcYVjbx5YHu/id55Z9bBFr2q2QW6nt2WpmHigPU2UoqqOCm6
         4nNkUl+2s12mHW216cw0SqklmX9mJRLNrv32tywdYz354himN7+Cp839Qb7+z8Q95W+1
         /fajuVy/rdfRN9fE/nh28IJVZvOUj3cTMTNrsG3aTl+Lxx2/rFY0Pq1WGQ/OChlomJUJ
         NwnY9vGAO8EuQt+JffUfIE639JdiW+7VyL5IKJokIqHqIhvI3BLr8ICKew/oEoKiJsgg
         EbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682089852; x=1684681852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U9T8AS9cjrS3s9uITV3twM/U96KCqFNw0iG6buaIPE=;
        b=IhcDBo/r6mAcFkJfjoGgtmt6TubhxyIARxw9jt1GmxaSX5lZEZPZi8mSL3n/wicJ7a
         IKDh/fPUvne/zXX0y5U+Shkzka7xdivtJ8VdNyPThvFNC41KHIsQ/xCJwjIwFP5mPv/U
         kbAJ/4tbq0PHxhqpjvYZV72kaEp8GDURaCqTMiV7yUzS7yM0JErEljjGx93OjibmoFGn
         CFIlz+iu6ISZV6OvI+qOsHLl8RTEui8H/5sKicWy5DHOK3bHMgy7Gi77TnW23x4klYnM
         pNIjdVp2Q/W91hvtZ8wtyxFjCI8BPyLXJXe91tUXYYH5d2WZp7jJBbYj+dR/0+iqQiWx
         u7tA==
X-Gm-Message-State: AAQBX9fNAt8HLshvgm8rpOP82D/g2HeV7M+xeD78yogINC/XiC2m3N7J
	sn2YTak+9ax2RE5DJly6AoPN/VX6n/cwo+DNbjwPLA==
X-Google-Smtp-Source: AKy350ZUvt8W0YLUNRC+2yZAEZEoEaJ9B2Ng8mmI1fbNoP/iiYmsOVan9Q7Gk6nHMn7GZKhJMkV7eg==
X-Received: by 2002:a17:906:52cc:b0:94e:6504:d134 with SMTP id w12-20020a17090652cc00b0094e6504d134mr2574638ejn.42.1682089852729;
        Fri, 21 Apr 2023 08:10:52 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id n21-20020a1709062bd500b0094e729d333fsm2131198ejg.222.2023.04.21.08.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 08:10:52 -0700 (PDT)
Message-ID: <e46dd2bb-16d1-0c99-56f0-f8c2c4bbc79b@linaro.org>
Date: Fri, 21 Apr 2023 16:10:50 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] Kconfig.debug: disable CONFIG_FRAME_WARN for KASAN_STACK
 && CC_IS_CLANG by default
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: joneslee@google.com, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 zhaoyang.huang@unisoc.com, "Liam R. Howlett" <liam.howlett@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, nogikh@google.com
References: <20230421130111.4041641-1-tudor.ambarus@linaro.org>
 <5d13e927-3713-4b9e-b007-6be5671d46f2@app.fastmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5d13e927-3713-4b9e-b007-6be5671d46f2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Arnd,

On 4/21/23 15:30, Arnd Bergmann wrote:
> On Fri, Apr 21, 2023, at 15:01, Tudor Ambarus wrote:
> 
>> The conclusion is that when KASAN is enabled the stack usage increases a
>> bit, but nothing unmanageable ~30-70 bytes, whereas when enabling
>> KASAN_STACK the stack usage is excessive, from ~1.7K to ~5.8K for these
>> cases.
>>
>> Disable CONFIG_FRAME_WARN for KASAN_STACK && CC_IS_CLANG by default.
>> Adventurers can still override the default value by input prompt or
>> explicit values in defconfigs in case they feel that some real warnings
>> are missed.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> I think we are still better off with the warning enabled. When someone
> really wants to run a kernel with KASAN_STACK enabled, they should have
> a chance to see what they are getting into and not report any runtime
> bugs that come from stack overflow. 
> 

Are such stack overflows warnings reliable when we know that stack
instrumentation causes excessive stack usage? Until clang is fixed one
shall hunt frame-larger-than warnings with KASAN_STACK disabled.

Cheers,
ta
