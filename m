Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26851D61BB
	for <llvm@lists.linux.dev>; Sat, 22 Mar 2025 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742676507; cv=none; b=QYU3HV6vwBxbgJjQDorQWVhRJVGIyJooLPaFs/P/q8HxI3KjpswYD/UYhsft5JRrct8b5CAYKNXdvFnMy63b8VP7chNLx7rsUo8wGqpL0uCalMGvqh5ImVGEkfIlojxp3RvwJQTAfYSXbUBzR75AN+vHPAfGULI0P/S7P6XCdss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742676507; c=relaxed/simple;
	bh=ay9fevNY0hFn8/QGn3/YRuwGGPrGYObaNbTRDw64xOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfoZab+tAevKiCMt+3+MnTYYwSNbunl3tEQy550eJXzrQ98k3ZOKIzi1TTTSLr7ajaYdzoSwxN99rIzBJjyQazJd3cbHjPb9RTcLVOXHhcw/+k6kZ1YoAKmxLYZx4vxJHhBhugVYztUvQHCKx/nf5yG/UPmPDmyRk8fyq/jy25g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PNaKGScE; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PNaKGScE"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f7031ea11cso32311187b3.2
        for <llvm@lists.linux.dev>; Sat, 22 Mar 2025 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1742676505; x=1743281305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay9fevNY0hFn8/QGn3/YRuwGGPrGYObaNbTRDw64xOA=;
        b=PNaKGScEli5e0CH61m7t429hbxZF1DoW5+iiOMaOn+IP2UvITEkpcj1EPzOdF94/m/
         VxW6JM9ddPBcHRrE3QJT69eL/6GRusTQQr/w6ccr5rDbA9KFMhTfG2M7GOAS5/+nRXUZ
         dFd2DxRtApYfLe/exTPFkWBBfZZDmRmdWpi6L0GVFY4V1kV6KACa0lDKxv6GdXK86hwF
         7LoE59i7sPBYWGmN7m37S10g5pMMz8DdysWzKGuusbef4PAbEaSd0EnY15mCC3IwJOfg
         IzRQ3mBDGNV5DMoLW+JVWEC/1FZr4M4UdT9Wnkjyufn8o5IrbabciQsG+JhKLyZ7TIT0
         IaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742676505; x=1743281305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay9fevNY0hFn8/QGn3/YRuwGGPrGYObaNbTRDw64xOA=;
        b=DKXw6jEWTpAgPOggDK59z5ytM8Zo0P39sdB30jDPX/luoALma/W7sbKpvyPfLyGZLI
         unexb7tPCL9ltkGJuT7Tg7VqAXyX9W0bqjGJ2yQvrk9PEtBE8RCEAZseaPVoerUoxYa/
         8cT57lJzBVqSdHb4q2GsTnqgKeYMCw+miWKSWz1hUub6BJ88BbagTarskI5JWtP7mxPe
         Ynfw6/rs791EzfaETYkH/X1D3QL+5WGbHRDGJcCETWv1cPkMpV/liedC1H7h1pxuUDe1
         4O1zgSKOKfe8A+A7EhalHHgZUriqIFSxS7inDukeArSs5Dd8KH2BRRgiDXN5EJduYn/F
         QSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaxELIflA4unR2BJxXpEg3c3z64bc1yDJX7+WWPjbK5iaP2fy7+E21kljIJE006i5OS4l+@lists.linux.dev
X-Gm-Message-State: AOJu0YxDY8+dBAHFR4DV3xCzZtXwIIi9nXE4dHJcZq/JRSJCeF66mSfn
	eha4ZIihHwNCJ5DMSZ+cQoA81MmStKKNWv4+Tv8ZB26j0P0K0ZDkZ272gpX36oRIwTdHXJ4snOP
	gs9XNpoNuKU14lh1K8NMh+YUFLKZFoS3EUS0Z
