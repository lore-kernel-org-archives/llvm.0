Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC341C2E
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 12:05:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E654FCB798
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 11:55:07 +0000 (UTC)
Received: (Authenticated sender: dodji@seketeli.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 002A360007;
	Thu, 23 Jun 2022 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seketeli.org;
	s=gm1; t=1655985300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tJWruXee+1IPU/DxQRgOYFgdU1xcLz92KRoAfRyusg=;
	b=lXmKKzzFNrG2gE7iGijgddXZFdnYfr1yErXofGf9JQsXX4h7eslmJ9b6UCy0NS6o/iHmBf
	RFXasvNecJ4kvkMdQ7Q9Xs22/F0Bjzuh0z3sjwENz27eyLDuPk/ZvnKRcF6AOWZyC+x27Q
	jkoLLHqFi3q6YnYwwNXlYhxmo65cWo0CCcs3qF7WOH3k2SA+G9zLbi4zl1oXwGMoKkqR8w
	am2zGGrn40tP7nb9SViiDG6J6vHnWOraYc8Fvess3owY0q7g2PWAI3OgB2rkoWYBFt34H3
	jAoO/ggcXGKRZ9Do4buXkvK6Yn91+FUAfPA05UJYQwGM4FgZH/XsUg0C4DHo6w==
Received: by localhost (Postfix, from userid 1000)
	id 32535581C3B; Thu, 23 Jun 2022 13:54:58 +0200 (CEST)
From: Dodji Seketeli <dodji@seketeli.org>
To: Matthias =?utf-8?Q?M=C3=A4nnich?= <maennich@google.com>
Cc: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>,  Giuliano
 Procida <gprocida@google.com>,  Nick Desaulniers
 <ndesaulniers@google.com>,  elena.zannoni@oracle.com,  clang-built-linux
 <llvm@lists.linux.dev>
Subject: Re: Kernel ABI Monitoring and toolchain support
Organization: Me, myself and I
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
	<87fsm7rbec.fsf@oracle.com>
	<CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
	<2651230.KlZ2vcFHjT@sali>
	<CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
X-Operating-System: Fedora 37
X-URL: http://www.seketeli.net/~dodji
Date: Thu, 23 Jun 2022 13:54:57 +0200
In-Reply-To: <CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
	("Matthias =?utf-8?Q?M=C3=A4nnich=22's?= message of "Mon, 20 Jun 2022
 14:42:31 +0100")
Message-ID: <87edzffvce.fsf@seketeli.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Matthias M=C3=A4nnich <maennich@google.com> a =C3=A9crit:

> Hi!
>
> That is a very late response, sorry about that.
>
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

I'd be super interested in this topic, for what it's worth.  I won't be
able to attend the conference physically, though, only remotely.

Would that work?

Thanks.

--=20
		Dodji
