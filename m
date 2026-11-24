Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559158;
	b=y4FqrsmC1SvkgPctCg2a1OMD+OnTU9fb1YnGTMul3D3Vzoichv/wZ85VHyMIHQVw28I8
	 mLiBaOXgHGHfHmHJlpVedF8/NGHKkDb35gn21s7XXgriEkv/7PHrN9p7T3cY0NmfLsjkD
	 B/5BHkvD7Zt7yvsKqyaVQkifRzfz0dMByp8R+ZWU13XDuhW1zaWSjKLpWfRXlMqHkSPsv
	 V3qA/efLTu2BgjV3CWTBDP+JjiH8N3+zXsssgqC6dL6PAYBE3BuZt3uh/ZQTp3QKcdhIV
	 6wmiOZtTlwhTiCjpQPVniT4wNpRYp5Uvo+vyA0vFrTojp307O19w30YwJincvkLY3mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559158;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=aLTr0txqAH1KNcSXhJTIoSUJiKU+VODsYB97zMuHtEM=;
	b=gygQptxeuji2lMqIZsIl4EdYlzdfIn4pCBEYIlNRjkwmiZyPPEgT4Q3jh84qTJ6s3Bdo
	 jt/keq37YSyp9Ff2j8w94ZNXU+TgedDI/yYNryJg1MAmo1olk3tjtrsImT2+RTXvTY3xE
	 5x1h+OMw4U+/UbnnYbHxb/33709H6wvAKOYeAbHlgrZQJsXaTqEIupeoTgZlPCBsT43AH
	 3Qpwc23bQQq6f4gvW6qY/z0q8Sn/EpRIl1emSlT9fqSn/kzzajN7P/4tJB7HQoVIlMMFY
	 a6Kt5A1ISW6s6ZGKESjgzNBRwFtC+FtmZBlofqPqJFtYmmaq2QNTRjXJwCTfok+SaLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTZj58PY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D7F606A31E
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTZj58PY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA8E1F000C6;
	Tue, 24 Nov 2026 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795559157;
	bh=aLTr0txqAH1KNcSXhJTIoSUJiKU+VODsYB97zMuHtEM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=lTZj58PYKQr1BRLFsPctOJeR1/Dvam24FNajnG20yvNe6CwQ2J8xwlpNKcVoKXmp4
	 IeVrHLBatVH2EU59YIj3/bTse5D4jb1ku77aOCWvmIYakfslaI1yFNEswTlSyqyPqO
	 bpM7yYlB+j83Gq5/psomVJkOv3HVupMB80VztuxmtXZAJJ3lXcQdjK4Xy/BmHEG7O1
	 XoPSXEauP62/sG6enPoUdy+SuCfCJxEITid7ixVH7BMW9q/F5/Bn2ElHQ91N6U9e97
	 0vNgvjSijpLjsHAgMbs+hN7SJCLgONcGOx4U+IyDdds0KNgq1Z72qrHc2ywZmhqnDG
	 1ctrnK4Y+5tPg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A4ABD198003A;
	Tue, 24 Nov 2026 17:25:54 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 17:25:54 -0500
X-ME-Sender: <xms:8A4Ga8rs8KJsDpMIB3VEAl3vgl0KxRRCaL8JFPcutadlSju_EZQE6A>
    <xme:8A4Ga9chGScYAoQsymneeqxoWT5A26dNJ8qINuUq6hU2zOcl-tEussAO1fVosquFJ
    c82Gu8YaiJmxwXROALvWgfCeMP92Y6AkvRU5NoKEIoonJDvVHmmE7-c>
X-ME-Proxy-Cause: dmFkZTEpK/2xlkcI7IAICd4ci3FEqW70yxAdWP8cO31i1/nut3GgcnD67ZtPZpbDtraAtD
    P5Zam7aKNWg5cuPn9CE8Gr7qmjdRmpbHRvwpJs83kbOfllq06baDX3mU/DuMJUgNVFgC5Q
    NBMu5GOQ168Wsg/tWOt6l4ACa9BQDd262uErIeIn6sTr4tnxyiXzvHeBx6WzlXNM3GuZTl
    fBhj8J08GBmWJ3OAyn0sGaL2VlmGetpsknn7YRR9QkyXZ8CGSgKbbQBXOwl0xrfFi778tK
    bzaiPV05Rs3jCW5/PPrI6cWZUUnBE69e5l1ayg0x0umgaaTeeH+ccX2ptkvducONf1eOi3
    87j8mP6PwjsJTRyhTO+1Qxv1IKXfuCgHX4LGnNktKL+VwmhY6tCGeespEqTmUtC/4PBNVK
    RYUotwmULIFmGzeTMHAEIEspzB67PbtY7hRe7bLdzvNjn8WRk1NCEMXn7wk9zkghAbKt8V
    m+6uzXBvg0ip+FpdWU1d7Lp7Td3fOC5JGBLSSc+37pXv6QG74NwxhVYhB4YzRwDR/xmOGg
    tSqwbim/8hAf9rCS2AvslAkv7nkCZwSLoDSr52ukIdYESHRc+FEZPeu06ZmAflW5YdeWs0
    NDkm1Hzep2yGxppDA2oGO0NmKEDk+Iy1deOq3HbsgC3DhG8fu5DPh2xt2WPQ
