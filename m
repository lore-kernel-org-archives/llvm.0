Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94467E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 04:51:53 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-04.nifty.com with ESMTP id 23P4inH4032005
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 13:44:49 +0900
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 23P4iaxo013244
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 13:44:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 23P4iaxo013244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1650861877;
	bh=eXtnkq15f32F+dq4gvLxxREDloNqTab17KTvabJawdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=0PT6vvPiMccgBL21PVKDbkrYYrkHF6hvriHDGpu/bG84+d/gTqmkHSUbF43W8lTj3
	 K5aTL8jEqohOicko2BOlQygdCTXwL/XAw/Ku8ka7Ei6b0UeQSLcNRoVLfIh9OTrybB
	 +uksMZClTTM67WyRQKkUfa3z+pMvzn857QDxkJmkTsshR0L4OdJW7ljYn0TbHE7AJE
	 O+Q6rn5N1RWn1NIj4LIJEfXtQNpPCBC9mj/Jq9bs+/FzDwUv/bIXL+C4hFN75PyuE9
	 f9buAz7YrObWC2aGnyr4E5IMRSZa+5Kx4nuDhzvOddQ90X6GzulCC4qmnHRHiJg6PZ
	 B1tjsZRKZdXOg==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id i62so250902pgd.6
        for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 21:44:37 -0700 (PDT)
X-Gm-Message-State: AOAM533Yw0GRKXrLU4MI3xDG9T7065gMn2GvONv2rvLlwwZIf3TUAZJk
	WrD9wAKuQWoZxHW40C6YyoKhM3o0HAIVvZZkGoE=
X-Google-Smtp-Source: ABdhPJx0G06+SVFeAfanWZgl4Wt1aq8jSyAW3//gm+gaqO8zChYq9THeWCes77xvYw4BxAmfT1sE3Kw9TcV5DS7Z7Dk=
X-Received: by 2002:a05:6a00:234f:b0:4fa:f52b:46a1 with SMTP id
 j15-20020a056a00234f00b004faf52b46a1mr17038240pfj.32.1650861876491; Sun, 24
 Apr 2022 21:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmwyFDYKMpq0dcvbq06drtZonpNJ3PqLx2RMBE00beHZA@mail.gmail.com>
In-Reply-To: <CAKwvOdmwyFDYKMpq0dcvbq06drtZonpNJ3PqLx2RMBE00beHZA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Apr 2022 13:43:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNARx_z1Cv4YOkYkdbgrv3PKVa3msHh8mCZDFvYDib++4kQ@mail.gmail.com>
Message-ID: <CAK7LNARx_z1Cv4YOkYkdbgrv3PKVa3msHh8mCZDFvYDib++4kQ@mail.gmail.com>
Subject: Re: plumbers session on syscall wrapping and kernel header libc
 circular depdence?
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Florian Weimer <fweimer@redhat.com>, Arnd Bergmann <arnd@kernel.org>,
        "Jose E. Marchesi" <jemarch@gnu.org>, linux-toolchains@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Nick,

Sorry for the late reply.

On Sat, Apr 16, 2022 at 2:48 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Florian, Arnd, and Masahiro,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
>
> Would you all be interested in a session (if you're planning on
> attending) discussing syscall wrapping for libc's and UAPI circular
> dependency on the libc?
>
> Masahiro and I were recently discussing the feasibility of building
> the kernel UAPI header tests with -nostdinc, but there are some
> interesting complications perhaps worth sharing with others?
> --
> Thanks,
> ~Nick Desaulniers


I am not sure about the travel at the moment.
I may be able to attend it remotely if the the plumbers is held as a
hybrid conference.

I am not quite sure how many developers would be interested in this topic,
but we can continue discussion in the ML as well.

-- 
Best Regards
Masahiro Yamada
