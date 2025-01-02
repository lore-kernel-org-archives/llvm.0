Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03371BD004
	for <llvm@lists.linux.dev>; Thu,  2 Jan 2025 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735862399; cv=none; b=qzdoFmc3D4B1McvUqQjmwiAa3s5EOPCVJQapmDgvKg4VsYdTHEulTvp+luZS/6LSj6v20WTE19FvSSA4e+UKycIUyQyKBZsX0vZ5qjfr3rE4XTB+JXKchR9FUK2GjFv7LodKjfkAe8PQBf/nqim51vv0j+b4y+2LGSekJtc4wdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735862399; c=relaxed/simple;
	bh=HxNd0naXzljiSFG6AXRAjPLoLBglpIzBtZ51c35EOYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lv7hniluqmozJ4CzQPKF1Ceo29WDGcxf4NBpvqA8TuqnB1xukoEPajZwaI2DHj95FT0xgKoR/0WG8upLXLyu6bo/wfJy9ewq/ePZShhCMn6Qzmpsji39HYXRiJJI3dFtgd1Y72sHyMRGze32b8GoAdNJaknPyxIJa0ZWgrl4nrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLDLwDgf; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLDLwDgf"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so3079a12.0
        for <llvm@lists.linux.dev>; Thu, 02 Jan 2025 15:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735862396; x=1736467196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JagMMKgqgxjUnOD8y3ma7xr4mL+1z6Rr/CnmbvmVVFI=;
        b=gLDLwDgfHOKERR2BMwA2YK+ez8o7Lp+MHa3ocY4RTbwdF90zqK78mhwBrtEMpeQ9ew
         2KpQHd3ZeEKOPbdGLEVtxbTeqRlr/1XqJcRtmPQ0MXDD3279A+TM8r4WN+CUkGSttG7Z
         OItlvgEtH7JHMc9jMTyGjZjUxxdqLqGw/C6qpNM4TX8vH8spzmpzpTM1e/MJfnJX38H2
         OIa/HK0ivzkJtdnSFd864tU/FZFOmlan9z/4IebMeWarYDEgrqdYUAhA46GwFGF3PiEx
         0VANHHsupAX7tgrfXeK7qmi9VQHOAu2qCh4y4APbAtrObAWuPN19/Az8pWr3tUTyfaiD
         5Jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735862396; x=1736467196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JagMMKgqgxjUnOD8y3ma7xr4mL+1z6Rr/CnmbvmVVFI=;
        b=UVO8JyMHEDbi6i3/VryoW4nqhZHPfZ41uxh8R6VSdbN1pUZtIukyJRnw6sGvS4RJrU
         dimY1aBrV9h/tt7bRzT6+myiRyr02md9U+tFtqmi46Nclg0seOLIwOFoNva3lpUS2pm6
         7V7YPURwBAGMb72WHoCqvD3+TOq/mLVAKkPRzcX6JuUa0XfLZg+KnYcgOmgukB4m/Ik/
         ylqycY75sNw5V6bsctclImCTJYk4mWtaxhNJvO8zioUQPZgokJ8ZXLr0JR1FwoDcQdyf
         3GBEU9ynVpyPqrXeqebAGD/QBscna1ZDKRAsQ1cSimgtMBc8UZ8yAenM7gvaXj5BRi54
         mXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZFpcUgtYf5MTdP1R6GeaxLSGo2LFhgVt9pKLD7LFsjd1CoLZJTBlFiqCkQiPnOzaaG+84@lists.linux.dev
X-Gm-Message-State: AOJu0YwpCedN8CVW7AXlQp/oVuZLppPtYJdqTqqQILHj6O5lgiPLpi0B
	Us/7B+W06mflGyHtTM4XUuAd+bXtBYXXzzY3UkRjRv295XidyziWBtzVZQV/T1r3Xct640ru0RP
	8y2Zg9fPEO4U1ZLqyeH1aJ58SHw6eLobb/kdw
X-Gm-Gg: ASbGncs851IgyRZCr/9pBZuffwdZ0DUkqqddt7R3g/kD1AJc/PUFimvtp6xsLFaGYk4
	9TSe75ikIbRWboWO3tRlKXNIgbDoN5c+CIVE=
X-Google-Smtp-Source: AGHT+IG4Bcn/HMWEbZ60oA6s5HIWBq/XoUKm5KwR7Ob6SU5lDVTpFL2Mtv8Jau8vEkr2GAklzWbdBN6Bor1xnBZs0DQ=
X-Received: by 2002:a50:8712:0:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5d917875c13mr4393a12.1.1735862395849; Thu, 02 Jan 2025 15:59:55
 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-29-bigeasy@linutronix.de> <24b66f6c-b8db-4f2d-bd46-e4417cda7ef7@suse.com>
In-Reply-To: <24b66f6c-b8db-4f2d-bd46-e4417cda7ef7@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 15:59:18 -0800
X-Gm-Features: AbW1kvYVjQDWyArYdrMXKgW1eNU6eIYHxn2KN8D2TEatAw19qC0_NMyaHZ2iZSc
Message-ID: <CABCJKudYd9HiOX=d9ghVB+v37JEPJoKX_XHyopF=S7FYFabQSQ@mail.gmail.com>
Subject: Re: [PATCH v2 28/28] cfi: Use RCU while invoking __module_address().
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Elliot Berman <quic_eberman@quicinc.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, Dec 30, 2024 at 1:13=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 12/20/24 18:41, Sebastian Andrzej Siewior wrote:
> > __module_address() can be invoked within a RCU section, there is no
> > requirement to have preemption disabled.
> >
> > I'm not sure if using rcu_read_lock() will introduce the regression tha=
t
> > has been fixed in commit 14c4c8e41511a ("cfi: Use
> > rcu_read_{un}lock_sched_notrace").
> >
> > Cc: Elliot Berman <quic_eberman@quicinc.com>
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Sami Tolvanen <samitolvanen@google.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> >  kernel/cfi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/kernel/cfi.c b/kernel/cfi.c
> > index 08caad7767176..c8f2b5a51b2e6 100644
> > --- a/kernel/cfi.c
> > +++ b/kernel/cfi.c
> > @@ -71,6 +71,10 @@ static bool is_module_cfi_trap(unsigned long addr)
> >       struct module *mod;
> >       bool found =3D false;
> >
> > +     /*
> > +      * XXX this could be RCU protected but would it introcude the reg=
ression
> > +      * fixed in 14c4c8e41511a ("cfi: Use rcu_read_{un}lock_sched_notr=
ace")
> > +      */
> >       rcu_read_lock_sched_notrace();
> >
> >       mod =3D __module_address(addr);
>
> I think that since 89245600941e ("cfi: Switch to -fsanitize=3Dkcfi"), thi=
s
> can be a call to rcu_read_lock_sched(), or in your case rcu_read_lock().
> The recursive case where __cfi_slowpath_diag() could end up calling
> itself is no longer present, as all that logic is gone. I then don't see
> another reason this should use the notrace variant.
>
> @Sami, could you please confirm this?

Switching is_module_cfi_trap() to use rcu_read_lock() in this series
should be fine. KCFI checks don't perform function calls, so there's
no risk of recursion, and this function is only called during the
error handling path.

Sami
