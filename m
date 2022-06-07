Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7A3D65
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 23:20:31 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id s6so30551669lfo.13
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 16:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kJadlcijpEraHCzXfyi7dHvp0N+x8osaIwQlxh9G2bY=;
        b=Z0ia+eLjj6yYhXvzoGPJY2ac0xIAPYnyriaetuCT3yoo9N/HOqP4XHzBGfMavxNlGQ
         JLjlyCYB5YLQc1PwQqza+kuCemyXvU+6AdZYjKQaoHP7z2E8K8oFFC5L4Q6cnM5JlFId
         EYJy6ZGMqU9k/lpBl+tq3yRhcdXnfg4GGxbc6IvuGEofwwTGWi2q0fFdCX4SSnO1btc4
         LWirHSmpgUAOz3v+bCyo21FfstCG4S0rRaZ/7ZgdLn6nFlBpKLo+JOkIWk87m90vdBE5
         1Wzkx4tFR26DuHShOoFlyOVaLcTGbfSc22D80wD2jfOVwvttkNKZ0ES6XCvZwi7/1i3F
         ZvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJadlcijpEraHCzXfyi7dHvp0N+x8osaIwQlxh9G2bY=;
        b=l3lWr49D4gZ/DladMKvJB0IQMb/4X0yWyjI2Xgxm0pCzMWc3LvO+aCrht4vOHHKbc6
         OUS25bKs4DcLNW6l5amk/vWcKKxRJDT4CCHHo49F6cgLK2Iey+Ot1Kej0qDa6A6X4Gz8
         AuQdhCGwQCVgaTevZJt2A81dHW7H4YDC3d4KN0yv0cU5QlY7Zwr3hvW77kCnFlNgjxQO
         dnKDd7Oa87o/vTFcw98pDfXcA91CYTibm+aYgbIQHgs+JQC7g6hWoHVbT6rJw1YkAsEX
         N80P6/7ilkigGAqji6n4zRrrjaFah5RePq/E4dxY+fMDAgBTj2RYMrnZ0vwww6RzjjkW
         PFdw==
X-Gm-Message-State: AOAM533eOOdkXMh8/Aoe3MfbZoD5rsLth4kT2W+CUP51o+Eltnka4a6a
	eET0MlOPEEv4T+g0wuuHOzuWXBUe4PZK7Ze6NgYlkqOMGJ8ruw==
X-Google-Smtp-Source: ABdhPJxMM91AMDYynBTs5Q7XtkgbyiYpxCwW9+RLJVrUt/uZz2PBE4EVkez8NfMupZZuHvJ7gQ8aix+PQfB54ft4sBs=
X-Received: by 2002:a05:6512:3f94:b0:478:7abe:de4a with SMTP id
 x20-20020a0565123f9400b004787abede4amr54322287lfa.401.1654644029597; Tue, 07
 Jun 2022 16:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607222006.22719-1-jstitt007@gmail.com>
In-Reply-To: <20220607222006.22719-1-jstitt007@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 16:20:17 -0700
Message-ID: <CAKwvOd=-NXR5HoHwwEUZMsCt90oaADH6XHifje9n-8S8rj9SFw@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/linux/swab.h: add __u16 cast to __swab16 conditional
To: Justin Stitt <jstitt007@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 3:20 PM Justin Stitt <jstitt007@gmail.com> wrote:
>
> if __HAVE_BUILTIN_BSWAP16__ is defined then __swab16 utilizes a __u16 cast.
> This same cast should be used if __HAVE_BUILTIN_BSWAP16__ is not defined as
> well. This should fix loads (at least a few) clang -Wformat warnings
> specifically with `ntohs()`
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <jstitt007@gmail.com>

I wonder why there's a cast inside the __builtin_constant_p parameter
list? Can't imagine that changing anything. I wonder if this should
be:

diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index 7272f85d6d6a..0723a9cce747 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -102,7 +102,7 @@ static inline __attribute_const__ __u32
__fswahb32(__u32 val)
 #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
 #else
 #define __swab16(x)                            \
-       (__builtin_constant_p((__u16)(x)) ?     \
+       (__u16)(__builtin_constant_p(x) ?       \
        ___constant_swab16(x) :                 \
        __fswab16(x))
 #endif
@@ -115,7 +115,7 @@ static inline __attribute_const__ __u32
__fswahb32(__u32 val)
 #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
 #else
 #define __swab32(x)                            \
-       (__builtin_constant_p((__u32)(x)) ?     \
+       (__u32)(__builtin_constant_p(x) ?       \
        ___constant_swab32(x) :                 \
        __fswab32(x))
 #endif
@@ -128,7 +128,7 @@ static inline __attribute_const__ __u32
__fswahb32(__u32 val)
 #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
 #else
 #define __swab64(x)                            \
-       (__builtin_constant_p((__u64)(x)) ?     \
+       (__u64)(__builtin_constant_p(x) ?       \
        ___constant_swab64(x) :                 \
        __fswab64(x))
 #endif
--
Thanks,
~Nick Desaulniers
