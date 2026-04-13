Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB626CE32
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097182; cv=pass; b=DRfoTfBqTQPU14qrvk4d7Nc8Su/GosS9A76iAid28kQ5uRfvUfucoyL1XA4U2eY0Il6xenEyiO6Rzdal0zPpX8wAgbw1x2lUHQabJW0jGEs+dSKw0A+zk77QIqJJtePEuVf5G0GpsUwqRMOmFihC5803n2vQ71CVL3WzRSmYlFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097182; c=relaxed/simple;
	bh=7z+fHG4ng1cD6ARETRCT7nrIYcESE680dx5KH4WOsAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5r6SO0oRCcm/YDmWvbGbtSNOlAqhzbXpu5Co/QXyqp/Hbk14iJqNLDncjqPkapcOErJAeFcsGRjpXrAREgtRoM3ePr2a5ENfOz7tCnbjiFF1NVYcAdPBEAAMpWObh2kINb+eO/uAtqv+//2PL0rVQNO4pDns45QeofLRBgIq5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cEGis5Oz; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cEGis5Oz"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12bfe0ae81aso40809c88.0
        for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 09:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776097180; cv=none;
        d=google.com; s=arc-20240605;
        b=GdeWR1Mx93dtm0GXao4Xp4sYHl8sCf12W1CwqcLWk78QuGomGnyMJRxlDhFwcjX2Sn
         vgIObzTt7FoFf32zRXYTQ7tHKMYYSawqywzpXlY9EJUWcjQYUFzHJlDmkhzkzCZoHMGK
         qvZIuCfriX1jFTc0d5ZPZTKSAnmnEJiXoAr1LMehSCYfcaNqgw0mXG9C5mE65A3t5XLX
         IQg4957N6l1z/vK4yYID6u/P78IY4d3pzMNKi/J9ilUMZXz3nwdC3AucbmyoKF9brlY9
         5Ak5ik2deG/v6dIJqVgUnF5GE2w23+yitUIu2NNuDhhhdrX7dcTaeJufOi4aEffZ/dJ2
         +TGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7z+fHG4ng1cD6ARETRCT7nrIYcESE680dx5KH4WOsAo=;
        fh=JDanwDI0a+cb5swv/5OCKmU2nq8LxnCsg4tR7ZfJiGY=;
        b=ZQU/UoVEXPfxwurxD3FEEvMcQD/NMBfn+w2FLGFPcuLbJeuxy4hL0k2ZtbAP58nNx/
         uCI51nk1SuKhN5Wtf0J6TEl1u0mDRxPofsBXOMUv87QHg6xvKxD2PHmT5FumSB4ZwNMh
         K0/jMHNcrJjJnvZjQYbqFlKjROk+yqV6Q1MAjVijulXowssd31QbecUVJlE5OR73GSgq
         kiUMnX9Ug1HodRsGgrI/ENYnfaKe/L80boQpcP/yxI+syEGsPuZW6NROxhaza6pJeD1j
         B1oxlHLEgWgulFWpr85n6E4cX+ReCNCiFSqvlW1FNBh5URfIJk4i8tQ5Rbmp1VSqhcwS
         9glQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776097180; x=1776701980; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z+fHG4ng1cD6ARETRCT7nrIYcESE680dx5KH4WOsAo=;
        b=cEGis5Oz0RhE0bNuoJ1XfMNj4fBALJj6dQTuT7PeMeFgG6RkNUCbAUWwET74Sjipl2
         LxFPDWUtPr1+PE49FvOTPAvKZO9UzCaT/53RyqE+Jb4ACgklwrD6GHy6RQ0+vL/DXOIg
         HzTmDlaOQczDgi1awj9gH4A3Auzdd5biBS4UNeJisUEdNnx01w1Y2sadjLduGab+XD77
         t2RFsEuG3d7AszfgQo1QBdpJw+D0iLLfIcCSN9zn3hk8DxKr6oV6T6HN5IszvMa28un/
         uQnazMp8qm7Z5yfT+QPqC7S75AdYnQ6RtO1JGDRqBaUTtvxRegjAFTsP90PtvGnkqvSF
         gQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776097180; x=1776701980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7z+fHG4ng1cD6ARETRCT7nrIYcESE680dx5KH4WOsAo=;
        b=evDHP8ZHYZke5VzVJWwN5+M1Y9n+ly6ySIJcgw0dsffgBbpEZkBgaV91i9jHmWwoVQ
         Ty3NLcwknrz0/W72Y+USdwyxQ2ueMMSCJ4xSHunOLEl6364CdQfzH04BSpdTIVSy/X/2
         BombTc/3QdjYitom+7FBlL+X5HYllXMqgjw5yWKyFoqh+cUaV+VmwXGqV4CaNbzBBK8K
         HyiiKP6COn70E1rc+ec3KNkq+SXBarnMwWhu/CDIlSQtHuw+Vw0Aaf+yEpj1McWMF6tG
         ZnsHjC1gFtkcbk6EJcNXxR1fz90RkSjRpnbhx8+ISctKC4/WYxQaqiIpy4NiqzPgriA5
         HJUw==
