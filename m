Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52867A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 00:36:33 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bt26so6712149lfb.3
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 16:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tU+Fe+vcmWYII8bcpQckbuUOYQxVwc8Ms6FjnpeZUXo=;
        b=L/mvPUr5+ed9/8F1xYBeOkHEQX/N5BqBnxQcWBYwpz8RAerWYK3vG+jQ8UcnJ76O8n
         Z6F8qP7cE8tNgjablMkD4TSjih/QPIMEsvNLTgmbdeWBRVediWkgAMhZdVVhEgcgGEdK
         lMZ1J3pO3p0Ql46BLe9TS7msF+0WkJiXc3GEYEhfXxvSABXRpmnJrXBNidzsucgWij7W
         h71P/xxdG4gMnr+gam3ehpQ7R8zTNQQGhJ/hYPRcyYsfLb7u+8rs0B5WjYUfbEvSpW08
         3VtCaxMUJjZ5zrZuYEdWuLeNzUmAVqnhioFkV1FhQj3OlGZ8RQb3TRq3538igabd/3yR
         jrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tU+Fe+vcmWYII8bcpQckbuUOYQxVwc8Ms6FjnpeZUXo=;
        b=ve47enlyar8i9qfHeE9NAV8JGgQnRAgt6n3aT1UAo5hJ6HIYraUGKReyZ+8W4Sb6tr
         tRzIkTSppdmt4bX+nF7sgg4VEDxKPhvGib7+X5vcpSb2k4WpzA55nleIJ0vc4baGmspG
         9TiLTPZTq6Dx8AYV7oXZJiFjwy+UMXO3fELXdVVWbt7JorXZjF/ZMITN8vIUGzX3cYGF
         jGO+DK/YZsZMPu3LLoHBwgibDDw4MwlOv+TFAt0uJEZs+yjHd+zhkFHod7YmhrWSLuZN
         T5xXCBz5/+vsvdjbS7Y5vYAe6Kx4v0AGeIzmylD7HNWv9990nXlnK7GDOk5kIzPOFLjc
         lwbg==
X-Gm-Message-State: AOAM5325xk1griVPd7Lw+GI7irlf+NDbsh5gBgSdL7El+Vi1Lmn6LI3E
	pVih9KE4eHV0J68y65SclcKh1BVnbGEDqJnKo46O4w==
X-Google-Smtp-Source: ABdhPJytXKwI98E3nQqK0BdQ0dFxt9GnezH6c63KyMKM/BPYYzDCKWIjWSo338Qxmgo/66zO3+BC+IAEhGNy/BYPIF4=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr1387380lfl.87.1646872591569; Wed, 09 Mar
 2022 16:36:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220304170813.1689186-1-nathan@kernel.org> <CAKwvOd=Q-7vPaRPj1wQagFsY3txcAKzrqU_D2UAX3h4ym91uUA@mail.gmail.com>
 <Yid6eS7YV4Oxj+hx@dev-arch.thelio-3990X>
In-Reply-To: <Yid6eS7YV4Oxj+hx@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Mar 2022 16:36:20 -0800
Message-ID: <CAKwvOd=0tn3DeqDkKxxk61EvHY9Vb+SnHkXugUmHCMFF_0VVoQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Make $(LLVM) more flexible
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Shuah Khan <shuah@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 7:47 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Mar 07, 2022 at 11:08:29AM -0800, Nick Desaulniers wrote:
> > On Fri, Mar 4, 2022 at 9:14 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > +If your LLVM tools are not available in your PATH, you can supply their
> > > +location using the LLVM variable with a trailing slash: ::
> > > +
> > > +       make LLVM=/path/to/llvm/
> > > +
> > > +which will use ``/path/to/llvm/clang``, ``/path/to/llvm/ld.lld``, etc.
> >
> > I don't think we should do this; `PATH=/path/to/llvm/ make LLVM=1`
> > works and (my interpretation of what) Masahiro said "if anyone asks
> > for this, here's how we could do that."  I don't think I've seen an
> > explicit ask for that. I'd rather LLVM= have 2 behaviors than 3, but I
> > won't hold this patch up over that.  Either way:
>
> Right, there has not been an explicit ask for the prefix support yet,
> although I know I personally would use it,

Then let that be reason enough. :)
-- 
Thanks,
~Nick Desaulniers
