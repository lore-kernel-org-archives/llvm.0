Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593849;
	b=OteRvN9wrQbd58tzZud1cBESxhyzxOgprdjuPTytcLYZK1GZyv2332T9PkCd8ufksj1G
	 jqcJqIL0f7b8NRPFAfAXNZ6IRX5GonMBYgcv8fgX8zTLX0q6pkpsADz+TftVrCqUDbCml
	 nJ6eVXRQEmV3KE2Z7FSWHZixiyRG5o+elUIYE8LNrIOLJDVX1Yt2FT6MPLZ9fhXuUegFf
	 C3JMA+GL61H7iGXSOEBYLk7qvaYmKIMfsosVM4Vj3FGqgtxN1oFW4OACvrG1E100kDlwr
	 L7WPvW3+qcinBJL+yyAWBuXWfPt0Qej1SzgstDJXOFGIhlGATDAJpbt+mC6M90Wmzxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593849;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=uJIkBK2PHpdfxzIQ1VFxbtN31D06EwP128WyTvyAIWw=;
	b=Q2p9UGpCR1LNHDYIeqAR+6spedAk0Kv4AJf5WQxUAVhOEpNtN31yyH5xMQ/7G680wpgg
	 VSHoBuuUszbzhsz0azgsADrEgWs2Mauq+kWKCzgD9vyD2rR6tyvhWUDQA6TuJzmdWWdBJ
	 blfxpApHy/2wXLyB+SzfxmXSfNxXJjXidatn6dxeEsvg1a9Ci/FAMSndms+ZaAFuVBaRO
	 znpX9BZAr6SjleI3XmkRyvjUADVAfQJ33u3u3U3IhdWgRYV2WZxw3/1cwr4aKhgQj0wVb
	 wP6f7Jvm+AB8LrUp4IFIdtlVSVtpdSMddqJ1Fuc8aoyZrl385/9l0ACYBGtXenuyhQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMExeYxN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13B6606A327;
	Wed, 25 Nov 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMExeYxN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4C01F000CA;
	Wed, 25 Nov 2026 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795593848;
	bh=uJIkBK2PHpdfxzIQ1VFxbtN31D06EwP128WyTvyAIWw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=iMExeYxNUM1rjw51fpGv5pqq5nBOB55Q1kb0P3aWCqqyTGgKxYyCAkAUlhXEupXve
	 aHnXGA8FpUz66QLqM0b/rcqVNitd4a37eHNL1/pnhxZYdUon3MED3CDdLoYWWvHg7j
	 IjrzzxgqshvaOfClLjgMKrlippsjhEp8rsvANBeGhZ0ALrcrEOyoxrr0XO4FQ5K6Oh
	 qgdxueqjv2oSUIswXW5R/dsRDo7qHV9DXxTcHQIpbmBZahQxBiXHjWvesMSXO0FgSy
	 l8uRAkepw2VN2I58s/OkZJcE2QkUJP5m5pHGZd13Mx3U9Cbu7ZA2/CTE8kHp73MP80
	 cumb8l1E94Ubw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 88B5B198004A;
	Wed, 25 Nov 2026 03:04:05 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 03:04:05 -0500
X-ME-Sender: <xms:c5YGa4wlCMMrVuFyb9ZVzUq1HnrtwiA0KNeSBOESlkyFwN2g9rBXVg>
    <xme:c5YGa3GY0jxxSJ1D8HIRciJoRcutMxhgTLO83hGwEwWZPqffQ8TYtxjIZnq50C71B
    5NgWbSijbudaC240auItTLYpfRWQoniS7l6xwhrXw7GRsylzBHi0dOL>
X-ME-Proxy-Cause: dmFkZTEGEvs2jPgYuYT3HWVkTVwAn3k/jfHeglJAkg4XZfMFe6vOOyp+rpdfClmuQ0BEDF
    Ovxv8tXPiAfIDjuKqdQWZqXbBkqOhKhou20+hD8oh85WYtXs10I4xBo42xrtV/7b9lp1iE
    lBRx5S30tHiuf+y0l91VEVb4pCMcjOvHI+AchWQHT4ok6gNNsX0/npVrvhoYkwpP300DO0
    NAXlUR6y80OZArraudPaSuxiL7ri89TvntvayVZOGgNTRc17MUkpTn1iUdtKxpR59SPvNo
    p1Z/6MqYrVkxP9pm/Wwcr8Siw8GC9xKTiSlBS6LCfmBCFG9WlNrzmOwl6VXLw3smxnCCdG
    3o67F1JQ41FFDlNX6KvpjNrPapzftNYLzxGccBWU7SxRjwLoe/pgaK5INkdZZdgfVwXUE5
    3UL1/xwh3vlaWxjRAGfIiJo/R42R8JsFAhT9EX2PRHN0/6Y8/JPA5jrPI/7NXxOXuxZtZA
    f5ICnFryrMwnVuhtYR5bxOFNq6c7q0rhrMJj79537Eldri/5k04EmQZPTxNmGR/JKuVoqy
    nGN0HizhS12FHTAP0KYHvfEe0gFu5MsInDFcKR8Tbbe7Fi9aAIxOBam6X0mAT8FAKNY2Ju
    oIdU8FkDuNWfKjt7nQrXWDvGw4G34Sr222SyuIZvuMSOUGvlJgzScOrQPYUw
