Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E5A4682
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 17:10:15 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id c17so17873609lfb.3
        for <llvm@lists.linux.dev>; Tue, 09 Aug 2022 10:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A9YjzO6pf9jUuipiXd320RsVb+qwVho6k/x9nJJSSr8=;
        b=KlWeX2Pqpmmm0Ttm2l2VCcsfY9ZqUVUh1HiPtrtKusMk8sThEghUmgtTErO6cmHfhF
         O70vD96WTLu4znZoxpKzyO7W4KuvBTM0m6eplMh+nMa49J3GUDlWGV7c+yqacRJc39BH
         Z1LPxVZ/wStTSQ6Ly8qjU00dqlHykxeK8OPVH81321pmphmBE3GSBVJFizApe7+4lB2B
         30q7fKtl3vo0vbDOS0GIFIFL26aEmZyurQZJpm6k4SxA9pDwearrewCw6FHRSBPinluD
         W49YWwDEt9FNyO8CfukSCOgOBLWvNAsVh8gby9IM8A7Y/a7xz4LxpEJJjtZ6v7o2rvUN
         GM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A9YjzO6pf9jUuipiXd320RsVb+qwVho6k/x9nJJSSr8=;
        b=lQelFWYCbsvbKu1xfWUfNFsTMYSK0AAXWBGHJFYtf3ElgoI/DoOpkXFICNEw/XPyIF
         a4ZYFmtAs7E0b3Tii2/iz6CefmO68fse9EUbU36AlyBeSu0888Pc1r30WIKBUji3EIdt
         ozUZulqQPGbc9ZQSBZ+jRsY2axPc3FpC2F5rR0NuJORH7/vP5KkhYrLn/V9HmPFqvKS9
         lKJYbMBog/LZYGfjFNkk8D392gscurnxzhxHtpWDGQLUqMe49COopX/QP75Z9Z6bbhjF
         u1pIkY9gb5XCYWkaoPIb0J9vjVy8kbucvBaTtGOh5CeYuSPMTSKF/Yg7ZS0lDK/kkf4y
         4UjQ==
X-Gm-Message-State: ACgBeo22sOnuoT6AJ1X6cNv69Iip9n977IOn3E6FsNjYSqt1aRryGDw4
	FmwJA2k2jlRVuvZvLnSgIyWxYP7Jcsl56FepFbOahA==
X-Google-Smtp-Source: AA6agR6BEEKvSMl+Ivvhp+4oYj2Oi9CGwNxaApycDinRhh+MWc3sKk/e+l5U7pLBntE5A/gb5KQYmxwqP2blZ90KuAA=
X-Received: by 2002:a05:6512:1317:b0:48c:ed42:5cf4 with SMTP id
 x23-20020a056512131700b0048ced425cf4mr3117389lfu.103.1660065013239; Tue, 09
 Aug 2022 10:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com> <CAAUqJDsAWRedULdKx3rEK7jL4=gHfJebCT4ujzWq4vSXZbju3w@mail.gmail.com>
In-Reply-To: <CAAUqJDsAWRedULdKx3rEK7jL4=gHfJebCT4ujzWq4vSXZbju3w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 9 Aug 2022 10:10:01 -0700
Message-ID: <CAKwvOdkexR9fc3=Dv+D5roJTBjkk6SpgoVd1xZNuuGUh2fUOvA@mail.gmail.com>
Subject: Re: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2022 at 9:59 AM Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.c=
om> wrote:
>
> On Tue, Aug 9, 2022 at 11:59 AM Naveen N. Rao
> <naveen.n.rao@linux.vnet.ibm.com> wrote:
> > Clang doesn't support -mprofile-kernel ABI, so guard the checks against
> > CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.
> >
> > Fixes: 23b44fc248f420 ("powerpc/ftrace: Make __ftrace_make_{nop/call}()=
 common to PPC32 and PPC64")
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reported-by: Ondrej Mosnacek <omosnacek@gmail.com>
> > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/trace/ftrace.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> With this patch my reproducer [1] is passing, thanks!
>
> Tested-by: Ondrej Mosnacek <omosnacek@gmail.com>
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/1682#issue-1330483247

Thanks for the report and fixup. I filed
https://github.com/llvm/llvm-project/issues/57031
as a feature request for -mprofile-kernel in clang.  If there are
other missing features for this target, let's get bugs filed for them.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/llvm/llvm-project/issues/57031
Link: https://github.com/ClangBuiltLinux/linux/issues/1682

MPE: can you please ensure the above two links get added if/when applying?
--=20
Thanks,
~Nick Desaulniers
