Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E851CB321
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700612; cv=none; b=qbmRW7z+Fb4Bifjt+gnDHY0MFmTu8iP0NRkmi6cuGnxF74XOKzXMR/BX8e+ouU9D444ppdcp6eKPXivIcAD7DyICqz/7MoCA3wbZEfX/mk9M3LJK5QxmGl7CwHWwiun7L2ahn01YCrUwqKvYEOQnkg1NGEURtwQPjZ4qyXd/Lek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700612; c=relaxed/simple;
	bh=+F9vNJ1/djrWjsipasBD8bhmQbboSFemBhQbuVC0gTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9XEKUfYOd8bOso9mgk3wpcOXdWVnH5SAcCHvzsVk01gWutpsK6lHMi6+MXN8rlySKBTj41PcRyOogK1ZSB5++jfbpZ3m79Tdxks5oz+fOdUi4WJGgpn6/7s4NFdznj0AMSjgwUQvQsfJxywpp2dtm4rY7T/QClHBtjtVxi0ePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPVbTPTe; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPVbTPTe"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-460a8d1a9b7so276211cf.1
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729700609; x=1730305409; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9BznJlsEbHz6OZfmqFHe4r9gEp0tOVcj12rfA//KDE=;
        b=QPVbTPTeNeqGeZG5rq08BOX3ZPSPULSlD1xbbvh48E4Cw24w9VEFXilWNCjMckfPBC
         ZupT5hNuFzpmbwGlVlXWDCyrTrAGYYJNop8NfwIYGOFCRmkDo/YBd4eF5C4Q1rQKnOJa
         RMTFvRy4E7o4RvOfokcvlaQhCI1L0pF18nyM0Z7VkodzUDCUlNIrYCI4vExOg1vWJUj9
         tQ0qSunqsBzYUwbbI7peW9QMXk42187eIVaEVDRzjFPlUbqlIUuCCf+ucd+UgMAPQ+A2
         jGFdLy9+k7ZF5MrftwLTA+s0LjInBWBrQ1tRUn+Db06i0Ro5T/szcDUX0Vq5ZA7EwVX7
         dl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700609; x=1730305409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9BznJlsEbHz6OZfmqFHe4r9gEp0tOVcj12rfA//KDE=;
        b=YVrJe7y426MgEn7cCsk/lCyhht042vaOTaLuZyAEa59QnY99NXB5NP7Dv24aSucIrY
         5+5WYwZ+oXXo2hYxIUTnQeknx8/+nz3k4Qxubnfygw5gIvBa7ApNAkAsKkx6VttkfwRF
         A/hbKf+SiyEa9YNBf08rLNUd17lFmuJN++xzSzWBMrXExa8/P2D76NApMJKUdtaQBCH0
         hVu5UjsuSr/FFeynBGgI4TznGqyx1XLh/1WOFU2EcMjk3eP97yHT8qabhy3nP22unhNc
         EORomOCVsmK3s+urEJ1w/Mu3l+rhcaETjE9W2ZOtQO7ar7fWVsQQpEm0oMMV98hTvufv
         gLIA==
X-Forwarded-Encrypted: i=1; AJvYcCXDwIG186IaIQ8aisoUcoExH4j4/Qvy48Mu6EH3/iYnpMuAaM9LwaRkS4bJkcyBGmSDnqum@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3kuwMf92mu644mc2xOto9zLG0EZLkhRZFmyBQa3Wt2X/6gIco
	y1s23HZKOzPtR4GbZDQeLBnpOeiPHtnRaA5IhmK2QfjCK0iWRkxALEbjTy4s1FXWkLpVZSOxWsd
	dN34sT2+dp9A+SIjNC7DtCwi/ol40jDI1xwHU
X-Google-Smtp-Source: AGHT+IG1FMKW9jEoP384sXUW7ke85OPpn1MSvATc3a4GObiTP9bSiG7WRlmZKZlcz1ig7syTvhf9DR79c1H5TXpjIHs=
X-Received: by 2002:a05:622a:1347:b0:460:46a8:9e67 with SMTP id
 d75a77b69052e-46113afc61emr4399981cf.10.1729700608716; Wed, 23 Oct 2024
 09:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-7-xur@google.com>
 <CAK7LNARfm7HBx-wLCak1w0sfH7LML1ErWO=2sLj4ovR38RsnTA@mail.gmail.com>
 <CAF1bQ=Qi9hyKbc5H3N36W=MukT3321rZMCas0ndpRf0YszAfOA@mail.gmail.com>
 <CAK7LNAQr_EusZyy-dPcV=5o9UckStaUfXLSCQh7APbYh15NC3w@mail.gmail.com>
 <a38a883e-d887-4d79-bb52-f28f5efc99a8@app.fastmail.com> <CAK7LNATfdxBvFxhAQhAuWhVfqfFptCXvjRS2xcWmFFqYo8Qp-w@mail.gmail.com>
In-Reply-To: <CAK7LNATfdxBvFxhAQhAuWhVfqfFptCXvjRS2xcWmFFqYo8Qp-w@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 23 Oct 2024 09:23:14 -0700
Message-ID: <CAF1bQ=Rc_0xwq+7njaTf1EdsO0fyyKhcvMkC9AqcMf0mFsOt8Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] Add Propeller configuration for kernel build.
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While Propeller often works best with AutoFDO (or the instrumentation
based FDO), it's not required. One can use Propeller (or similar
post-link-optimizer, like Bolt) on plain kernel builds.

So I will remove "depends on AUTOFDO_CLANG". I will not use "imply" --
simpler is better here.

-Rong

On Wed, Oct 23, 2024 at 12:29=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Wed, Oct 23, 2024 at 4:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Wed, Oct 23, 2024, at 07:06, Masahiro Yamada wrote:
> > > On Tue, Oct 22, 2024 at 9:00=E2=80=AFAM Rong Xu <xur@google.com> wrot=
e:
> > >
> > >> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> > > +
> > >> > > +Configure the kernel with::
> > >> > > +
> > >> > > +   CONFIG_AUTOFDO_CLANG=3Dy
> > >> >
> > >> >
> > >> > This is automatically met due to "depends on AUTOFDO_CLANG".
> > >>
> > >> Agreed. But we will remove the dependency from PROPELlER_CLANG to AU=
TOFDO_CLANG.
> > >> So we will keep the part.
> > >
> > >
> > > You can replace "depends on AUTOFDO_CLANG" with
> > > "imply AUTOFDO_CLANG" if it is sensible.
> > >
> > > Up to you.
> >
> > I don't think we should ever encourage the use of 'imply'
> > because it is almost always used incorrectly.
>
> If we are able to delete the 'imply' keyword, Kconfig would be a bit clea=
ner.
>
> In most cases, it can be replaced with 'default'.
>
>
>
> --
> Best Regards
> Masahiro Yamada
