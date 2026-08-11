Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A837A842
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479728; cv=pass; b=hWowpbP7HQ287vcq7i1lIKXKPTNINZ3h1tIPfuG6IT9IXCnzi4ux/zWmnwnB8eO/BW6oDdep4+2hm2WVhBMqiLnxdsaXNUlNJ5yuMH9zrn5nl3GZy1Wq2De69aoJ4iDWXtBnOR4I6DA1cSxm7J0+LJ0qWC9MiGH5LmOlCxckjZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479728; c=relaxed/simple;
	bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clRzJ7DkkkEpG473kSEtBVwKA/KudKL7TEVYCR2w7EZdGgdf94Wcy33vap/WoGK6vxiXOLwjQrzXLyYNhETqw8XYlUjQzAXb0Y2XjUzVCf6UgpqX08Cw06rc+WulA3QRY5l8mVsBJV4AxenOEgWEHCLi6dqukpEjY2lrhtJqAVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qY4Tejb5; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qY4Tejb5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3811f512167so177264a91.3
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 13:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786479726; cv=none;
        d=google.com; s=arc-20260327;
        b=hS8SVm6M/c0viuu1E4gOxiT81JsVXVSgGs8fzuKcm20qNKiLa++iFQ0wYEte7AiHK4
         tY+anI2fgvalZenbzVWu4SefwM3SQDkhaW6HuYKTOOluHVapHf8zqqdPLzpFkveQBlx8
         sM4hcNJXS9FtwhVMmto8SPNN0/NOH6cy5aiX/x3JU0cMpSUI5upQ4nwmLoW5DReKOTQM
         BivXO4inqtt+CskSfN5ftkGRsvKd0OC6Ccm4uz5FWjU94EJk/KciTAbWuv68PM43VETi
         YFZuA6BAcSOpwVTbrC/Txq5V4mmCNsQ0A8amlra4g2kAb4syshPJuxXhESi0st9pLNMt
         oM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
        fh=VtE7dJ8b25StsC1hYDoaJeI1J68I/iVE5ObFYsZHbOo=;
        b=P41KsjHtE8t43PLJhEtM+8Pa7+aUBeFERodkonGNl3hpdlYcJIAdQpUhtp/zfGrR5j
         ffgsHK2Syhr9iluMoah8a0iRUmwcEkR0TII3GoN09yy2XGN+3cV/qj/3o1GhnCfXhlQd
         YKYHiEMwC0HdLHyp4WsKHq2ax2vImksuuyYjIvzID9/0Ho/cXPWCjFznv/H/JbcUlxSM
         28mMGfGuGVhROa+ey7B4z8H8hYxuZmh74CFU9a9KOyKLNCRGEHApmHrQxEnNpSsxnEaX
         rb1NObY7TtdEUDi6fjIoyb7CdGJK4oi0990KPZpxBo9Tv+Mj7Lh+ya4D+SOHe2xyuwX3
         Ef7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786479726; x=1787084526; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
        b=qY4Tejb54MwOZhvsuO7E07Jwy8aWZjS83/7+JbquHOKlMjtOPrlkH/ITkduLIo8DdP
         v1Es+5xWXGKndaF/1wL1/H4qDF754BtShvREZ5BtllV/o67XdRT5cGJLUpmABotoQa0Y
         Ulse3qxsgvSbVjzEaTBlXgCX9I9HYQvcW0bIMD513tK3hQ7iItp5lVucX5YK74EFsa/s
         Ih7KNzoe/VKUsfBB22vryFmSRpp0IXuGEAdGvujllrzNh0s8nRfVtR6KhouKjw79+h0R
         qsV3srlk1n/LUKDgXHBxs/KOj6c8q7usAk4vr1bvNbZZ/cw/zkPMITMQK95JYZz/Uttb
         GV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786479726; x=1787084526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
        b=knTHtPJ1qZ26SQOo94MaX2PzjxqMjB7rgRbWcQUBT7HgD1N+KCA2WEJwzJCUHg69F9
         t9Kun1kBwFm1s9kUsyt4TbtCcxqa/FThJS8pEOp1puw1ZGt9dJb2GhZajVZ9foTp/6BA
         vFBCDQsaSIUwGoK019V79Qp1SrUNiNn/qlK5LiiNNGOAwqwuAKCdSsYv/zCxzgXHPeOo
         r7NiaNDE2VdAl0ZMA8BiAXXMjggro+3GJHJ+rturku003CKES612Gaeqmqsm+3Q13YRT
         VhrpQoexx5p1a0Gh9PiHasgisWV+HCyPvF90EJifupYxT29xKjKSxwOXDrTOc7mDwKzy
         0WTQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7x5WyKVvEuXocCoOBrvB1id/dr/pruHx3K8dyrV4pnyLt5zAOCkLJdn1CpT4Y6uijyW33@lists.linux.dev
