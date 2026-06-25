Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2954370D49
	for <llvm@lists.linux.dev>; Thu, 25 Jun 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379136; cv=pass; b=bRNbpmZwSRZXlSyZN5lvoYDk0GUG4bfQAdvxpj3al8kmk0PBObpipWhxxnFwBf/qqP7sDsFl0zqNRkYbhWwCh6HSO8vLfT0Mu+NJh39KaOIIGPeEmTpHqcyueASt/PRRuCzOUY23f/8YTGfD3+waZErWVn5Sya53gCqSCnNJYes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379136; c=relaxed/simple;
	bh=9p0e68yd6Ezsaf93rg6/oRpCVdpUDbcaLKoXuopP55Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LT8IUqbobtr9b/NaCP/YO4lAWehvJG6fFr1fZu7gqZEMyNTbJGSHF0yT0lowj1ZbhI1FD2bQqLg38EtD9p8Zm+FKw+Atc1YHx3SFqEM2vjc3vIHrtc4BEUWpglIlEQ+8lv6KCyPz2/mzzN/hF0kSNQAxDl9X2gdSz+ISEUrZQCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vs4uBTrP; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vs4uBTrP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c029505b389so222429666b.1
        for <llvm@lists.linux.dev>; Thu, 25 Jun 2026 02:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782379133; cv=none;
        d=google.com; s=arc-20260327;
        b=oxbcmnWsU7BHQHXEpSKBVbwjxKjtQZZss8A4jI/DC0+A3WqXXZCr6ShlES68Sh4v8+
         QZJ7ygiGETckYI4AcR5fWhohdpOtYa9I7O9WpLekWDY4jrRB7Q0HLr8BLvAovZBKRXg4
         F6DQTE9i5G/w1l7tm4LVFSgI3FjHRWz1qVdxk6O+E1ZVjbznpSeXjKFHQq+TefcG53xL
         xkqmber9KmifzfJ1DxLjveg081VmgXTA1OBFenpeE303Z94PggB3pjTfJLDu13us8HrI
         j9PVHnCpK8izWt+7BtniRBCS5eNNZkhNv3AOmSEmKLSYNESVrTIHAVTinqyrVtNsOF6J
         OJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjJHZ4zl9GiesT5N040A+7X4rJOON3O7PrTeg2fCR9s=;
        fh=iUTSTWJ5QLdqIIgSb/tXsq95q8aIbf/ggsZ+lOh73YE=;
        b=ZGHyIoHAiGqrLXkQ+FpOiJ2ExCcJowu8wdhfWFW/QkFaplS55CK2sidmR7QePBYTEH
         Jd/cMoaqk2TKnRD8RUYww4baRpvhQ7bqLomjqk43l+PNr4yLd1JlfrE02HUnApQQNDUX
         3nrC1PEZOU+xGoZrPk5wzt56l9akV+8PTFm2MW8wUDKs469Y5Oux3BsaLiLxhlA1Lq+m
         zGnWuVXRzeuNdATPqzZor2YGCKCP+L/U9S+oaXFDLKBQ/YRbWJgzcI/IiDIX8GQlW3tH
         5IU4xNQ6lUN4r5b1eFKGJrLfiC/+Z1eh+ieLequ/DfBfqErK7dMIqM2MwgfDUKolDrz+
         gpSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782379133; x=1782983933; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjJHZ4zl9GiesT5N040A+7X4rJOON3O7PrTeg2fCR9s=;
        b=vs4uBTrPTZ82nifhgM2MJXI0Sraq+oMYTPn+m9S8IdjgQ6pKvfsaP7dEPZxLLrZs3q
         dvgZnk22Yv4EK5BzYYKZ3NVZY/zHV4vvAXHIyykENXl/dz85kPsWIyoE9VnVa+9DNWey
         SzJM7yG2N79fFe11cgNyBmfQYvsFnmlmLjunmynQG1/fvfXmH1Stcs61HSOSMoX7YulS
         2Ss9C0LAf36C9ly4JmrRWU/cqTGgGwZFyCikTFmdVJucDEXDi/GVMxYcuZ7l5O+s1+qy
         Gxj7EjvFhsEBc7Dc/qbX0NEGKuYOSSYxaxzaD8OlCprAZ05OP0bAvurIPtzol2cIKqBg
         p7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379133; x=1782983933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MjJHZ4zl9GiesT5N040A+7X4rJOON3O7PrTeg2fCR9s=;
        b=myieyc/4w3ScTqDprGTL6Is2O5XA9O1DxDIK9l7pUPlnqPJ3DV8PWMEwufeMeSoYY2
         2nBixUb/4B6BcnoZKn6iMWNI8vTp6HDqwuv4eMITsdWqXS/FxojhnOJl+Wd7z03wSA+d
         u9f2zZX2c2D8w/8xnobptCeBlB11xSXlUfB3n7BV5Q9NwCUSmc99CpYlEjUGKXPxQ1Ay
         v15hO9W522BZi5qTZG2IqKq+SrpdKijNPJQ/nR34rUDCA797lmF+MpvWI3SflQiNR+kU
         56iv5nXE+IJ/Hr5nzkOB2evhNoUZfncaT06ufhfbmJimvIuMu/2pbKKMCDSYQZgEVqIw
         CFjg==
