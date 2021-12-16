Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098F72CA4
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 00:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 031A038333C;
	Wed, 15 Dec 2021 19:29:45 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JVw8I638vL5P; Wed, 15 Dec 2021 19:29:44 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 869A9383484;
	Wed, 15 Dec 2021 19:29:44 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 869A9383484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1639614584;
	bh=KwFtuPOIv8k2DKYJZEaH49Ll7nYawzAfmsVBnaT4faI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=hpVatC0AEJ35GX//NZevfA9Q4hJPDoPz2xSA2sfUQ26k4nX1lk95N1yllRx3RCtqz
	 JdxOEGP2wf8pDDXt05YqkXjEEXdZP/2KnUMz3Md0Yp0/nREp30TDXPIlUZdGwEl3Io
	 m4gf9jX/gEFGhyqDFZb/CwXl+CsbUh8gy1JzCAG5LlsrFwszJZHpcuM4o41dkGzGJR
	 VSlr3NIaeXVXJmz0uzWgtXmTe+5rt3UeCWYAdLmE2SpHMMAZx/MWmPnL22YasYMeEq
	 2sDtXU14mYrxqCVZBZk9wsJXotc8xpSwclLouCuSv1chyRC9yj0P8byHpUnv+pT0Xs
	 wYQgeTO0EYgPg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OWDfdkkWR_Ww; Wed, 15 Dec 2021 19:29:44 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
	by mail.efficios.com (Postfix) with ESMTP id 788443831AD;
	Wed, 15 Dec 2021 19:29:44 -0500 (EST)
Date: Wed, 15 Dec 2021 19:29:44 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: ndesaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, 
	James Y Knight <jyknight@google.com>, 
	Eli Friedman <efriedma@quicinc.com>
Message-ID: <1481671522.34267.1639614584440.JavaMail.zimbra@efficios.com>
In-Reply-To: <CAKwvOdndCue_E4eE1_bnGisrPnmUY7vRb_FP_TMs4bQRTOi8Rw@mail.gmail.com>
References: <157245708.33559.1639605989199.JavaMail.zimbra@efficios.com> <CAKwvOdkUhqt8eUQ_3HknXkF=6LBFY6Zc7rsXFPCT3GwNfmDoUQ@mail.gmail.com> <CAKwvOdmxOsEFkEGuh86F5CZ9sgqq8G9di9ryVUEeTQCjfoETqA@mail.gmail.com> <CAKwvOdndCue_E4eE1_bnGisrPnmUY7vRb_FP_TMs4bQRTOi8Rw@mail.gmail.com>
Subject: Re: clang asm goto issue small reproducer
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - FF94 (Linux)/8.8.15_GA_4177)
Thread-Topic: clang asm goto issue small reproducer
Thread-Index: h/ShblJhFPVvRyQskoCq9TGQfwDSyw==

----- On Dec 15, 2021, at 7:25 PM, ndesaulniers ndesaulniers@google.com wro=
te:

> On Wed, Dec 15, 2021 at 4:18 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Wed, Dec 15, 2021 at 3:50 PM Nick Desaulniers
>> <ndesaulniers@google.com> wrote:
>> >
>> > On Wed, Dec 15, 2021 at 2:06 PM Mathieu Desnoyers
>> > <mathieu.desnoyers@efficios.com> wrote:
>> > >
>> > > Hi Nick,
>> > >
>> > > I have a small reproducer for the asm goto issue we discussed over i=
rc. I have
>> > > axed away all code that is not the problematic function by hand. Hop=
efully this
>> > > won't change the overall optimization context too much.
>> >
>> > If I cut the compilation pipeline off at after "middle-end"
>> > optimizations, I can see that `this_cpu_list_pop` returns `NULL` for
>> > test.c while in test-asm.c, it's a phi node of either NULL or head
>> > (which looks correct; for the test-asm.c case).
>> >
>> > "GVNPass" seems to be converting
>> >
>> > return:                                           ; preds =3D
>> > %cleanup.thread19, %cleanup.thread
>> >   %retval.118 =3D phi %struct.percpu_list_node* [ %9, %cleanup.thread =
],
>> > [ null, %cleanup.thread19 ]
>> >   ret %struct.percpu_list_node* %retval.118
>> >
>> > into:
>> >
>> > return:                                           ; preds =3D
>> > %cleanup.thread19, %cleanup.thread
>> >   ret %struct.percpu_list_node* null
>> >
>> > Which drops the
>> >   %9 =3D load %struct.percpu_list_node*, %struct.percpu_list_node**
>> > %head, align 8, !tbaa !9
>>
>> Ah, Eli pointed out that I'm chasing the wrong squirrel. From test.c we =
have:
>>
>> struct percpu_list_node *head;
>> load =3D (intptr_t *)&head;
>> ret =3D rseq_cmpnev_storeoffp_load(targetptr, expectnot,
>>      offset, load, cpu);
>>
>> then in rseq_cmpnev_storeoffp_load():
>> __asm__ __volatile__ goto (
>>   :
>>   :
>> [load] "m" (*load));
>>
>> Did we ever initialize head?  Isn't this equivalent to:
>>
>> int* foo (void) {
>>   int *head;
>>   int **load;
>>   load =3D &head;
>>   asm(""::"m"(*load):"memory");
>>   return head;
>> }
>>
>> Isn't that equivalent to:
>>
>> int* foo (void) {
>>   int *head;
>>   asm(""::"m"(head):"memory");
>>   return head;
>> }
>>
>> For which neither compiler warns for -Wuninitialized? They would if
>> head was an argument to a function call...
>=20
> What's going on here...
>=20
> $ cat y.c
> void x (void) {
>  int y;
>  asm(""::"r"(y));
> }
> void z (void) {
>  int y;
>  asm(""::"m"(y));
> }
> $ clang -Wuninitialized y.c -c
> y.c:3:15: warning: variable 'y' is uninitialized when used here
> [-Wuninitialized]
>  asm(""::"r"(y));
>              ^
> y.c:2:8: note: initialize the variable 'y' to silence this warning
>  int y;
>       ^
>        =3D 0
> 1 warning generated.
> $ gcc -Wuninitialized y.c -c
> y.c: In function =E2=80=98x=E2=80=99:
> y.c:3:3: warning: =E2=80=98y=E2=80=99 is used uninitialized [-Wuninitiali=
zed]
>    3 |   asm(""::"r"(y));
>      |   ^~~
>=20
> Only 1 warning each? I expected 2.
>=20
> Is there something special about "m" constraints and -Wuninitialized?

In my work-arounds for the lack of output operands with asm goto,
I've used either of those tricks across various architectures:

- "m" (y) input operand with "memory" clobber, or
- "r" (&y) input operand with "memory" clobber

to achieve writing to a memory area from assembler without having
output operands available.

It may be stretching the definitions, but those were my (perhaps
ill advised) expectations.

Thanks,

Mathieu

>=20
> --
> Thanks,
> ~Nick Desaulniers

--=20
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