X-Gm-Message-State: AOJu0YzxG2a5WcQN9hRqosxI8srxUANw2FPjoiU9rA4YP7ngjj75Dqf+
	+b853Cy5DfLhQ+B1bl6ScVpc6D1X51zKHEPIBsM9olY0D05em1D7Z8KeO4yY85Htr7ExZxGQOSX
	B+FOFshDgaXncT0ni8Lrp6y5TDwQFI90VVgO5gIND
X-Gm-Gg: AR+sD10w2T5oEW6En/mDUp/IbTMpKALNVuInsh5ml2vrSycBY3YO1OtUsL6KEDfbbz+
	RoJWBHEIcyCHajzFWvBctoajsooBYgutOhkrj2FiYhChG8Uo+Gxtu+liQdF9p1HPfBW44PdeZan
	5Caf7j5uKnK5NRhpDy03jhP1SnWF5oswyyh84rbyc7VY526o4rMpanNyTzAvaUKcOKVTfX/z1iv
	72RuZLjL4vAaZKO8B/miuMvP/6q1V9Q4fY4/BvGPAxV9asGKT+uLV5jICOFV5QS0C3UN1OgpgtL
	D7XziQPkNRm56Npjp66oy/EuZtVx4N/w5LHTo/cKUFip
X-Received: by 2002:a17:90b:5483:b0:38e:8300:af51 with SMTP id
 98e67ed59e1d1-392ec3a9001mr7606224a91.8.1786479725107; Tue, 11 Aug 2026
 13:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706183154.2660394-1-dmatlack@google.com> <CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>
 <202607150902.F17F8DE5@keescook>
In-Reply-To: <202607150902.F17F8DE5@keescook>
From: David Matlack <dmatlack@google.com>
Date: Tue, 11 Aug 2026 13:21:37 -0700
X-Gm-Features: AUfX_mxVBsjnbB1DrMel3A258ig-TIae0_jrT2t6gBnEIP59zFKlPTNtWimYS90
Message-ID: <CALzav=eV_VBDqwko0Qp3kALK0fW5Ad_SHOdn+Gune8Nps0Opyg@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects __maybe_unused
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 9:03=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Jul 14, 2026 at 09:24:36AM -0700, David Matlack wrote:
> > On Mon, Jul 6, 2026 at 11:32=E2=80=AFAM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > Mark _##fixture_name##_##test_name##_object __maybe_unused since it m=
ay
> > > not ever be read. This pointer is only read in XFAIL_ADD(), which tes=
ts
> > > are not required to use.
> > >
> > > clang made a change to -Wunused-but-set-variable (split out into its =
own
> > > subwarning, -Wunused-but-set-global) that causes this warning to be
> > > emitted for various selftests and can be upgraded to an error in
> > > selftest that set -Werror.
> > >
> > > VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> > > selftests: Add -Wall and -Werror to the Makefile"), and the net
> > > selftests builds have been noisy due to -Wall.
> > >
> > > Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between fork=
ed processes")
> > > Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > > Reviewed-by: Alex Williamson <alex@shazbot.org>
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> >
> > Kees and Shuah, is it ok if Alex takes this through the VFIO tree? [1]
> > This fixes a bug exposed by recent VFIO selftests commit ff556bd98348
> > ("vfio: selftests: Add -Wall and -Werror to the Makefile").
> >
> > [1] https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@sha=
zbot.org/
>
> Yeah, please do. This has ample review. :)

Thanks. Alex, can you pick this one up for 7.2 if there's still time,
or for 7.3 otherwise?
