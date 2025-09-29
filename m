Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797E2EAB66
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161530; cv=none; b=tzWJmOG6yvH+0ZLzvk+igR0sNmJ2P+l8VD9Qa1AaddrlICnlXmBZarBWo9dgOihidz7pjFOYMLg0nFUJM3l22fQCQVxhOq7zrN4PbzmsKhBT0s7yzSjZCiNpZ3jlUmFCQt+IrMhb6q8hJeAC3YtiCTzD8j9blfy2O1fyVIZgtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161530; c=relaxed/simple;
	bh=KP5kx0VRuRBxNT9JPTkeTOUgylYmXovvWpGXUsY+dqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHzddW5bDGDf8FfzZvkWxeq4TQnxd+e5Sy4gWgb/IuvV6Hl4HP3wEwI2imZ0p8lQbKnueaxhbmh8Gw85diNhFAPtVM1hgHhpGTW7IP7DqKWWiujRC/if+TkZokCYOgh/CvIslmiHWdh+NT74MpNAuptQ6C3vv1HHct+ZINFiuok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMDC65IJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMDC65IJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2e0513433bso792913566b.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759161528; x=1759766328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KP5kx0VRuRBxNT9JPTkeTOUgylYmXovvWpGXUsY+dqk=;
        b=GMDC65IJ/b9sq/jx5c7m1N/jGgDMp32LKprqR6cOtOZwKOOiX5nToxpStRg7Wuai/Z
         LvjsUVFLyyItK94aKdUI1Us+yS9AoyBVtDctydEKyuKQkF2KS1dqk4fG3YBY5mOQrDrH
         ecLGrcLvfIdGL3BD7bik4jQ6dDegmTRmcgBS0qb+g/m1XJTRvcZvbRUYbwqkk73BiFDf
         WhI+I2kITO1TAypaw4tWqtCfRp1vNefbLxNPM048BouAK87dY10FdR0WxAlEnTWNz0kp
         pOaBkuRHXMz+OMpwavJNq430HYO4lVWTW9oL1+1PM4vGd56CBHCZ5hVOgRgfE90pMjdw
         UaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161528; x=1759766328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP5kx0VRuRBxNT9JPTkeTOUgylYmXovvWpGXUsY+dqk=;
        b=Ty+/fSegH3Myy70z4uvD3EoS/YQ7zgmCoOKHdbS3AklSQfcDhcDkxrS7zSZR/wwqSx
         806CeAsi2mXsTbTP4VF01tKAolT09cWKtKK/ela2fPipz7shrRIrkaXu9k0q2CbxWPMM
         XMuteFR/nISJfVLBJnqgQsN7GQ7irJIufj3TdijrA1a31wOE8I8pJJvHW3AskDAsWlPG
         HV1Sl4S1tCiVkssz/D5FlVWVF6g6e/hOlFikH9p9ffx9pvDO+hIdU5AjhjYI0szR/2S5
         b/3AGqUntfR2O5oZNW4Np1qBXHqJH8GSpXodylUrNN0JWZ744EzHK3g+1yGn3t1f3bZq
         grbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+K3Fo5zmYOKEhdVDR+wPoMDspIzDrOW2oj8iZQgj2Vug1V/NKks0uNbfufAdcbhHwf/rk@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4rbOCAf4qI0H9p42HPrQ2DM/RL/s6aPgP/NS9DrR7PiAuzTkm
	AgX+5sBWUygEBw62wZjhY9Mdnm6lghHIZ9zbVNBUo1YKjCjVYduMb3koMLd3+iZfEDFEd9ilyIY
	nKUwFcUa19tPl0xwI4WqEoRnU6giw8GM=
X-Gm-Gg: ASbGncsLnDTboVES7mVvXJ9Svmj5kn7Wk5CGiCiWeXUddtdwYGvSU2erwns0Fq13BDR
	ZGT3bACXGL7YPCAQ3D+KpJrY5G1A3TI/Kv7vz/2M5iCrrtvNPAZ3jkU2C1QV92qOInHIG1CKjFo
	da9LGkuBv5KDrk1brlDbzLWRpRf6TZWvvznmDi8NA+y9wURl1HD7hjSFgxhSznckoZEk5tF8k8Y
	rzKWA9DRzN2RxBVrymMHeRnS1C3oAggS2gaqSCmqg==
X-Google-Smtp-Source: AGHT+IEyCADO6J8WiEBVdrcDX+0EvoZzPtvlyZ0fcAEpiz0fGzu77FQXIwzegr8XJ0+/55shLRsQasieeKC3kMA42EI=
X-Received: by 2002:a17:907:9706:b0:b3f:6e5:256 with SMTP id
 a640c23a62f3a-b3f06e527cemr412737666b.32.1759161527436; Mon, 29 Sep 2025
 08:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250929114356.25261-2-sidharthseela@gmail.com> <willemdebruijn.kernel.a37b90bf9586@gmail.com>
In-Reply-To: <willemdebruijn.kernel.a37b90bf9586@gmail.com>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Mon, 29 Sep 2025 21:28:36 +0530
X-Gm-Features: AS18NWCgnPycz7t2entTrmTu5YC-DafC0Q0uYk2zgNL_KC7OWEjNYY7xyUDcjPI
Message-ID: <CAJE-K+C9_En-QWYrTJmMH-H8CP_1wgpREjFst1ybiE-bJtF13g@mail.gmail.com>
Subject: Re: [PATCH] selftest:net: Fix uninit pointers and return values
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: antonio@openvpn.net, sd@queasysnail.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	kernelxing@tencent.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 7:49=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
> [PATCH net]
> and a Fixes tag
Thankyou, I'll add that.

> Does not need a fix. The default statement calls error() which exits the =
program.
> Same.
Yes, you are correct.

> Agreed on all the occurrences and the ovpn fixes.
Alright, I'll send v2, with improvements and a changelog.
--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
