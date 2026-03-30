Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F153374726
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886125; cv=pass; b=U93Qj64344nJebXc4wZV6EC57HOPWKFWV1NZLu/oBbDllsc151Ww/kMJ1stqgbXguPDDUpbk8Pzq72dV7SOEsk1fGeq4bex8x74F6hBjJZ6ZGuTU5+0NklxT3fIwLFPTkTDvk/1ljgJPa8IQawbpgIZ8u7I0azKo5FufpnlLK1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886125; c=relaxed/simple;
	bh=cT6dqlvV69ID7t+rQgE2fUq0TEMPLu0Zl80wvl2d13k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8TT+TRJ0kE4wOT6bG7dkUepgik0CwVKbzkDi7FeUWJQEOnPJZAFKIWOTaR2pymM0ATVYz1KlAnjy8zKAo288314kOQjBEDr23csjIqUNkaCD6Zb7MdYNq/VRxcqbHox5M8Tcg7EE11Nl0wJUaIW4w5REEh2xiBZoei6c8JLBDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWTRf3qY; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWTRf3qY"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1270fc2bdf2so18479c88.0
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 08:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774886123; cv=none;
        d=google.com; s=arc-20240605;
        b=cp6e1ZKWFnaIqBW77zAbriVC9ydJuWqxgmrP6z97wJF4I51sW4lMGN8ntpjOgvliDa
         2CbaghtBMNAvUYc8ZUEhhRR/pG820WOPw+nViibSZgtN1R7MTLiEL63s783DJ5Upl8rf
         NF0Dc+Qb03FtV4o4DbkZU2zkl7lfw9rP5J4VHojyQCz9gvo1KSRP3OrwqOIRF99tgfJG
         r6DMf2ywJEK0bAmdHlZuzHvWpKjvAI+F2j7ocC8GIK8bhdbSDSD1wzm/uqYCQX7fuP+m
         DtGrSdn8nCVH85NN3YkIOnc6T5omZr1UBiLhsL0tdBf7lYpkD/LNZNRDLSr+S009AXPN
         Q/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rrHZbUOiZztpEBTZHQn3wQUAlYRvZYJdyMGu8dQ/mbk=;
        fh=zHkiBOq7JKjRMaaJp0TpSd7KRUfbfATBKgmELlagUrk=;
        b=HtFuoxMrHy6xPJOM0rug1gn9SRck6r3KW7YGcrifDDud7SkTdImxFWqdzTs+Eo6gMc
         mkDgbf1RSLnXhHst3PpeWH4JTnyKR1/kXKG1b7Wg2MBgJYLzuz18XNyQ5mYiGyoNM1Eu
         GsPgVSPF5tTYcM0YJVmw0bKe29aTMufhKL48izfc2I7GDZkN2iHzLlEPJSlPx53VDIK6
         Slk8lLBLB6UYvJyaOTnwogQ7M9eUR/cCCP+yhGLLsAvLL7PR1KSqZE5XsemHWFAlOJnQ
         A1GeK6v4VjnE8cdQJDlz+aibDZhiKqQ1CHoRP+PsHoCmx0vv0IijTfnuyG5UizNEGvQ1
         CdZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774886123; x=1775490923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrHZbUOiZztpEBTZHQn3wQUAlYRvZYJdyMGu8dQ/mbk=;
        b=eWTRf3qYME3giVKOl1liRIq8yVN2pN6N23lQ1rsiRvSYzpvSml0/YTF2JrehFr5RgH
         zBLPiHhb2cxfkd/bPQA+SiFAKRvbko1iU8LGZ2cTsOiKH9tW39eqO76g4luqUqTCzcRY
         XPLfBckusZ/SBuQTX5wVfIZhQDprG2nq+2PMXtZ+aSNmUUuGD2VDYzzfgS1ZsFMB5opX
         TNLxLLfrB8z8KsHt8Iy32BTRVsP9zJmeWdiOwPiK0Hn8z3CHPr9ND/c0GoKkJWL8vYTQ
         u2RtewSsyNJSNBwWeXpAPIVLAWpDPch3GPZoAsSZJf14DziXr4YCAjq2j8xcoVJBIhR7
         41Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886123; x=1775490923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrHZbUOiZztpEBTZHQn3wQUAlYRvZYJdyMGu8dQ/mbk=;
        b=LBRirm02PIPd4nckF622G8sESffF0XsQ2Lhqo+nwk/CgqYlCi/jo+xcBAEY83qz3ZF
         NUCD+g20CZEdcTCl1IEUkJ9x5qsBaYgi14wlSw9DpsiaU0dl5aYqEn4/xhEYLBQ3Gi1b
         BS1Cl7PjeIlgQUzESz0MqTGYvi84JAComtP1CU0uASHCbInHr5EAARukXxbrps1DsDf3
         hc6RAU+aS7fnqyX8/PfXYeQ/pkyhKffk1jnr+Vd55aYl37C4/nQSIjDvbRHTwvzVVaco
         37Q89wnMhlduBt46Fa9liJa06spnxsP+tnF5HtR1pfpA0sY1WLeDbkTiOxghLvRX0uqu
         Sqsg==
