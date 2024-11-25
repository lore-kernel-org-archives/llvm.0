Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16A2C181
	for <llvm@lists.linux.dev>; Mon, 25 Nov 2024 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732548284; cv=none; b=ZAltNb5ukfEiJsYtCkeFtT5+YdHfbWOGAQ/9hiORYJFR1byM4T/TW5dj8mhHeNA+VS/olF16MHL8oSyj9Ss4ePS7rYn6Dz6A/+Un0xc3dgXyCftR62lFfT2qjIa/i6E+lyWrEPPlLDWaHquUMDO8P9xJbg3ksbaRnJDOt7jSkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732548284; c=relaxed/simple;
	bh=BJJPLGTfv5/CsQFoXlNKSyfnTmg+4UhC2eXBLka7Cu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP135efVQ3tEw7HeI/7041NUAfYlls/BOUbGdKlvywvPGQQDI5+810FXte1kRPeMvDBe4YrIPcoVhiDhyWbeSiTps4i0r+DE/b6NlFWIA2GmzN6IPqKEnjgOrDtC78UWnE8lg4ZdCJrmkveMJDO44NQJlDxN7dLpAHk9KrO5Cqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PKiMqgo1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PKiMqgo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1732548277;
	bh=BJJPLGTfv5/CsQFoXlNKSyfnTmg+4UhC2eXBLka7Cu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKiMqgo1f1qG+6fSgZXVdpiEzH+KJ47ukhgQctfSl7kZWOmsnXUNqAYD4BAsZz+xc
	 Bqg4bo3LinSXfPq+Fo3nOydfiGoDIEIgYlL6cQuXoFfVPZsC2iS9f/Oj91KICMdjo+
	 6Skw9nlnVvywfEXrxuGIGqMlrWREpWkkQ6pTkk6M=
Date: Mon, 25 Nov 2024 16:24:35 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC] kbuild: disable -Wc23-extensions from clang
Message-ID: <842506f3-6a5a-424c-90a3-ba55a4262a74@t-8ch.de>
References: <20241125-kbuild-c23-extensions-v1-1-b4263b795fc8@weissschuh.net>
 <20241125150700.GB2067874@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125150700.GB2067874@thelio-3990X>

Hi Nathan,

On 2024-11-25 08:07:00-0700, Nathan Chancellor wrote:
> On Mon, Nov 25, 2024 at 10:03:00AM +0100, Thomas Weißschuh wrote:
> > Some of the C23 extensions are also GNU extensions, which are allowed.
> > Examples are declarations after labels or function definitions with
> > omitted parameter names.
> > 
> > Also with the switch to C23 at some point in the future all those
> 
> We are likely a ways off from being able to switch to C23:
> 
> https://lore.kernel.org/10db3077-9409-446d-8e50-1a2a803db767@app.fastmail.com/

Agreed. My reasoning is more that we know today that the constructs will
not be a problem in the future as they are allowed by the future spec.
So fixing the warnings today would only be pointless busywork.

> > warnings will be resolved automatically anyways.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > I had some patches failing the CI only with clang.
> > And it feels like unnecessary busywork to fix these warnings.
> 
> A declaration after a label is a hard error with clang 17 and older, so
> I think it is entirely appropriate to continue to warn on that:
> 
> https://godbolt.org/z/sj98GMhv3

Ack, then this RFC does not really make sense.
Thanks for the pointer.

> While a function definition with omitted parameter names is always a
> warning for the versions of clang supported by the kernel, I still think
> those should be fixed for consistency sake, as I have really only seen
> these occur in stub functions, which should match the definition of the
> full function.

In stubs or callbacks which don't need all arguments.
The prototypes themselves also fairly often don't name the parameters.
So having the stubs right next to them need the names feels
inconsistent.
But any discussion is pointless anyways right now.

> 
> > ---
> >  scripts/Makefile.extrawarn | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 1d13cecc7cc7808610e635ddc03476cf92b3a8c1..0da75c9d84da4daf6936495a5ab96df75658da4f 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -31,6 +31,8 @@ KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
> >  ifdef CONFIG_CC_IS_CLANG
> >  # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
> >  KBUILD_CFLAGS += -Wno-gnu
> > +# Some allowed GNU extensions are also C23 extensions
> > +KBUILD_CFLAGS += $(call cc-disable-warning, c23-extensions)
> >  else
> >  
> >  # gcc inanely warns about local variables called 'main'
> > 
> > ---
> > base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> > change-id: 20241118-kbuild-c23-extensions-2560d140de36
> > 
> > Best regards,
> > -- 
> > Thomas Weißschuh <linux@weissschuh.net>
> > 