X-ME-Proxy: <xmx:dZYGa1nD0wQI63lF1YYFmr5bnGiZw6TwFqwuQ4NH_PAZJ2a8fSQ7WQ>
    <xmx:dZYGa9huYqFENtwaWJVRjoIdl9sa5Qkgl25SwHGPsj5EZQs2oDMZqw>
    <xmx:dZYGa_gkjR_9yhabRu7df31WF_3BiCRKL9xHLVY-rDh2-ZHDaE4b3Q>
    <xmx:dZYGa_uAtQAXNOQ8aNAhymE5nNuTbr0_ryLcvOB3dP3Km6OQtSModw>
    <xmx:dZYGa3u6BLh_2MOEX5sioNgOxA2dnPcc6wcmwgSq3wccoe7flayeMkdO>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 13062F80093; Wed, 25 Nov 2026 03:04:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 09:03:42 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Bill Wendling" <morbo@google.com>, "Ard Biesheuvel" <ardb+git@google.com>,
 linux-kernel@vger.kernel.org, "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Waiman Long" <longman@redhat.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev
Message-Id: <c508e8c9-29ad-4157-bf64-40532b708067@app.fastmail.com>
In-Reply-To: 
 <CAKwvOdn=FjiYgiB9wdut2=2FwivPUXiNOG2F=uOeEkycrtoVUw@mail.gmail.com>
References: <20261122105646.2223131-2-ardb+git@google.com>
 <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
 <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
 <20261124163905.tkkaLhJ2@linutronix.de>
 <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
 <1d4d7a84-d0b8-4b81-adb5-4fcecd1e19a1@app.fastmail.com>
 <CAKwvOdn=FjiYgiB9wdut2=2FwivPUXiNOG2F=uOeEkycrtoVUw@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock pointer if
 unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, 24 Nov 2026, at 23:44, Nick Desaulniers wrote:
> On Tue, Nov 24, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
>>
>>
>>
>> On Tue, 24 Nov 2026, at 20:32, Nick Desaulniers wrote:
>> > On Tue, Nov 24, 2026 at 8:39=E2=80=AFAM Sebastian Andrzej Siewior
>> > <bigeasy@linutronix.de> wrote:
>> >>
>> >> On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
>> >> > On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@ker=
nel.org> wrote:
>> >> > >
>> >> > >
>> >> +/*
>> >> + * Only evaluate @lock if it is actually used, i.e., for local_tr=
ylock_t, or
>> >> + * when lock debugging is enabled (see local_lock_acquire() above=
).
>> >> + */
>> >>  #define __local_lock_acquire(lock)                               =
      \
>> >>         do {                                                      =
      \
>> >> -               local_trylock_t *__tl;                            =
      \
>> >> -               local_lock_t *__l;                                =
      \
>> >> -                                                                 =
      \
>> >> -               __l =3D (local_lock_t *)(lock);                   =
        \
>> >> -               __tl =3D (local_trylock_t *)__l;                  =
        \
>> >>                 _Generic((lock),                                  =
      \
>> >>                         local_trylock_t *: ({                     =
      \
>> >> +                               local_trylock_t *__tl =3D (local_t=
rylock_t *)(lock); \
>> >> +                                                                 =
      \
>> >
>> > Why do we need the temporary?
>> >
>>
>> Because 'lock' is a macro argument that we should evaluate only once.
>
> Ah, right!  Don't we have __auto_type or something for that though?
> Maybe cleaner than the cast? Ah, that also doesn't work for the same
> reason as below.
>
>>
>> >>                                 lockdep_assert(__tl->acquired =3D=3D=
 0);    \
>> >>                                 WRITE_ONCE(__tl->acquired, 1);    =
      \
>> >> +                               local_lock_acquire((local_lock_t *=
)__tl); \
>> >>                         }),                                       =
      \
>> >> -                       local_lock_t *: (void)0);                 =
      \
>> >> -               local_lock_acquire(__l);                          =
      \
>> >> +                       local_lock_t *: ({                        =
      \
>> >> +                               local_lock_acquire((local_lock_t *=
)(lock)); \
>> >
>> > Is this cast necessary?
>> >
>>
>> Surprisingly, yes.
>>
>> https://godbolt.org/z/E8rGchfev
>
> What the f...
>
> Anyways, with the additional context (git trailers) linking to the
> clang bugs (and missed optimizations):
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

It turns out we should be able to work around this treewide by using
__seg_gs only for __raw_cpu_read(). I'll send that out and we can
discuss there.

