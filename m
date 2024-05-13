Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454E182B9
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617905; cv=none; b=Uh6ROicIrNb0eAb9gd+I6NTBO2opAjFjMG8VgMWpI6bljg13PZY4iBp+NbKXFDnO/LmqTqGRurDu0oZHJwwD/Qb/UKpu2aXeTCmpw9SzjSs8916OmT3Ye+xb4l7YEiGjD5gFpK++zqmQVycW1Gz9mI0TPG0mljTGNHs9Bgi9Xdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617905; c=relaxed/simple;
	bh=311dwzltPk5fOF2CTRb5l8iHO2TC3E82uom3/fmI05o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvTHqZyvQnOp8NAwT5ec+251i2lTnuQZABRbQK7DG8KVdEZgjPMuFZEBEyl1VsUXDjQvRlcHy3MOu8mlNZZ0dCNf5/4B3Yd5H8gbgiMFS05iV//yEfCt7ZBU/ojAYih0w00OmYHrI6y5VNJDdlaCz3blY3BlOY8BmVaElM3plwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCqJguPJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCqJguPJ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e576057c56so24956141fa.3
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715617902; x=1716222702; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUFnT8yyTapCAsA+F1D1wSnTUO1k2FcynX/QhnqWbRY=;
        b=FCqJguPJxIovmOxod4Xj2uQSo4DmyffhRoeE/5Vq25QXlSDSwkJPqVJbBjr4B0kVSy
         Jj5vJGALfp1iC5Q0tc6vV932j3dfEWGc7dl9SRETY3OBl6PMFD3pWEeMNxgYxIxp5Q6G
         irFcJxdykrdIuwiXIYHTbJ8nPAPAHjibP4bjzYlusL/LPrRkzcmaWwBToAzmRPPumSwF
         0SHvo4J6A4eN9AISnswcXpFjyUO8ANhmuYfRyW5S2fNHoz+NP5snYcW4LipobtxSxAUk
         MwTt+giQTuNNJWljow2B7ld0LrbRJdi1CY8+GFecNEFB7QGINXJd1zSWEatsVOJTw2Bp
         PpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715617902; x=1716222702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUFnT8yyTapCAsA+F1D1wSnTUO1k2FcynX/QhnqWbRY=;
        b=svLRGgoPJ8gsJNNShbLOPZN6UKXw1b7JHDOKNa5HpicwGIB3QjI6I4JUWS1ZJ0GeY7
         nFerjKWMMag/h2CSqBKG7Af9r2hwkoIn/qirm3bLkfHOy+dlzQ44tKGlVP6jwUturJ1z
         DMNIJc/bg1FwLHnhHkDe+aufinFwQEdc8QpD7IgSUZCTGR0YZCCf4NJEsgxJFPSPgUAC
         RUdcUxBi7NV5A3e9Q+4jlloRHm4z5hkn/fLG1e8e8w+9RdNBVdStXBgikFOunSngJl90
         QDYyHL3t8CcfX9o5XhkkTbuu0GGylX/ydZOeSpzVWBALI5/XJ47w8T0boApw9ukp0+Gl
         KhOw==
X-Forwarded-Encrypted: i=1; AJvYcCV180JcKP0sfu0hl4fXb/Uq0BKAfDm7kaCLi7H5UHe8pUe21t3kWIfNc22+lUzogV8SQwu+VPehQ1kstBa8CdS9GOigkg==
X-Gm-Message-State: AOJu0Yzf/pbz5VkFhyzzXyBnWcH2Q7+VulsYG/MWDOxCTBDrTlPjQfFR
	mzolWhZrmXbSijaYt9FHoNe+9Bgd70bjbMNIjC1Xpoj0QWCKl0iqOgl/HkclWc+HiZvMFDSLZEe
	fKxil6PIuOkhj1vWd9+0jsv5rGbE=
X-Google-Smtp-Source: AGHT+IEfQfbks6Pb9MhqjUGNG1bzcGu+P0BjYxxyNbUBodsFQi2U8Ir6ig2hVVlBqpKtOgABUOUtPTVs2/IAcJEAvxQ=
X-Received: by 2002:a2e:a7d6:0:b0:2db:a7c7:5d11 with SMTP id
 38308e7fff4ca-2e52039e290mr67635451fa.47.1715617901807; Mon, 13 May 2024
 09:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AS8PR02MB7237ECD397BDB7F529ADC7468BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <202405122008.8A333C2@keescook>
In-Reply-To: <202405122008.8A333C2@keescook>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 13 May 2024 12:31:29 -0400
Message-ID: <CABBYNZJcg5SpO_pew6ZwN98n1sR7kNZs6VtkFToyOs9NM1bO8Q@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_core: Prefer struct_size over open coded arithmetic
To: Kees Cook <keescook@chromium.org>
Cc: Erick Archer <erick.archer@outlook.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Sun, May 12, 2024 at 11:08=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Sun, May 12, 2024 at 04:17:06PM +0200, Erick Archer wrote:
> > This is an effort to get rid of all multiplications from allocation
> > functions in order to prevent integer overflows [1][2].
> >
> > As the "dl" variable is a pointer to "struct hci_dev_list_req" and this
> > structure ends in a flexible array:
> >
> > struct hci_dev_list_req {
> >       [...]
> >       struct hci_dev_req dev_req[];   /* hci_dev_req structures */
> > };
> >
> > the preferred way in the kernel is to use the struct_size() helper to
> > do the arithmetic instead of the calculation "size + count * size" in
> > the kzalloc() and copy_to_user() functions.
> >
> > At the same time, prepare for the coming implementation by GCC and Clan=
g
> > of the __counted_by attribute. Flexible array members annotated with
> > __counted_by can have their accesses bounds-checked at run-time via
> > CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> > strcpy/memcpy-family functions).
> >
> > In this case, it is important to note that the logic needs a little
> > refactoring to ensure that the "dev_num" member is initialized before
> > the first access to the flex array. Specifically, add the assignment
> > before the list_for_each_entry() loop.
> >
> > Also remove the "size" variable as it is no longer needed and refactor
> > the list_for_each_entry() loop to use dr[n] instead of (dr + n).

Have the change above split on its own patch.

> > This way, the code is more readable, idiomatic and safer.
> >
> > This code was detected with the help of Coccinelle, and audited and
> > modified manually.
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#op=
en-coded-arithmetic-in-allocator-arguments [1]
> > Link: https://github.com/KSPP/linux/issues/160 [2]
> >
> > Signed-off-by: Erick Archer <erick.archer@outlook.com>
>
> Looks right to me. Thanks!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook



--=20
Luiz Augusto von Dentz
