Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4AE46A9
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 16:38:51 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-02.nifty.com with ESMTP id 29RGWVeb029090
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 01:32:31 +0900
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 29RGW5oW028366
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 01:32:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 29RGW5oW028366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1666888326;
	bh=52K3j4S01m6w/RfZ2ZmouebwYkbBAw9HS00T9luyzUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NbAQ6FXkO9En0C8Gi1ej9gn1bbEKRjuN0OQjeGqMUuzE5jS3YnzHhYwjEOWhQq3/s
	 RmqVCqFFTjGudrH2pQ5zuXFfSv14UPIzRRUKsUc0oBEGGymUH9RPkmwkSspuCBW25I
	 Ppvtyeb23nVGhJqIke+KIMGPKX19bvDYrLvPyrJYyqJiLXx9nJCOCEjsrf4ubq+VLJ
	 x3VTyjvJ1l5a8cCd5Y7jnPHGbjZdHAXXSxn5TC65QAm5ODb3sZEofiZ/ulw9WRIXsj
	 S7QkqPg+cVVx7f+K/fOhJ5936Sz+kHAZLZ//VFcQv3+TA7eugy0eWbq1in57rzd9WU
	 D7soZ/NNpmeAQ==
X-Nifty-SrcIP: [209.85.160.45]
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-13ba9a4430cso2756505fac.11
        for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 09:32:06 -0700 (PDT)
X-Gm-Message-State: ACrzQf1v2DQVnc+q4YRw1xCFL8MCCl1A5crx814gAX6ukWXtTListON8
	0ZsiiCFUwpJOyyHMP9cmdvx5lqgtaq31ru7uQ8s=
X-Google-Smtp-Source: AMsMyM5HtJWKYTji479rNEYH9axJJybHQHD8bBb7XeWPXWObEmy8J9YLvBHRuppp2rRV0aIxNwePrqHWrwGH8t/5cqE=
X-Received: by 2002:a05:6870:7027:b0:13b:a5b7:165a with SMTP id
 u39-20020a056870702700b0013ba5b7165amr5974579oae.194.1666888325338; Thu, 27
 Oct 2022 09:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221023195257.175946-1-masahiroy@kernel.org> <CAKwvOd=pimEoN_OvyefPiTTsOdzo+Xda1gJrYg8+jAE5GA0rqA@mail.gmail.com>
In-Reply-To: <CAKwvOd=pimEoN_OvyefPiTTsOdzo+Xda1gJrYg8+jAE5GA0rqA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Oct 2022 01:31:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5nvQDYD8jqazng2_CwuuZMGE2FyLFF73iW1_Vp6DWgw@mail.gmail.com>
Message-ID: <CAK7LNAS5nvQDYD8jqazng2_CwuuZMGE2FyLFF73iW1_Vp6DWgw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix 'Broken pipe' message for AR=gcc-ar
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, eng.stk@sapo.pt
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 4:15 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Oct 23, 2022 at 12:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Since commit 321648455061 ("kbuild: use obj-y instead extra-y for
> > objects placed at the head"), 'make AR=gcc-ar' shows the following
> > message:
> >
> >   /usr/bin/ar terminated with signal 13 [Broken pipe]
>
> Not just AR=gcc-ar, but also AR=llvm-ar:
>
> error: write on a pipe with no reader
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1651
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>



Thank you.

I updated the commit description, and sent v2.

https://lore.kernel.org/linux-kbuild/20221027162839.410720-1-masahiroy@kernel.org/T/#u


> Note that due to
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8017ce50641c303b9b5d96f3c10229ecfd770a70
> we should send a backport to stable like:
> https://github.com/engstk/op8/commit/6f2688e3eb4ec06b276e541640d4f06364b68442


Maybe, we can backport 8017ce50641c30 itself,
but I am not sure if it is cleanly applicable.



-- 
Best Regards
Masahiro Yamada
