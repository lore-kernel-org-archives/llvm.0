Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2119F42F
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867582; cv=none; b=VkjUKf2Y9XrQ1iGCFFqczlx7X94fyXZkakFe+Hb9J7mBxMtIlljUZ35pcEb7z1APpQccVz5WHj6Vohkmod8IByq5DIQ/sy2F/EYMqNpbve33uaaTAgrtpLC8m035uuMMR14X+DxBEXHcwHkQ9k7O2lTisxVFaNjUl9nb6Xz6U6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867582; c=relaxed/simple;
	bh=pzT4QF0kWNwyO041dX1IdeXux9AvDC80CLRnBOiGKeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9swmZWHvAPcXBLbwUMBbf8qYvUN/2om1svFbEmMNjpWCQIN5VkPAUHP2dSWqkgm4tWKPVv1wCoWCcnlCqKwso/rtDR+nSWkbmtEUlJSPa9GQev/rLkAHOTNeDb0lC/OEDmaax/CKRudc+Cmyj6XqSsfsgxXaKqt6eexuWLrP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dizteoEw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dizteoEw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de34b72ce8so1213557a12.2
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738867579; x=1739472379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzT4QF0kWNwyO041dX1IdeXux9AvDC80CLRnBOiGKeY=;
        b=dizteoEwcB3HPY2vcqgF9CraD66NOJPWqv2/RP3jnmQSqHecPgxVKhF4WcJKblL/Xx
         mozO4fs+WPoeUMcwYxulrlpPCY3JSFiG1DM5i5Hr2QRgkzxZsyAkbb3Xq2qQgsvzxD/E
         QakLT4iaP1GPJ1K8dK1NP4AVMBElYEBFWF0MD7SJKQibufmofJoBa9yyzliUW9dCZtu4
         pAKEXmuiqfVkN4TNNAD36bPKCFcal21bcDw+pZ+GYxayzpl+L+14f15JkF0vQrvjqMVi
         iiXY2gEuDrllw+UXTPzRbd1hiS9dj9SUqyMqjj5cwiYKEBLqOy+U9CoZGEznpCMUx8Vv
         bFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867579; x=1739472379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzT4QF0kWNwyO041dX1IdeXux9AvDC80CLRnBOiGKeY=;
        b=j8CAeK9m6TND9IvX23kuM5ez5HfccjCpuDWuDXO1Wk+bsV9NuIEpy1Kh6hYOnsMxfu
         BpAczOWpI6iBIY6FXa5xGSMMPMvh7cirDUAXzNHz93H43J8slwHr/39cc593SpP/d5iB
         WRh9aND6x0hddCmmJVvjjc3F6BlcgsmlAc7qPNvryVc8jDwMRpetOHp8ev7wog3m5FIY
         LScDgczmQYuzhQvk0uxsV7pqGDFHs8gV4j3QmR+UrrTRjRMB/DmcSgWvWchVpgE7Nziy
         ZMnpIerjdE88r61c6q5pcvUqddr7lv9SYadEntQQRuhxSKMImRIuc3H/raBUPvE31Ovb
         dZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR/Kw/jJWv8mf6ukGrYTEFuwH9PVibUeMQmKzrtpU/v56i0nsHJAfr7ZinLspiu4zUXKVf@lists.linux.dev
X-Gm-Message-State: AOJu0YyyPqVN8d88nvrrAn2BduNW5wHfNOv2scZLQ25TuPAbW/aKWOVd
	cNpwb9jw0sqxFSg/5ya7hoQ5UKglI15eAeaqVc4/3V+Xa13UME1fhemMj/EWNZHef8x6AtUbD2j
	BHCAJ9yvZB1XEL/crLJMBdklv91Y=
X-Gm-Gg: ASbGncv1WpkVsT9uo8SUQ17012zL9oubw+zg32m9xQJQjZ/llxohxPmpr2AqD1U6jJV
	dQl27/xvcPaIWOE/Yn8CG2LHKyEZkI1+6FwoClmqHbmMZE423Abbb/f5emCsoEXJYxk1n9KzrYJ
	c=
X-Google-Smtp-Source: AGHT+IFiNmefUf+mNqYk0jECfFpnzTpcj9ZBe/kLveoBw90rH+JKaTDVwob+mi6XZxKrpQxmOV4tN/0GGrlH7k5lrQ0=
X-Received: by 2002:a17:907:9307:b0:ab7:8213:cdb with SMTP id
 a640c23a62f3a-ab789ad3a59mr1266766b.13.1738867578483; Thu, 06 Feb 2025
 10:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206175216.work.225-kees@kernel.org> <CAHp75Vf=84tWvv57Kj5A5bLenQSkC5yDHTHy-u0iK1_U87nvBw@mail.gmail.com>
 <CANiq72kGUOgP60SaEwiBcgsDJnjdvJZ1VJtyf3a_+sQJjiffng@mail.gmail.com>
In-Reply-To: <CANiq72kGUOgP60SaEwiBcgsDJnjdvJZ1VJtyf3a_+sQJjiffng@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Feb 2025 20:45:41 +0200
X-Gm-Features: AWEUYZnl_v25JRZVZMfCXn4n6JYqfVfyix8wpGP-RASEega_qdLtImG5HYQd0VQ
Message-ID: <CAHp75Veo-C3A+XVr1RuFumoULWNOugN+CFE65d1T5o+TZSmw-g@mail.gmail.com>
Subject: Re: [PATCH 0/3] string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Andy Shevchenko <andy@kernel.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Philipp Reisner <philipp.reisner@linbit.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:44=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Feb 6, 2025 at 7:42=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > What's the minimum Clang version we build kernel with? 12?
>
> 13.0.1 for most architectures according to `scripts/min-tool-version.sh`.

Okay, does it mean 13 has no such a bug?
Otherwise the commit message and other comments might be clearer...

--=20
With Best Regards,
Andy Shevchenko
