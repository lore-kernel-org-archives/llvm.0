Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA811CB6
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 17:45:29 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7a2ab581cb1so508082241.1
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693503927; x=1694108727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PjK5svytdPnfL/m49ERN9u4S1TwPwbqfx3ubmgNjKU=;
        b=ccik1C9rfTfT6xbtLwDFIr0w7VR0VEReoAzYff1dCiq/qKlTieIzLNKFiiuDJFqoya
         Qdjhd/Lo5qxiomRxpH5E2n8n3xRroFm0aqeQXE89ZLpGm7Go/M1WqYtAIv52hz1Y69uM
         xvc233lNaJAQvaYMcTlN+jPsF4Gp9mRvvYRdk9dUsW/QuYhuqD4S4n9p9CJ/LAE6eoJX
         VD94mupN1PA23Q7KwF7Lk9S5ZgejP4Un5bKPcy6fOh+InYe1/OWI7dmBuDGYsYRf52Jx
         0+LylQXSUrMTpuWaiwt3U0c+BztnVTllJ0FuLlPlr0bmu+9gGt6e1N/8jRsIDMeUiTqh
         KOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693503927; x=1694108727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PjK5svytdPnfL/m49ERN9u4S1TwPwbqfx3ubmgNjKU=;
        b=LX67LQKtFZz78YDHm4/VdvuPmHTFtji1hTst7ymEAjZdlKDNHHDfNgZJ1p1GlKVi8p
         yjeQ2fvW95rBKB7tvny2Mx6LkzQFz0klVIovhzSf9fG9sKsno69VabTTnBkeACW8w6x0
         yGaoCrkDeGHUq6iN2Ns6JTcCuh0AXeO/lPT1SaSvLJLv6xAi1bBJL1UgeXFMyrUGm4e1
         xbGgO+SMoJkpJgDH37hByheNtVSLawkTy6CsgLbPXrMrL7ITosjTi1laWmCg3pNF27CC
         v6SGzpfqCC5wOTeBAb24wN3hJx1VF0gaQKmSKWh6FK7TjzeY4I9/k/rn68zbU9gSsZk+
         ygHg==
X-Gm-Message-State: AOJu0YxBZK5DzlDr+UrS9E6RLGKCsCbtw9pxsv9gaZmyFuEvVf/6f3Jm
	2k2KO1unQShle2p5FFKkfdmRFOwKg8gW9jvPIKXYwY/DsAK265SwQOyTlA==
X-Google-Smtp-Source: AGHT+IG8BqfOc+i/pC5a+VFjpVFvwTp8C3RAGfiGDVzaaOGyaIVdjNITr/9eCzx5MI1wddTNQ8wQyEs4KSVjahijWRs=
X-Received: by 2002:a67:f947:0:b0:44d:5718:d72a with SMTP id
 u7-20020a67f947000000b0044d5718d72amr270390vsq.11.1693503927565; Thu, 31 Aug
 2023 10:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdk_GVOdT==9=X=+s=xaD4PrvwXWoKePNJJ5WRmYHkrTqg@mail.gmail.com>
 <20230830194920.GA2263564@dev-arch.thelio-3990X>
In-Reply-To: <20230830194920.GA2263564@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Aug 2023 10:45:13 -0700
Message-ID: <CAKwvOd=+Uuzm5w=mbmry5VNX4sjg+=MbZ-h3GmNZMqh+YmTCqA@mail.gmail.com>
Subject: Re: RFC: blocking posts to the older mailing list
To: clang-built-linux <llvm@lists.linux.dev>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 12:49=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Aug 30, 2023 at 11:46:39AM -0700, 'Nick Desaulniers' via Clang Bu=
ilt Linux wrote:
> > Hi folks,
> > We established the newer mailing list <llvm@lists.linux.dev> a few
> > years ago with archives available at https://lore.kernel.org/llvm/.
> >
> > This is in preference to our previous mailing list
> > <clang-built-linux@googlegroups.com> with archives available at
> > https://groups.google.com/g/clang-built-linux.
> >
> > These can both be found on our homepage
> > <https://clangbuiltlinux.github.io/>.  While it was our intent to
> > deprecate the old list (and still is), we have not yet taken any
> > action to actually block new posts on the old one.
> >
> > RFC but my plan is to change the following settings on the old google g=
roup:
> > 1. Who can post: anyone on the web -> group owners
> > 2. Who can contact group owners: anyone on the web -> group members
> > 3. Message moderation: no moderation -> moderate all
> > 4. New member restrictions: no restrictions -> new members cannot post
> > 5. Rejected message notification: off -> on
> > 6. Include default rejected message response: unchecked -> checked
> > with link to new ML as message

These changes are now live and in effect.

>
> This sounds reasonable to me. I am still subscribed to the old list and
> the only stuff I have really seen sent to it is just junk/spam, with the
> occasional mail that was sent to clang-built-linux@ and llvm@, so there
> should be no functional loss. I think we have been clear enough with
> people who were still using the old mailing list that they should
> completely switch over to the new one. If they mess up and get a message
> that the mail was rejected with an explanation of why, it will be even
> more obvious what to do :)
>
> > Then update our homepage to note that the archive for the old ML is
> > explicitly deprecated.

merged: https://github.com/ClangBuiltLinux/ClangBuiltLinux.github.io/pull/5=
7

> >
> > I think that will prevent further confusion, and sorry that I haven't
> > taken these steps sooner!
> >
> > Thoughts?
>
> +1 from me
>
> > Another outstanding issue is that it doesn't seem like there's
> > available tools for exporting the old google groups archive, AFAIK.  I
> > would love to be corrected though.
>
> Unfortunately, the tool I think I had looked into using at one point is
> now marked as deprecated/broken:
>
> https://github.com/icy/google-group-crawler
>
> So aside from us looking into how to export the archives that we should
> have in our own inboxes as mbox files or seeing if someone else has
> built a tool of that sort, I am not sure that we have much recourse for
> getting those archives out of Google Groups... Fortunately, I am not
> sure that we had many discussions on the list that were not also Cc'd to
> some list that lore.kernel.org archives. In fact, you can use the c: and
> t: search option to find messges that we sent to that list that got
> archived on lore:
>
> https://lore.kernel.org/all/?q=3Dc:clang-built-linux@googlegroups.com+OR+=
t:clang-built-linux@googlegroups.com
>
> So I think that might just be good enough to say between our issue
> tracker and what we have on lore, potential loss of access to our Google
> Groups archive should the service shut down or experience some sort of
> data loss should not impact our ability to look back for answers about
> why we did or did not do something.

Added to https://github.com/ClangBuiltLinux/ClangBuiltLinux.github.io/pull/=
57.

>
> Thanks for writing this up and keeping us consistent!
>
> Cheers,
> Nathan



--=20
Thanks,
~Nick Desaulniers
