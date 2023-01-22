Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAE2598
	for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 17:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC5DC4339C
	for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674410383;
	bh=D2pedExuLZNrqCvaz8leJ1LLl8TDRo55BvOVbQvnsHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XeN8NIhI+PlG/yfWOyYUlW0zFARxrYBSjBSadr/9jb+D4OB13s5gjH4jZS9OXhv+w
	 pZeKdBWNNCDu7vt7UdT82aKIfXQEP2krdV+Zx1UA7tNkvvDT3Fh3TwBlsVc2xg2tBk
	 K0i5OlM+8CrJTdgDPPyN/AIZz/yOq8LOSC1QH89u+pOwVhVqRlTHWjzH4yy7z4X5c6
	 M4w2Ec37+EdGecPdVSz4R+SEmINCUQVhFEYviFB5CLYUU363YWl42eEdED+ZPtTkrt
	 bkDiFBlYVa5CSVkJOSkQ0HgCtUoLqra4pUhI7cGwHdnOHfa8axujsF+ItQ0Og+eSz4
	 Hj+SYv/4bvWXA==
Received: by mail-ot1-f42.google.com with SMTP id f88-20020a9d03e1000000b00684c4041ff1so6092590otf.8
        for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 09:59:42 -0800 (PST)
X-Gm-Message-State: AFqh2ko89MmY3XDujq/pYl3nrWuuSYRp2d184crMM7lRM6Pm4cKlLIfS
	WJk5ZB8WDkLBtnc9G7nukfdUrf21oXPA0nn1bxk=
X-Google-Smtp-Source: AMrXdXv+qtyo8rkIgtdEIum0rnVQ7nA9lGu+dYgdpObD9i+RSncPEFAN4enCYSMJPIkQXTz+zrtc/hI56H8Zxw7puU4=
X-Received: by 2002:a9d:6a4c:0:b0:684:a3ad:87e8 with SMTP id
 h12-20020a9d6a4c000000b00684a3ad87e8mr1295263otn.225.1674410381648; Sun, 22
 Jan 2023 09:59:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112023006.1873859-1-masahiroy@kernel.org>
 <202301121403.599806C597@keescook> <CAK7LNARaXH9gJVCJKR5GLuyEiJarxhcXoUyxXDo=MZYKLxFmyA@mail.gmail.com>
In-Reply-To: <CAK7LNARaXH9gJVCJKR5GLuyEiJarxhcXoUyxXDo=MZYKLxFmyA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 23 Jan 2023 02:59:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATOzfM_5ntS9TiT1=04u28tBvmPJsUWyTptZkS630B-oQ@mail.gmail.com>
Message-ID: <CAK7LNATOzfM_5ntS9TiT1=04u28tBvmPJsUWyTptZkS630B-oQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: handle BrokenPipeError for python scripts
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 12:04 PM Masahiro Yamada <masahiroy@kernel.org> wro=
te:
>
> On Fri, Jan 13, 2023 at 7:06 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Jan 12, 2023 at 11:30:06AM +0900, Masahiro Yamada wrote:
> > >     def main():
> > >         try:
> > >             # simulate large output (your code replaces this loop)
> > >             for x in range(10000):
> > >                 print("y")
> > >             # flush output here to force SIGPIPE to be triggered
> > >             # while inside this try block.
> > >             sys.stdout.flush()
> > >         except BrokenPipeError:
> > >             # Python flushes standard streams on exit; redirect remai=
ning output
> > >             # to devnull to avoid another BrokenPipeError at shutdown
> > >             devnull =3D os.open(os.devnull, os.O_WRONLY)
> > >             os.dup2(devnull, sys.stdout.fileno())
> > >             sys.exit(1)  # Python exits with error code 1 on EPIPE
> >
> > I still think this is wrong -- they should not continue piping, and
> > should just die with SIGPIPE. It should simply be:
> >
> > signal(SIGPIPE, SIG_DFL);
> >
> > Nothing else needed. No wasted CPU cycles, shell handling continues as
> > per normal.
>
>
> I prefer try-and-except because it is Python's coding style,
> and we can do something before the exit.
> (for example, clean up temporary files)
>
>
> >
> > >     if __name__ =3D=3D '__main__':
> > >         main()
> > >
> > >   Do not set SIGPIPE=E2=80=99s disposition to SIG_DFL in order to avo=
id
> > >   BrokenPipeError. Doing that would cause your program to exit
> > >   unexpectedly whenever any socket connection is interrupted while
> > >   your program is still writing to it.
> >
> > This advise is for socket programs, not command-line tools.
>
>
> I still do not understand what is bad
> about using this for command-line tools.
>
>
> >
> > -Kees
> >
> > --
> > Kees Cook
>
>
>
> --
> Best Regards
> Masahiro Yamada




Applied with the typos fixes.




--=20
Best Regards
Masahiro Yamada
