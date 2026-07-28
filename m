Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D537BE6C
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256647; cv=pass; b=r4+VaeQ8VhcxHS7t6O7v00FrwGfjVBkmDvMRhewkzZx+4HcF2fUS9N/t+5lU1TxQ2paAv9vxtvXVKKdTHzaHT0+J+Z9w3AZCYME/sxdHbNshdt6LweQ6o9/4+RMljvldGfGFqRhfmy2FDUiwQKfI/Idcn1Zd67uTUpwJu152TA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256647; c=relaxed/simple;
	bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2DbyjxSlSCFEcQxmpZfjDfpy6VXdHQzh6DCune/IC6kjO8YpW2WFh3LJftcHIDE8pC5Z8qzFwoHLGgiJoFaDBA3bBdoDB6uDxeCFrl/glB+k6jhFGs5eMiW7fTcjRhz6/UG15sk1fuTBGNoS990+anjztJNyw7l5zQAjtpj8qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=QH+mvebw; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="QH+mvebw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so1541075ad.0
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 09:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785256645; cv=none;
        d=google.com; s=arc-20260327;
        b=D/13JalkI3gitGsNm/vprHEKPEDkBcs/EUFRNMZMPJRhTPhLOn65DtaZMxtIiTVdYz
         z5WaKcWa4b40yDaVckGMl2cv0t5N0T0WprZt/qoOFpXXX7eLkdgnSiA2oRxJuyLonHwe
         JRN9ZvVK4e6sv3skItLSH84qoSOelE4u3Qs70K18eJ4F2K1LhGf7GMq9J5JtdkHSmnMd
         feL4EAcEvehZMP/DNrs1oNlsKuS8qDpgvmJ3PYxS+F6vNBgj1DC7KmaroU+G4RyBEOW2
         WCfMxGnosVt5ca/DRFUIbyAMCkrUB6jPvVu5b48pg46Pu6CO3Sm7IB4xAZsDjJbYPJ62
         cr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
        fh=2wQRjKR5BkirDZ+ZWfLcD8nZzuL/i8p7ipN0jyKdiUo=;
        b=s6JBLTgUFRsncHbHI0a0npqQc6ybCuejXrUiN80y5GMrcxDJFmTSHvXC/3Cb/IHriY
         IyBd+4bgGGm4fC+Z/ywqZjeizO6bYHlJyZnoW0ibsySbdpRnAEQWKws3K8hXnej0Td+9
         kw73Z4ySR89TlKL/EkiAFIWx8Xd8YjE4zWh45z/WEcSBDd3zWfcR4Iw/tKz/hmjsndKE
         NEYv7H5ILiO+VcSuoD4s3XmhPP6506lYXpjEPGnzT0D8AdhxSsHlfUEdQJC4E3Sv9YhG
         80Z369YywcVOqI3ORurH+xMgeSpcCqa+nR2eHrhIGyweK4O7vjQsW0MQcCKiyj3qczjg
         X6kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785256645; x=1785861445; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
        b=QH+mvebwI48qwijtdHP7tbZK6U3agqtg/w72dbsGllLup4GdFcvMis8E5EjAZnYJ7u
         VMd3pqXOmT1o+RjNpli0+IgnqJ6F1k2uuZq8W2uMnZlxqAVTrTubjH8DI0yUX7e5Mzb4
         SjoEttybIQLVx4r1j0ZcLig09FbFAZxhrUSqNdWoG3pu9do0KFyZZ2xdOlLhdCFHRHw4
         XUmvABJanw3T+4uMrTqixHWWXDG4n2GC5D6ho2Ee5+ijKyRVEonjX6JZTZ0c4v2qdPRC
         lkTYmNvLjeqOrrebrrqCfub455z801eLXqViWr+J5Fpg1CfpZWTv3kEgyBCTVPjiX6e5
         Wp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256645; x=1785861445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
        b=cfZG7QUCSdjzyohzk6hOYYjkd1JSp10xbMYYpXHxSVa+BLMbmoLRxF0W3i8sN4kZ3p
         2dhBMeVIKXqJp/CRAgoHYLIy8DY764IPtjgcZ3vojIeCnZOo0Y7OI+cZKlzsL9VHzE7S
         3BqFtT/DcWw4I92/Ow7+mP+5L1GRoTVN+oQwrrkVO1oIfXFnuDkjhD2JatUxEqdSdwNG
         7w/jS9gYmXFqHHuh7m7JsliPy3i/DzJCO4xU81xSU1zKO2DNbrwZOjjtQnUArlCfSwsr
         n0yuEGSt+sBM07d7Dv36Q6IaUdwfJLiPMFh+uSc4X8pshKs0QRbefj8TPY3pIfAv7vIl
         3PXg==
X-Forwarded-Encrypted: i=1; AHgh+RrlatbtCr7bnWHiKoXNszGMpOGz1GfLIc7q8Z7wYwTKJJkfG38hIkKg5R1u9EM3lC+ceiWf@lists.linux.dev
X-Gm-Message-State: AOJu0YzppeVcCaGbR2++2CIQ6aSmi8Pu3GloPEMxKya5tT0IRu/YdSYO
	L/i0sPIBfYrzbaUdWA6TdXe7EHjITy8a/OEcjSrTrDBde1ta9zXCYvISEWpwD8FvwSpfbJnC6Dl
	tOi7SKIGhksb4CBq6iyDE1f68dHkCBJHKTQeNpB+s1w==
X-Gm-Gg: AR+sD12Rm7Ofp7VTd11mvn8/fiNhp+qUaidTZvy63dy/om+BzPLj85ruybEq/dfydRe
	HA6zKOprKknp9969wC1MESFDqa13p9xncr0XbrpqpBT7O8m86LrP4qZ3h72AZW9nAUMqiDIzd2H
	q9SIvQA5VQa0gK9p8GuIh8Ko7IC4ssfw26tqpk2uSMKX+eCOuWKY4mYhBD5U6Ww2bQ4N8ReTOKY
	faE83JzHKqjsBe4BA1hba2x5TyUfEq+PUY/7Y2+5rthh35DpH2qej2/ttSNSQQbELtGUbVgn8Pz
	wqjFye4bx3grJ+Rl4DfC
X-Received: by 2002:a17:902:f710:b0:2ca:a03a:29b2 with SMTP id
 d9443c01a7336-2d015c9c0c4mr43627675ad.8.1785256645434; Tue, 28 Jul 2026
 09:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-3-ammarfaizi2@openresty.com> <20260728094626.0fb1a467@pumpkin>
 <700de276-8949-4587-a853-935dc7c6433f@t-8ch.de>
In-Reply-To: <700de276-8949-4587-a853-935dc7c6433f@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 23:37:14 +0700
X-Gm-Features: AUfX_mwWfHzpzL7Vmi1IA8MN2qfSLLCaLQx7BQcvXqsKNTbMGCEFSoHGZxrEbDU
Message-ID: <CA+KFgX6899SdedfWrYD0aC0wfogjQ=-5C0D8mbGjxAeS8gOYyA@mail.gmail.com>
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs()
 and friends
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: David Laight <david.laight.linux@gmail.com>, Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 11:31=E2=80=AFPM Thomas Wei=C3=9Fschuh wrote:
> So I think we should keep the functions as they are.

Okay, I'll drop the abs() related patches in the next version.

--=20
Ammar Faizi
