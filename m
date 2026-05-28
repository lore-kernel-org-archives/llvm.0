Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E75E36215F
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005129; cv=pass; b=HZqxsKh/i3pF8uOAmDxCqwgS5bl4Texd/sutIR3psnlpU6eAj4WGQy5LzIOJwmsdzCk3RkDsTW20Kzo59bGCR2B+t1xObMHumlK7Ln9eXkO7sbaEcfvqs+WJ3sYLrCHFK0NLCYp2tX0PsmyUVJkk+Zh55wfLmKJ5wJmgnaE6xfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005129; c=relaxed/simple;
	bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/Hy0fozelqf2XRikEAdjgvJlSxVIsFp/tVl4Oreb35/1rvYjr9lkruQBNEzDcPR7rrSk9BS0lfT0NkCMwDQstL6k+uAlsig5cF/IDI0/79AuFekN3pTW72uazLG72cp+Yfox7S1HquyZ7bz0DjzLNgSrAM7pBbnYu8GZsFMTk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG2pgxWi; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG2pgxWi"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so1074993eec.1
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 14:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780005127; cv=none;
        d=google.com; s=arc-20240605;
        b=OlxmvWcJn2k/7qh7aRFJ2zTvhmg1vAVtJ/U9EF2A1OQ2SUnGsQ1P2pXVx0kT9SuEq7
         6/fNSdMNtqBrOyH0Sbgas8WxCFNdfGmBwnz0AQzLbjuZuCYJ7AINHYsSPGKGYAao5yfp
         7afC1O0mTXlApdW0nNwNXru7a0V0FNZ0zUlE239nYKPvIaEIjz52Z+0tU9LYVpG8m4nf
         uybt7wrAn0wWq4PwCdj1i3Jl/nACSRqoiky5QLyMUxF03BLOsZTPF8D4FnkW8N0JtGUC
         xyccEl4WVo/pwoHkbTdlx5p1Fjum2MuyS7muM331u8iuZFToYX73c8pVat1ZHYpxqaBl
         4JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        fh=l+82PZQLp40k1xbt4Guq/N71to3LG1JtipZGHjtU2zk=;
        b=PYwJNMBbuyxWWNqpK1S3KP+QJh5Bg4wpURXlitD17dEAr203VJkK6Q13j3ltNSO3S3
         nMzAgMPy+Es2DGOGvARGdV3Rfwhe/Ll2M4OVEP9r/RCAw25zss/qZmJ/VeexJPFZVLkU
         Cm6ExQihvE+c5GkKtnYa1BdhmE5GE/pAEZKFSwhaUkF6im21XxHaC+cYQj8o/BzuA4l8
         NCaeemsNqdST7UEGfM0F34bpQ/HuhJMleAZfAxmeGcQzG8p+BRP/wUAq6d2s5PY8iiDf
         tFkG0v89w+Bc0OTY6CN8EHRnT+/aDw8iIN2kSwE8lI/wWppH0FWgtttwyHCQq7Vr6p9D
         BMXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005127; x=1780609927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        b=WG2pgxWixG9h/Hc1BqWtCdxEHtwhXGnEQ5opARKPSi88/D7/5KN/eWklo6VClIYl0k
         tP88XAU3ZO78e1lXQH2/I36OoQrzWJPjJo1L6+4TI2UO2O8pAfkyi+fuhhONsu63Au8+
         idP97Oo4oEudxw/rw6tOMXWONDv3byENGiLMDNesk8UBkA1iEKG764ly04RtNXex/IDN
         bQXE/CNc8L03MzXPFMKrU0SlWSHRK3LJ/gyfYhln9WUriYRvkTTYeFkj1bCSce6sRg2e
         jFYjhhTdYUr6qSvPiWHzD07Q7zgyOCm9sRjgS0EBOi071I2mrx7CkPtkSikIAzTgBVDx
         WLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005127; x=1780609927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        b=WNjfzUC31pDbzBSCpQ4JsROoUovOgSTqr60XRIAudENe3dxOVuL9is6Z4X5pnUi7OI
         AmwsLQDcxEjh0fn76bll1ZX8zAJsLR80QMQZOjVWDVBlUPQ/GlLK/T3LOWq1i7jphai+
         57zt3ZUzP1Aj3LD0d2FozXgLx0wm2x8Eo+5jZDZVqg7EDvs8qv3QD8a21jMj3GoEQj9Z
         t62r5d/BibiBpb0h9ckRGKXj3iBz6rbpAdSCzTwPH+C2dWos7m73JvqbzDQPQ1pjjfA4
         w1uBV2k825zOBdDByD68oS4WJBUtkHQ12yzjQmpujosH7kGyVVypGQ68ySxAc4F/Z97U
         K4Eg==
X-Forwarded-Encrypted: i=1; AFNElJ9Yx3XyYYiewrx3uu6IsX32ofVq7sWUx2+SbH2ISKxVNAvflyz7QnAasAbdBi7WexQzTbbX@lists.linux.dev
X-Gm-Message-State: AOJu0YzjqyImMhCoYF06D+TcnGJm5Op3mnC67hdfIFJQlcZ2lQ9u21Sg
	5wHOKS9WuAqkThWoaGJMGJwkJJBDDFTi8c5+EWEj8Thdtw7tT7mygtFW+z3ZzFlcYE2QiVIYmEC
	dPTiFRTt4OEifsQdu+t6Z38ExvXVHH6k=
X-Gm-Gg: Acq92OEf4xxCf3pa/5aGPvflmCPQk24iS7NUgCpdc/CJKjXW+rLsCBQebpfsyKZfHSx
	7eZoWEZ4X19O0wz7EmqWTrRwj1R6HUWuMZuclhyQon0UEmCcKP/dCySlMerX9NZY++gwWehmAX2
	d7YwV8Un6B0M+tekeekVieohydFov/IzwjQrniQwJQ4ntmwHBc8yB9QtabOZX7JyJYx1F6Cff5U
	fxL3lw8nT9ivE0XT2cieSB0xEFLELARDPm+71hF4XaVGj2Ey5KGfJV0TbqCbeN3FuUKVvixaHt9
	DCRS33vvQL+9qyg0ElkD7Oua4Y+4iUXi7MAI6PKb/yooTWlpUGxzPUQ1ejwMfHyTeBfSukSR/xE
	0FUTzHZkggBrASHcYEklxnksQnThZY2WJoA==
X-Received: by 2002:a05:7300:a984:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-304eae25163mr79142eec.1.1780005127399; Thu, 28 May 2026
 14:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 23:51:54 +0200
X-Gm-Features: AVHnY4KsYVj2Jopx_r3QMdCgeZbmquWS2iLzmSMqMdc_bkNyvnbcslo9ojp-pAQ
Message-ID: <CANiq72=tdv2xVLnXaYuvOLXkAYBdFnTFPohKxb9Tc-3QC0Zs9g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:41=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> change-id: 20260528-im_back_baby-1ade32dc049e

I noticed the change-id -- welcome back! :)

Cheers,
Miguel
