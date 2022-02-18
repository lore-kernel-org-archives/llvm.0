Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A54A9F
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 15:44:29 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 27so2986747pgk.10
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=doT7bK7EPrJiz241mVjN8JSE6X0c4y1Cn7yH47MmQuY=;
        b=f7IrV8Co4YLWgbQabeAxKnaaARwhRRuipRCEkgrAJCQqP2XFBjrXQKuLiqPrbblMp4
         1I0PyweE1qWbuBRwiem9GlWvoesOq6Y1GB8AnDJbzrRXaD1VWQKp8irajqq+k55dCKAi
         CseUDopHDjNGPOjBaX9WvpduIweYhYqPDAMXxxYv0yiDD8iPLrA7BZIetCe3CCIYdVYV
         ASZLZRL6vD/Zv40jqnzmkhX/ZXHdMbZSSn8xdx8/UI1a++gVGYKlWrJhfahzStHzBbVt
         iFKohUn9z3TIl5lLqD6/ZqoBkVkbxJ6dRJy+TTq14nDy33ykAI0H/nBHragcZH98I9mN
         Pgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=doT7bK7EPrJiz241mVjN8JSE6X0c4y1Cn7yH47MmQuY=;
        b=OjOheTvjb+h2mwN85EYruB4vbGbeC7SpALUFVIp2q8qqNYIRty5FyNA+/BEDzftOjl
         XhFLlIXh4VkjtURHq1TFQsbUQ9tZyO5KZJXwCThP5RJ9v35Dk+qfIQw5m+LRc3cc75ws
         5IP9psB74mcLdItVjl1ggMMCBDuaYoDz8PDNJO5kcEX3ovmXRWBXPDFQWkfQp/3gF/14
         ZiYEkP0McqHtXut00pHZtlCqjk9h0TvauSjKXKoPFevVvXV0nY9kFMbHdWyVTiHLs70C
         9ehLvwFFtcJ2xWcf8NJkt3rupAa4FOs1Rrfw+2Qj85T+Igeg4hY7iMsRmHnnI8LQzIZW
         XuKA==
X-Gm-Message-State: AOAM531NDNWvq0YFvN25uIFA6RoXrykdwIfyQ9xI4FewygrIZwDSKr4P
	Zkjt6jb/R4f4zJ6huGnFWqlNPZnoZXgCIX9aJ02J
X-Google-Smtp-Source: ABdhPJzPTn2nMsDVP8pfZnyivdp+JN2LbHE/ubEBj9MgLJGKutLru+hZtPhdSKHgoM+BCyRoh2SY4sYUhFcJlHlQacc=
X-Received: by 2002:a63:da4d:0:b0:36c:2302:1940 with SMTP id
 l13-20020a63da4d000000b0036c23021940mr6764465pgj.261.1645199069118; Fri, 18
 Feb 2022 07:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com> <20220217142133.72205-5-cgzones@googlemail.com>
In-Reply-To: <20220217142133.72205-5-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Feb 2022 10:44:18 -0500
Message-ID: <CAHC9VhQ6hTa2ZrNHBWeE2hcr9uAbD1r351oZvxRzO6H357-H0g@mail.gmail.com>
Subject: Re: [PATCH 1/5] selinux: drop return statement at end of void functions
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Serge Hallyn <serge@hallyn.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	Austin Kim <austin.kim@lge.com>, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 9:22 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Those return statements at the end of a void function are redundant.
>
> Reported by clang-tidy [readability-redundant-control-flow]
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c          | 2 --
>  security/selinux/ss/conditional.c | 2 --
>  security/selinux/ss/ebitmap.c     | 1 -
>  security/selinux/ss/mls.c         | 1 -
>  security/selinux/ss/services.c    | 2 --
>  5 files changed, 8 deletions(-)

Merged into selinux/next, thanks.

--=20
paul-moore.com
