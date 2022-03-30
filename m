Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778847B
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 14:45:30 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id a1so29618826wrh.10
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RmXuJD4qZhRM82pfRtozOF5I4Q36TKR9jSgAnaIvsFU=;
        b=IE6Kb5GEly2RGkpACdTwZ3d+W4pa+BR3N+o4d2j49YkHmS6KNHTqBY98X3IkMuba1f
         P2aomfULik4/hS6jY0G+cdHZkGaiWUdCn08Ddt9oa3aS2PbT504r6zJYRLxknzsZLpBX
         9K7MKGvv14D5wN/0qWGKW4x3Y8b8brMNfwTanUIUTnWiUdUYDDa9ZQzs7qsrCU380347
         p97eNyNB4j0ZpAZEqJmb8LP5/9XIWKqWNC4z9ozebTJEBTuHav3dTSmZ03R6TiRkg9k+
         iMpj6w24hgQAM/hkj+9q84P4d0xjTicW5TmTLLrqRTa3QzEUTrAArzdWZlx0IUkRhmMQ
         uCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RmXuJD4qZhRM82pfRtozOF5I4Q36TKR9jSgAnaIvsFU=;
        b=Qhm6y+CHaUA/rO1R4o7iJJYYc3eh7LiLhv27hPGhPAy3JwQjMwYTBbTws34A9m7mLi
         RIflN5XdgMLRcwXNxmC1/S8ye5bCh8EkrimwLkMv6Gf4vUWB0Hzm/7u3M5d7Ttdq25iP
         MYEenJkJcU5zfLvdHQOyHk1iJqrt60Wn3uvUkazq3Xn002Z+1XEK+4yd6PjnBUZZ32yb
         95ywm/LE5Ztj/4cQlzTnyypQAnbu4yMzMGqOj4YrkAEEuBSPIMxqb+la+1Yc731xjwwV
         bE9bgqF1TU36os7Uj2c+UXGMHVkqdGn0ZD6tjh53E6ABr7Hm5fI3OKsU8yL6sMHUxR8k
         S05w==
X-Gm-Message-State: AOAM532tvwcW4OjKNvrDm0R48u6Ik+YGa/jYn5BH7of536vFU9Y5vtgc
	ojPINTuC0/Go21US9gTRc18rcw==
X-Google-Smtp-Source: ABdhPJw5Q12+09m+TsdsuwZdO/QaOdBpDutmXMtjHeIdKREkr2cwkkLxUsqiU3mAMCv4XIa8aQBYpg==
X-Received: by 2002:a5d:64a3:0:b0:203:d7e5:67ff with SMTP id m3-20020a5d64a3000000b00203d7e567ffmr36471260wrp.617.1648651528474;
        Wed, 30 Mar 2022 07:45:28 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:c121:bc3e:9:bb31])
        by smtp.gmail.com with ESMTPSA id f10-20020a0560001b0a00b0020402c09067sm11534659wrz.50.2022.03.30.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 07:45:27 -0700 (PDT)
Date: Wed, 30 Mar 2022 16:45:22 +0200
From: Marco Elver <elver@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jakub Jelinek <jakub@redhat.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Nathan Chancellor <nathan@kernel.org>, x86-ml <x86@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	linux-toolchains@vger.kernel.org
Subject: Re: clang memcpy calls
Message-ID: <YkRtAuFniiLYdbxG@elver.google.com>
References: <YjxTt3pFIcV3lt8I@zn.tnic>
 <CAKwvOdkw0Bbm+=ZyViXQhBE1L6uSbvkstHJuHpQ21tzJRftgAw@mail.gmail.com>
 <Yj2yYFloadFobRPx@lakrids>
 <Yj3OEI+WHV/A5uf8@hirez.programming.kicks-ass.net>
 <20220325151238.GB614@gate.crashing.org>
 <YkGFdtn0yDIPqXRl@FVFF77S0Q05N>
 <YkGL929QoFiTfMK7@tucnak>
 <YkGwSsXLBjReBhMf@lakrids>
 <YkG0LqWoBRqQ9Jxu@tucnak>
 <YkG7zqwFRtmUKVFc@lakrids>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkG7zqwFRtmUKVFc@lakrids>
User-Agent: Mutt/2.1.4 (2021-12-11)

On Mon, Mar 28, 2022 at 02:44PM +0100, Mark Rutland wrote:
[...]
> From my PoV, distinguishing instrumentable/uninstrumentable calls at
> compile time would be ideal. That, or placing the instrumentation into
> the caller (omitting it when instrumentation is disabled for that
> caller), and expecting the out-of-line forms are never instrumented. I
> appreciate that latter option may not be workable due to potential size
> bloat, though.

That's what user space ASan with Clang already does:

	https://godbolt.org/z/ro1Y8E59e

, where it prefixes mem*() calls with __asan_. Only
-fsanitize=kernel-address has (unfortunately) been taught to omit the
prefix. I don't have any info on the history of this, but given the
issues that have surfaced in this thread, it's clearly the wrong thing.

We'll be adding an option to undo this behaviour:

	https://reviews.llvm.org/D122724

It's unfortunate yet another option is required, but it's the only way
to retain compatibility with older kernels that don't yet understand
__asan_mem*() functions.

For the kernel GCC then should also:

	1. omit the prefix for `-fsanitize=kernel-address` (current behaviour)
	2. add the prefix for `-fsanitize=kernel-address --param asan-kernel-mem-intrinsic-prefix`

But because the ASan user space runtime already understands the
__asan-prefixed versions, I imagine GCC can also do to align with Clang:

	3. add the prefix for normal `-fsanitize=address`

Thanks,
-- Marco
