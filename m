Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250A3D65
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 22:28:21 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id t25so4346419ljd.6
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xyMWC5Ce+DbHvHrRZbNzybIooKs941ovMuRT8zwal6o=;
        b=ODldyIJbQoAyYDC5pjX9b20HROQqklkQThQUFGX3eTahhXsBHBH4CJlIDCBgttiogS
         MmA3Oo84KlyqrtjbK76zj9ibCUeLYihWEyQSxtQhG2lX8Far/bwtzC0hVK668HMlqWfe
         ia5ZuUTYVcKzSzX1Fa0FUl/4sh4+GA+p4bgK9NIL1dBZh1A2NpMc0sBPArJlyLn+Bi07
         pNjdkORNwQcm1WoWkJEtRjnibWydx+fLZclqKH+O93fNK+BclfQPzuJmqUALA0f9wzvn
         7tZI+ql9/KioXlR48gTW8io/0g5EQV67uS6bfAZu2AJa2jTe+8daQMNT+xmEpiX22eeF
         wv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xyMWC5Ce+DbHvHrRZbNzybIooKs941ovMuRT8zwal6o=;
        b=pXtC0J/N7ggGIII3LDix5uEesA2kiRp/V4u83maSv9T1xuMn5M53s3tkpNuhaL5O1e
         yRJrtbELh7wTrIoZND4jVDnIJy3PLH95amOWgKofk9WF+G47nX0NODlwYdL1ifj4LzUY
         PYAkIV0JtJAjb7nOJXwQ3F/HlN9s36HBsAhpekeEpJUaXyCerJTpnfl/LWebPAsXN3Aa
         4A6Ufhs0HM4YwMP0TcyzEuQcyucqHysmg1I/ssMwYdUvcVYWahsRR74tBQ5UDun2NTMm
         mkdr8ixZ6cw1jGyeDGqibawibt3NDfigK4DzXRgRvegGip5d00QYFWk3WCoI39YiEiqn
         ne6A==
X-Gm-Message-State: AOAM532wUQSJBiml2lU2kK3POogEwcIU2E0o8pmRjerOE0MjiJGoJLTa
	ByZzvii5PxMGAHd4B20SuYy3N37z1a8+GlRwYPeilg==
X-Google-Smtp-Source: ABdhPJyv+O/HArEJ1Z0AyIFHlWgXlGM/PbFI2as6NgGfHYb60UnmpCiC8VUkn1r037kAgnW3UIkA20t6ZlFJ8Xt5iqs=
X-Received: by 2002:a05:651c:552:b0:250:5c23:d0f2 with SMTP id
 q18-20020a05651c055200b002505c23d0f2mr18636863ljp.239.1652308099695; Wed, 11
 May 2022 15:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511164514.2741934-1-masahiroy@kernel.org> <20220511164514.2741934-2-masahiroy@kernel.org>
In-Reply-To: <20220511164514.2741934-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 15:28:07 -0700
Message-ID: <CAKwvOd=SZYO0344rrJWP+JvmuZmQ9N6VM9UgMwrb9fH3MaNLMQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] modpost: split the section mismatch checks into section-check.c
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 9:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> modpost.c is too big, and the half of the code is for section checks.
> Split it.
>
> Also, move some related typedefs and macros from modpost.h to
> section-check.c
>
> Copy Sam's Copyright there. Commit b39927cf4cc5 ("kbuild: check for
> section mismatch during modpost stage") is the initial work for the
> section checks.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Sorry again for my "brain fart" in reviewing the global var in v4. :(
I think my blood sugar was getting low or something...

> ---
>
> Changes in v5:
>    - Fix the build error  (spotted by Nathan)
>    - Do not do codying style changes  (Suggested by Nick)

I'm surprised the style changes didn't show up in v5 as a later patch
in the series. I wasn't against them in general, just thought it would
be easier to review if they were distinct commits.
-- 
Thanks,
~Nick Desaulniers
