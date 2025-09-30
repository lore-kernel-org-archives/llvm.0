Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8AE261B9E
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759225640; cv=none; b=MWzvwxSnI+zH9YaPwgeMHDgvGBe2/Z1sRzpTD4n+cCDJoWJtrs472w5DMc86rQMp92kJOs/lL4rpI5spEX41n1+yL/xNECO7OVI7Q3lfu31Tjj2P31Iyt1nUHZ4X8xFTJ7y2/H1/zKZaSf8cXgvCB5GIRN3vq8X5EOAq+GDcP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759225640; c=relaxed/simple;
	bh=R5eUE/k7fr9cPxgmyCPHZN28u/hmGz9eGDjEvMGrQ/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOA4Lrw/GpbzUMVsIS0it/g+nm6t8tjzMieFqP5W28a+Uxv0hUfiwpGqEpRUVB97A8d1zOuG+Gqm08JtSoKciTqS8aJ2kRlR0AOfOEHkuJz5LXj2dPV4pj1wSM8yRrVJELpOBRVInZBL5UrrM7aofQZxKp0d/VMeX9iFw/ft5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D72PFj8j; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D72PFj8j"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso10168632a12.0
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759225635; x=1759830435; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PECcxxgPrslWjdZF9hdrPJ/fNitPu9//arKK4RLmCMk=;
        b=D72PFj8jxcla6ArlQ7gfgCgkJyCdNWCwj0yV+Y73FgIyCOYH5wd7VbZ2bJf/ZPBC/U
         kZ+1Ew3Ri8KiygdqPxtXbOA9qPLld+VUt+q1tOxJ9vOf3mo4617FDyLb6z7hcScKehZF
         zffnzJBHncqXUVxxQmd0pviUdM0tZanXS6oIOft6eXdt1vNwDj2yaVXjAMGaIXkN3Oyo
         47gjs0f/ONqkFHyZQs2caHBm2cYMLAI5XXiP7wgZMwIWPy+LGS2zqn5aoU//bEJCqdAB
         qc1bni1LBY4p2E6yUckSDU3GzEn65hzNmRXOy/d9nqVVJFqjg/F3B4JnmGk2dA8BeN9Y
         lL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759225635; x=1759830435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PECcxxgPrslWjdZF9hdrPJ/fNitPu9//arKK4RLmCMk=;
        b=LUK+VMqxxASDBRsDqYzISDhlbi6+pyXDTWqHy7qzF76RMhAzFlkGPXfvbLaqeesU78
         mfrnWlxuMoXbQzZz3oRQO2+v4CDU3JOZBfC6X8XQ6bX7+kr7neBqP/FVPE/+vQ9HtWdC
         qf5bgeSsf6OcRiW/ts8v98Jd+xjfjCkX7Am4ooh11Js8+QTCKE7YNgjXNEefkUy6tukJ
         0Jov2ot8WwjmVfsKigq4j4Gh63hLeSg5TyZisYgZlerQY+pIqz0pHKbfQ5ftopBAuBRc
         T2pSUKGxH4amLOP8/VPhvUCmLj5KdyqSwxbYnlFLhgeWqsCCO1AYHsnWrF26bxg1BOng
         Zmeg==
X-Forwarded-Encrypted: i=1; AJvYcCWaxlt8sTKbbUhamUUejMcy8YoHpJcmMZ6uqeXbloglrk26sSmiEmIB9pYjEKu9GH/L32pH@lists.linux.dev
X-Gm-Message-State: AOJu0YwjztZXVj4OPuKIxHS1Pwm52ppW8lQpTrOshZMsHK46fCd1kOZ0
	NJ9mLUnM5FbD6QGXMfLRLnDTFzCp5irWQa/pIU2Nvltql5UhwBP/c6wf71o2k5cZ1d6wi1XP5Eh
	34JD9xccSD6Kh9PGrYeiiYSeuo+lBpZY=
X-Gm-Gg: ASbGnculHQf4domYuh+XNYPJ5p7Yt7Ls+y5ptnnk0PpT9WmDldvPdq1mXq3kthxsaqz
	1/qv0cgjkei5HPqDgBVTRcKbaUUSXzkOCfPWQXfo8J6QEAhTl9rorpUsEX/Kbl9J8E/1lEJ1C4r
	z41OtaQJr0di5cuFag/Hi9sSlad0ZqLSrmHc7FNiOSViVeE4YVXUH/cqZFE0qhnXsw6EgCeNg7L
	DnhdXJS+MD5x1K+eMSM8U3rQ/YEBxZRCAqHEpEzdvtSbV1q51oeDaILUHnrGPk=