X-Forwarded-Encrypted: i=1; AHgh+RpoGjFct+f1ilrueSFvE/X+6esCH1TAovHnXIJQB2VnQj6wEkDmM8+oatWdL7z/JXkNrUpq@lists.linux.dev
X-Gm-Message-State: AOJu0YxZrvA75orbL456rbFTqPTkiIUX/WE+bMhC5vK81C+iq8xRwWKs
	b3c7dNxjHlbsImIr6NY7z9YA9bpWf2QrDhdZJgnqOMTGrFbMNgVLsw4MMKY6tSBzfoRRiLBrUW7
	ySr37B2B1P9j/eCqBytFqeBy4h7vTW/Is25vX6W9H
X-Gm-Gg: AfdE7ckSr/UqxwlluhWl6Y25H3L9+EF2jlxIRas9QUuWSElxvfBeX6rcRLkPw7bXjwU
	1grstZkc4PZaqHRgfcX+urAb0DRby4IPzSGpYCH1m+14fHxDsZ9XVqa2idIQ/WClhGUNWqUlC4L
	CQrR+hOl1cfuvv75pzZtpl/qbjgBkdTXS4Kje6d/jLEeyiBhON7l/mZkrmF17VL5uOJpHCmjT8J
	d5uCdMTeik928odUuMiZXlvENyjtQtLXSjAbOo09GJTA473FSynZnbebZQkXD1svCUtm8H+ZofH
	qx5et4tt1p2A1vndx/mfA0AJrXY=
X-Received: by 2002:a17:907:c588:b0:c0c:2e5d:50ab with SMTP id
 a640c23a62f3a-c102cb6b6a5mr722184266b.0.1782379132615; Thu, 25 Jun 2026
 02:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com> <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
 <249b8ebd-1ef8-4c17-bc9c-a63c051c2369@I-love.SAKURA.ne.jp>
 <8733yiconb.ffs@fw13> <8971cc3f-c0dc-49ab-a278-690a676cd5a9@I-love.SAKURA.ne.jp>
 <871pe1ng7m.ffs@fw13>
In-Reply-To: <871pe1ng7m.ffs@fw13>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 25 Jun 2026 11:18:15 +0200
X-Gm-Features: AVVi8CdyE5UkL3VoIQDmIF9EdNK41MHrNRQoWoP0Nd_WGcwKoxJ5lk_jmlIMVPs
Message-ID: <CAG_fn=UDJTpSn6kGU+p9JkZ_Ysph+qyuTUUcBG+vrA+50uSZsw@mail.gmail.com>
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in rseq_exit_user_update
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Peter Zijlstra <peterz@infradead.org>, Qing Wang <wangqing7171@gmail.com>, 
	mathieu.desnoyers@efficios.com, dvyukov@google.com, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mark.rutland@arm.com, 
	mingo@kernel.org, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, 
	syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2026 at 9:51=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Sat, Jun 20 2026 at 07:34, Tetsuo Handa wrote:
> > On 2026/06/20 4:32, Thomas Gleixner wrote:
> >> %On Fri, Jun 19 2026 at 21:45, Tetsuo Handa wrote:
> >>> On 2026/06/02 19:42, Peter Zijlstra wrote:
> >>>> On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
> >>>>> There is an bug which is an uninitialized stack variable use in
> >>>>> `rseq_exit_user_update()` reported by syzbot:
> >>>>>
> >>>>> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linu=
x/rseq_entry.h:502 [inline]
> >>>>>
> >>>>> The local variable:
> >>>>> ```c
> >>>>>   struct rseq_ids ids =3D {
> >>>>>           .cpu_id  =3D task_cpu(t),
> >>>>>           .mm_cid  =3D task_mm_cid(t),
> >>>>>           .node_id =3D cpu_to_node(ids.cpu_id),
> >>>>>   };
> >>>>> ```
> >>>>
> >>>> FWIW, I've no idea what that ``` nonsense is, but it does not belong=
 in
