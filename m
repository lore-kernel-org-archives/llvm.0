Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534723CB
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617760; cv=none; b=mIxbng4xzhzgMk2e5JP6Hq4iUoJ/bFz+e+A1VWnaC6qjbfDqL9RRQu4zZZ2IZoluSJmtJR+6sDlZUCy9bs9P3ajPSmF8d4rwSbnGODSA67IqoKrJT+9aoBKpKaV/uBm9hlLOkHxheB5TmdTLi4g5fuHqBK3agztsyNLcnD/rPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617760; c=relaxed/simple;
	bh=9oirvRjInAAK2WGeTpkg13GutqE/g028MxGLEUfVJ4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGiBihIVDYI56sdTPygqmM6bdFVMUrUCDBNU8zwrKmcSnRf60Jdk5E83j9JeFO7BBR9dqhDMZCewloJ5k/yE4ZDneIN+E6P9Yfu4JEkCrL+678t7ECctJklBdf/wKdhJYQ12xGlf9RP0MNQMt8k7QqddcBogRZhHAXU0S+eH97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tg1Cvtdi; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tg1Cvtdi"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2df848f9325so58200141fa.1
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715617757; x=1716222557; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sABAyDDibQeTUxaqpap0tAGtEYkahruaupGbesZnVxw=;
        b=Tg1CvtdiXPWpP99q04GiKDdb2J5iJi+tVA2JBlziuK1wSG0d9mVRRRv1aOztzyM1hj
         l4AEx1exuPRwwA3oJ1nchmG/3HJXq0UxrI+lgqFa/4H98VaH+R64Xc/ydEFzPHitjRze
         lAdiMHzqbXbtIPGq2KIi+N9cfQ62KKcMiWG00bALZtUTS64rHHdbQX+eC/eR9QmUDj6m
         ZdKuBOTlU7b2yfJ1rSwZTTNX+GwWA9sJ4gaz7fTqyhLzPzcJT3PakgEurLn2u0vN4zKa
         3cRhqNwG7/FztPJZRWe63IBMrsW5t7euPFbLVa30FhvaF6eEMmpz/z9ihRkimuIDKk+N
         q7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715617757; x=1716222557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sABAyDDibQeTUxaqpap0tAGtEYkahruaupGbesZnVxw=;
        b=uwybKjj5H4kfJkhLmn1Y9XR2QYjuNOmD00srZhf5kPZgH47P+Btfek4RsoIiFlzF7l
         LwngjmnHU9Ltxg4Pj+j5PyJZBXCs+IAccF+ZVBkw6kDSOh5COyYavdzp/+lmRO7GgFf7
         L8EVyraZ5V4Y5N2h81Yzt5ENOm7cYDuDSV1y+Gw+X6fzWheL635hmSONJPIecOZ2026f
         gwb1mc22VWIKnBHKkSpTyg1oQLXxB4794Fti0LAGCrNo8gC93CjQN7k9yGVE1+slpPWj
         RoYAMTAIaClbrT490Fh3B21uJUA7bMe6MIJQF2P683QqfpT1zJ4odvAQ9O8wfJhMXTtU
         Z8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRKfv1TpNN26osN9gDSnEBeG/nI7Yuc2zGTi42sUoePWXRg6cFypgeCdRqKAZtbSe9qhEuuyuNWkhBbCTAE99Yvwom1Q==
X-Gm-Message-State: AOJu0YyiBEy7JRHcJBuRM9HD+0fuvMLJQZU8Mp8wC9eodNS/6ZwjcS18
	56vrslTeeFRBuxNRh+bMOxaGp7Wuk9VGGQLNaai92dey8W3SfBcfwWQ1zH25EOtyhxnfW5rSghb
	WpxPra+PJbXMhkNIBOUMrp05YLrs=
X-Google-Smtp-Source: AGHT+IEzW3swQESCG1PQZCau4vY6voiOCRmeopxeRXdBZmXXzeygMwKz9BndpIVFZiSJ3rYSQcVeLpqTsjWpyxNmprY=
X-Received: by 2002:a2e:91ce:0:b0:2df:1e3e:327f with SMTP id
 38308e7fff4ca-2e52039bcb3mr71238121fa.38.1715617756547; Mon, 13 May 2024
 09:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AS8PR02MB7237262C62B054FABD7229168BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <d11dacfa-5925-4040-b60b-02ab731d5f1a@kernel.org>
In-Reply-To: <d11dacfa-5925-4040-b60b-02ab731d5f1a@kernel.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 13 May 2024 12:29:04 -0400
Message-ID: <CABBYNZ+4CcoBvkj8ze7mZ4vVfWfm_tyBxdFspvreVASi0VR=6A@mail.gmail.com>
Subject: Re: [PATCH v2] tty: rfcomm: prefer struct_size over open coded arithmetic
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Erick Archer <erick.archer@outlook.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri, Eric,

On Mon, May 13, 2024 at 1:07=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 12. 05. 24, 13:17, Erick Archer wrote:
> > This is an effort to get rid of all multiplications from allocation
> > functions in order to prevent integer overflows [1][2].
> >
> > As the "dl" variable is a pointer to "struct rfcomm_dev_list_req" and
> > this structure ends in a flexible array:
> ...
> > --- a/include/net/bluetooth/rfcomm.h
> > +++ b/include/net/bluetooth/rfcomm.h
> ...
> > @@ -528,12 +527,12 @@ static int rfcomm_get_dev_list(void __user *arg)
> >       list_for_each_entry(dev, &rfcomm_dev_list, list) {
> >               if (!tty_port_get(&dev->port))
> >                       continue;
> > -             (di + n)->id      =3D dev->id;
> > -             (di + n)->flags   =3D dev->flags;
> > -             (di + n)->state   =3D dev->dlc->state;
> > -             (di + n)->channel =3D dev->channel;
> > -             bacpy(&(di + n)->src, &dev->src);
> > -             bacpy(&(di + n)->dst, &dev->dst);
> > +             di[n].id      =3D dev->id;
> > +             di[n].flags   =3D dev->flags;
> > +             di[n].state   =3D dev->dlc->state;
> > +             di[n].channel =3D dev->channel;
> > +             bacpy(&di[n].src, &dev->src);
> > +             bacpy(&di[n].dst, &dev->dst);
>
> This does not relate much to "prefer struct_size over open coded
> arithmetic". It should have been in a separate patch.

+1, please split these changes into its own patch so we can apply it separa=
tely.

> Other than that, LGTM.
>
> thanks,
> --
> js
> suse labs
>


--=20
Luiz Augusto von Dentz
