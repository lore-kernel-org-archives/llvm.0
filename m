Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306C14389F
	for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730026879; cv=none; b=HxmXDSoCIujuaiiBrICCrYS4wElTlTCHiqROqt0abZcsPPs6YKItTZe7uOUQXZQoINTDS+BS2JiBmtd5bI5cFYnMkavkp4iwsbWu+YH4RadV7rqQtDZxa7W6m9zUtPMYt05QSMJB09e9/ZPtiBMdnBzJYmHO5ptPAr/21Oz0svc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730026879; c=relaxed/simple;
	bh=3quH9xYFiuttFZOs4ydoaTvF3jIBQchB3SK5V/gWpLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmnlC2U2MususTWaKfKswj58JZ7hp/Z9/J44JLne1yogVxkAMuWnBXczJLiZHCAwWpG17Kgd6tY054iboemxl/sWvSsie9JwYawLzOZNsknVpu32Xet9vUcfijajibzwfqLf+EvrYnQ9ZBDFbTKXgi6/eN5HGVXRvv4tEDhqfG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJU57+HW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJU57+HW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B25C4CEED
	for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730026878;
	bh=3quH9xYFiuttFZOs4ydoaTvF3jIBQchB3SK5V/gWpLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dJU57+HWLoo/xHKQWSyEHFA9AbQNGSOiahO8sx4O1X7IqWwg68FFL/Qi0NLXh0iY9
	 dYoKwKJBB+/6DZ0Z5ty8pfF8+IhQs8vtc+hVEYkIjH+vqLOtCKHoo7YZkocCnjlpqQ
	 y7EagpoQFVSbAdYs868A/VyTiuMz5wfIi3rfAflAghEhaxs5yca8XWE6k7xzD0kDkJ
	 izYZ31OQfIIKtN1cWX9qaOm9salyxjKEWmlxk4oOkfelZ6hPDqpPeV7e114q3pEwqh
	 UQ6x+AEQxL5arkHkM/EAQW2V4QfsKdns3ga++3+Nc0njQLGy5rwO686F+CZPNMwkhr
	 61M6Qul7zrIVQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso32072791fa.2
        for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 04:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHmB1URQGMvtcuqsmAqJCmVxb23JRWHfGUQFLO0Dv51XcQZaJeAy6hjzfjVb+Cy83poOJs@lists.linux.dev
X-Gm-Message-State: AOJu0YyyNs0qBPY8Xy3ll+/9/6lLWrwchJv1amzN3jg+iO7sKDcFgAp/
	iMXY9XCIh2M5EupktB5wZhY+8prK1D5OyvxTLkAoS/Ri1SuzUIZJ4+QU7V8XRH0CtkQTK9w04hn
	a/gZxR3ljuDK08wC2iuj79+TUis0=
X-Google-Smtp-Source: AGHT+IHUiu1/2RDrCFQjE08nvbf0pFjgub83W2LWpUswHIlLPbwuLbY8emFcknGoqBH2i1i47pTbngVhgD5dL/oCDdk=
X-Received: by 2002:a2e:be84:0:b0:2fb:4f2e:5be7 with SMTP id
 38308e7fff4ca-2fcbdfe4a77mr17515121fa.24.1730026876753; Sun, 27 Oct 2024
 04:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X> <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
 <20241022200732.GA487584@thelio-3990X> <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com>
 <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com>
 <20241023164535.GB4081497@thelio-3990X> <InqlMfqWWeNw8Mh6y1y5oNb3EotVpA26gkX70xcVxt9ygCtb7DYfTB3Amg3SzZfs78q3osSW2BIEpgyhmOjSqBW7neH0Se2sQEpmdClVV3M=@protonmail.com>
In-Reply-To: <InqlMfqWWeNw8Mh6y1y5oNb3EotVpA26gkX70xcVxt9ygCtb7DYfTB3Amg3SzZfs78q3osSW2BIEpgyhmOjSqBW7neH0Se2sQEpmdClVV3M=@protonmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 27 Oct 2024 12:00:39 +0100
X-Gmail-Original-Message-ID: <CAK7LNATswFdLRO5YWvtogV+sVJ=SOPrP9frrYq_QNzgmugg8dA@mail.gmail.com>
Message-ID: <CAK7LNATswFdLRO5YWvtogV+sVJ=SOPrP9frrYq_QNzgmugg8dA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
To: Koakuma <koachan@protonmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 4:53=E2=80=AFPM Koakuma <koachan@protonmail.com> wr=
ote:
>
> Masahiro Yamada <masahiroy@kernel.org> wrote:
> > I think this should be documented (required LLVM version and
> > the supported build command),
> > otherwise people cannot test this patch.
>
> Nathan Chancellor <nathan@kernel.org> wrote:
> > I am not sure that there is a super concise way to describe for
> > Documentation/kbuild/llvm.rst that sparc currently requires 'CC=3Dclang
> > LLVM_IAS=3D0' along with a build of clang from the main branch of
> > llvm-project to work properly.
>
> So about this, as a middle ground, would it be okay if I put
>
> ``CC=3Dclang LLVM_IAS=3D0`` (LLVM >=3D 20)

I am OK with this.

Having this info is more helpful than nothing.



> In the documentation, in a similar manner to the s390x entry?
> I know that LLVM 20 is still a couple months away but those commits will
> likely be released with that version, and since it also tells people
> to not use a version that is too old, I think it should be okay (?)
>


--=20
Best Regards
Masahiro Yamada
