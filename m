Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C24692
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 19:32:11 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31bf3656517so59490857b3.12
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1Cx5iQ53pL7HiSekvxBvkLFnjl+EdINP714DV+6Thc=;
        b=VGbgzTZgTZX/2WZ+zac2xcxgBOwMdDpG9pYD+JVrSpuVQ5DymsCz/HaW+V8a96bHUv
         RUe2GR1Rf+1rw0q4fOwXBiytVFtBcai/HJT3+MsFcLE3QV+HIeDlOJX1BuktRmNk9qeE
         BT01HWEFL+5GIktnzk97krULC0/b3iATNOja9ZRNCcLiB/eGN9Dm/nCl9jrCHwvsqgPb
         sv0ttnd98xmeybPn74vKnLywP5tcqPFDwhWRH+wN6g0wFu0p+lSeNMVLt+SnheDXyFT+
         QNexh42MKBMRF4SUGRr4c1jj8QKiQFpyuJyXP98lN1kcD1Fe1Vpgj11dZ8nLzCAkshMA
         ClHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1Cx5iQ53pL7HiSekvxBvkLFnjl+EdINP714DV+6Thc=;
        b=rbWb6sPcMi4hJ53SdGJVzI6+bLUEzaSGl2dGkaUlLOgFs9UGQkxoXEn4qjp+YsS477
         Kmerju+UmG9iC1zSYgsAOKUWXoAWXOnncPZXYZ8esEPSdszC5JadTiY8PUdmeX5fAPkR
         QHKPz4q2xWl1/FW2EPKNGUHBlkuOVzb+0jTs/EByBf8XoCDJgp/cnj4bYOPdd+ZsWV6u
         9EoPDS0A8zIfyrSze6hFEKCje+c1IY05rPkL4B25bFOA5Hh/rxQFBDIgACXSusPQjF6F
         SdvKa2RqcJWuvNipIVXmlguHosimoMYh0g5dLPyUoJVPyXQZroAAqxTuVGkbX06Vo5p9
         GcUA==
X-Gm-Message-State: AJIora+6JEnT7cj6XubvfgM+gzp+xgAFL7rJueJCB/lincujUyO7M9SJ
	GiLwTZsfQq1IhDnKjzC91QFwSrHbgheePo7Gzux2vw==
X-Google-Smtp-Source: AGRyM1tnA2ak+GWWf/mQNTQkis9L/nmlb5vokwYVfajiT4hmUTR6TfOY26PDc7uxn6KxN/uUrRr2coYj3+eh/ESYER0=
X-Received: by 2002:a81:3984:0:b0:31c:b59e:a899 with SMTP id
 g126-20020a813984000000b0031cb59ea899mr21304958ywa.195.1657567930561; Mon, 11
 Jul 2022 12:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev>
 <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
 <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>
 <20220711181933.rcukzsnabiiowy7p@meerkat.local> <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>
 <20220711192719.qryq35epoko2jeii@meerkat.local> <CAKwvOdkmy47RKjp8KeTN8L-y4jS-MtzyCCwoiBkAWHTDSixXXw@mail.gmail.com>
In-Reply-To: <CAKwvOdkmy47RKjp8KeTN8L-y4jS-MtzyCCwoiBkAWHTDSixXXw@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 11 Jul 2022 12:31:59 -0700
Message-ID: <CAFP8O3LTKizPJnGdtkTY8TQ+FjwCHd-b2oP8GDCEMKneRh83xA@mail.gmail.com>
Subject: Re: [sysadmin] Fwd: Bouncing messages from llvm@lists.linux.dev
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, postmaster@kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 12:30 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jul 11, 2022 at 12:27 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Mon, Jul 11, 2022 at 11:30:31AM -0700, Nick Desaulniers wrote:
> > > Any chance the error message could say something like:
> > >
> > > The message at
> > > https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzettait.com/
> > > could not be delivered to you; it may be spam but you might want to verify.
> >
> > Unfortunately, mlmmj doesn't give me access to the message-id of the bouncing
> > message (see http://mlmmj.org/docs/readme-listtexts/).
> >
> > I will tweak the wording to offer a bit more explanation, though, something
> > like:
> >
> >     Some messages to you could not be delivered. This usually happens if we
> >     have accepted a spam message that is being rejected by your mail host when
> >     we try to deliver it, but may also be due to other reasons. Please review
> >     the public list archives to check if you are missing any legitimate mail.
> >
> >     If you're seeing this message it usually means that things are back to
> >     normal and no further action is required from you.
> >
> >     Here is the list of the bounced messages:
> >     - %bouncenumbers%
> >
> > -K
>
> LGTM; thanks Konstantin!
>
> --
> Thanks,
> ~Nick Desaulniers

LGTM. Thanks!
