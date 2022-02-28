Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2754C63
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 21:03:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id u11so19178025lju.4
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 13:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiqNCFc6U32ONzTNhKfvxI6B2p9x39AVrXt2rLta2M8=;
        b=W1quCfVq9oQhkjVMSeWaW2Z55DxdyDGbetnmG15rPiQ3v4OpkSJBRZVXEMnaa2odqg
         QOxU/DybvDsA1JnfyM0Ii4qw3F6xR+UbY0dAPPGiPqs4IHrP1aOpkQPW6UBPfhHTs8Tm
         PR7CBwZgGDqGkw8bM51JgA90FDhHoPP/FDNizSDpxNc9PDO+WtRrOnLiA4YcU9jxsmrw
         z0maaOELQKiR1hC/GWCjcXmHCEwCPjiDrVGmn41QSQ89BJlDlTrXtLJTHpab0xmVnH4M
         sZrukyP266PjsJuciZ6D4hmibJchflD3xDwtX05kLpAsnblhXyGN7U6wiOr/bpk5iv1a
         EfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiqNCFc6U32ONzTNhKfvxI6B2p9x39AVrXt2rLta2M8=;
        b=NUt8yBWQPj/pznifhqkEJSN+yj9vzjRR3dY+hOSMXzzD4wpIc4QUxI/XpRqhV3caD5
         XBvffpGtX5XUO6Vp1RDAbCq9xrd9cw/6InqvZdonKor3wp3YqqFZ0cBl3VPLwfcxgbxX
         jYvJm4byU8KEk8jnP5qNWlnBtjAMkPgqUT88G06dzNfA/HYs/dEtzXrAzt0raqxaOl3n
         yb8Z+6Pfqr9RxbBYm53RXlORQNMoCyNuUyYKzurQKdu2fs5AyHev8oujvlkBuaS2x3gi
         O4rjYNkWYN2RdiE9azCd3LLNU+EVddbgRNNpDGwV/HnO+GuH2dSJ4lFaT8OpSFEAXToU
         y8xg==
X-Gm-Message-State: AOAM532TQQfnaLcMagWXjFqM/TIvtE6X74X9OPNxZCTh9tHUDp1QBSf4
	zEjYUKuKvaBHqP88ZWZZB4nfgMFoxDl27oI+zw/76A==
X-Google-Smtp-Source: ABdhPJzGFFfCBCn90UYvglywOrc8nxTF2i5r3/1lhRKGwuSQ5VMkWLmIJa+L1faEtfi148WU9C5GVQ0oji3KdUudozI=
X-Received: by 2002:a2e:bf24:0:b0:246:801e:39d3 with SMTP id
 c36-20020a2ebf24000000b00246801e39d3mr8506477ljr.472.1646082236647; Mon, 28
 Feb 2022 13:03:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Feb 2022 13:03:45 -0800
Message-ID: <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 2:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
>
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=gnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between

More precisely, the semantics of "extern inline" functions changed
between ISO C90 and ISO C99.

That's the only concern I have, which I doubt is an issue. The kernel
is already covered by the function attribute as you note.

Just to have some measure:
$ git grep -rn "extern inline" | wc -l
116

Most of those are in arch/alpha/ which is curious; I wonder if those
were intentional.

(I do worry about Makefiles that completely reset KBUILD_CFLAGS
though; the function attributes still take precedence).

> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
>
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the
> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.
> To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> in a Makefile.
>
> Nathan Chancellor reported an additional -Wdeclaration-after-statement
> warning that appears in a system header on arm, this still needs a
> workaround.

Ack; I think we can just fix this in clang.

>
> The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> minimal and mainly impact warnings at the -Wpedantic level that the
> kernel never enables. Between these, gnu11 is the newest version
> that is supported by all supported compiler versions, though it is
> only the default on gcc-5, while all other supported versions of
> gcc or clang default to gnu1x/gnu17.

I agree. With the fixup to s/Werror/Wextra.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

-- 
Thanks,
~Nick Desaulniers
