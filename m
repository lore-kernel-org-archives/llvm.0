Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B017C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 20:28:51 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id l12so11567087ljh.12
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 12:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xd7zhNWTAbsjcup8ovj0bhbEUHVo9VN2YG5iXSmKuGY=;
        b=AXUNohphNBaqg4Ym0QvnB7ovOxC0qHBwQQTkvDU09LsSmaqliomVWRZBWSH9rA/NdX
         mggO8k84CHtaDmY5vc6klMZugRCimckzfjt5ruN87TRJQCG97xdfs7M+rGBCx/iITiho
         m3WSdHrV71StH8wJGQD2H6zmXpefAi4NA1HM50JkQz1wBh8FPbo2JL0PJbfCiWj+flF5
         VPizIjc+dyyhgd2d0QTocmiEr7TKxUjrxGCsDGzMcimHkmBPd+NZjW2RI4B879m3tzhe
         7OsVy6+c5Q5sdBrzGsalxEeXKu7lIv3BuaHd0Vn77MJW4nH68YFqeea7l79i24g7mXhe
         HpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xd7zhNWTAbsjcup8ovj0bhbEUHVo9VN2YG5iXSmKuGY=;
        b=1/VPq2+3hQ4n6x3m8e6urMi3E6KoBfzLIGGcOEdekUtKHrbD4dZV4aO3vT8jT5nlka
         pgBOQQyp2Qip0OWS9lOWDnJy17Dkr5cR5BUMfHysl2nkfhy5NAZu6/749IzwIMhIH9la
         4qqs8qVCK5jObGRlcpdPUKb8rz2onl+twQknaFULI8HhDUdscri8UnBvLPGn/w2zDyXx
         bDM1hJXuWylj0WEYk9m9tInbN2xR0PXddjcwA1hzwoDR/EOb0ysnA57SbeZOYRS1p5Ip
         S788K68EDlyXMjwkeJgqd4HAsdZRBJv4x/5gZ+fgLhIKOxvhKV1TlM+ZnhbaJniXjGVx
         jqJQ==
X-Gm-Message-State: AOAM530DWAN3/Por+P5EgRuzJkjM5KN7LZXLL24XROKlsWKzDUzffoE3
	mv6bP4WMxf/wyx5OtdhwQeYFZqiSSforbVEdHZ0nyQ==
X-Google-Smtp-Source: ABdhPJz45aoPYRnC0P6aRihQR7uE1J/WWQWC3IT9GukIQheAZ9K3oSg9y9PHLUJG3F+nspjRI+QY5wqfA1AwR9GjK5Q=
X-Received: by 2002:a05:651c:1542:b0:233:8ff5:eb80 with SMTP id
 y2-20020a05651c154200b002338ff5eb80mr18018505ljp.352.1646166529822; Tue, 01
 Mar 2022 12:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
 <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com>
 <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com> <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
In-Reply-To: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 12:28:38 -0800
Message-ID: <CAKwvOd=TpqiSSh3yqQ2Z44nJArBACvfohVCgd6Ej32rGQMvShA@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Marco Elver <elver@google.com>, Jani Nikula <jani.nikula@intel.com>, 
	David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 12:20 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 1, 2022 at 12:06 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > That said, there's a few additional places that reset KBUILD_CFLAGS.
>
> Yeah, the boot code and vdso code often sets its own private flags,
> because it's _so_ different.
>
> The generic kernel CFLAGS often don't work at all, because that code
> may be doing some truly horrendous things.
>
> So I agree that this may not catch all the kernel code, but I don't
> think it's much of a problem.

Agreed; they can still mirror the style imposed by
-Wdeclaration-after-statement like the rest of the codebase though.
-- 
Thanks,
~Nick Desaulniers