X-ME-Proxy: <xmx:8g4Gax4cIA53GWgy_JDUIiopAG8muUeBe3G_-sa_FrM2_wiEx4AZZA>
    <xmx:8g4Ga8bPhEZSO4izeYrRn-r6Q0kBoxMh5TzKMiN-cLwXTrJYXPSFuw>
    <xmx:8g4Ga7FOhjU8q9gDxtdeaQTvEN21BYD7hp0UJcRZr__rEcNCmC_8xw>
    <xmx:8g4Ga_nUhUWV71tymWj1pwtVFYGW4M_HxP23YpNyA7J7PBT1mhQbsQ>
    <xmx:8g4Ga4CrX0snWpuTOXSsfli2yWilvohoqoa6n8ZlKnA-FZNpSeXElmL_>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2D691F8009D; Tue, 24 Nov 2026 17:25:52 -0500 (EST)
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
Date: Tue, 24 Nov 2026 23:24:57 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Bill Wendling" <morbo@google.com>
Cc: "Ard Biesheuvel" <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Waiman Long" <longman@redhat.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev
Message-Id: <1d4d7a84-d0b8-4b81-adb5-4fcecd1e19a1@app.fastmail.com>
In-Reply-To: 
 <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
References: <20261122105646.2223131-2-ardb+git@google.com>
 <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
 <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
 <20261124163905.tkkaLhJ2@linutronix.de>
 <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock pointer if
 unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, 24 Nov 2026, at 20:32, Nick Desaulniers wrote:
> On Tue, Nov 24, 2026 at 8:39=E2=80=AFAM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>>
>> On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
>> > On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel=
.org> wrote:
>> > >
>> > >
>> > > On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
>> > > > Very detailed commit message, but you kind of bury the lede her=
e on
>> > > > what the actual problem this patch is fixing *is*.
>> > > >
>> > >
>> > > Apologies. I'll trim it down,
>> > >
>> > > The TL;DR is that non-volatile asm() statements with memory input
>> > > operands are not elided by Clang if their output is never used.
>> >
>> > That's not a bug; both Clang and GCC behave that way.
>> > https://godbolt.org/z/sEhec4oae
>> >
>> > (perhaps there is a clang bug somewhere, just trying to suss out if
>> > there's something we need to fix here; forgive me for being pedantic
>> > here)
>>
>> I see a
>>         movq %gs:this_cpu_off(%rip), %rXX
>>
>> on x86-64 with clang-21, not with gcc-16 for local_lock() and
>> local_lock_nested_bh(). Are we hunting a clang bug or considering this
>> patch?
>
> Both; I'm just trying to better understand:
> 1. what is the actual point of the patch (see my "burying the lede"
> comment upthread)

The point of the patch is to avoid evaluating the macro argument unless
it is used, to work around the Clang issue  where it doesn't elide asm()
statements whose outputs are never used.

> 2. what issues on the clang side are outstanding and conspiring here.
> I think a v2 with a revised commit message is good to go, though I
> don't know if Ard saw (or ignored) my questions about the temporary or
> casts?

Apologies, I did see them when I read the email, but had forgotten about
them when I got around to answering it.

>> +/*
>> + * Only evaluate @lock if it is actually used, i.e., for local_trylo=
ck_t, or
>> + * when lock debugging is enabled (see local_lock_acquire() above).
>> + */
>>  #define __local_lock_acquire(lock)                                  =
   \
>>         do {                                                         =
   \
>> -               local_trylock_t *__tl;                               =
   \
>> -               local_lock_t *__l;                                   =
   \
>> -                                                                    =
   \
>> -               __l =3D (local_lock_t *)(lock);                      =
     \
>> -               __tl =3D (local_trylock_t *)__l;                     =
     \
>>                 _Generic((lock),                                     =
   \
>>                         local_trylock_t *: ({                        =
   \
>> +                               local_trylock_t *__tl =3D (local_tryl=
ock_t *)(lock); \
>> +                                                                    =
   \
>
> Why do we need the temporary?
>

Because 'lock' is a macro argument that we should evaluate only once.

>>                                 lockdep_assert(__tl->acquired =3D=3D =
0);    \
>>                                 WRITE_ONCE(__tl->acquired, 1);       =
   \
>> +                               local_lock_acquire((local_lock_t *)__=
tl); \
>>                         }),                                          =
   \
>> -                       local_lock_t *: (void)0);                    =
   \
>> -               local_lock_acquire(__l);                             =
   \
>> +                       local_lock_t *: ({                           =
   \
>> +                               local_lock_acquire((local_lock_t *)(l=
ock)); \
>
> Is this cast necessary?
>

Surprisingly, yes.

https://godbolt.org/z/E8rGchfev

> Ideally v2 adds git trailers for:
>
> Link: https://github.com/llvm/llvm-project/issues/93449
> Link: https://github.com/llvm/llvm-project/issues/245738
>

Ok

> (Since if both of the above were fixed, this patch would be moot)
> (I've assigned the second one to you, Bill, since you're "in the
> neighborhood" (touching lots of related code in LLVM recently))
> --=20
> Thanks,
> ~Nick Desaulniers
