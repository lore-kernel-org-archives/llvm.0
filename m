Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DE1B60
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 20:47:31 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id c14so7876806ioa.12
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 12:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VhQ6lKdQCvPa4Z8KH2JlJuyb4CM5CfZt3HGbqFOgQ4M=;
        b=eegCtk9huTZTwXDWkYjkVEEZ5pesUUXBxlnsi20xEbSGwmTDenbsGqD7FfXQ4quQLR
         oMGFfxk/+95IXHOck2zsyXN9Qb3MFG2FbcA85EPpUe+F17Yuygbvg6sQGrL97ZhV2W8k
         RzU0LhY94wy+yc3uEEpLo09XXGh2GNaHtSlnrSz8Z0S+q81auadodsbblVnJWqjKXgV+
         c9dO4Uz3tJE1MgCgr9V/hS/ihJXCOhe5c2Kt0s9hWOiQxoeuiYsBbVC/yjG2b2Ywy1Wb
         6yaH70PUTXqYA6jrN8dOMYZpAxBE7Lyyzan1KInNNGh2YlRcjGpaS0qG1aqPO201F4V1
         sIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhQ6lKdQCvPa4Z8KH2JlJuyb4CM5CfZt3HGbqFOgQ4M=;
        b=D3D4pVIvc9spV4+rSUMltA31yClZZqO+q9QdLIM/FRmlJ441EEg8Mi3GCNZHVUNQgf
         8RjO/7onj237jct1y2xP/3ZkCvF55xYcFpI40+PVGV6Dyt/neTOdOmDqBqWFP5o3Ol4x
         goBaS6QClqbKQsKmdsdOEgnSdspEStEpULQEsNQYuqpPPoZnf2o3JI41R3M6ycQw/52w
         IvCuUJ7AFnHb3pCu57Jy3YJ2kxQ2JBnQ6L2Etqk+SgOQsxyo0T5Vy9PLkImRz+aumxJS
         l6LK+MVacycvmSUcBpgpJIgeDbKbK3wEgsx7J9wOMRep8bXzV5ZrRAVdUtj9NB4gFfF8
         QNog==
X-Gm-Message-State: AOAM530sIdCnVsDpFJu/pMJJYT2Zf9MjWrdUfmVYbVP9fjNOqAKgqzu1
	q4Si9UHsH3bY3ZHR9ugOkboRviIKjR0cHh9Jo0U=
X-Google-Smtp-Source: ABdhPJwMci6YtjBxOjakzW01EpDicV5XGJJDGczqNUCY1aXcEKVD0okYOyZY2SmasQNuCV5U0S3wfTU6mAJiYqXfSz0=
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr6737452iow.172.1645822050350; Fri, 25
 Feb 2022 12:47:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225032410.25622-1-ashimida@linux.alibaba.com>
In-Reply-To: <20220225032410.25622-1-ashimida@linux.alibaba.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 25 Feb 2022 21:47:19 +0100
Message-ID: <CANiq72kXoonDYk095XvBwEtRCRNECd1iQOqJHE2cNcgLyUMfcQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] AARCH64: Add gcc Shadow Call Stack support
To: Dan Li <ashimida@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Marco Elver <elver@google.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 4:24 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>
> +         - Clang (https://clang.llvm.org/docs/ShadowCallStack.html)
> +         - GCC (https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html#Instrumentation-Options)

Maybe Clang: and GCC: instead of the parenthesis?

> +#ifdef CONFIG_SHADOW_CALL_STACK
> +#define __noscs __attribute__((__no_sanitize__("shadow-call-stack")))
> +#endif

Since both compilers have it, and I guess the `#ifdef` condition would
work for both, could this be moved into `compiler_types.h` where the
empty `__noscs` definition is, and remove the one from
`compiler-clang.h`?

Cheers,
Miguel
