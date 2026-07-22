Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D04749E0
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743474; cv=pass; b=YdN/POs0hGWO6IThHnIcFNHm/jRhiqNhGoLxyEw2wBiv9SGKrcVs64wJGQK+VVDk+EniV4vCPSki+3A9AcXApFdzln5DZHA32m1Zu71tj1gfUOBLpKR8TO5lckqvveLbOtm/aUQGOS3mA6qzvSnN6EJk76IsH6ku+xJVNPdXOr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743474; c=relaxed/simple;
	bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDcfOYPcIQqukN9dGzBEUAL4rK3mDdhzI1KnoSwK7/HjIauG1VSMaXq3Vhw0PV7Qj2o3WjNZvdkr+SYdc/u8/g212ny5DKF+sj8sx5EJ8tPGLV9GTfXp8ysLz6cMRapwjL67FF/HW0xdNnY1BXwaMLg0GkIwBdayb+D2qZ5X8ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aUT6/n59; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aUT6/n59"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c01c79467so14491cf.0
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 11:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784743471; cv=none;
        d=google.com; s=arc-20260327;
        b=NPh0KuogQeBn7np6iI0Y0cXs1IyuCZJQK09B+jZb+fyGhFkaHpzL5vchZkiVqlv2i5
         c7pMG3BNB1qNy+9f8rLL4U2wtCfFdX7lRPgN73RxyrjqmVFyJV4ct1dCOb3T5bbkvNTb
         fFh7Cuyc49Mp3c6oFecZRW3OjZRj9n0Xn5LG/ZLvoT+Nae1lWeHyNxeN1yuHlYZVjP+v
         l9jnCboALageozgHqXZqrxGEsLEWmS/5kYxe8bT/Kw458dEoTGvWr4Zu93CNpxeFV9Ta
         F61PWAE0hCJSmhrIQ/pKFzA68ekPDBIb5ls+B/Dzkm9nnLyShtAXxUsaghauh6f+53LX
         m5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        fh=zxB0OX9e9uB5PhMwK5+wq4O3aiQNcrZqoeuAkKilW/w=;
        b=RnjeVbItzokt4J/4nUA7poUQXQQ03TfxOUzTqQa6bBa40RVwcDujls9PSqcSmSL156
         GWaEKZmvcxKbCOHordznEHZLf38gI0tpKz9GvJDkXvUXGFILfP0d5ZskKUcZ79Nwugei
         49A/X/XQpA5X+jYA++0Wjdaw3adCfzPEcMN5u+SnklARDHpT/489sG5fmOaddLzXZbFZ
         NgyDR9nbYAbBQGYoTYtfUrlwBOdrPLiz3jR4JQ/LtOketAE4nm3yTwrM4T8N0HVep5jw
         XRYwZufg5NNQ5F4W/SCayVdh6FRcgzrS0/4QdMGxgFQpHR83uUhrDdb9Yc5q07Kmw6lx
         chIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784743471; x=1785348271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        b=aUT6/n59VAgnW+gS7Mgt8lmtev7E7PL7j2f6FI3x69jKxnTouBJYRK0NG6MNoXLZk+
         79yQaDNfMZj655m9tEh1nVhnv4EGhUva/Pu3neX7Ho6ywfBSwz2m/AHJwJ6Jk8GOF/rD
         vnQb/MpD3ksoOtGF7orxe+jlkO447fO8iCnpCJGemSBPbwduM+3RvcYvWtE4DDKa4MNJ
         j4d9xsFSpzqKvnaUkXXLt8ety44oW8JiLDSc8EPGAERi12gfH5p/9bCedbe+lk/HK3qT
         U0bQNjiy617SKBjXPOCYbI7by69XVq1vX8AJxWivmFfNW4qLt/RyJtSN5vWeLBkJWDoD
         fRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784743471; x=1785348271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        b=MkCx2qq/8bCaVdEHTgVByKhSxvst+NQE/Js1pC9T9TchaN9Hn7aOQRjfdPQXq3mLt7
         S451bZ7be90T/QKjHOocuYDcY60cGAi+PW93iTPfwFK+4CWlajg7ntplgL52Nu4x8Ip0
         yYPKIBc8ASN3gHQ/9nYGG73qKUap5yDE+zqcHHawwej/Z/Bq7cMT1oflvC10ewMrQtZJ
         PuZgDf6CCrsQ5g6Y3Tb+qw5KSFA+AB8PH1ZrtKLdnm1DC33gc2DJHytHqxEH5ioZDYYB
         5kuYfqpzUlWKkOv9KZhvuQwpcwrk3ftE8NMsKI87J7SINsno7EvFQlipPHeRlS+ZkwR4
         N//g==
X-Forwarded-Encrypted: i=1; AHgh+RrSGcsFCIu3Yp0C3SELHLsBXFs9li/rQX+L8Yl9+7Bf+QIzrjbufcKnx8PiLXD562qr3OM+@lists.linux.dev
X-Gm-Message-State: AOJu0YwLCKEzMaAy3Q8C8lSRXGYC8gqytOYysqJwJzYTDnAxXNkUKzrQ
	aJkBb28uRH3RhbdlfCWq7Rs8KUZPDofTE3L9U5NFeERyNp2LYdyrYb8mQdClP2MuU+QK4dF/HLF
	qCf7wAy2MA0FI7m2HebobXm/ksB5RB4du6V8nklTX
X-Gm-Gg: AR+sD1046uCidUSNoBdd00SvQ9/XFJsLkASIaUXLycQkryUu8Uqu9ijopjmxrv1GUwW
	ImMZUZGQ95BDW2Z/f9AMT1ktAv974xhl8YEatpogJXdgXMFfvkWBEnV4EuEAdMizfRKMffjXvk1
	syGHgozc4h2YNTIVgepTvj3qggWxO26bsPkkyqRBM+M3YbBmmN5gRkMX6IV4fGQBr7sVa4ZQzoY
	1ZjoqbEQe8lP1JXEsCUspmwNGwYfoCvsKzBIckU1WNQeiiVY9pMlLo1YHY=
X-Received: by 2002:ac8:43cb:0:b0:51c:935d:8d74 with SMTP id
 d75a77b69052e-5283be3e9d4mr374341cf.9.1784743470255; Wed, 22 Jul 2026
 11:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
In-Reply-To: <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Jul 2026 11:03:53 -0700
X-Gm-Features: AUfX_mwbxqkU-iAMaiWQ1yNey3EgrzgXznb4NhUQjYMjtNDBUtwxFYY_8mI2M90
Message-ID: <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:47=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> I think the issue might be a parameter mismatch: in C, the pointer is
> declared as taking a parameter `void (*)(void __iomem *)`, but in assembl=
y
> `imx6_suspend` has no parameters, so Clang generates two different hashes
> for them?

As long as the C prototype for the assembly function matches the
function pointer type, the hashes should also match. Can you dump the
hash prefix from the OCRAM and compare it to the disassembly of the
call site?

Sami
