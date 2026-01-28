Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C242FD697
	for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599135; cv=none; b=J46egl09/Zph9cUT8ZwyAdQdTk1wkTVYdvA8r1HNJgRUY3vNCYwdl9ybd3eKe8e9XHlwcuKgH2WASJZa48vK7XzLJnxRVqwx1IfmcYtZZFudgIG9hdsqZwFtRkt/TnX8IA9VLNyBineisQ5I51dmPepo/GrdidKvU87jaPULoZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599135; c=relaxed/simple;
	bh=IIxOee7CxMRjLbZ72ZcEOp5UU8q8/q89V3BBid3bMNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VP8VGvGD4m6pEHAFc6xz7MqHa3EHJTJ7X7Ec80CF8NbLKgipfHI0Rp3QDsMwnzUFD9MeC9D7S9v8OqBjaL/V4NrG8mpgC3KfGHEQz8cR4yOIb13jYnQRhC95PmL1MSOv19Iq53el9PYTvHShw9furOo2TXj6RrhdvuekQD6NePc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ludm8oU8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ludm8oU8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A33C2BCB2
	for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769599135;
	bh=IIxOee7CxMRjLbZ72ZcEOp5UU8q8/q89V3BBid3bMNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ludm8oU89XrUlVttSR1ZUgAwj8NQQgPZ/oa8Yr4XrTInsjmyO23WbSFRN97Ech5Ea
	 x4UiifTSHqaA1CfI80KyY0Sg1Ab2folTxrIMq63QP3ClU7U74we8NlqXlYiZzCp2IA
	 yJOybXqhUD3q2/bRcS9mprshybdK3jOwsIKdyaneXaJocYaz5c20uFU/Qxs7NjNH36
	 ajshyq5PuqHJQTihyuJV/h3IziT9K5Knq5mp12hePQ/ZxK33LVEP80hD0YinPdsCvY
	 kKSrmm7trWJLiIzPik/uZcqySf7fWs0jbRC96nZtjhiCP2dBIPRoK9exEnV5MlUbyq
	 PRIzFyp6gqwsw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385c6c727fcso58339681fa.3
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 03:18:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1xVKALYQ2T2Pi5DncxSyAsGB58dB/B3rCBn5X6HekP31RIffzmT0NkJ68mgyTWMj2p6ig@lists.linux.dev
X-Gm-Message-State: AOJu0YxoVwRhZAbqQFjn63JMmn5Y9VZK6KBGxTcdIMBHZvYW3159B2jP
	cJULMDCbiG/pZJHRm6jdQv5H/0aJm3jDfP5P/whM/uh05yv2qq1K9Zwg8LWe/kyr3PycXWWIVxR
	pMe36rbUBXm5Lbg8SADRLqkrjoUuFH4k=
X-Received: by 2002:a05:651c:3249:b0:383:18fb:fdf0 with SMTP id
 38308e7fff4ca-3861c9186bemr22350011fa.22.1769599134234; Wed, 28 Jan 2026
 03:18:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org> <aXnX77aYdsyFBiU7@pathway.suse.cz>
In-Reply-To: <aXnX77aYdsyFBiU7@pathway.suse.cz>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 28 Jan 2026 06:18:17 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kmBa2grvC_+EwiZVhkkLqa2xmHRQZr+bFodt2phTkpLA@mail.gmail.com>
X-Gm-Features: AZwV_QhnwJTpFgvl1BkXNiWC0QD8vFb7fx5l-RwrJgw9pD_1NgFmKhgdGhcMUkE
Message-ID: <CAJ-ks9kmBa2grvC_+EwiZVhkkLqa2xmHRQZr+bFodt2phTkpLA@mail.gmail.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 4:33=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Wed 2026-01-21 11:10:08, Tamir Duberstein wrote:
> > This allows the compiler to check the arguments against the __printf()
> > attribute on __test(). This produces better diagnostics when incorrect
> > inputs are passed.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp=
@intel.com/
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> JFYI, the patch has been comitted into printk/linux.git,
> branch for-6.20.
>
> Best Regards,
> Petr

Thanks all!
Tamir
