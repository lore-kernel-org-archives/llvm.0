Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036165A0A;
	Tue,  1 Mar 2022 14:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A050EC36AE2;
	Tue,  1 Mar 2022 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646145969;
	bh=O7PMjYoyVgpMGjTVJdUqo4vjOgkMH6zVD28CMdfxejY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ScbK0J6pozv/c2GDJYHlIZpbvfONFwSIK/2j9QTvGy0h6OxUAoFSJS7ACLBifahWv
	 DcEHKw3lZtb+uu9XBfWLbqlt4501Amp6VUN+Dzs96ZiZLJ0WrXZIhbPfc31qIWMyNy
	 ATq4x+Oqa8aCq2GW5gs+Y/j2lbHCJQUV8G4qbfbhkoke2or1lVhj8owINILXGePjRZ
	 R7WocAjuMhKmJQAgH9JZzvEWwPneWdjxvB9/qREXxhHUchmngRvsvQS8MYiNKoAhTS
	 lRIGGo0c7PSqmvXlDIU+2nV4tRgWSUE8CyjB1CiW2iruBEJHgJWl3+5y31XDNWkEo7
	 0CfBGfIlQclkw==
Received: by mail-wm1-f44.google.com with SMTP id 6-20020a05600c024600b0038125fa8e43so1355097wmj.0;
        Tue, 01 Mar 2022 06:46:09 -0800 (PST)
X-Gm-Message-State: AOAM5324vdhdnlX9Y7zwap3VcClGHpDNe9H1/H/zQWVMtGt9CeEvTuIR
	/aRsC4g7Ty0MmWRpxnP78cS7YpfeWmTAo4SLpn8=
X-Google-Smtp-Source: ABdhPJxXTbyRPUGWO5ZqEHYDoeKGRHcrrv5eZPJqecMQqdHX7hdx2ouYJfmaJG1ZffheKZ5NWAXaiF6wK5E6lkn8a4k=
X-Received: by 2002:a7b:c001:0:b0:381:1afd:5caa with SMTP id
 c1-20020a7bc001000000b003811afd5caamr17359158wmb.35.1646145967920; Tue, 01
 Mar 2022 06:46:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
 <20220228214145.o37bgp3zl3rxpeo4@google.com>
In-Reply-To: <20220228214145.o37bgp3zl3rxpeo4@google.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Mar 2022 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ZBOdEWTB1K9wA0v657VTZc-BC4LkDoQ0uw8Hw8FfSyg@mail.gmail.com>
Message-ID: <CAK8P3a2ZBOdEWTB1K9wA0v657VTZc-BC4LkDoQ0uw8Hw8FfSyg@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Fangrui Song <maskray@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 10:41 PM Fangrui Song <maskray@google.com> wrote:
> >
> >More precisely, the semantics of "extern inline" functions changed
> >between ISO C90 and ISO C99.
>
> Perhaps a clearer explanation to readers is: "extern inline" and "inline" swap
> semantics with gnu_inline (-fgnu89-inline or __attribute__((__gnu_inline__))).
>
> >That's the only concern I have, which I doubt is an issue. The kernel
> >is already covered by the function attribute as you note.
> >
> >Just to have some measure:
> >$ git grep -rn "extern inline" | wc -l
> >116
>
> "^inline" behaves like C99+ "extern inline"
>
> Agree this is handled by
>
>      #define inline inline __gnu_inline __inline_maybe_unused notrace
>

Ok, I've reworded it again, but kept it a bit shorter, I don't think we
need the full explanation in this patch description in the end.

Thanks,

      Arnd
