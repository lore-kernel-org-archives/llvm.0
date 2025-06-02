Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041C221729
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872526; cv=none; b=C7Xnz6d2DptEru91zrLinu7ppUDl1wkoUAUS4lZAcNnjnaq0oeeC6iTF6/wcofRfAW8FqhdC4T3F5W6BQ2OwieWtBJ35kdQy+q4rSFxGRioNOEKbDIQxw9Plmd1mdQRqwa6O1zPT/QIPjTrtsuMfkKJOgmc1RJjLDwUmk3YScHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872526; c=relaxed/simple;
	bh=CE13FvVd/oZWld/RcBibj9PFe0iI8IjGbKlr0iRzhJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeG/ffpwN/aiMw+4y1Wmr7PdhuMYScSE47WoIA/1vfWQmf4oQ23/sVxlgLSqZ0jPSgp2xHFDlTmAdj118NPHX47x0f1heyRWo6InbMneuuXsQ+ArW+7ii7lE9sXd20cQ6DgqCRcTGkhcKELcYBMESqHpFtNJcOxxIiD/L6D7ij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWes363z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWes363z"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30f30200b51so43862681fa.3
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748872523; x=1749477323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE13FvVd/oZWld/RcBibj9PFe0iI8IjGbKlr0iRzhJk=;
        b=eWes363zBcpIkwYlpj0HJOG5qeksbCnny73CaormjOWC/0IOS0KWP3G8tpOHOpeuec
         k4s76Dhv6iRbKdIaK1ZXgLIIHfk5+T1oftbj5dN6m80U0CrIsIP/4fC82I5fPYyWWLYS
         zPF/eahIyzR0xse4xRXwWuUl70sztDRYJGfTjnsbzTIpYlgQZS1G+XFX9xfBCd8VExe0
         Z83gOmBFHKlAizkIGE6hM0NPBqQEjxsTijkrmyX5QMRc6xX3yNpsR8j6Z26SFPBMeylz
         zHHJtlRjLok0k08lUv7Rx9mip575ytygNHue9+SW8P5vw+HBswDVGV2zyu9w72585DGI
         01mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872523; x=1749477323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE13FvVd/oZWld/RcBibj9PFe0iI8IjGbKlr0iRzhJk=;
        b=bwx7TWzPbHLEdT73CffgcvcEUcUPjhwq1M8ZP2HxXTxGQj9xwN35RhKiJw8mCXG5U4
         Ahht+ftdyotvqjUTU0y1YMEVZcsx5wFBvtAAnsox/xbCYMW5ds4dSxvye1pkdrRQor3N
         v+6yBoaHrE4x1oIz7RWVHJGqk2NJ8NFM2gnpf1S+dKe79fULujZ3K4Zb98NfKndRdITE
         OClWvb2zkjaVZ+lHf2Hf0edwVH/m/OnePEi0L7LD7RI4jfb/P7u1VpYF7Y14JWCM/9W2
         /gWHNSM5sua5s1Gb8RcSKxRmHN1WuyHtDD0KEgADy3LUoAKxfXbaUXOrKNxPPRiLoQSV
         x9CA==
X-Forwarded-Encrypted: i=1; AJvYcCX0ckCIF2Dg5/1aF4tPfB9PTbBtaI3Vuu014DRtCNPOUTV8X1o1kkdfDQIG8xfkOFh3m4EE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1ViX/qCCZyHIqVENpJda9vi0E3tDdpCYaKoLf1Xp+9mdZdc56
	Kp6P6EZZBHI9Bpp/71SgtC4MgqX/xRMmYTY7GbcpbIfpun32JCK8d9OWieqHkhD3ifA75E2Ytqy
	q7Xhw1IpmawtA2jnfIlyqdu8fpwM1xSM=
X-Gm-Gg: ASbGncuwvEEzbEmSISFj6WBd91uUpvMxQjqsdbykeba6KdJWj9KkAcYjGQig4B3mC9W
	YKB/aEI1o+4/IcBtKOzfnraeUj8ELBPkZRASp0Qx4mFa/Lo69FFUaMGKylJn9/C8ZZxkC/uXJTg
	EEDNJgH9BEP5zgCV7m4jehgUE2EQSgWvRcrncry4VKsznwvRf/
X-Google-Smtp-Source: AGHT+IHz2uBVrN38mqcMJz16ScrK52REQ3KL0NzpCYQfCXahCS+RixLkxRyOA9nPkDFUugfUGTPzmT74dbDRz5uF7Uw=
X-Received: by 2002:a05:651c:2223:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-32a9e99cea5mr28582111fa.1.1748872522258; Mon, 02 Jun 2025
 06:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
 <20250530-cstr-core-v11-4-cd9c0cbcb902@gmail.com> <aD1knOuEFxv6VQy1@google.com>
In-Reply-To: <aD1knOuEFxv6VQy1@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 2 Jun 2025 09:54:46 -0400
X-Gm-Features: AX0GCFttP_CQMaSyNKDR25_XJh3x3vRlTYDuJ8CXsXgGcEC-sRFuWZHUykb5COc
Message-ID: <CAJ-ks9mmkpvgbQs+EjPeN5N+TwOHKB2-9NV-FauGnymmxhxUrA@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 4:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Fri, May 30, 2025 at 08:27:45AM -0400, Tamir Duberstein wrote:
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible and rename
> > `kernel::c_str!` to `str_to_cstr!` to clarify its intended use.
> >
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> > -/// Creates a new [`CStr`] from a string literal.
> > +/// Creates a static C string wrapper at compile time.
>
> A C string *wrapper*? What do you mean? I would drop the word "wrapper"
> here.

Yeah, I don't remember where this wording came from. I'll change it to
be mostly the same as it was: "Creates a new [`CStr`] at compile
time.".