X-Forwarded-Encrypted: i=1; AJvYcCWvrv5OdQfSqYQT9WEm385AsOBAXmIAwynMcA/kmEUASv+bktXTxUPNNh8JYhDHQMyliX2t@lists.linux.dev
X-Gm-Message-State: AOJu0YzjB9Wwz3KOk9WhGRUK6tldfOBpKGqprRWytr8/hJcF3YAralDk
	h7awd9LUDOOl39Gvbh4Sx+YoA4cyEqnPEj8TiHpdr3c2RZgOdxIzVB6165ZZ57AQy9UMq/GHmuu
	8/Mxb8C9rprdOHJ6e5ydp57tYQ6lOzZqZwz4AHgVE
X-Gm-Gg: ATEYQzwC/LsDu0WEsg/A9Nnf6np6j9h2fO3/BQE4KPvJh/MdaHWZ7ZJDlZaYoM7hXvj
	UPzcmLL3k0PXdcK7y4l+OV6OySyPLaVZ9RLl3v05NFWARAYUq6m48JoLJEzsndBxXi3Ow6o7ZMC
	ElpxJLgQ+UTYxivYKfVgnLc19ivj3Mf20J8mSYnluAbfcXV+CTB7FuFlmZsrQRGtll0MNxrVHPM
	Cet7p8bcTU8KCH+3mxvqJpgX6gTJ/wYx3FmHONcCq0gNnRBX7Q9HMY41mbJ2hT+H8/NDPcC7i8d
	gFt0B5ho
X-Received: by 2002:a05:7022:693:b0:124:a780:cd42 with SMTP id
 a92af1059eb24-12ab9d26076mr223463c88.11.1774886122395; Mon, 30 Mar 2026
 08:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com> <20260328011927.3569802-4-xur@google.com>
 <acmF7nvIh2nX5hjK@levanger> <20260330100119.GA1953970@ax162>
In-Reply-To: <20260330100119.GA1953970@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 30 Mar 2026 08:55:11 -0700
X-Gm-Features: AQROBzDUFjGXD5q1g8LEAWqYZen0RbCWLrRtXQQqURk85AMCXI5LfCGwZ0d5oM4
Message-ID: <CAF1bQ=Q7BN-ymcgWbWeXnwp_7nB4As9ygwmG_UyW+dRr7NL=VQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 op

On Mon, Mar 30, 2026 at 3:01=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sun, Mar 29, 2026 at 10:05:02PM +0200, Nicolas Schier wrote:
> > On Sat, Mar 28, 2026 at 01:19:27AM +0000, xur@google.com wrote:
> > > diff --git a/Makefile b/Makefile
> > > index 69ccf9b8507d..d474b6f0f212 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1047,11 +1047,11 @@ export CC_FLAGS_SCS
> > >  endif
> > >
> > >  ifdef CONFIG_LTO_CLANG
> > > -ifdef CONFIG_LTO_CLANG_THIN
> > > +ifdef CONFIG_LTO_CLANG_FULL
> > > +CC_FLAGS_LTO       :=3D -flto
> > > +else
> > >  CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> > >  KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility =
-mllvm -always-rename-promoted-locals=3Dfalse)
> > > -else
> > > -CC_FLAGS_LTO       :=3D -flto
> > >  endif
> > >  CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> > >
> >
> > This hunk is just reordering but does not change any functionality,
> > right?
>
> It does, as CONFIG_LTO_CLANG_THIN and CONFIG_LTO_CLANG_THIN_DIST are two
> distinct options. That said, this hunk still does not look right based
> on Yonghong's comment?
>
>   https://lore.kernel.org/044bebc0-d996-4be3-9330-a64195c19a84@linux.dev/
>
> Rong, have you tested this with a recent version of LLVM? Or has support
> for this flag been added to the distributed mode since Yonghong's
> comment?

I did not know the Yonghong's recent change is not compatible with
distributed mode.
I meanted to enable that in distributed mode. But after reading
Yonghong's patch in llvm, I should have disabled
the -always-rename-promoted-locals=3Dfalse option.

I lightly tested my patch, but not with the llvm23 compiler. So
ld-option was filled out this option.

I can submit another version to fix this.

>
> > Nathan, Piotr: your tags got dropped from v6 to v7.  Do you want to
> > renew them?
>
> Yes, once the above is sorted out.
>
> Cheers,
> Nathan