X-Gm-Gg: ASbGnctwuP0lXoS7TUlrbXjpNRtfH2xbzLv/jbccijwZWkjRQbnxSyOMvtvbinibRu6
	tVAfRh2xOKdiSX84oS00YNZQeFYHVFJp25FhL8nG055bXIv1z0fW9rmWsTVPk7UsvoAe4kGXVP0
	78/U0N22rl7Zxe+LJzEa2KFcOsEg==
X-Google-Smtp-Source: AGHT+IGCHUgYHj8FnbhbXd2f6u0nMs1qNJ4El5oL87Cb1hpfEP0T9cT3d8s0LxRDBkc/UszGgdVndU3eZ48ic7LA2Uc=
X-Received: by 2002:a05:690c:2501:b0:6fe:c040:8eda with SMTP id
 00721157ae682-700babfd59bmr94340957b3.4.1742676504841; Sat, 22 Mar 2025
 13:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321164537.16719-1-bboscaccy@linux.microsoft.com>
 <Z97xvUul1ObkmulE@kernel.org> <CAHC9VhQ4a4Dinq+WLxM88KqJF8ruQ_rOdQx7UNrKcJqTpGGG+w@mail.gmail.com>
In-Reply-To: <CAHC9VhQ4a4Dinq+WLxM88KqJF8ruQ_rOdQx7UNrKcJqTpGGG+w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 22 Mar 2025 16:48:14 -0400
X-Gm-Features: AQ5f1JqDeHoEYBZnZnhU14MZ_ha_8yis_y2VRPgUfTr12KfbQKKoHE7FmctARms
Message-ID: <CAHC9VhSfPz4fYU-YxxQ++3OP_hqtiD=J9fJXyUHmcj8NHd1pZQ@mail.gmail.com>
Subject: Re: [RFC PATCH security-next 0/4] Introducing Hornet LSM
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jan Stancek <jstancek@redhat.com>, 
	Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	nkapron@google.com, teknoraver@meta.com, roberto.sassu@huawei.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 4:44=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Sat, Mar 22, 2025 at 1:22=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.or=
g> wrote:
> > On Fri, Mar 21, 2025 at 09:45:02AM -0700, Blaise Boscaccy wrote:
> > > This patch series introduces the Hornet LSM.
> > >
> > > Hornet takes a simple approach to light-skeleton-based eBPF signature
> >
> > Can you define "light-skeleton-based" before using the term.
> >
> > This is the first time in my life when I hear about it.
>
> I was in the same situation a few months ago when I first heard about it =
:)
>
> Blaise can surely provide a much better answer that what I'm about to
> write, but since Blaise is going to be at LSFMMBPF this coming week I
> suspect he might not have a lot of time to respond to email in the
> next few days so I thought I would do my best to try and answer :)
>
> An eBPF "light skeleton" is basically a BPF loader program and while
> I'm sure there are several uses for a light skeleton, or lskel for
> brevity, the single use case that we are interested in here, and the
> one that Hornet deals with, is the idea of using a lskel to enable
> signature verification of BPF programs as it seems to be the one way
> that has been deemed acceptable by the BPF maintainers.
>
> Once again, skipping over a lot of details, the basic idea is that you
> take your original BPF program (A), feed it into a BPF userspace tool
> to encapsulate the original program A into a BPF map and generate a
> corresponding light skeleton BPF program (B), and then finally sign
> the resulting binary containing the lskel program (B) and map
> corresponding to the original program A.

Forgive me, I mixed up my "A" and "B" above :/

> At runtime, the lskel binary
> is loaded into the kernel, and if Hornet is enabled, the signature of
> both the lskel program A and original program B is verified.

... and I did again here

> If the
> signature verification passes, lskel program A performs the necessary
> BPF CO-RE transforms on BPF program A stored in the BPF map and then
> attempts to load the original BPF program B, all from within the
> kernel, and with the map frozen to prevent tampering from userspace.

... and once more here because why not? :)

> Hopefully that helps fill in some gaps until someone more
> knowledgeable can provide a better answer and/or correct any mistakes
> in my explanation above ;)

--=20
paul-moore.com