> >>>> Changelogs. I've removed it.
> >>>>
> >>>
> >>> It seems that this problem is still happening after
> >>> commit 6d99479799c6 ("rseq: Fix using an uninitialized stack variable
> >>> in rseq_exit_user_update()") was applied. Please check.
> >>
> >> It seems is not really helpful. If you observe the problem can you
> >> please provide the full debug splat?
> >
> > Please fetch the full debug splat from https://syzkaller.appspot.com/bu=
g?extid=3D185a631927096f9da2fc .
> > This problem is still happening as of commit 9ecfb2f7287a which include=
s commit 6d99479799c6.
>
> That's not a code problem. That's a KMSAN/compiler issue.
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rs=
eq_entry.h:502 [inline]
>
> So it claims that the copy to user in rseq_set_ids_get_csaddr() is
> leaking kernel info through an unitialized variable.
>
> The ids struct is on stack and was initialized correctly ...
>
> > BUG: KMSAN: kernel-infoleak in rseq_update_usr include/linux/rseq_entry=
.h:536 [inline]
> > BUG: KMSAN: kernel-infoleak in rseq_exit_user_update include/linux/rseq=
_entry.h:645 [inline]
>
> here in rseq_exit_user_update().
>
> ffffffff90ff6433:       48 89 df                mov    %rbx,%rdi
> ffffffff90ff6436:       e8 e5 3f db f0          call   ffffffff81daa420 <=
task_cpu>
> ffffffff90ff643b:       89 c7                   mov    %eax,%edi
> ffffffff90ff643d:       89 45 98                mov    %eax,-0x68(%rbp)  =
       ids.cpu_id
> ffffffff90ff6440:       8b 8b 94 0b 00 00       mov    0xb94(%rbx),%ecx
> ffffffff90ff6446:       b8 ff ff ff 9f          mov    $0x9fffffff,%eax
> ffffffff90ff644b:       21 c1                   and    %eax,%ecx
> ffffffff90ff644d:       89 4d 90                mov    %ecx,-0x70(%rbp)
> ffffffff90ff6450:       89 4d 9c                mov    %ecx,-0x64(%rbp)  =
       ids.mm_cid
> ffffffff90ff6453:       89 7d ac                mov    %edi,-0x54(%rbp)
> ffffffff90ff6456:       e8 25 40 db f0          call   ffffffff81daa480 <=
cpu_to_node>
> ffffffff90ff645b:       89 45 94                mov    %eax,-0x6c(%rbp)
> ffffffff90ff645e:       89 45 a0                mov    %eax,-0x60(%rbp)  =
       ids.node_id
> ffffffff90ff6461:       c7 45 a4 00 00 00 00    movl   $0x0,-0x5c(%rbp)
> ffffffff90ff6468:       48 8b bb 50 0b 00 00    mov    0xb50(%rbx),%rdi
> ffffffff90ff646f:       e8 9c 3e db f0          call   ffffffff81daa310 <=
mask_user_address>
>
> > BUG: KMSAN: kernel-infoleak in __rseq_exit_to_user_mode_restart include=
/linux/rseq_entry.h:674 [inline]
> > BUG: KMSAN: kernel-infoleak in rseq_exit_to_user_mode_restart include/l=
inux/rseq_entry.h:703 [inline]
> > BUG: KMSAN: kernel-infoleak in exit_to_user_mode_loop kernel/entry/comm=
on.c:103 [inline]
> > BUG: KMSAN: kernel-infoleak in __exit_to_user_mode_prepare include/linu=
x/irq-entry-common.h:207 [inline]
> > BUG: KMSAN: kernel-infoleak in irqentry_exit_to_user_mode_prepare inclu=
de/linux/irq-entry-common.h:244 [inline]
> > BUG: KMSAN: kernel-infoleak in irqentry_exit_to_user_mode include/linux=
/irq-entry-common.h:315 [inline]
> > BUG: KMSAN: kernel-infoleak in irqentry_exit+0x4a6/0xa40 kernel/entry/c=
ommon.c:165
> >  rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
> >  rseq_update_usr include/linux/rseq_entry.h:536 [inline]
> >  rseq_exit_user_update include/linux/rseq_entry.h:645 [inline]
> >  __rseq_exit_to_user_mode_restart include/linux/rseq_entry.h:674 [inlin=
e]
> >  rseq_exit_to_user_mode_restart include/linux/rseq_entry.h:703 [inline]
> >  exit_to_user_mode_loop kernel/entry/common.c:103 [inline]
> >  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inli=
ne]
> >  irqentry_exit_to_user_mode_prepare include/linux/irq-entry-common.h:24=
4 [inline]
> >  irqentry_exit_to_user_mode include/linux/irq-entry-common.h:315 [inlin=
e]
> >  irqentry_exit+0x4a6/0xa40 kernel/entry/common.c:165
> >  exc_page_fault+0x7e/0xb0 arch/x86/mm/fault.c:1539
> >  asm_exc_page_fault+0x2b/0x30 arch/x86/include/asm/idtentry.h:595
>
> And then it claims that the local variable was created in a completely
> unrelated piece of code:
>
> > Local variable st.i.i created at:
> >  __do_sys_statfs fs/statfs.c:193 [inline]
> >  __se_sys_statfs fs/statfs.c:191 [inline]
> >  __x64_sys_statfs+0x73/0x200 fs/statfs.c:191
> >  x64_sys_call+0x334c/0x3ea0 arch/x86/include/generated/asm/syscalls_64.=
h:138
>
> The above backtrace clearly tells that the CPU cannot have been in that
> code because it's in a user mode page fault exception.
>
> > Bytes 0-3 of 4 are uninitialized
> > Memory access of size 4 starts at ffff8881192c3e78
> > Data copied to user address 00007f05e438a680
>
> The code is correct and does the right thing, so something is wrong in
> KMSAN land. Alexander?

Thanks for the heads-up.
I am currently reworking both the compiler pass and the exception
handling, which should hopefully address these problems.
