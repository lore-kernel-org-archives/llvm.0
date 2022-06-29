Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4D16AB4
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 19:48:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j21so29913337lfe.1
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 12:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GDpRTVhKkWSy2MvVKUZ3Z3z1Bt+bBeXV0KIHaszmkuA=;
        b=g3Uaclg64d1TGHzQcBfl7t9w3I1ww5YYtVkypt3S0N5+TmABgMDxTUWvOXt+9mE0Le
         is4FHdD4ZkcI9SN/SIcqtii+qeRjvjZe6VAIbiqCVXchroWHh2LwaXMpwGCocA1tbv0B
         hjr7V6fjm/b+USYataYNnwfHfWPE0kQxbi15bDZMZ58npPO/z1/6UndlovS7hWHSG67i
         cQLWaO3ZHi2zkaIKnEUd44KY6MliZhLMN928/SwMz5yzbgz3jszpOfA90ilDArEe1HUI
         8r3NhHwX5cnxRMZvHR8E+HsLScWoSk0y+DodSdeK7w7KCcyrnAph846jsrTCUnHseGvh
         4nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GDpRTVhKkWSy2MvVKUZ3Z3z1Bt+bBeXV0KIHaszmkuA=;
        b=7FyeDfqW17SgDVbEG8EQ8GtXPP0TGDMSzcL/Es572L+RywXEYWqdrWr/B0o2DSEOpc
         7tGfDmx+RrdH1YeXj035tMuXa4SjKn92fCqeFZRO3KoueBRv8u3V3Az9vxXwfgjtGG8h
         wYzJrtR3/swo47Ng5iOo+B68JNHL+xIe5rE8XF7q/NtBTGjiYYjREo+qleZN4Iqa4Wl6
         fKc7QOk8j5gsGvfQ7DfvTelDh/eN7PUklJcfNuzLpi6cPA4Uk96c07dJ2INkM9Zj/bqs
         atPE2/BhfLeE9YY6p+WMBKQTGUknz4N6CZD3gQPQc2oOfNqdbOH8oaBa8F40RPlNMBD1
         QuNw==
X-Gm-Message-State: AJIora/rjhNdX+B74nH8D6F7vTIHjwpA3dM5P/FTsI91z4vNaJlET6/n
	Quk0JouO7c2v3TWiwqIU5DLQ3EAuC6uy5q1P85yi
X-Google-Smtp-Source: AGRyM1vOzYL8y+rYaHubXte6XVU+zHTAwaKw4l5hfw2LEvmAQQHulkepcxbBzAjO3GZRm1rXAwzmuBMIM7rYOPMx+fg=
X-Received: by 2002:a05:6512:3503:b0:481:4470:4128 with SMTP id
 h3-20020a056512350300b0048144704128mr2025991lfs.303.1656532122803; Wed, 29
 Jun 2022 12:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
 <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
 <87mtf7z0rt.fsf@gnu.org> <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
 <CAKwvOdm=_YqBpuBzouqoWHYNe6MMUE10vqF0PUkU=hcOj+UqrQ@mail.gmail.com>
 <B0A01DE7-1B50-479A-92DF-DAFAB3F06E0F@oracle.com> <878rpgpvfj.fsf@gnu.org>
In-Reply-To: <878rpgpvfj.fsf@gnu.org>
From: Bill Wendling <morbo@google.com>
Date: Wed, 29 Jun 2022 12:48:31 -0700
Message-ID: <CAGG=3QVNid_s5QFCtPF1hVChsm89hax=KuHTt8Z=huP+CV_edQ@mail.gmail.com>
Subject: Re: plumbers session on profiling?
To: "Jose E. Marchesi" <jemarch@gnu.org>
Cc: Ruud van der Pas <ruud.vanderpas@oracle.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, 
	Vladimir Mezentsev <vladimir.mezentsev@oracle.com>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Wenlei He <wenlei@fb.com>, 
	Hongtao Yu <hoy@fb.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>, elena.zannoni@oracle.com
Content-Type: text/plain; charset="UTF-8"

I have experience in this area with our internal production kernel.

-bw

On Wed, Jun 29, 2022 at 2:00 AM Jose E. Marchesi <jemarch@gnu.org> wrote:
>
>
> [Added linux-toolchains@vger in CC]
>
> It would be interesting to have some discussion in the Toolchains track
> on building the kernel with PGO/FDO.  I have seen a raise on interest on
> the topic in several companies, but it would make very little sense if
> no kernel hacker is interested in participating... anybody?
>
> > Hi Nick,
> >
> > Apologies for the delay. It's been a busy week with gprofng related work.
> >
> >> If you're still considering attending Linux Plumbers conf, please
> >> submit a proposal:
> >> https://lpc.events/event/16/abstracts/
> >> Please make sure to select "Toolchains Track" as the "Track" after
> >> clicking on "Submit new abstract."
> >
> > Thanks for asking!
> >
> > Our presence largely depends on a discussion on kernel profiling and
> > to see what we might be able to do with gprofng regarding this.
> >
> >>From our side, the main person will be Vladimir. He knows the code
> > inside and out, but I will also try to attend such a session.
> >
> > Is there any news regarding such a session on kernel profiling?
> >
> > Kind regards, Ruud
> >
> >>
> >>>
> >>> Kind regards, Ruud
> >>>
> >>>> On 24 May 2022, at 12:24, Jose E. Marchesi <jemarch@gnu.org> wrote:
> >>>>
> >>>>
> >>>> I am adding Ruud van der Pas in CC. He works in gprofng and would be
> >>>> willing to participate in a discussion on kernel profiling.
> >>>>
> >>>>> (Re-sending with Vladamir's email addr fixed; sorry for the noise)
> >>>>>
> >>>>> On Fri, Apr 15, 2022 at 10:54 AM Nick Desaulniers
> >>>>> <ndesaulniers@google.com> wrote:
> >>>>>>
> >>>>>> Hi Sami, Bill, Jose, and Vladamir,
> >>>>>> Jose and I are currently in the planning process to put together a
> >>>>>> Kernel+Toolchain microconference track at Linux Plumbers Conference
> >>>>>> this year (Sept 12-14) in Dublin, Ireland.
> >>>>>>
> >>>>>> Would you all be interested in leading a session discussing various
> >>>>>> profiling related topics such as:
> >>>>>> * gprofng
> >>>>>> * PGO
> >>>>>> * AutoFDO
> >>>>>>
> >>>>>> Would others find such a discussion useful?
> >>>>>> --
> >>>>>> Thanks,
> >>>>>> ~Nick Desaulniers
> >>>
> >>
> >>
> >> --
> >> Thanks,
> >> ~Nick Desaulniers
