Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41AD1FF5F8
	for <llvm@lists.linux.dev>; Tue, 29 Oct 2024 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181097; cv=none; b=MC0JwSPx19HBrvTzvXWFYyoDGgqQYpOW+iRpKxSomSbsmnW7n+XlQoP9p3Rok+jtziKAlVuXC6+eCf60h6byhb+B7zBPlEw+76iamYSYYCruiwWk5VN2BcMwFf6QsqOVUjnPUPHn2NYi4l6KDhziqRCBIJ26ZvSKmv0Uq5KbvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181097; c=relaxed/simple;
	bh=rkJGzaJiGDNyDHmrzD6Ukn0kvrLRqUNFw7rsJbF66DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7+hQ3080whenZEWLNDTHsIfXR+LRVx0aEMYc+aDmJRKD0vxSbZEvK6elTygEW5DrvOxMuW9uRRxfOSH0U9XX7XFxKkq9aYPJdL5L2pzJ9izk7SxJ+Z1Va6O3HPgi4XfFodd+DPOIscvk/vpKO3ZVKd7BIZjh5lPl3khL/GVM10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xqzdLMuG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xqzdLMuG"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460969c49f2so146881cf.0
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730181095; x=1730785895; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS+AWBnCO/J18Xc6TcuxqR5XEdAGr/Rpio3YV4nA0AE=;
        b=xqzdLMuGkf2HZH/WDYl+RXKgaW1PDWKt95+cZ6UYw4yfvR4KENwPNdRzkBmjDY5SrO
         cyi/7LjniF7Q3AdbR4QDizMsvv6PzWfZ62Aj9H8Fzt2pOQd1yIEM95a0aheHOGAKCkRk
         Xlo2D1vegpEHB1G29Y7+nmZi2qFsCfITuN/ykcTxuzw7gHxd8WXv2789dDxUEawBWUAA
         K/7cEn0Ahualgl4DDOl0s+TD1TAYxdlSaW5piTYm69EwZZMm9EbGY+LeFp1BguwS90Px
         onr0VodTRqh8NVqmrxYjmqdh7A9snj49gvqgmwK9whg9IZBzgK6jh36DBeFuIsXSCovo
         ij+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730181095; x=1730785895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS+AWBnCO/J18Xc6TcuxqR5XEdAGr/Rpio3YV4nA0AE=;
        b=Z615M/Ybww8jalmmPlec9D7UqUrwJvwGpoO+VJYcDxx0LCCSM7TkI5cvrpfCQyu5xt
         ZORbCc7iuGK3om9stDp+VTD4MrY5ZHRp/Nvk+Ewj0OGXSJ7oX5+dSwBA/VgBCyTFf7SK
         VwYGdLaFNsVtVR3xPseov9bAdVk9TTcwLBCI7iPIrprsQ0CfGeX7rX9IAYwBWUqCeKPS
         c3NgzFzqaZM+NTa8vDTyxg1ahKe7aIz1xRsUEC/TJeCcN0WkLkHNL2Y8U+ELe8+vv/6e
         7gKqymXTac/ws6dxEsAZfpaf1fMZ+3k44+4N96Glm/J4bhXJ8HwkdaKCiYk2W7/UL1ho
         4vBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXhwNs9w0i4WoAkGh0xbXMjIGuhKWy8y2OiFnhTda3lQtnWqFKr2e128KGF49ArVC6xAWU@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxj+ghy5UxYJxhJbgOoT43XK+t+9u4NLwYA71Rj5mqqLzYtxZh
	2UbrLmcC5MK6s6u+DTTg/Txsw7gAuxXwoom59Z6zNjc6KvKW/V9ZYyzPAMCtbXDBWagf/Qsw7UX
	FImAvFeSU4cTvziEx4SQuLZZv+0qjaToxssAk
X-Gm-Gg: ASbGnctA9VrXdzMBcexBJW1xjeOHECHvA+TxK8Teboor86oJ3t1O5omdq8+/KXDJ+DL
	blEm91kzZEomkV+b6uDf+vmTP3CduEgPrLd/U19BzoXjtqhWFo0TA5RpOxHI=
X-Google-Smtp-Source: AGHT+IEVAXdFG3fNtFOsbcJBNRZwq6dZ7NPHf4Fl17QtrnIba/Ad0eOq8gq9bIFuScwN6QgnbyAorRomVIE9wKpqH3w=
X-Received: by 2002:a05:622a:38b:b0:45f:6f3:5671 with SMTP id
 d75a77b69052e-46164fa2de0mr2424301cf.20.1730181094473; Mon, 28 Oct 2024
 22:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-3-xur@google.com>
 <202410281716.0C8F383@keescook> <0605fa9c-0e48-48ec-b04d-c2ef1c48fdd9@zytor.com>
In-Reply-To: <0605fa9c-0e48-48ec-b04d-c2ef1c48fdd9@zytor.com>
From: Rong Xu <xur@google.com>
Date: Mon, 28 Oct 2024 22:51:21 -0700
Message-ID: <CAF1bQ=QDQ+ACsH2CchnRk2LDRpN_WYjJOAjr9FDspxiar+YbrQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] objtool: Fix unreachable instruction warnings for
 weak functions
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
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

I think the objtool works on individual object files (or vmlinux.o).
The -Wl,--gc-sections flag, on the other hand, is a linker flag that
acts on the final link -- it's applied after objtool invocations.
Therefore, even with -Wl,--gc-sections, we'll still encounter those
spurious warnings from objtool.

-Rong

On Mon, Oct 28, 2024 at 5:19=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 10/28/24 17:16, Kees Cook wrote:
> > On Fri, Oct 25, 2024 at 10:14:04PM -0700, Rong Xu wrote:
> >> In the presence of both weak and strong function definitions, the
> >> linker drops the weak symbol in favor of a strong symbol, but
> >> leaves the code in place. Code in ignore_unreachable_insn() has
> >> some heuristics to suppress the warning, but it does not work when
> >> -ffunction-sections is enabled.
> >>
> >> Suppose function foo has both strong and weak definitions.
> >> Case 1: The strong definition has an annotated section name,
> >> like .init.text. Only the weak definition will be placed into
> >> .text.foo. But since the section has no symbols, there will be no
> >> "hole" in the section.
> >>
> >> Case 2: Both sections are without an annotated section name.
> >> Both will be placed into .text.foo section, but there will be only one
> >> symbol (the strong one). If the weak code is before the strong code,
> >> there is no "hole" as it fails to find the right-most symbol before
> >> the offset.
> >>
> >> The fix is to use the first node to compute the hole if hole.sym
> >> is empty. If there is no symbol in the section, the first node
> >> will be NULL, in which case, -1 is returned to skip the whole
> >> section.
> >>
> >> Co-developed-by: Han Shen <shenhan@google.com>
> >> Signed-off-by: Han Shen <shenhan@google.com>
> >
> > This seems logically correct to me, but I'd love to see review from Jos=
h
> > and/or Peter Z on this change too.
> >
> > Reviewed-by: Kees Cook <kees@kernel.org>
> >
>
> Does this happen even with -Wl,--gc-sections?
>
>         -hpa
>
