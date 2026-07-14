Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C34ADDAE
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046313; cv=pass; b=DhYuFfgNcg9ynlmmNBMYkQtYz6/GXs0hCPZEOybTb2bnUN98wROkeXWQzhlR5fOAhVxWag86ntI5+QKKyKtagj2UUYomaL/JSW+SwH0Cx98T2pYc2i471vAzhlQAnIy3aRU10F2WVcormbyowrtbU6jA6XqcY5vfbfhY+5sgJKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046313; c=relaxed/simple;
	bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/fx8cHjHJLdFit/8QfuN2oum6MsGvCFuBB5ucD7u2Th4c8TSlmLYMaup/SRO6Jm0JTYsztoed0mFZC74ZeuX/PURGuj+qWofyccw0JwEiGe59aM52kqWr4tpJBHOZt+bRo2ygHPZoU05LbAxET5q/kIstCWxL2dqWiqPbD4Nm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kD6lO99T; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kD6lO99T"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so41185891fa.2
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784046310; cv=none;
        d=google.com; s=arc-20260327;
        b=e1j3rJaMLJL2mW7yfwCZ2KPiMIHp/DHlCS430yatiZMSJ4B7Lt4x28PYnORyB7MLnp
         7gxy9LWLsMrtlodrm+YcgJCZ9kBPhp7bxmqJI0WIQSwhz/L1TLZ55eLM9lW23BqhJZog
         HTMX29obQuiEmFZSDnWCOwFRs+ZY+hfvj/RCz1JyH/oERbXPWqlnA4xCnEJNQhjuNTr6
         KT/7ltcTAR7KYqIYiaT3pCgvjab7EP6DkAZiRDxwkBoLAOS5pKKVFIVLABFPqp3DQHqg
         d6nW8Xv8aPzNgVY18NhDkroBgZJo4xEgaz/EUhx54ThByoCffo4QFkfOjYPq1uhy/Tht
         ISbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
        fh=5cP+fHiTgCa3RXiYPmON+BZXtm0M4xTkE7hSLlOvHEI=;
        b=mk15JKG/Raame5U4qwEdiPYf/roeuZ73376vWk+iGrsjnGfJpPnNA/0YxVFoAEPt1M
         gy69gu8HQYfFtGhycG47i7vs6ZerH3dc5r64YesPR8f/d1iLuCeSUtd3grzAgpqX10Si
         exUhhxuSVHfgiuGknWHb5bJs7GnO69oHZyA2SzdBmKIhWk3vAz66eSdi0bf/BoCXLxqi
         ZkEcuMNLQAMjhzD3SD/yMzALSO2TsvMbZTPd1YjUHDSQPzCSCPHlikYZ+fWBr5uIO96u
         X1BOKeJJAqOZW/5XfNK1jNmCqaxS+qdjS156oeesiFpZAUYd2xfh5bp5XJv3CyIIb5l3
         dhrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784046310; x=1784651110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
        b=kD6lO99T3JrXwP7P0zXjB04G2PCXBsYN6hCsKl86UsRhr5MNISngfSQ0vmxTZGcgPw
         wfLFZaFV61wghl0J+MUaliXtVejWPtw6RQrsbTT1bDABsfvCumWPUdlMv91srzPU05Nz
         peCRpp7LYyT7/KIytdWocxPJjWStnswwogjxf/p9JgDVcTUfCT4Si6IHUPGGpzfLu3UM
         1vSrmCiUwPb1ZqmmKwjRdPq7RIVJsTnLej3hMPGQGAo2SadaWtPBPEjpVQISR8OKjFLb
         YXoVt/rjS9UvHnrU59EmSHpDvzb38743Q6Ki5PRdGjm6bLGyCZs3ZgdT5p6dMAn8ae++
         M14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046310; x=1784651110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRKWE3rM3DpVZ9KGKfZOkgcnQ4/sMd3C5C4XI1BwLag=;
        b=Q9YOwvkXG6MJ6C5vxyM05RBeEDCJXer+ac2AON9KiJ/JF96NBl1c8tWkPvxHdJ/0yD
         FwZrsoX4LOQrvU9rW/XEUcTwCQ8rZRuXMmcuFLcqtGca234QBSn3AOppMbL+SyMRgH98
         /IMceVGs5Ed5IPTp4ob/OQVyizYl22xP7RTHRYaSS2KOYByMdtXuw1ZdkJKZXyOq3RmJ
         MVM8mvVehvFOoDNozfKKa7zpTvplZxQLVsOHkfQG1FOHrqe8tQNPi9/bWYTZmG0lsT5n
         /qN94VgUF9oGtQR/oCuBfg9/xPRBcXDA5867MEr5NTpSM6DnbK9Qz83oc5KKKPoHq7J1
         03HQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpv5k7QtVW1D7+dcJZuyh8YR9GdJnw4pSZXSeWHwSSHPfzK4iT9eu72Xt+mWp4iAuPnnYt@lists.linux.dev
X-Gm-Message-State: AOJu0YwpgFjC+pe4Z6AbICWFilxe9kPa5xMQsULkFqtYDiE+X/YHQJ/a
	vW/29wqo/CZD4PAodmbCqVh0ZZdEYIVlur4icGKd4iJMnmegLx2QJHEBSC/rvGcclC0NSmxBBdq
	PTkOvsCw9A4pHc6xRwvM7HDcHZjlTIcV2ztOfricN
X-Gm-Gg: AfdE7clL2GEsemASV/K0bXN8v9cQBf0d6oghn4JxKhDNU1e8FXJDeIsUPO5kDVSkIws
	2ry6+Esod3cxp6AzpmAv74FKwtybJWs+AhCUCKRwZimkplBDMUbmDZhpNQWt513socpTwlRny/+
	DQ84a0msyWTd9hMTImizTNwlv29HjcibIUPlE7QW4CouLGpwcbNqsqP/og7EWY1CsFZx9QSMeN2
	D5H1BaO73a3xhFbgY0PCukoE028X8oUwQ40+oxz5errK8I0E37fYsOt9lb+amw0aadQi0r0
X-Received: by 2002:a05:651c:891:b0:39c:7922:b43d with SMTP id
 38308e7fff4ca-39dadc1fddamr5555901fa.13.1784046309897; Tue, 14 Jul 2026
 09:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706183154.2660394-1-dmatlack@google.com>
In-Reply-To: <20260706183154.2660394-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 14 Jul 2026 09:24:36 -0700
X-Gm-Features: AUfX_mzLDP_4rVW7KuKXw9WbvqtNEnT_4J6faTgqP-IEY19v7FHPuva_xUWrsYU
Message-ID: <CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects __maybe_unused
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 11:32=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> Mark _##fixture_name##_##test_name##_object __maybe_unused since it may
> not ever be read. This pointer is only read in XFAIL_ADD(), which tests
> are not required to use.
>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that causes this warning to be
> emitted for various selftests and can be upgraded to an error in
> selftest that set -Werror.
>
> VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> selftests: Add -Wall and -Werror to the Makefile"), and the net
> selftests builds have been noisy due to -Wall.
>
> Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked p=
rocesses")
> Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Reviewed-by: Alex Williamson <alex@shazbot.org>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Kees and Shuah, is it ok if Alex takes this through the VFIO tree? [1]
This fixes a bug exposed by recent VFIO selftests commit ff556bd98348
("vfio: selftests: Add -Wall and -Werror to the Makefile").

[1] https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@shazbot=
.org/
