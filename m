Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E131DFDBC
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736198708; cv=none; b=RMnVd5RDPRYNZsEAVo9+5fJowP1PzWs+iz66rreZi1Hab/te7u/6xwN7YUXVP0DtZ0f/3gTzcR60D5YnNlT6btfmegshbzUnUN+pU1aLF2tRkzsXbdhE3RKFrAI2jRa/bYAQSIK4LnC4L1m6pb0FoXz28VyWzaJtrZcWcip3FwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736198708; c=relaxed/simple;
	bh=p4J4PAy2tYWT7PoePXeGlsHxjWsDWfXEDLRMS94pf48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lxc6fQtTPJPgFsJym29A7dbgra3sQ7gQl9NwcIPkcXjJyFSSsssuy+kCnFnQNvJPM/RX5GCL1ep1o++aO3mPUW1/uCdiJkxUJjVf46BGhzlQ40Re7k5B4WbcUAbC8v0eS3Cmbj6cYxajUltFqFnLvoppfFFsfI2vT66oqhE6c28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSjySFbo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSjySFbo"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so455a12.1
        for <llvm@lists.linux.dev>; Mon, 06 Jan 2025 13:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736198705; x=1736803505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln1xgM2oStVuWhoEQmusatYJbTnshkZKwHgkCtpswhE=;
        b=fSjySFbom5TSZPctSs3N84u8gSv0Qtvj07zXUX45n+9wggsLz2t5J6jJiXgOKhCq56
         JC2OcfFkHFRbjGn8ElfGRef9Klqf5e3Lc8nnNZhCiBxGtw8DSgs8sH3QvwZ9cEKaXp+6
         aWHYU2q3VNAGvW4USH0tBh5RQzwZqGXrNjMixZVNWpR++6LMa1dnbS7VqC0SSBboccF7
         U+BEn3arA9Ru3lD/Sd0UsCdf1M+pKceq4qoXyUnj1z9QfvrKmgN6YW9YK9hPRcqjqJhk
         MJI5yRbBLxbeEhDYIh2o5W8X9SRHNb0XIMyjGdyGqgWa/XI6x44aT7Mf3WgzAKlpjdbw
         avIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736198705; x=1736803505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln1xgM2oStVuWhoEQmusatYJbTnshkZKwHgkCtpswhE=;
        b=hgr9A+LfjrrVWNmMZ7LF8hnntbTKO+GxdyBIY/dp+xbC3kBhKtr9hItno1N5QVVG+i
         RZfJXWJWZiVENHYG/QGw7AlmjGyK6mK0CIq8jqkbrOE9G3luFb9PWkrfshTaPhPMaB3x
         sIGAt89beecUsi+XUgrlYfqsfw5RZC02becqy//DiAe9A3PHdeNxwayFI/52moHnxqef
         ni39yW3x0xDeiYRyBpwx6yAjp7IoboPrW2FbxYOfSPAmmOMZE+0TNqmoOgjHktmAm7jY
         dLd2kR9M0aijKrJLuZq9ShVy71QZ4rSwfP68Hu0vsb/XK09cgc5xGxBVKyCSoafYHsnE
         6FzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0QEyy6T8d4ZCR6SORBNcW+GePw5hmRWwKWf2m8QVjnccu7QGBdwCm+qDwabWnxCqPaYd+@lists.linux.dev
X-Gm-Message-State: AOJu0YxXomUkpbqLOkb7Kgk5HYzuNF6IbmnlbcEu+OfkCjtaQ/JoQx+2
	bL2byoFmgHqMzXdOAlj1QOt2/RdRmBNXApJ/i6SyVPisg065apPTfcvZdsUbapoFNZqLiRx5/vk
	0OET45lEpJ6UqsnXpWnwqiAUO6Ikf3h0tyj8L
X-Gm-Gg: ASbGncuEoLJeA0/5qIRbdVn4xAgzIpXc1VXeSwL7hZEFLglzUo4dP0+QF7PwvWz+pVa
	juUjyTM60a0cXQg6+s+fFYn4RkifhzyUK3UM=
X-Google-Smtp-Source: AGHT+IH41nFR4XjznMl40Um9p1ogmkX1bwJtAiR7xoIgiSg+CzLikN/2L1bWntFHz6ID5Nht/Mau7+LGgOJyS3n7MqI=
X-Received: by 2002:a50:9f67:0:b0:5d0:84a6:f1a1 with SMTP id
 4fb4d7f45d1cf-5d95fd9ba7emr16336a12.6.1736198705050; Mon, 06 Jan 2025
 13:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-29-bigeasy@linutronix.de> <20241230185812429-0800.eberman@hu-eberman-lv.qualcomm.com>
 <CABCJKucZKvFcTQEqbKNUfdYv-upxsH6cmw1=iHUORPFJc+vKHQ@mail.gmail.com> <20250103101357180-0800.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20250103101357180-0800.eberman@hu-eberman-lv.qualcomm.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 6 Jan 2025 13:24:28 -0800
X-Gm-Features: AbW1kvaJo1nyTcxgxrH-hOUFMC8ycywlnsAQAeEU4OUg47oM9mviVzwMlb8sMhs
Message-ID: <CABCJKucPR7ty7oPn1NYkJidv_Mk46+E0B0vmGhBXz4Stt+vujA@mail.gmail.com>
Subject: Re: [PATCH v2 28/28] cfi: Use RCU while invoking __module_address().
To: Elliot Berman <elliot.berman@oss.qualcomm.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Elliot Berman <quic_eberman@quicinc.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 6, 2025 at 10:00=E2=80=AFAM Elliot Berman
<elliot.berman@oss.qualcomm.com> wrote:
>
> On Thu, Jan 02, 2025 at 04:24:22PM -0800, Sami Tolvanen wrote:
> > Hi Elliot,
> >
> > On Mon, Dec 30, 2024 at 7:33=E2=80=AFPM Elliot Berman
> > <elliot.berman@oss.qualcomm.com> wrote:
> > >
> > > On Fri, Dec 20, 2024 at 06:41:42PM +0100, Sebastian Andrzej Siewior w=
rote:
> > > > __module_address() can be invoked within a RCU section, there is no
> > > > requirement to have preemption disabled.
> > > >
> > > > I'm not sure if using rcu_read_lock() will introduce the regression=
 that
> > > > has been fixed in commit 14c4c8e41511a ("cfi: Use
> > > > rcu_read_{un}lock_sched_notrace").
> > > >
> > >
> > > You can replace the rcu_read_lock_sched_notrace() with guard(rcu)().
> > > Regular rcu lock doesn't generate function traces, so the recursive l=
oop
> > > isn't possible.
> > >
> > > I've tested:
> > >  - the current kernel (no recursive loop)
> > >  - Revert back to rcu_read_lock_sched() (fails)
> >
> > Which kernel version did you test? I assume something pre-KCFI as
> > arm64 doesn't use this code since v6.1.
> >
>
> Ah, thanks for calling me out. I dug a bit more, I thought I was looking
> at a recursive loop in the ftrace buffers, but was actually the expected
> behavior. When I tested on the other configurations, the stm dummy
> driver hadn't kicked in yet by the time I looked at the ftrace. Indeed,
> this function code is not used on arm64.
>
> I experimented with an x86 build as well and I was able to get the hang
> I remember seeing after some tweaks to force a CFI failure. Still,
> guard(rcu)() is okay by me :)

OK, great. That makes sense. Thanks for taking the time to test this!

Sami
