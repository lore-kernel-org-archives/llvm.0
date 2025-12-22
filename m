Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347119992C
	for <llvm@lists.linux.dev>; Mon, 22 Dec 2025 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374234; cv=none; b=DuAdOPSJcN8w/SEbCtHitNTXuAm3jx7NcZTVVLCk8bZUCYeDxH6lDkrhAyuhcQfDKVKuiZqSRWxFKdvsq/lLOAS+6Jp+IAaRLyrhznfjKqw09a2VZoRt4FiCr2wcDtWY/Qb5cux1F2NJiLj0S9HQLkBM8AOXdtpJZ2roYymG5Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374234; c=relaxed/simple;
	bh=0sEgOjWNYiRpYEbqOkuzrHuh+/Ex8OeQWPYb0COe5JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lboehxYJHebAOKHSlkF5xDkGgcsF2mR7IitCbGXjlR08uj8AK6ge6LYI58ayftvRYVgbHmxQOqwDoV70xU41Ai+jrdplaV8T/QfAvvyEItONrgJFhBCX95jjZAU2OkWHZBe/bt9HBfIi72YA8Y6Tgd6xeuDzHNklLJPK8l81mZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czJgGe2c; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czJgGe2c"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0abca9769so6911765ad.1
        for <llvm@lists.linux.dev>; Sun, 21 Dec 2025 19:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766374232; x=1766979032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=czJgGe2cedHSO0H4orPxIJth85xiNdI8bjfs4wJd6pzXYYw3HSgCRnsqFPrzn6tacr
         bz9ldiZyR6OPfWZPlbOedvYjxah1TIXsOs/JrsmGay0JuTuluBVvgCrFsBrNFHdqscp0
         fdMN0yoVQo/4OaCTfVkMIOppjEFaIXP/tHvwDDyDtNh+6duSLW3pS+K0dQI7X7n2tzh7
         EQzXTdHPUvJx+2uNDR7adLRKWxiKhpsZpX2CRFnnIP5NAO4fIUZnbq8BKPmrv03wP6n/
         b2z4ysPTlgVzmYf3nT8t22LzhOS7/t6HQgLcSIFu61eVOfugZ1m9NCWc3LaY2CVIpM2P
         kysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374232; x=1766979032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=OGR4i7fqrE4hizxHQRhPBcjOj9eNhe1ilgD3uAyuQHHqgzn1ICJxtWmKo++/TbLezB
         I+ibSqFzhIH+FyyEHl+5HZTFUYStv7jyrr7/0eCxGWLuiR2KhHdW1ym+67jpeBi1tPef
         hG6p+7jHmM4AN9O0jxrg0RyZsZEkSl6BxBeFlPLJ25iGqPmqBi1mFh0DPLlx3TYp8qBp
         MvXxTd513XH6+140CFCgoOgFTY0VsMUiFaejkEEa236TtB+9Jg5i9kBaTUSYR2pra0fe
         pTZa5oJpis1EknUliUcQJ45RSGtOaLNOcTgXbM/Gq37iXkmNM1g2vYh74mSy7H+xHsPa
         9Ucw==
X-Forwarded-Encrypted: i=1; AJvYcCVX1rt6RpMluj7hzAsM+9unH385AEpXgT2un3MEGpj/12p+PbHaSNKUWcyDj/p+xWJGyMGF@lists.linux.dev
X-Gm-Message-State: AOJu0YyrbxrI3qm639Gg5TSAlBmCuIGdC7MP+Z52zaI9omwl3zi4LtOQ
	ufgxgp6JUl1emIQH39WpuqAnYBJzv8ox6qjMWAm24fKwj44otsX5h9PejeYrz73RQlo6reBWqAy
	WvLgQvsgJ8zbDGbwi9O4kN2F/uUJLjhk=
X-Gm-Gg: AY/fxX6vrBSY961r+TE54nND2OoSZXsLDPopBlmq36jHaR3vHu3QDUv78AlMD0qn1uC
	RvMmp7bp6NHSzFywa+sRAsAh88edncNRnaDsMjBcZXTAy4SDsdcyXQULP0wW5yiVoVYRgQt8+WS
	WYOLQ9AQGbSHSl5AbIbJ5wkXDhBBM5rZG/JIsHdyCo9iTuJFCmQGzpGNrOOr0Z2mgte1RB9FiYK
	MkZVARY2Yv2Xo01iKPN2zKjJFXnpheTyYaqGtQp1P9VUXkuRSG9dSLHlzhQ4UMRzOU2/0fDp/sv
	fMh6znOnha8da3GCA1tMrzT85XkG6RhtdprMrKOGoL/XCfYJiRC8WwzhN38eG+MVqHhWygf9mtV
	lufVvMlLzSwo3nNOH3Aoake0=
X-Google-Smtp-Source: AGHT+IEwHp7GiTxzNjQa+1kWbGxVcf+HWSVN1hKAodz8N06a/N/cWQQAGQMNADFaWCws3ABO/rPUi3ymBQAn595hUMI=
X-Received: by 2002:a05:7300:4f9b:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b05ec47be3mr4112576eec.6.1766374231860; Sun, 21 Dec 2025
 19:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766061692.git.gtucker@gtucker.io> <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
In-Reply-To: <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Dec 2025 04:30:19 +0100
X-Gm-Features: AQt7F2p6PVxe3-97y300_XoLgtbOQwn1v4BhwJSxqspmpx2ZlG3l-w_-sXw1ElM
Message-ID: <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:19=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Another piece of feedback from your v1 review was to add a link to
> the documentation.  As it's not published yet I just mentioned the
> section name here in the v2 - but I can anticipate what the final URL
> will be i.e.:
>
>      https://www.kernel.org/doc/html/latest/dev-tools/container

A docs.kernel.org URL instead may look better?

Cheers,
Miguel
