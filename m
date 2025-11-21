Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774DF757EA
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739014; cv=none; b=AePvgqvsFSUELT/9zI/J/DPGC0jxW0lrxfl8DbQ2koFaDW/bC6R6dHqNG8Y1YgQtqdsz7L/4M+Xpw3IzQJNqRiTaZsZmUu5CZ736FQb5FvNsoWKTJMKqZOsKy9Ezob1ZFyc74TJBMobE8VWZz06QXsq8EFKdniKZw+By4Tsb3jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739014; c=relaxed/simple;
	bh=+7JaZ904HEfoToTNqFXnfKLDp6L6QuFWgSLqJgbr5TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzNVpidto6/7Bvp1qE3I8e/rE6z9PgWmJvMK7zVh6goWREl9XOzT+xTjDyOadXf7w+JCkreokjVUIhpZwMwBJt4dUyEqVUQbPRuGBfHEZtz/YhK6LKBjdv6vbsoXp1c0Vr5ei+aPn0ilq1B49O6uR+2twPiPFeMsFqu/JIARN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqoMjkJc; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqoMjkJc"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bceaaed0514so125627a12.3
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763739013; x=1764343813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2mvpQ6p+JPlOzBY+YV20bR1O2Kxu26V2VO57Tqxgmw=;
        b=YqoMjkJcQmOpixTis7YMtlbAnXVE9ONzJiVPJIaBljg88IpaDZnQRd2mUR4/2iz8wD
         e2JsOuSeEa/0anccj/aixx3ANF6BswjX+oEd0mBzeHInmZnxbgZxEbc21IO/d7paOiHV
         I9bbYgm9/92pA2qkMGBB6K7k2xjY2gCTYB507oitFV/pbx9QgHDzchI9alJ47b3t5cRS
         faN2pnZPH4qPWz4fX0kg+l/jtf+o6vk0Kv6jUC7/E3LAQKnMpv81KEXVor3d1PhGlxFp
         /n5ALPsVYx/U5f7qmOZu44SBR1xPTdyB4mUPiAscNcpVUmXh8momHvDGZ0421nzQVsPK
         K1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739013; x=1764343813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2mvpQ6p+JPlOzBY+YV20bR1O2Kxu26V2VO57Tqxgmw=;
        b=rI2qmSy2dRQoCE2lxtgVB0Qb/p+pWqeIqKOtSH2Y1azz1dOthZ90+4JzHmsdrvkdr/
         w+LvNe3jQ2jvfwnT/zxQrulqpMWeoPtA+MxaRFfB+8ZjyOOihXvcqdaTfbMeZyoqUdG1
         dJ7AldmXGod2qqjaU6w/U7UZrfcTwNHaVs5ocnHRVIxx4RbK8UL/4AoFIrHeg7z8+ql4
         dd0Dg2o3tb5I7iUptyyTPmxSmGu2PMA8YuwK8h0xBYpcbi8B3DVXSm3C60bm734aEUcZ
         wPbd9A3y320jN3qPPksnm1ZyKcRYZvbSOSiEtIwOgC4SLdyRWu5Ow801HUqdebwfjIZm
         r7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHhwUD/PpI6biGzL/MecjT63pIAEdzaFLxWWaYGG3YlQGsBxL0kCeVU98wqYfEwyVcuYq5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2vdnrZ17fOj5MsFcPf/oYWzzwBG+Q+PK5dCZ2a8kn4O1bQKRb
	H8KGR8JQ8Hf1fFzJhIK3EH8qnvXjkrvI6dsblheRuPHEQOOjhFSqzaoWNWpGDVy4HtT6Q9/+j5P
	7buOzE1MRHh+203rTg1EjFS56WwOuABs=
X-Gm-Gg: ASbGncuRdqwpF7AoeVooxDzaV55KBkkMR9KCkRZywIPo0vFGHNC5CGnVmD0VeXBQdZM
	cqSLKAz0k76I1YriOkgYUXqegJRsrOHJYRQ6fP80/MYQLtYfy4PKD3el/abotmEf6zFx1h2G4LO
	kNCYGcz5IrWvdd3HpHupS9FJ+hJJuveaGpTrCCITqRD0b/pg2XEauwziZ2beIt3Sljxom/NVgDZ
	G7ZGYGudGG8l7r5O7pB5dg4QTQ0sFuLJcEHaobfmB6Hfmt+rvP/adP04bnGoBfVzmZ11ht3uBup
	eHvxULsOtff8Zns6QRRJQ95AfrI6p9jGZDbLubSRp/UsEDIrZD77OZyWbuRMCbq3sk59uPO2L/a
	xL41QDxTNeU7Xfg==
X-Google-Smtp-Source: AGHT+IEJNAec/VNO4xmyIScwh5VSum2fjqj0VWiV0z8Z2rPyySBfGlVQDrqDGlOu5guG9erl3rYIIaqy5jHoUUeIwG8=
X-Received: by 2002:a05:7022:441c:b0:119:e56b:c3f5 with SMTP id
 a92af1059eb24-11c9f38e94fmr464472c88.5.1763739012499; Fri, 21 Nov 2025
 07:30:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com> <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <DEEH8WPYR4KA.1WUYP0D5F9TYA@nvidia.com>
In-Reply-To: <DEEH8WPYR4KA.1WUYP0D5F9TYA@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 16:30:00 +0100
X-Gm-Features: AWmQ_bmPKo7Yv7lG7AzLgke0QOCQSypk_ziJ4woRpErZhoidpeodemRVc_AkWUE
Message-ID: <CANiq72kqX8Ua7NFHUwLBW1Gpb-Ewh2wHnWmXH6SUQBUyrrSdbg@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 4:27=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
>     CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>
> I don't know whether this "CC" setting also affects Rust, but assuming
> it does, we can very well imagine that at least one of
> `from_expr`/`fits_within` does not get inlined, causing the compiler to
> not be able to satisfy the `build_assert`.
>
> If that's true, then this is an oversight of mine rather than a
> fundamental problem, and could affect all architectures. I'll try to
> reproduce the issue locally to test this theory.

Yes, it does affect Rust, i.e. we use the same levels for both.

Would `inline(always)` work?

Cheers,
Miguel
