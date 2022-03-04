Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050C7C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 18:56:36 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 224IuJIx020102
	for <llvm@lists.linux.dev>; Sat, 5 Mar 2022 03:56:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 224IuJIx020102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1646420179;
	bh=ae5Yd4J05pJERqgIww/ekBg7J6J/HW2Ax8vCdSSmy7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WKMGWPQS0Angn6t12jeTQy1uq7SLzAJU1sXmgpzQtIHXctTlvx1O0lx3cm1Mn/83A
	 f4BNL0rhAMmm3jEPmI9iYkzOGjqwz0Hw8hAZfrdcUZTTOBv1zl35I0a1QhcjaR1kXg
	 PVNwELdrqMn/QhbIfySunaXJa4W7oHu1fSQ4QdmOYGKONCQzltHfAxL916AOH7qMBD
	 OXSwajo5M5YSX9KY9yONKMtmjySyfsD8mRYrZc0d/CdanYqsmXfRA9sgZ/ZNDwTPa/
	 24dEYq9D/tTuJ90JcGf92jiA8byZ6erLknY4PA27638/IAImOhPOSLQl2lZM5bvNyr
	 Js+MOIERcMr6g==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso8747464pjo.5
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 10:56:19 -0800 (PST)
X-Gm-Message-State: AOAM531+FbXG8EH3j2hak7DzT37pVuK1ouunBAdxjbQbrsRz/tVu3RmT
	CA1k+EzUTHn/z6Zjq3vJ5o4ZixOqqKclEno0u4I=
X-Google-Smtp-Source: ABdhPJwRRAwCRJWCopAh560BqX5nnMFeJX4fJRkUamLZIOmZSLvfoVWOOqJxRKhig5RNtnEWMDnmuKsSg5SnHO/by8w=
X-Received: by 2002:a17:902:b183:b0:14f:c266:20d5 with SMTP id
 s3-20020a170902b18300b0014fc26620d5mr43172969plr.136.1646420178457; Fri, 04
 Mar 2022 10:56:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220304170813.1689186-1-nathan@kernel.org> <202203041005.A3B985C@keescook>
 <YiJXUL3zIik+4QDv@thelio-3990X>
In-Reply-To: <YiJXUL3zIik+4QDv@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 5 Mar 2022 03:55:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+4t_c=SLJqVWYVMaQ8C1uqWCeOFJ6eNczT1TUgEG_Cg@mail.gmail.com>
Message-ID: <CAK7LNAT+4t_c=SLJqVWYVMaQ8C1uqWCeOFJ6eNczT1TUgEG_Cg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Make $(LLVM) more flexible
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Shuah Khan <shuah@kernel.org>, llvm@lists.linux.dev,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 5, 2022 at 3:15 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Mar 04, 2022 at 10:09:03AM -0800, Kees Cook wrote:
> > On Fri, Mar 04, 2022 at 10:08:14AM -0700, Nathan Chancellor wrote:
> > > [...]
> > >
> > > Update and reorder the documentation to reflect these new additions.
> > > At the same time, notate that LLVM=0 is not the same as just omitting it
> > > altogether, which has confused people in the past.
> >
> > Is it worth making LLVM=0 actually act the way it's expected to?
>
> I don't really see the point, omitting $(LLVM) altogether is simpler.
> Why specify LLVM=0 if you want GNU tools, since it is the default?
> However, I can look into changing that in a new revision or a follow up
> if others disagree?


Changing the meaning of LLVM=0 is beyond the scope of what
we are trying to achieve now.

I think documenting it is enough.

(If we have a good reason to change it, we can. But, it should be
done in a separate patch, at least)






-- 
Best Regards
Masahiro Yamada
