Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5A32C80
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 08:35:11 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-03.nifty.com with ESMTP id 1B28Raui021857
	for <llvm@lists.linux.dev>; Thu, 2 Dec 2021 17:27:36 +0900
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 1B28Qw8B018994
	for <llvm@lists.linux.dev>; Thu, 2 Dec 2021 17:26:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1B28Qw8B018994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1638433619;
	bh=/yQg01BYOJFXppdxBduRNih3r4B6OrrFie8TdUvWsH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JXmvbWDwG9IKGlbZi3rbZ3DTGFqHrgLL6Wyi619NwvTKYg8SHvNOybbAxsGCdO5xu
	 VbcVLiI7JlVuom+6954OzZVFHrAQQh7Q7TD8PIonFkZLHYzlRsyDyoW1Cq7Ii3YV3I
	 a/aAQNHf7HDmnAqcUIJ9Ls+C3LZrzPL6OHxVVPyTlBfR4xBKOiKx30wsOTi2Zujxgf
	 w6c/XhJ5i31O+1loPUWXpp85931taW/uJbfgZJKbCH/QqS8x3rD82cHMXE6Md/2ydt
	 JfekgAj+MXdPlj3EW2wlizT7qgZgy8THxlcxRKRmU42qTVO+ObvwY/g34km16pYT9p
	 b67OTJ/Qdxktg==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id g19so27197328pfb.8
        for <llvm@lists.linux.dev>; Thu, 02 Dec 2021 00:26:59 -0800 (PST)
X-Gm-Message-State: AOAM532sZpiIxjNl9Hqb7JP4fSdRQtu4sI85O3IH+bKIFS6F05AH/wwI
	XoFzQ70vRUyWJPRXIeMRq+A1vsYh2n6F3F1t2Ew=
X-Google-Smtp-Source: ABdhPJxcPQ85vfjbSc2TTaMucoAVuXnzpKovoHhZYYdrtl4XmPNKKDlS6sEvhw15FBEyiNyupWGC01mqEQnCKEu0WzM=
X-Received: by 2002:a65:50c6:: with SMTP id s6mr8754532pgp.352.1638433618425;
 Thu, 02 Dec 2021 00:26:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211129165803.470795-1-nathan@kernel.org> <202112011140.DA93B3E@keescook>
In-Reply-To: <202112011140.DA93B3E@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Dec 2021 17:26:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASW2F3SxgR6ydMaW7-ZumsxDv2QQTDqVxqJA1JWN3r4FA@mail.gmail.com>
Message-ID: <CAK7LNASW2F3SxgR6ydMaW7-ZumsxDv2QQTDqVxqJA1JWN3r4FA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Tom Stellard <tstellar@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com,
        kernelci@groups.io, llvm@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 2, 2021 at 4:41 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> > This patch series raises the minimum supported version of LLVM to
> > 11.0.0.
> >
> > Patch #1 outlines the issue, goes over the potential impact of the
> > change, and does the actual bump. Subsequent patches clean up the
> > various checks that are always true after the bump.
> >
> > I have marked this revision as RFC to give various parties the option to
> > comment on this bump before it is done, namely KernelCI and Linaro's
> > LKFT, who are still testing clang-10. I have added some other folks to
> > CC that I know are testing with clang to see if this impacts them in any
> > way (as I would like to impact as few people as possible) but as far as
> > I am aware, most other CIs and developers are testing closer to tip of
> > tree. If that is not true, scream so that we can see what can be done
> > about that. If I missed anyone who is actively testing with clang,
> > please key them in and I will make sure to include them in future
> > revisions (if any are needed).
> >
> > It probably makes sense for this series to live in -mm.
>
> Sounds good to me. Thanks!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook


Only positive feedback so far.

All applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
