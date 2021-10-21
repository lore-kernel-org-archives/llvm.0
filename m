Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF12C80
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 08:46:52 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v77so40439oie.1
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdXFjy61Qy/rnsWDdjxcnajZ2gMgamPPbsD5FZNqukA=;
        b=cnx7RWXe9MTa2MyYSEhY11osG+93I8MxzJ7YGe9R3MBcBh818wFg8gXiNrmQwSWnFC
         wxl5gQXgq/UOg0CLpgJRaKhnKaqeanItrEtiC7ACXxPgc5bNcNYWGveXIPp93STtRcrb
         iKSV5e6zUvcLsUOUr7Nujd6G18wCd0vo0Yxzky7sVWYchvWu/YLPdhjD/j9YEjumxpEl
         BpdWvCqtNM51PmjdT3Bydf1MpOZy/5f/d1fslw7UB0axfJQeX48O3z6Soo5jT8VjEwcM
         QQ1z+lMKRWwIfOZrtihBi3sstqQr8k5baiYdYgG/xflNTXMcCAm9NodyKw/Bn77cYza2
         v9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdXFjy61Qy/rnsWDdjxcnajZ2gMgamPPbsD5FZNqukA=;
        b=RDLtxWPcfoLpM0oNt+1xaAKP0gnSTEcxurBgM0aHssdz07qlMwm1TMAOT85E7z+SuZ
         z/IAUijN1bs5N5RrHqh3HH5aXrfSQ8Gre8O4b8kGT70D2PrbnCrsMXIBG7YUdgtcmaZ2
         /gCmRqQAbb0qKxeSmMwYsNE0lK9gsV4IUU04WM8RqTxEEPOMEjAUV89mgzf93yupAUux
         LoNwWEOqyQ5X6bzxTKsFbNbaKKaSfZqDV1BAdHwRGG8GHdfPujfDDDfxmEurJqFQCgwn
         vH8UFJu5E5laLzxMaPsFt6tbRHduqyziIWOK2SByGCCEwIGRtF+483h+YJmwWjiHYy78
         V0NQ==
X-Gm-Message-State: AOAM530541hr9LiK0q0QmHizDMRyG1093b/LUIsINJKQ8ZFGNtlz79e3
	k+DhPQV4A9EHBMl6saenQe6spYNfhOjgiexj4c+vjQ==
X-Google-Smtp-Source: ABdhPJzVvuyF5GdGpswaNFJXcJVKW/wyXlllnzMgF8chWYnVNr+F18Z+ShLA/2gjBOhpxLhqslZEhvZw3tToO3Mvy5c=
X-Received: by 2002:a05:6808:6ce:: with SMTP id m14mr398982oih.134.1634806011175;
 Thu, 21 Oct 2021 01:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020200039.170424-1-keescook@chromium.org>
 <CANpmjNMPaLpw_FoMzmShLSEBNq_Cn6t86tO_FiYLR2eD001=4Q@mail.gmail.com> <202110210141.18C98C4@keescook>
In-Reply-To: <202110210141.18C98C4@keescook>
From: Marco Elver <elver@google.com>
Date: Thu, 21 Oct 2021 10:46:39 +0200
Message-ID: <CANpmjNNwEXH2=mp4RS6UUU7U9az7_zgVM223w-NJgqw1Zp-4xQ@mail.gmail.com>
Subject: Re: [PATCH] compiler-gcc.h: Define __SANITIZE_ADDRESS__ under
 hwaddress sanitizer
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Arvind Sankar <nivedita@alum.mit.edu>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Oct 2021 at 10:43, Kees Cook <keescook@chromium.org> wrote:

> > Other than that,
> >
> >   Reviewed-by: Marco Elver <elver@google.com>
>
> Thanks! (Oh, BTW, it seems "b4" won't include your Reviewed-by: tag if
> it is indented like this.)

Ah, I'll stop doing that then -- or can we make b4 play along?

Thanks,
-- Marco
