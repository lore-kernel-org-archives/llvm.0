Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D9125B3
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 17:29:55 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-403a3df88a8so33463961cf.3
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691429394; x=1692034194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s8Am+NuCF8QWOzKex4jmoxA1gAih8dsglrkA++VhjHo=;
        b=D1t8IqXcZ6X/6+kjvndB2rmw8GHobr/D4q0HEp1VC842sFBu6ODSwWzCepiuiLojWa
         xXhaj9kLT5em2l4hyqRaY/F63VzICNEaO3U0ZpRx8EX3D9Ue25Jv5YeuP5uuaZtlkk65
         NkcSFmHZC6OcFbhJgwQQOwyKDkZpDTWr5dQIGeHB61JUzBcjrg/npwCyTjaABiSlD4e2
         b5zmj6fqAHMgcRpGGkBVCiKX4nq4X5dKm4cme6ts//af1YG5uggXAaDc5qvzvAAGgZwQ
         m2q2NUmFQZ4CScGlT1AwbVJFdXcfejC7RpQkh4WRA/t2UDGMViMv2M+AiR0maY5QSjFQ
         Emag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691429394; x=1692034194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8Am+NuCF8QWOzKex4jmoxA1gAih8dsglrkA++VhjHo=;
        b=DV6jOtfaCQB/YLYzi0k5lFM5zbloO9TXFtJPHkX+uJyxtd3MDJfiE91RajHkNK7wlT
         NeEPy55ZQklg0zz+Pa2LIKE/VEOx7y7EXY/rOxuG+7r3wzkKU1q2BwTrn7RkpkG1DwwD
         PReZR59k+aXLw/SLLO3Qp0O5kReyoivUilowAWU6aQpQJnXBrNwyBJVSmX47v85yU5sr
         dFZ9wMuEx8bJBzZGVsT2PqK1V/ixed8U4iIs5RPaLC40hTnMasl+aSxUCSCMmCzP1Aqv
         Et25PKrAvJgCBkhjYgQ87e/l51ig9ohX3mJNuhLAr8xgiA005Xcj0Wemd35Nt9We22yF
         M0Ww==
X-Gm-Message-State: AOJu0YxGkkAygwm+sy9F1JV6jcMmU+cD9G/8O9w7tYowLEdrsJu7Ob7U
	hTPuSSvY2CCZ4EtHvHyZawLCwE0Oe4aX+LZDlSj2LFXMHwmg0w==
X-Google-Smtp-Source: AGHT+IE8JXAdZZ2AhJvnTVq38tCiS5y3S8Lr8F9jRzOV7FZBwOTu62PWZj5snMysoZ5yp7eyV6RFDORrEGQ2dRGrHMo=
X-Received: by 2002:ac8:5e07:0:b0:409:f273:e28d with SMTP id
 h7-20020ac85e07000000b00409f273e28dmr14321455qtx.62.1691429394504; Mon, 07
 Aug 2023 10:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c7f1bf9b-b183-bf6e-1cbb-d43f72494083@gmail.com>
 <2023080743-amendable-moonlit-15b7@gregkh> <CAFqe=zJ9uRTVG=jny2PzUrrFGW2E_mZrGKF-3YMRkjzMUdu_7A@mail.gmail.com>
 <CAKwvOdm0Tv0=KGdhVwuJX+8N-Dgx+kzuPy6zCBsV1kOc+6b+qQ@mail.gmail.com>
In-Reply-To: <CAKwvOdm0Tv0=KGdhVwuJX+8N-Dgx+kzuPy6zCBsV1kOc+6b+qQ@mail.gmail.com>
From: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>
Date: Mon, 7 Aug 2023 19:29:43 +0200
Message-ID: <CAFqe=zKdcOQpBFJXtjWUzET76mzsLE5Qu6jr_cRSsAeccmTEcA@mail.gmail.com>
Subject: Re: Fwd: CFI violation when reading amd_pstate/status
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux LLVM Build Support <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

> Can you tell us more about your distro? Is it public? Is it built with clang?

Hi Nick,

this is Gentoo Linux, one of the oldest source distributions. We're
also the basis for ChromeOS and various other niche distros.

Gentoo defaults to gcc and glibc, though we also support clang and
musl (and any combination thereof).
You can find our compatibility tracker here
https://bugs.gentoo.org/408963 . You can also find us on
irc.libera.chat in the #gentoo-llvm channel.

Best regards
Jannik