X-Google-Smtp-Source: AGHT+IHgrTWmNMFFHnfd0lj5oNhgsomsQpL15DJSD0/eU20JCLwROv8mnCSGOX61iu8gWXio0owIt1z4w1bbdeC1XZM=
X-Received: by 2002:a17:906:730c:b0:b41:27ca:6701 with SMTP id
 a640c23a62f3a-b4127d9aeccmr487703866b.24.1759225635179; Tue, 30 Sep 2025
 02:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250929211241.55701-2-sidharthseela@gmail.com> <aNueLn3Wy-2X_GeE@horms.kernel.org>
In-Reply-To: <aNueLn3Wy-2X_GeE@horms.kernel.org>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 30 Sep 2025 15:17:02 +0530
X-Gm-Features: AS18NWCrQTE6adq-xMOBGkCFzYdqRGqDir_x8mhokUn4KGXncQ46nLQvKyPQ23k
Message-ID: <CAJE-K+AeEYkAN8wX3FbBCbQMGTDsueA-YiC4w_qi+TZgUzkS-w@mail.gmail.com>
Subject: Re: [PATCH net v3] selftest:net: Fix uninit return values
To: Simon Horman <horms@kernel.org>
Cc: antonio@openvpn.net, sd@queasysnail.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	willemdebruijn.kernel@gmail.com, kernelxing@tencent.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 2:39=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
> Hi,
>
> I don't want to block progress.
> But there are some format problems with the commit message.
>
> Locally, git truncates the commit message at the line above ('--').
> Which, omits a lot of useful information.
> Most critically your Signed-off-by line.
>
> There is also another '--' below. Just above the fixes tag.
> Which would cause a similar problem.
>
> And the v2/v3 information should go below the scissors ('---'),
> below your signed-off by line.
>
> Maybe the maintainers can fix this when applying,
> given how close we are to the pull for v6.18-rc1.
> And that I believe there has already been some
> discussion of this patch with the maintainers.
>
> > ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenev=
er 'if' condition is true [-Wsometimes-uninitialized]
> >  1587 |         if (!sock) {
> >       |             ^~~~~
> > ovpn-cli.c:1635:9: note: uninitialized use occurs here
> >  1635 |         return ret;
> >       |                ^~~
> > ovpn-cli.c:1587:2: note: remove the 'if' if its condition is always fal=
se
> >  1587 |         if (!sock) {
> >       |         ^~~~~~~~~~~~
> >  1588 |                 fprintf(stderr, "cannot allocate netlink socket=
\n");
> >       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> >  1589 |                 goto err_free;
> >       |                 ~~~~~~~~~~~~~~
> >  1590 |         }
> >       |         ~
> > ovpn-cli.c:1584:15: note: initialize the variable 'ret' to silence this=
 warning
> >  1584 |         int mcid, ret;
> >       |                      ^
> >       |                       =3D 0
> > ovpn-cli.c:2107:7: warning: variable 'ret' is used uninitialized whenev=
er switch case is taken [-Wsometimes-uninitialized]
> >  2107 |         case CMD_INVALID:
> >       |              ^~~~~~~~~~~
> > ovpn-cli.c:2111:9: note: uninitialized use occurs here
> >  2111 |         return ret;
> >       |                ^~~
> > ovpn-cli.c:1939:12: note: initialize the variable 'ret' to silence this=
 warning
> >  1939 |         int n, ret;
> >       |                   ^
> >       |
> > --
> > Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for =
ovpn module")
> > ovpn module")
> >
> > v3:
> >       - Use prefix net.
> >       - Remove so_txtime fix as default case calls error().
> >       - Changelog before sign-off.
> >       - Three dashes after sign-off
> >
> > v2:
> >       - Use subsystem name "net".
> >       - Add fixes tags.
> >       - Remove txtimestamp fix as default case calls error.
> >       - Assign constant error string instead of NULL.
> >
> > Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> > ---
> >
>
> This is where the v2/v3 information should go.
>
> ...

Thankyou Simon, I didn't know that double hyphen would cause
an issue. Although I need a logical separator between commit message
and warning log, may I ask what could be used instead?

--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