X-Forwarded-Encrypted: i=1; AFNElJ9UxuWaXcZTQvP9Ok5BajMyA0tLUgHpLRGL2auiXre4IVXfkK1+/nF9jUNOlm97VOXcFLAP@lists.linux.dev
X-Gm-Message-State: AOJu0YzMbl2U0xoBfzGXVK6OaLXiWZ78LREfWJapAtPRjkNnuOGfHmWB
	F8DnlhbD/A5LOjApKKsfHU77alUFCnyqg40haolEpoIRr+DBw1ahTguGB5iKp7LDvEq39sfoh+w
	o+sqZarpxkTDLyt3qCkDZZGrWKluUOp9KBIx0ZtXC
X-Gm-Gg: AeBDieuKvUbY5zILLxKgAiailAe7jWHGXVFvVHtCibp4GmzC4527fnaXtnvNINTThin
	8+6Xv+Sc1YaV1SxtvU2d/Dc95dZooWwrr1+YHAbK7LxGzj3lDdKhc4FQSF/Iu/a+mk+rAYsNT4Y
	ziQycUfxzb0D1/QkBR0vYK2qlAb4IPgWZEnoswSge44bPLsKiIncyaG+DCTQ5aDsVAbBjvW9GvH
	9GRXyN5XuoOkTLG5kYwz9g8SaBXBmVnl5PHMYoKZgV32sjDLGM/FN0pltgphd61QKmTuhbD9lkC
	l/1jjskLaLD4RXPX24Q7qjdzdMN9JBo4jO/Q56a8BTBZod8E
X-Received: by 2002:a05:7022:11f:b0:12b:ebc9:3da6 with SMTP id
 a92af1059eb24-12c29c1d268mr781533c88.7.1776097179805; Mon, 13 Apr 2026
 09:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407165551.3075684-1-irogers@google.com> <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
 <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com> <404f559a885169513b7e3526eeff77148ee55bb8.camel@perches.com>
In-Reply-To: <404f559a885169513b7e3526eeff77148ee55bb8.camel@perches.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Apr 2026 09:19:28 -0700
X-Gm-Features: AQROBzCXRT8_Ra020gBihH-jcFuxxWSo9lGgCdKG9yfqmFI4-UbuRzDMebc5vzE
Message-ID: <CAP-5=fWteCfNQ7DmwLorcs9h3iH__XK01CrwnJ4-qUfcDCsSSA@mail.gmail.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
To: Joe Perches <joe@perches.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 8:45=E2=80=AFAM Joe Perches <joe@perches.com> wrote=
:
>
> On Mon, 2026-04-13 at 08:39 -0700, Ian Rogers wrote:
> > On Tue, Apr 7, 2026 at 10:11=E2=80=AFAM Joe Perches <[joe@perches.com](=
mailto:joe@perches.com)> wrote:
> > > On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:
> > Sorting headers is desirable to avoid issues like duplicate includes.
> > > Perhaps.
> > >
> > > Some others prefer reverse-christmas-tree by length ordering for #inc=
ludes
> > > though I think it's poor style.
> >
> > Thanks Joe. I second not switching to a reverse-christmas-tree style :-=
)
> >
> > If this patch is okay, could we bring it in through the perf tree?
>
> It's likely better to avoid this suggestion.
>
> The issue is that others strongly prefer that reverse-christmas-tree
> style and would object so nak.

Presumably that is a kernel suggestion rather than a tools directory
suggestion. We can move the file into tools/perf, tools/lib/perf, etc.
if that removes more global concerns. perf hasn't adopted a
reverse-christmas-tree style.

Thanks,
Ian
