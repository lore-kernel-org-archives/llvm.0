Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949B205E0F
	for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358729; cv=none; b=rj5SAItm4oo0VCfgLMjoDHsThvHME0J87+o55Y9DavCGcHpzAXq7Bcy0DjuSABUhXIelHVuUtrVdH9n2yPkdseiGR3bFDnK4TW5UwbmjyWBes+3/3znTTyFC0ZvY76h7UfeysRPcZRSNul8jZNRsyXX7NdYtgVFgnJ6kw/Ql+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358729; c=relaxed/simple;
	bh=PxrPr/Krj1U8XTgIJLipME3FysDYl/LFJ6QaZJvD214=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCpP4Qfkxs6VkR22oVFWYHSBqX2iTFo3lQ4h0Kv65f1IwvdmuhM1PkUFvCwd0JSE57HnlnqaoMET0KCc0iLxNJ1Pce5+3K57DoSPT/T5XnOQjRfd1MtpJwDWdwBVvFpKi3+BOJBEtvzOAjdfGbhbFJTS3yTQGG2ZjWisRWVEcec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=a7IG908o; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a7IG908o"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6efea3c9e6eso29088617b3.0
        for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 06:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1734358727; x=1734963527; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B6xbMJ3heJG4U9cdD+cnJPtEtdixFqaU+BhqzcXQco=;
        b=a7IG908okaJdprF5KbJjbJ6Us295iKKjhJ+Zj1PSXSgHPNR66LGYkxBWGTaXD4dWuI
         xsUTXRjk22K8QLRyMyZqwR4/dSSCa7UKV5j1LffrEtNTkrRB4ZdasHpj8Yo8cHIXGzhe
         i9j/+rJrZhFQHGNXWEK8/b2UCMgLeELUbjlYFuHOJPHcopt9lqNidIMSwtQEHbeGimRC
         tT1tr8aXCHCtaeNnX/1NAEivpG4g6l/pquz961epDI7X5ubhOT+VibIo66V8hDBbgwK7
         mvsy6X2SqG6S5NoxCpDCxkFQp07muV5z/K7Byl9Lc4XXyAiSE6DsmOu1UYEp96R8aYO1
         FnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358727; x=1734963527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B6xbMJ3heJG4U9cdD+cnJPtEtdixFqaU+BhqzcXQco=;
        b=xRA/DPbB9AIbofp/NSCChT2xMXW9vyfUkJEjuZaEBIE4SExWUHa64RS/IYyDh9a36m
         lViJmpPY3jhY27tfqdWFJJKNRdhAzVq67uxPczhf9G9UohrXPuywzviGukUqsrZQ785W
         dPKhdg1zZh3oKfr/7KAkuN5w2HwCod/PGRQXjYK4PmLKY3RL4+DzVZhX5jDf9jDanpSE
         +8GgsmORxwn5ZM+jycwKjUUL6RjDmuFKpNKQiZLq5S0vkmAHEhPhJEfL5meuYDDtxq1c
         iFv1W90QeTb/d1pMeNuYtovakE1oT28o8vQy7GRIx86O0eyVKGkrBjyrkOO8fNxG8s9z
         8mYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkrJf38JsFlCBmSj1qV3tJPYVZVoxgAzr0nLY8qwFXLU2WKFmsdK6i8pLWgUG38D18nMSG@lists.linux.dev
X-Gm-Message-State: AOJu0YzteWfXPzQXF8LI/FalEvLdxsj02hgRcekBRuQJCiNu/kfoU7gV
	BQjKLKXyR2uJmNYKt3Bp0ZWjfSlzC0ntQxPJuIZq5F5Mc64w0esA+g5a3y9LTAMsQqiKHOglWuP
	qmaZ6ozkOQyuRRnFJT3jM+un7CRw=
X-Gm-Gg: ASbGncvCaWOGzsAINQaRbxizZEAxRKoiXjImtPA2EqKTIjTAtweqGV/z3hxk3uKUlaG
	m3+4vlDa/4tn2JYqPlRNKAVT8WzywavZnIzBH
X-Google-Smtp-Source: AGHT+IE7O106teXGJgMuGx92iD9nbQNfIz/hXI//hj3qWeavajLtySdJCUp1biONYIUYbr8j2P9w55vT0Z/+jp/sZZo=
X-Received: by 2002:a05:690c:6113:b0:6ef:a5bf:510b with SMTP id
 00721157ae682-6f279ad838bmr109461637b3.1.1734358726938; Mon, 16 Dec 2024
 06:18:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125110646.50799-1-cgoettsche@seltendoof.de>
 <e43da8418fc54a5eba7cdbb594b24bb9@paul-moore.com> <f7bfbf89d2ac4b929637bbb25f749c96@AcuMS.aculab.com>
 <CAHk-=wgraNfcOCZ4n_C+ircQkD_AhsPM-=z7snt+eLgE-6otkg@mail.gmail.com> <CAHC9VhSDfn5QgQsF9qq6-k67bQB_M6UZoLODDYs4qkwHcr4-gw@mail.gmail.com>
In-Reply-To: <CAHC9VhSDfn5QgQsF9qq6-k67bQB_M6UZoLODDYs4qkwHcr4-gw@mail.gmail.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Mon, 16 Dec 2024 15:18:36 +0100
Message-ID: <CAJ2a_DdBTwiu5cXzL+eojJzjTCT6CWSKASXiUYRXZSDKqztyXA@mail.gmail.com>
Subject: Re: [PATCH] selinux: use native iterator types
To: Paul Moore <paul@paul-moore.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@aculab.com>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 14 Dec 2024 at 23:48, Paul Moore <paul@paul-moore.com> wrote:
>
> On Sat, Dec 14, 2024 at 4:10=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Sat, 14 Dec 2024 at 13:08, David Laight <David.Laight@aculab.com> wr=
ote:
> > >
> > > Isn't this an example of why -Wsign-compare is entirely stupid and is=
n't enabled
> > > in the normal kernel build?
> >
> > Yes. Please don't try to "fix" the warnings pointed out by that
> > completely broken warning.
> >
> > I don't understand why some people seem to think "more warnings good".
> >
> > -Wsign-compare is actively detrimental, and causes people to write
> > worse code (and often causes mindless type conversions that then
> > result in actual real bugs).

I somehow like compiler warnings since for me they offload some trains
of thought and let me concentrate more an the overall code structure.
Also while not building the kernel with this warning, I like to enable
it in the language server in my editor.
And sometimes a warning can point at a real issue, see a65d9d1d893b
("ima: uncover hidden variable in ima_match_rules()").

> I'm not going to argue the usefulness of '-Wsign-compare' in a general
> sense, but I will say that in my opinion the changes proposed by
> Christian in this patch are correct and an improvement which is why I
> merged the code.  If anyone has an objection to this particular path,
> especially if you believe this introduces a bug, please let us know.
>
> --
> paul-moore.com
