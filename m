Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9A916D9C9
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715108439; cv=none; b=lWwkO8GQVJ1WRI8TV53ZOtRWCqxuhdw1L7Zrx6ufdlcGjism9JFlcxo6mprdKIFI+9YvpSiy9RtNUPbYkqLSx3KM04lU8udRhbvh1XId5u6hLWdRlTcI4eYmJB4EMST8XHNmMQbyLGGT83ge6qyAI97CJmtG4hMoAfHjXp2nHz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715108439; c=relaxed/simple;
	bh=7s3oPGkGLzvOuGWVPAZcFf2NPdjW/ND+O4YOkgFBmXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKoHz4ir537Io9h5a4pPIG5N5vIbeqe9vO2rsoAJEnaTQ51Occ82lo8IDwdbi5H2G8X4bR9GeksS9sNdqBb7HEgKANYl+1kHFkwsj7TjHGiJiuik0P0GSF8GGs6Drp9oiqYYewqQLKGmwzUuaTsV2yV16bt9L3KIIBoRJ8KDJE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0V2nDdrx; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0V2nDdrx"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6001399f22bso2604147a12.0
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715108431; x=1715713231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52/TiGb0pRp1cCi0WAvKTSl0Kx/3b9XgA1N/tzA4luI=;
        b=0V2nDdrxVpWj/XiJYofPfntzTv03lOdSpaXeOUR3c/CsL1ZDApc0iZvIGCL9Cam8TT
         TQc1T0coufjdBFZUXV88wPPcKm88T6jimUEOTD3nbG+Nt1VBCaA7Dqc+nZz8srjwoQ4a
         V7TYFCSVxl3hRKuwQNms07/DIiWA8s0igAjfNvpOmxtGGyGdy7kcrhwTVvPRwlYhGJHp
         7ZbZrLfR7Gw0pDOQkHjIQ+P7GIBBnGmzHFWaHgrK5jG7GkrWTEfMKl+tQIePlHF9cTZc
         l1wF/sjz/+bLL6Kjf8UJ9bIdY7g/XF0AgfqbK5Ch9oOpRInJUPGxCLM3gwv0grMiHOTh
         fglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715108431; x=1715713231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52/TiGb0pRp1cCi0WAvKTSl0Kx/3b9XgA1N/tzA4luI=;
        b=okM5rYzVfHzF69OB1VIC06v1KBLUqXwSGQb/JwH83HDi5M3Um9GZTQK9QdyMmOdeWK
         bDfXgbJv0dRtu/6IrGraWWHvLSGWhJ4jPzZp0CS2bmimqjZrhfEDBY8bG/3WoS25O4oN
         izfEJoo0VPAGh7tLyS5MxNQ76YqCS3fB6X8nTbg2ZutlWeWyIvSECjeUxiW8Ijb9iPMk
         a4L+kPBw1sa+TMIpEtkGybhLoTATJ3dz4d/tTjtKHg7AGSvlYZuqtfIfqrlbAJV5AvLo
         ChlIMllsYpcW+lZRZNp7cE6XHNimMqFNbmDwQ+U5I7lQKMxSO6WrDJYhKzj7m+bwaj0P
         PRWw==
X-Forwarded-Encrypted: i=1; AJvYcCVBmvpRdwJ5TBd9KJaTzAiPqM0HaQo+GXBM+iszkKhzaAQ3XiB1ht20p42ZDsc3TOoBsqcPubR6AiJbHimN51Bc4uF7/Q==
X-Gm-Message-State: AOJu0Yz1MqGD6GD6a7CV0eMxPk8Yi4RMJ+Jfbkn0HkUbVY2sJp9T9T8a
	cpDZ8x4gFE0LW8Ar21GqFJbiT0060TV8ihbw4U1XACmQfUpkHZxcFC+zKEvMGYIYq0XzJnrOc0k
	HAdxa0F/pXlT4/QfkQYsm1l06dkLv0CCyWRDy
X-Google-Smtp-Source: AGHT+IFdufqWMf0KRyS6ONQjfkqedO80otF+5gAkHmdq5Jd6uIJPgZyn9Nvw+Eax/axJml6eRyADco7/lvarEj7yCXU=
X-Received: by 2002:a17:90b:4f46:b0:2a2:70f6:8f67 with SMTP id
 98e67ed59e1d1-2b6169e318cmr418365a91.30.1715108430851; Tue, 07 May 2024
 12:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-gve-comma-v1-0-b50f965694ef@kernel.org>
In-Reply-To: <20240503-gve-comma-v1-0-b50f965694ef@kernel.org>
From: Shailend Chand <shailend@google.com>
Date: Tue, 7 May 2024 12:00:19 -0700
Message-ID: <CANLc=ata9H4ZTN92MhQ+P5bTBo9grE7sP1_JDk5MdzaCOhXOGQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] gve: Minor cleanups
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 1:31=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> Hi,
>
> This short patchset provides two minor cleanups for the gve driver.
>
> These were found by tooling as mentioned in each patch,
> and otherwise by inspection.
>
> No change in run time behaviour is intended.
> Each patch is compile tested only.
>
> ---
> Simon Horman (2):
>       gve: Avoid unnecessary use of comma operator
>       gve: Use ethtool_sprintf/puts() to fill stats strings

Reviewed-by: Shailend Chand <shailend@google.com>
Thanks!

>
>  drivers/net/ethernet/google/gve/gve_adminq.c  |  4 +--
>  drivers/net/ethernet/google/gve/gve_ethtool.c | 42 +++++++++++----------=
------
>  2 files changed, 19 insertions(+), 27 deletions(-)
>
> base-commit: 5829614a7b3b2cc9820efb2d29a205c00d748fcf
>
