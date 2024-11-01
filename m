Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70A1DEFD8
	for <llvm@lists.linux.dev>; Fri,  1 Nov 2024 22:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730498673; cv=none; b=W3gtpwe3FvxMwLM0/0zjs72+ZGW3YbUIplLQEIdqTMPhg6XsUsu07FrdYalm/h8gnQSg/gJZ/xo+Hoj7uTZpTHpAAg+iLMOD8uIbQyhWRLuMPAyLR6wCTFg9RXI/axWH2Q1NWzrDyNiQR0yJCWfazkb5bsLFG9AH/5htUOWAel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730498673; c=relaxed/simple;
	bh=rcoTiHAzGNigzhjuUOf3w29Wr+BpteeHJQCW1ztY21k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkWrBq+1Q4C1IA0tFc+tqykDs2OPPv0qFz9ZICbtCqD1H0YeyJWWt0NRdXmwod7LvIOLiiLSmUY8wM/FhIRVulndsDzjfr3y9EJK8xcpnk6NX7ztU167tFyy7gn54/xNZmIUqZwP75kna/00lS+xAMZUq4ZwqroflCNp8QJqaxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zcuv7wXS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zcuv7wXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DB9C4CED9
	for <llvm@lists.linux.dev>; Fri,  1 Nov 2024 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730498672;
	bh=rcoTiHAzGNigzhjuUOf3w29Wr+BpteeHJQCW1ztY21k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zcuv7wXSl6E/pJLqvocrlSymBS4scHtLKXTcP+fMrvmrGXVIea9jn0+QGHOGLUeAb
	 wlAl5cSK7kQC9XO8ADw2A6KRBq4llF28tgj0eOWKf0AbKSqTsAi4pGwWTWGQQ9yRCX
	 O0i1Zhd3DSnnFl7TqKgTIu5Nz14o2T20gXExsyDXPxZkN2V+iTczHy9eJ3q9Knn2bz
	 WkzDhS5SjZvKetf7D8DVj7pjXqP96hzR+TZVEnuQVe2etQrYXdwc8PxPFCvFHylNPK
	 atzuVdx0OpfYKNyGWoorkpwN1u3F27QjDoKhTeiXkNHapW3YeVKj0ysavnK+ZEDD1Y
	 Csd9H4hjVaQ8g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb49510250so25464601fa.0
        for <llvm@lists.linux.dev>; Fri, 01 Nov 2024 15:04:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/2JSGeiNytk/fYi/aNg8HtIbHp5XeMc11WHHoh+6VQuUptn8BUJWBhtLqVBKuPvrW1WyY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+nkwk7+XJCc0/hX3PN2Czps8HPKuMvoTTdc+5Ss6VMX9mXhT2
	5UhAsrBkk+S0YG1SBJr5xtZXhCIVJHlk1D49vuPOYcCNlyqIztUwY+O/zskiXeT6u6CDvXTCTQN
	8KzCLArYI0J5bTXxrPJi1bAdlkxM=
X-Google-Smtp-Source: AGHT+IGVMAgeS0V2k3gbBjmJnFp43Rbmnq4wT0SbRNO4NZeNLFW4f4vONEJ7HO2aD/gqiSPW9yN22T197mAQWhrZFyU=
X-Received: by 2002:a2e:819:0:b0:2f7:a5fe:adbe with SMTP id
 38308e7fff4ca-2fdec72f2bemr34602561fa.18.1730498670823; Fri, 01 Nov 2024
 15:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <CAK7LNAR6Ni5FZJBK_FZXWZpMZG2ppvZFCtwjx9Z=o8L1e-CyjA@mail.gmail.com> <CAF1bQ=TjpUrEgiqepyaGAiDoFM8jzozzxW=0YvTXpFY64YoTzw@mail.gmail.com>
In-Reply-To: <CAF1bQ=TjpUrEgiqepyaGAiDoFM8jzozzxW=0YvTXpFY64YoTzw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Nov 2024 07:03:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZ3Hw-OuMe39eOHR=H1BSpyaGQf4xUFW9tuOWFnEzXqw@mail.gmail.com>
Message-ID: <CAK7LNARZ3Hw-OuMe39eOHR=H1BSpyaGQf4xUFW9tuOWFnEzXqw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Rong Xu <xur@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 3:37=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Current order is:
> .text.hot, .text, .text_unlikely, .text.unknown, .text.asan
>
> The patch reorders them to:
> .text.asan, .text.unknown, .text_unlikely, .text.hot, .text
>
> The majority of the code resides in three sections: .text.hot, .text, and
>  .text.unlikely, with .text.unknown containing a negligible amount.
> .text.asan is only generated in ASAN builds.
>
> Our primary goal is to group code segments based on their execution
> frequency (hotness).
>
> First, we want to place .text.hot adjacent to .text. Since we cannot put
> .text.hot after .text (Due to constraints with -ffunction-sections,
> placing .text.hot after .text is problematic), we need to put
> .text.hot before .text.
>
> Then it comes to .text.unlikely, we cannot put it after .text
> (same -ffunction-sections issue) . Therefore, we'll position .text.unlike=
ly
> before .text.hot.
>
> .text.unknown and .tex.asan follow the same logic.
>
> This revised ordering effectively reverses the original arrangement (for
> .text.unlikely, .text.unknown, and .tex.asan), maintaining a similar leve=
l of
> affinity between sections.
>
> I hope this explains the reason for the new ordering.


Make sense.

Please describe the above in the commit description.

Then, it will be clearer why you not only moved up fixed patterns
but also reversed the order.







--=20
Best Regards
Masahiro Yamada
