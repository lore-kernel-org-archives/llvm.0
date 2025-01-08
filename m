Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800C61FF1B2
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355741; cv=none; b=u8G+Pf6qB4/N5JqDF53PH1NKiG0Y6gaAg14q34cXWUjmmu28L9xstSmI3hG4E9zqu0LQkFbVqTQGxMBEQuM9y+v3EEGOuD+R/1stMB/S195QQSMbP2PwlA8QyY5w6Xpy2ZoXhKH6zG9k/5/zF6id7h73w2k3dRZNDmCLMf8rUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355741; c=relaxed/simple;
	bh=hJhGOgjLJW/foVpWlAObk6c0wNrPfhRIn9rgD4HiUkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ab9pzzRspkJQjdldbS9U3+4N2NBTZKmYU7KetRMca3h9plpg1kBRc4ruYa3JDcFNPnwM2QX/FjRTWvv4iS6Xq+bLlyeZW1MVC0HAC4xwaGm5vPO31FrB0/edJNtDR6qY1ouqLbNqljBTdAJebksoTL5TLqNobA0Hv7hkL0UASW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=U9BO8Dpn; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U9BO8Dpn"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5447fae695so14245016276.2
        for <llvm@lists.linux.dev>; Wed, 08 Jan 2025 09:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736355737; x=1736960537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwZ+CV+5h2p/PFvnPwPMSUOLWdPmHSTt5hkA/RWK/+M=;
        b=U9BO8Dpnxr4Xvy+uU+FdmOm1xJqndDx5Mo0iZcyNVAYIoHinERWzD7flTE41+MG0M1
         dRUDEJyURimG8EOY4Dz6xQlEJDfd3B9XUIZpPbzWM7S42K8y/r/+xD2//FTrm2Cqq7MA
         CUDQpPDkuSs6/tIiaCzNius8Ujj/JfukRVtZTQ4Qv74i6GEP9/txk2znU9DM6wZBu/Xl
         udQvX6Wy3enXxLgXeYkzSPz8nw64cY1A3Tg0WFgf35HLiqgfFDkZleZazGdPIpNpoZbd
         NuyfoPmovBaCCqXEBW4L9uRGtAaCxZD7N8o+ZM4A8mBMxPK1Y7OnkypV8AYk6cxV+u2D
         BYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355737; x=1736960537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwZ+CV+5h2p/PFvnPwPMSUOLWdPmHSTt5hkA/RWK/+M=;
        b=ORJKBsi6TLA8f6bQbc5Gcf/MesMCsschB/9BgaznLLcAVLOQLmKndYeyAlFh99TTeo
         TfszSjMCAgbIYx9/3U0L0UslxbNnLyEkVID+jxctDNFNy67vw1m6R5tYoND/+aNSTjfy
         w80WTWeyfMNEDi228gtVVuq5KSGrxCU5VOR0s/NYHjW1aMvKYgf3COCMZuIZ6z4PP64X
         A8Ja47IyvV5gvXYsdHvGwDQFZQXLOBcbRGkI6WGuv1ExhyAFU1SBrUptB4B6JpLe0LaX
         x6W38jesQzk2UE6nkJUHaysIiqQ6zPv/UsUOip3cHCSISwZMW0niX9KdpH0rt/vPrrya
         0nVA==
X-Forwarded-Encrypted: i=1; AJvYcCW39oUS7On76+8P8JIfpSiSD2+uM5M0YzikPuflQmeFoxC11zOLpZ560CN4PGkhouUZFQXs@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9G6p6fXh0g9+TzsNs/buTLzGdy4lZ98TFerP8ViYxZ2u+dQdy
	8BDAPuR7ruadUNJNzQA+zefJL2LZYIpePIeUgw1OgCzwOZvy8f6bvZ1gh8KYN4zd6xC+Wt36jSP
	wOtFrC/fwPp4LWyZoMGiLFYP4xTc=
X-Gm-Gg: ASbGncsNNX5ELSKpAqoC5dSTXKmptesGiXi1jqdjKBgk1AuiZx6PhOZjqmHx6CI23A3
	A+I8V9tobNdvVsfPy8kNjqPdZvaDwmGXLweIj
X-Google-Smtp-Source: AGHT+IGmV0iG7wdc/IPnLhed+8gRObsGafv0Msg5R3ACLWE8C2ShTNz8eOnTylXHzI4jxvkoZzxe9aeVyq4RPwCJB84=
X-Received: by 2002:a05:690c:b17:b0:6ee:66d2:e738 with SMTP id
 00721157ae682-6f5311e4ab2mr33657517b3.2.1736355737322; Wed, 08 Jan 2025
 09:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216164055.96267-19-cgoettsche@seltendoof.de> <e1e67dea8520f71bc54377a93e26d849@paul-moore.com>
In-Reply-To: <e1e67dea8520f71bc54377a93e26d849@paul-moore.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Wed, 8 Jan 2025 18:02:06 +0100
X-Gm-Features: AbW1kvbVpB5vQRaF4j7zoLu5ldk_OiXmqz3jISyLmgKfrBF34zh3GNS4BkPZAPI
Message-ID: <CAJ2a_DedB9d+mes16ws0gFBtzwZ3LWj9Ocq8+xDjQyZETgWbCA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 19/22] selinux: validate symbols
To: Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jan 2025 at 04:00, Paul Moore <paul@paul-moore.com> wrote:
>
> On Dec 16, 2024 =3D?UTF-8?q?Christian=3D20G=3DC3=3DB6ttsche?=3D <cgoettsc=
he@seltendoof.de> wrote:
> >
> > Some symbol tables need to be validated after indexing, since during
> > indexing their referenced entries might not yet have been indexed.
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > ---
> >  security/selinux/ss/policydb.c | 94 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
>
> Out of curiosity, have you measured the policy load times before and
> after this patchset?  I'd like to understand the performance impact of
> the additional checks and validations.

A trivial benchmark of load_policy(8) inside a virtme-ng environment
showed a slight increase from 82,7ms to 82.9ms.
I'll try some more benchmarks for v3.

> --
> paul-moore.com
