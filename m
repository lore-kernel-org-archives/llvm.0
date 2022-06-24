Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83F7C
	for <llvm@lists.linux.dev>; Fri, 24 Jun 2022 09:03:25 +0000 (UTC)
Received: (Authenticated sender: dodj@seketeli.org)
	by mail.gandi.net (Postfix) with ESMTPSA id AF2FF24000E;
	Fri, 24 Jun 2022 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seketeli.org;
	s=gm1; t=1656061398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxhTdrOZbaBgtu9408n73iQUS5qZeGxMaRCjzZe+3wI=;
	b=CSOcz6Gl/CE8z4w1RihsYGywkn89K2BI9A2ndidQrVMWHLTj62sIEmVKi8xv2YDVuHRQdL
	5L2JuN9hn/2u8Exs1N3J3ZB0SuXVYHTcFzYY3qB3i/KFDLRgz3cX1dGWTxDS0N5RbLKgYm
	n8DTpeoguh8EZzBkLtVTDkc+JJrBZohv7H2xV7+MO1JhhKAa6/ORIpn7t7GiejODK4SpYn
	+LgujTwMIs6XE0OTcUXtbjJEN/pCplz4kpk58Wz3my0ZBlb6s3x4FPU6YGYYd0llENpUwG
	wueWZGF4Y8aWC7D8sTnZf99z5qk8WF/Um7WFHGuDUZs8ObSxtb+yOXx3bYkspQ==
Received: by localhost (Postfix, from userid 1001)
	id BDB281A0A97; Fri, 24 Jun 2022 11:03:14 +0200 (CEST)
From: Dodji Seketeli <dodji@seketeli.org>
To: Matthias =?utf-8?Q?M=C3=A4nnich?= <maennich@google.com>
Cc: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>,  Giuliano Procida <gprocida@google.com>,  Nick Desaulniers <ndesaulniers@google.com>,  elena.zannoni@oracle.com,  "Cestmir Kalina" <ckalina@redhat.com>, clang-built-linux <llvm@lists.linux.dev>
Subject: Re: Kernel ABI Monitoring and toolchain support
Organization: Me, myself and I
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
	<87fsm7rbec.fsf@oracle.com>
	<CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
	<2651230.KlZ2vcFHjT@sali>
	<CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
X-Operating-System: Red Hat Enterprise Linux Server 7.9
X-URL: http://www.seketeli.net/~dodji
Date: Fri, 24 Jun 2022 11:03:14 +0200
In-Reply-To: <CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
	("Matthias \=\?utf-8\?Q\?M\=C3\=A4nnich\=22's\?\= message of "Mon, 20 Jun 2022
 14:42:31 +0100")
Message-ID: <86iloqtovh.fsf@seketeli.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey,

Matthias M=C3=A4nnich <maennich@google.com> a =C3=A9crit:

> That is a very late response, sorry about that.

No problem Matthias :-)

I totally forgot about this thread to begin with, so thank you for
reviving it.

> In the Android MC we will have a talk about the latest news monitoring
> Android Kernel ABIs already, but I definitely see value in a more
> generic session in the Kernel+Toolchain MC. Is that schedule already
> finalized or is there still a slot available and interest from your
> side?
>
> In particular, I would be interested in discussing ways to standardize
> ABI and type information in a way that it can be embedded into
> binaries in a less ambiguous way. In other words, what can we do to
> not rely entirely on intermediate formats like CTF or DWARF to make
> sense of an ABI? Maybe CTF is already a good starting point, yet some
> additions are needed (e.g. other language features like for C++)?

Do you have something in particular in mind, Matthias?  I am very
curious about this.  I know the idea is to discuss this at the
conference, but a little bit of a teaser would be awesome, I guess ;-)

Cheers,

>
> Cheers,
> Matthias
>
>
> On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
> <guillermo.e.martinez@oracle.com> wrote:
>>
>> Hello guys,
>>
>> On our side we are working on:
>>
>>   * Gives the support  to extract the ABI for Linux kernel image
>>   and Linux  kernel modules using the CFT backed in with
>>   libabigail tools.
>>   * Add support to compare packages with CTF debug format by using
>>   abipkgdiff and other related libabigail tools.
>>
>>    * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
>>    * https://sourceware.org/pipermail/libabigail/2022q2/004345.html
>>
>> If you think that it could be a point to talk as part of your MC,  I can=
 for sure
>> provides more details about it.
>>
>> Thanks for your comments,
>> Guillermo
>>
>> On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote:
>> > Sorry for the late reply, I've been on leave and Mattias is still on l=
eave.
>> >
>> > That sounds quite interesting.
>> >
>> > Matthias and I could certainly talk about what we've been busy with and
>> > what are the main pain points for Android (not just the kernel).
>> >
>> > On what more would we like from the toolchain... it falls into at leas=
t two
>> > buckets:
>> >
>> > 1. make the possible easier - stricter conformance to DWARF standards,=
 full
>> > DWARF 5 support, getting things like ARM64 ABI extensions (e.g., for
>> > HWASAN) into things like elfutils at the same time as the compile-link
>> > toolchain, more consistency between Clang and GCC debug info for the s=
ame
>> > sources, the same for Clang and Clang with full LTO
>> > 2. make the impossible possible - extending ABI monitoring coverage be=
yond
>> > just architecture, symbols and types / dealing with header constants,
>> > macros and more
>> >
>> > Giuliano.
>> >
>> >
>> > On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@oracle.c=
om>
>> > wrote:
>> >
>> > >
>> > > [Adding Dodji Seketeli, libabigail maintainer,
>> > >  and Guillermo Martinez, who works in the CTF support for libabigail
>> > >  including kernel support.]
>> > >
>> > > > Hi Matthias and Giuliano,
>> > > > Jose and I are currently in the planning process to put together a
>> > > > Kernel+Toolchain microconference track at Linux Plumbers Conference
>> > > > this year (Sept 12-14) in Dublin, Ireland.
>> > > >
>> > > > Would you all be interested in a leading session on Kernel ABI
>> > > > Monitoring and perhaps what toolchain vendors can do to help, as p=
art
>> > > > of our MC (which itself is currently still in planning phase).
>> > >
>> >
>>
>>
>>
>>

--=20
		Dodji
