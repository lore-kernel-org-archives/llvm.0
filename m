Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3621094E
	for <llvm@lists.linux.dev>; Wed,  6 Sep 2023 17:53:36 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso7195e9.1
        for <llvm@lists.linux.dev>; Wed, 06 Sep 2023 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694022815; x=1694627615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GItvzZBrWu32ylbui0Mu9MqN0Zvfi9d46znV9XBqxIM=;
        b=Xoq47ox+f/QiYeBMDhOMSIYQrLBkYES4q2vBtcnQlI/o/rvswfiwjk86DcuefVtSrb
         ag9S/4B0QbMIepovF0scI97ExAPu84P2FX+7Kav0KuC0xe7qH9BeoncKrgvcY1jzaefn
         I4rgc59QIqDN3tLPiSfXrys0U8mJnUEk8GD/uxke7nY8RnsHbirYAuaQoJIlYd8CJMeZ
         wU430iakyjfc+KU6pgqCW5PoGnKUwr0XbtcNTB/POHGLJj4BZ9qhk19wb+v/1m6EQATu
         MBbE9vVIlbF/M5lY7iSrBLtxDjic6qtOlO/Lv/0y5qRzNImFguisUinhLmMXlLljK8Yt
         Tefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694022815; x=1694627615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GItvzZBrWu32ylbui0Mu9MqN0Zvfi9d46znV9XBqxIM=;
        b=Qd3B8h9IPXWx1YkCU3/HeXJ9T4v+p2H/qXIC2X/nyKmgq+5k91QQL1Ba70ObDEY96h
         tW+CbcREynX1SlWVc+Qu46pi6SYzv/ewW+5lpXh6+4Dk+FCwE8WhbTn2yoCPhVy3VnGJ
         hS0xxnZuuiWrW+Nc/3pX249LYyMgX9/mnLj0mgHcPx8srlEKpTl3zscix5HWgj95Yf4i
         VUrjd3HWLiZc10MIQqi3AufrQ1oLH/RxriuHqrSTuf7GebK6+t/Pq6/sWysZmMrcb+iW
         89p852ahljR1T+I5j3iO77JMicu59d+eUI9P66nNDezjS73gdpq3UJrqq/CpMWJMrhb5
         nXPQ==
X-Gm-Message-State: AOJu0Yx/lJ2hMEOXpJYdLRGOyZpM8Og1CGFvKjJJj4zwo6SEIvw5Xscx
	NCK/EnU1O9CdoDJtL2PZ6d7CEqugiNkhlgVryKUp3A==
X-Google-Smtp-Source: AGHT+IGE+KRbKMdMCSUHfOxchGSX//3upfBW6z8FnI8Xd0ueFP0OnH3XRDlho/9C9hBrnYDsizqh/iPaU7AFTTHjiD0=
X-Received: by 2002:a05:600c:1d98:b0:3f4:fb7:48d4 with SMTP id
 p24-20020a05600c1d9800b003f40fb748d4mr5069wms.3.1694022814737; Wed, 06 Sep
 2023 10:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000e6432a06046c96a5@google.com> <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f> <20230903180126.GL3390869@ZenIV>
 <CAGudoHHjnRct1jEAjNSHmmPt9u_y+tYhrb56uRKXez8DKydNaQ@mail.gmail.com>
 <20230903195155.GM3390869@ZenIV> <CAGudoHGJsKqDWtp-7SmM9FRni+xBY98odAROxOifFR-4PpmJWQ@mail.gmail.com>
In-Reply-To: <CAGudoHGJsKqDWtp-7SmM9FRni+xBY98odAROxOifFR-4PpmJWQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 6 Sep 2023 19:53:22 +0200
Message-ID: <CANp29Y7CVJveEgQQj8qq2eyvtkdYqvuJuqePVAR7oky14N2i2g@mail.gmail.com>
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Dave Chinner <david@fromorbit.com>, 
	syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>, brauner@kernel.org, 
	djwong@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 3, 2023 at 10:04=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On 9/3/23, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Sun, Sep 03, 2023 at 08:57:23PM +0200, Mateusz Guzik wrote:
> >
> >> This does not dump backtraces, just a list of tasks + some stats.
> >>
> >> The closest to useful here I found are 'w' ("Dumps tasks that are in
> >> uninterruptable (blocked) state.") and 'l' ("Shows a stack backtrace
> >> for all active CPUs."), both of which can miss the task which matters
> >> (e.g., stuck in a very much *interruptible* state with f_pos_lock
> >> held).
> >>
> >> Unless someone can point at a way to get all these stacks, I'm going
> >> to hack something up in the upcoming week, if only for immediate
> >> syzbot usage.
> >
> > Huh?  Sample of output here:
> > 2023-09-03T15:34:36.271833-04:00 duke kernel: [87367.574459] task:ssh-a=
gent
> >      state:S stack:0     pid:3949  ppid:3947   flags:0x
< .. >
> > 2023-09-03T15:34:36.457355-04:00 duke kernel: [87367.759981]  </TASK>
> >
> > Looks like a stack trace to me; seeing one of the callers of fdget_pos(=
)
> > in that would tell you who's currently holding *some* ->f_pos_lock.
> >
> > That - on 6.1.42, with fairly bland .config (minimal debugging;
> > I need that box for fast builds, among other things).  Enable
> > lockdep and you'll get who's holding which logs in addition
> > to those stack traces...
> >
>
> That's my bad, the only content which survived for me in terminal
> buffer was a spew for the scheduler and a ps-like task list.
> Stacktraces are indeed there. Sorry for the noise on this one. I
> verified stack dumps are not gated by any defines either btw, so it's
> all good on this front.
>
> All this brainos aside, I added Aleksandr Nogikh to To: in my previous
> e-mail. From short poking around I found he was responsive to some
> queries concerning Linux vs syzbot and I figured would a good person
> to ask.
>
> So, Aleksandr, tl;dr would it be a problem to add the 't' sysrq to
> syzbot in order to dump backtraces from all threads? Either break t
> over a serial port or t written to /proc/sysrq-trigger. Lack of this
> info blocks progress on the issue reported here
> (https://syzkaller.appspot.com/bug?extid=3De245f0516ee625aaa412)

That's a good suggestion, thanks!
I think it should be doable and would indeed simplify debugging of our
reports (even if not for this particular one, judging by the
conversation below :) ).

I've filed https://github.com/google/syzkaller/issues/4200

--=20
Aleksandr

>
> --
> Mateusz Guzik <mjguzik gmail.com>
>
