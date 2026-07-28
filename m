Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3C3BBFCD
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221500; cv=pass; b=OsWNiSLdNY9kZq0W5n6DlRUWMgUGD4vCBzPsl0SeuhlaajUXtnUxh8TW/jP9psv91+WEOFfgCEg+zoJrWBnk1ETJ01JVAjTUOqktxMg6R6bDfm5Cg5WjoQx6ptKrqAKGkWJ2eYWV8QVUb0HdDZjF4qrxqZHFHKloJ9LLIovYdG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221500; c=relaxed/simple;
	bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhFo0VKlUozLMDP7gZB5LQW8yFELgWwioOBhjmYx791MuTK9y2JQegJIxNUxSkKhjstEOquBnGejkf0GGB99WklXOJ2hLGMKoowyiLkb+8LrkgwYoGNMnCepDiItAz8gqgKd9Ph9aiEqy4CmRmPqsMH+Rr+kV2fhOmApyVtIlYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=Nl9OCEfK; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="Nl9OCEfK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3738461a91.1
        for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 23:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785221498; cv=none;
        d=google.com; s=arc-20260327;
        b=Cp6vkCitWa8gDm7N1QOknVVHQ5gZfLdytEke4MoOYbQfofxdKi2ULW12BpLDpM2VEF
         r+QYt3GHbkCfPFCe8jKKolPMX9M+VvE8AbIxhxyRWCc4Fu7McPllXrgYkmVeWMTAcXoy
         o2yDE43vOyq3gtxzgPsoZubfwVUV15oXXZonaU8hz0o4KFKSsYET1OAIeegAr6dZ65sl
         PznERgWuzwJ0ZMq+Yc9WglpAmihSDcAxnmglvd8oHrqRy/0USlQNYSFm4mJDWQokZodn
         fAnrFgjODOLGx96KzRlC7l7lGTO4SNwbe+RPhT0/9X2uUcygOkQEEnUpgADYLTXgJz88
         P6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
        fh=pLPH7UD7TP0SSuuEfXPR2+gF5Zph2SL7BRoe3o8aG2I=;
        b=G7kihgxlO0WiBzI27VRJMgHx4a95RNlay6F+Mw0MLkQ47GTc7vmQLumw696t3a3+Cb
         Q3dcuH+j4wYuxWmfPp4uw5O64EIWYFNTPKe2TV6entzYRghDJ0TGc68wz3M3jdUWudwX
         AVDfs/sS5hdtPokJbD8FB99l4WZ5EGRaNxpls8t6B4WhdcYGaBMRejfC8AMt8w8Xpq5L
         4OdBKbiILcIVftTG/0kq2TMZxbla6fWkZCyDAjagHoVwqRZzlnfPOtrYlh5g8oHD6JfA
         ImsPnP5OFwcJs3q8ANNnhYYGgg79VwncZsuYHlqYIuBRfSIB2vxeRo90YDZyGCxH8xjb
         drkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785221498; x=1785826298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
        b=Nl9OCEfKGNyMthwxQ9gLPTo98tt6iJaxkuvSL5MM1/OuDlobHMfeVcbdufwFT1klwi
         guLVtcDh3SK9NLzuP4Ky/hRUgO7qbPbhHlTn65+Mv95RPYZrBBvdsgh8/EF7xc8WpUwD
         Ea+YDN5pHQNkxMXydYzGGU0tD0Xyzkp8YgHvRRDpNR+ASA6nEHg1aaxi+xzfLfpYu4QM
         /cZ990uobxaHsqDAysw7Qrqfn/XyJN6ZozyK2NomEhjRKI4Moc2fuAK7zMuRpu486gLc
         NIyQefjAaCE39GqpYPcuRyXatZBsFAnUqrmb5R2wJaEadpOgh1GughfTMwioxBzc6S5j
         1ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221498; x=1785826298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
        b=QNcy5d6PII+svJ+L9gA3+19EZ+nod1/05+Jnlqrd7rnu2iS8cNHJOijPdvZfqBzY22
         5Sh4ZYLIvC6g/wSihImTr5ObAX0xv48ieMIzV060zt6lV3grbi+qiKofwt+FV0I0rFBa
         mY/BZhcoxCNLJRFKZ+cxdIDtvPUeSx8hshMWv774mzgum66QCEKU8H9OuwQqsS21lySW
         ipTd+ml5B5U/22Nfpv9mREEMJuKIKRWDfN8fwUSRKR5/JYVEUa/PV3CmleJEzFRUjhin
         2gtj6kc4m+a0T3SYAmHmw3mG8euCD9BJu8+b1Dy36ocjr2r/Vow/ckCiN44d3v8k5EHA
         pI7w==
X-Forwarded-Encrypted: i=1; AHgh+RqpqncVglySKw+A628zWd+Ge/79HL2jf9HSlehXQ2p2JQtMqmtMR0RZPWdSP8/LhJxck/5h@lists.linux.dev
X-Gm-Message-State: AOJu0Ywaey7f7Oa3AJ8MkvqNY+5gRxButUPSduru+PJpeXJ/KqbYljM+
	Qgqdp82TtJfgLDNpzYdqOrNvWGT85ltHKGQBic5evYBIna0aEODwcEkFkfJjzy0GSHWw1pMh+fL
	njfk5ZEuQd8WS0wTpKyjn2zJm8Pu4D0OIXTqKlwbyhQ==
X-Gm-Gg: AR+sD10A+66nPrH23up28pEkLa7koWKJYHWOP0lxfjJpzII2piC5ocZhF7pXrSCzCt7
	wkb34juJEVgCA0U4+zCxmcndKt/NTYg8dy/ysAQx7J3bC2TFQ4U+B9oV+qfpS1Qp/NzbLTKsw6r
	haRXuFiHRGL3fNy06t1v5VnMV2tO+MldUVr/JWcXdMIv2fUrsKv5jMiICcrCqX7kvhyx8p1jBK0
	ZeSQ65+c6R2tkOgkDOxkbd1ZKs4Wr3jVXV23m+zViQy9sLAeuitFE9ZZSBei0Hot1STEuTBkrMs
	AXeRGZOhnR2uy4tQFaXs
X-Received: by 2002:a17:90b:51c5:b0:380:71eb:4014 with SMTP id
 98e67ed59e1d1-38f6a37e87fmr1398283a91.15.1785221498096; Mon, 27 Jul 2026
 23:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com> <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
 <ambQ4715PGeb6uFq@1wt.eu> <6a6c1738-bdbf-4beb-9abc-e9c38434b8ac@t-8ch.de>
In-Reply-To: <6a6c1738-bdbf-4beb-9abc-e9c38434b8ac@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 13:51:25 +0700
X-Gm-Features: AUfX_mwNMBgSu4dTxFsUacHTqp-RjCOEkBg0s1vRYDZbBtotdldmDUVB9cpOwoI
Message-ID: <CA+KFgX51SLUKcpLhaLT0sT-b1k0k==am6ooaGj3VaFMkLMmWxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before the
 arch macros
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:19=E2=80=AFPM Thomas Wei=C3=9Fschuh wrote:
> On 2026-07-27 05:30:43+0200, Willy Tarreau wrote:
> > Well, at other places we already have typeof(arg) which is exactly the
> > same, more explicit, and doesn't come with such restrictions, so I'd
> > rather suggest we use it instead.
>
> Agreed.

Noted, I'll use __typeof__() in the next version.

--=20
Ammar Faizi
