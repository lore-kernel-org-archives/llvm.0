Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A3FBF3;
	Sun,  5 May 2024 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714905856; cv=none; b=f3V8oIPIO6rNnzfjJ2niBU1Y8pT8ElhyNeQVVlTo72PamjtBr7de2osCdjFuMyMR/ylXU05UmQ2eXbIRC1dQ6pBu5tJNB1SK62teJ0Qs/E84gqzZUeAn4v/Og32QgLuGfW3pGkchYdLeHVGxPn6eusDUNgxrdGMaX52K7ovqAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714905856; c=relaxed/simple;
	bh=KHEhv3zmaRfP0djX9DxadejSI7CWrAi5q8BogsN6Uzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXhhc3Td+3lXGbFjkJQ9sWY2V+8ukioL7IHTHRzQ1nUM3WbPoJShlq7cqqxfljCe9giwtFy7pzk2ODl7epJRXGMFd9V9YR65MKdqJAARrFjggGc109oPyzT7e7eqfO/ENQOSaD7suDcP/UihjH+6aMPgNPx/5bYS3UcwV6Ck1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npme2n7C; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npme2n7C"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-620e30d8f37so938209a12.2;
        Sun, 05 May 2024 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714905854; x=1715510654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHEhv3zmaRfP0djX9DxadejSI7CWrAi5q8BogsN6Uzg=;
        b=npme2n7CTKJYwEDlVMy/owf3hmMW8Zrk4H9DGmo3LCWnIZ4SNI7lxfrHgFY1jhZlR6
         +Zww0cKR29UauDvmCD8YEJAOybQy0qvo5odjaq6+LO8mUkTJ+4YXkPKGPtHgdUL2vSTC
         debC6MqNmYlqSiA9pxaclg9akH8Lg2qK7I+QNqurOEvwSIUm/1RUwgadWf/KaKanSu7y
         LPpUs/rmjDyL3FH3831Ym6RNqNXL6md9qtY/CWVlgwBktwMlC9UjT7y4M7pUReTuweEA
         mKJUC7HaYQfhvuIMPtalQl6IZIrjTdJrwJz5fbaPqfXekN31emeRc3IpICubRMekK1bx
         kS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714905854; x=1715510654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHEhv3zmaRfP0djX9DxadejSI7CWrAi5q8BogsN6Uzg=;
        b=GHOK6TYQmGlRN0Z0tmeQiZnPUh4P3dFTKwOtF+5YLcZpZZK/bov0M3xLeSTP/CUI9W
         ytjk+yBv80LIrF3WwhV6rwZ9typ92cLAG3ApqJzpAGzzxScPMfKplHCblevNLpoigh/g
         ZyPa8xQyTfGa7pxx5wcp8vs39ucPlFODeQgUqZqrRlBBa25l54yuhbWceyEAQSkcFfNZ
         6h/btkuvxuoyuHmTCSVhJ1JE6z3ipFEy98ah0mdiqjzbtCV3XK3t6nLzEPu8hpDNozvk
         2Usb2mmgGMkXz02Gs/5T+EFLQhv0uR8a5ux1JwVLjPC3AGcTe571dgIxghgwkIOLCWpG
         NQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWQYXQ51WfBgB2j4Ck3KpQycumQaTcsQsRCFg9UxKgNLonxiDWP9+3MPgN53gYs8qBhoFP78uATPMQPL5zOJUKw+NkZOsGOOpmQV3Tg2iJ0DhoKwlwc31Y0R0jjFykAWZWDn9E=
X-Gm-Message-State: AOJu0Yyf6fZQrGrjJ/oQeShbf+fpimUHUcfl9yNFNvvFbSI0ifavmlV4
	RndT34TLC8hMdW1YbKlasKXQ9NzV5Vxdn8IyKJNnwFyv05RMEG3Ep6EJj7rffA4nIh3AYi95+pf
	//b3bbc/QngPe8oEz5VnyLGREPMk=
X-Google-Smtp-Source: AGHT+IE/KQfFTavx9IjjwIVQyxMZ7eZmWGjgcGO/oqK1nSJ7M3enWhKtOEViDKSlx+ck20q3uRIjXvGpMgTk6YXz/fg=
X-Received: by 2002:a17:90a:51a5:b0:2b2:d375:3b7c with SMTP id
 u34-20020a17090a51a500b002b2d3753b7cmr6369408pjh.31.1714905854426; Sun, 05
 May 2024 03:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240502092443.6845-2-visitorckw@gmail.com> <202405030808.UsoMKFNP-lkp@intel.com>
 <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name> <20240503041701.GA3660305@thelio-3990X>
 <ZjSSylciH+qJeEEG@visitorckw-System-Product-Name> <ZjSUk4vgsQ63wfcn@visitorckw-System-Product-Name>
 <20240503155401.GA3960118@thelio-3990X> <ZjVdbavKgDo8a0CZ@yury-ThinkPad> <20240503222338.GA1908482@thelio-3990X>
In-Reply-To: <20240503222338.GA1908482@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 May 2024 12:42:50 +0200
Message-ID: <CANiq72mJPPp=H6qb7sG1K1hxR3uiHA9+WEVAZkvymSt_dW3CbA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 12:23=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Adding Miguel as compiler attributes maintainer to make him aware of the
> change. I think it would be reasonable to have you take it through the
> bitops tree with your ack so that the test patch can make use of this as
> the fix for the robot's issue.

Thanks Nathan!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

The new macro sounds OK to me. Perhaps we should add some docs to the
other two attributes about their relationship and/or the existence of
this new `__always_used` one (so that it is easier to find). And if
so, then perhaps the docs for `__always_used` can be simplified.

> One gotcha that might be worth mentioning is that this combination only
> works on functions and non-local variables (i.e., static or global).

Yeah, since the `unused` one only applies to that, right?

Cheers,
Miguel
