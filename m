Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6731C6BE
	for <llvm@lists.linux.dev>; Sun, 29 Dec 2024 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735499391; cv=none; b=Z+XXsVjyyKs/9MlSlrm+UvxJOrthp+omeLQ+QudqQlmc6g6uwo04B3QcTlBuAox+e/2hAyqj6xLjWE+sJYylhxOPUgZfTLIGGDqrChLR1e/V9uXwFyNqlvjX9VCrjsqAQMdZ3W/pISapMhEhQEiOQ9lPPLQh/KuIIBPgX3fH25Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735499391; c=relaxed/simple;
	bh=NCrrgqVAdcYcVpkHo2xkAAJ9iDqQ1idGb/S2gtyxU2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGeSDSRMlXjmo/9i3E9enyLihv0n2ybNzOY1YQrNYZmMxV6Ax8k9Es6VJjGFOZydlMjNHRYlh957VipT2hXchSGH7R+h/W2OtsQ0e3tW9aEAbD/jIX95B3zCFeZ/LYKGsbVtCwx9GnfsOkBi1nzPP2xmK0i6kYElDbJ7cSbLEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcRyWrM4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcRyWrM4"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso8966547a91.1
        for <llvm@lists.linux.dev>; Sun, 29 Dec 2024 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735499389; x=1736104189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLV20bromzR57IY1Unak28q6U4TXsFtoJ6LiojUAkQY=;
        b=PcRyWrM48v4hfEj5jEUb9zjuzHV3WMWOHjKhlOZC60h2qJJys2MwaBhm/rGjpIJFgI
         sz6ROJV5zHqBt6V3t1PczvS+Top4kWIrXatN51H8Y4zywd/M8htlQY6M+Wd5avQsxVgD
         Dg162EynrXXi2rDAlCYYSsEp8X2KHyQFpOc7YdAFXQMJ+tJlekTU7rQzEbiTSfe/RrpI
         0NMddzTcAzSiq+d1plh+Hq4Lvq6/mfnt5KjvpLhNf4aV0FzwlLCcZMft/mA36ipVUlOo
         wwi3VVwqeJbm43BjFP1TpzkEcsYfXRmmsBW6m1vwPM9TR9zZq2El85pUfnQSRhwEFYUC
         OWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735499389; x=1736104189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLV20bromzR57IY1Unak28q6U4TXsFtoJ6LiojUAkQY=;
        b=PRrg2Ea6OwXT1ErJiJAdxZeA8NaDPObqvVTthCXocG4OGw9cPkzLHG7UEisx06V2+p
         Ui6AWHEq+ttALKz60QjuIpdjcuO0ty0uPGdrU8HCHaGlC7YBFc+wn2xbcQ24Gl1rgOuh
         g4Gt/+YywVYo/I07Fyulq/lssZ3oOGU5oN8WqDDfuEXFCgsnvRJQF3SP0isJvya4Jugk
         4QbiHfLXrNJUG1jvmJBEcRCYPQ0cQF8NAGGWRIloQ7qNBxiXuNlgUCUqR25SCU/ChdjM
         BBUfGnJWiiWVi6pDY+S7I9SJ9IVQA6gL0GY9gJx9YxGF2403L6NFs6llHTjff40rzqxp
         QbsA==
X-Forwarded-Encrypted: i=1; AJvYcCX2qZyRoHN6qe/1cADHv8HsdTupIBs2l/qFSpJWt59C/ZkAU0shzpUQdP7GTrGv0zjpOLIQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwolGuBvUDnm9DzB/AocpCxEZXG/ZlKmmeWMgSL6AlJ1gUm6n3d
	3xctmCDaz9HeqYi99g039I7DRa7m61Uema3XUbe9p3N4WQiwzAPd88Y91fh1vVGZmkTaIKIkB7+
	GgAgFNfNXybIzNOU8nwe3sl6B+5Q=
X-Gm-Gg: ASbGncsm9JUbfG07kC+jIiykvQo6mEjWJ4H2CXAO86cv457OxplJHY3D58UpymcupX+
	PUO73Cn04p0X0mp4SVbTlWw2fr7tRN+vaVrA=
X-Google-Smtp-Source: AGHT+IE7Tm8Mby3gPyNsg+/b10UHatLbPwY4DMX0HrwWi6WxBOR1WIfuspFPxlHAL3JLR9SzCcUearx0rAjJKnBNpWA=
X-Received: by 2002:a17:90b:2d43:b0:2ee:c797:e27f with SMTP id
 98e67ed59e1d1-2f452eed977mr42563935a91.36.1735499388635; Sun, 29 Dec 2024
 11:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <87frncmkre.fsf@all.your.base.are.belong.to.us>
 <20241223221556.1f5e598f@gandalf.local.home>
In-Reply-To: <20241223221556.1f5e598f@gandalf.local.home>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 30 Dec 2024 03:08:00 +0800
Message-ID: <CAFTtA3Nb66VZGoMVfrVs6cYLorjbSX8GmThyKB1FFvfg2HknpA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
To: Steven Rostedt <rostedt@goodmis.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com, 
	puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com, 
	zong.li@sifive.com, samuel.holland@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steven Rostedt <rostedt@goodmis.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:15=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Wed, 27 Nov 2024 22:25:57 +0100
> Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrote:
>
> > Adding Steven.
>
> And this has been in my draft folder for almost a month :-p
>
> I kept coming to this email, but then got distracted by something else.
>
> >
> > Andy Chiu <andybnac@gmail.com> writes:
> >
> > > This series makes atmoic code patching possible in riscv ftrace. A
> > > direct benefit of this is that we can get rid of stop_machine() when
> > > patching function entries. This also makes it possible to run ftrace
> > > with full kernel preemption. Before this series, the kernel initializ=
es
> > > patchable function entries to NOP4 + NOP4. To start tracing, it updat=
es
> > > entries to AUIPC + JALR while holding other cores in stop_machine.
> > > stop_machine() is required because it is impossible to update 2
> > > instructions, and be seen atomically. And preemption must have to be
> > > prevented, as kernel preemption allows process to be scheduled out wh=
ile
> > > executing on one of these instruction pairs.
> > >
> > > This series addresses the problem by initializing the first NOP4 to
> > > AUIPC. So, atmoic patching is possible because the kernel only has to
> > > update one instruction. As long as the instruction is naturally align=
ed,
> > > then it is expected to be updated atomically.
> > >
> > > However, the address range of the ftrace trampoline is limited to +-2=
K
> > > from ftrace_caller after appplying this series. This issue is expecte=
d
> > > to be solved by Puranjay's CALL_OPS, where it adds 8B naturally align
> > > data in front of pacthable functions and can  use it to direct execut=
ion
> > > out to any custom trampolines.
> > >
> > > The series is composed by three parts. The first part cleans up the
> > > existing issues when the kernel is compiled with clang.The second par=
t
> > > modifies the ftrace code patching mechanism (2-4) as mentioned above.
> > > Then prepare ftrace to be able to run with kernel preemption (5,6)
> > >
> > > An ongoing fix:
> > >
> > > Since there is no room for marking *kernel_text_address as notrace[1]=
 at
> > > source code level, there is a significant performance regression when
> > > using function_graph with TRACE_IRQFLAGS enabled. There can be as muc=
h as
> > > 8 graph handler being called in each function-entry. The current
> > > workaround requires us echo "*kernel_text_address" into
> > > set_ftrace_notrace before starting the trace. However, we observed th=
at
> > > the kernel still enables the patch site in some cases even with
> > > *kernel_text_address properly added in the file While the root cause =
is
> > > still under investagtion, we consider that it should not be the reaso=
n
> > > for holding back the code patching, in order to unblock the call_ops
> > > part.
> >
> > Maybe Steven knows this from the top of his head!
> >
> > As Andy points out, "*kernel_text_address" is used in the stack
> > unwinding on RISC-V. So, if you do a tracing without filtering *and*
> > TRACE_IRQFLAGS, one will drown in traces.
>
> I tested set_ftrace_notrace on x86 and the function graph tracer does hon=
or
> it. I wonder if there's a kernel

After checking the log buffer, I can confirm that riscv does also
honor set_ftrace_notrace. It does not print out "*kernel_text_address"
in the trace buffer. Sorry for not making this clear.

However, the problem is that the patch sites "*kernel_text_address"
were enabled, allowing the code flow into ftrace and parts of fgraph.
In particular, with TRACE_IRQFLAGS enabled, the functions are called
extensively, causing the significant slow down.

IIUC, it is reasonable to enable a patch site if there is at least one
tracing instance that request the function. However, in another
experiment, the patch sites of "*kernel_text_address"  are enabled
even when all instances have them disabled. Here is a way to reproduce
it:

cd /sys/kernel/
mount -t tracefs t tracing/
cd tracing/
mkdir instances/1
mkdir instances/2
cd instances/1/
echo *kernel_text_address > set_ftrace_notrace
echo *sched* > set_ftrace_filter # this is just to make the kernel
more responsive
cat set_ftrace_notrace
echo function_graph > current_tracer
cd ../2/
echo *kernel_text_address > set_ftrace_notrace
cat set_ftrace_notrace
echo function_graph > current_tracer

To figure out this problem, it is probably worth trying to understand
why the patch site is enabled after the above sequence:

It seems like the ftrace_ops being passed into
__ftrace_hash_rec_update() at the start of the second tracer has an
empty notrace hash. This leads to the eventual activation of the patch
sites. However, graph_ops does not have the empty notrace hash when
the user starts the first graph tracer. I am trying to understand this
part of the code, and the relationship between graph_ops and ops in
the fgraph_array.

>
> >
> > E.g. the ftrace selftest:
> >   | $ ./ftracetest -vvv test.d/ftrace/fgraph-multi.tc
> >
> > will generate a lot of traces.
> >
> > Now, if we add:
> > --8<--
> > diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.=
tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> > index ff88f97e41fb..4f30a4d81d99 100644
> > --- a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> > +++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> > @@ -84,6 +84,7 @@ cd $INSTANCE2
> >  do_test '*rcu*' 'rcu'
> >  cd $WD
> >  cd $INSTANCE3
> > +echo '*kernel_text_address' > set_ftrace_notrace
> >  echo function_graph > current_tracer
> >
> >  sleep 1
> > -->8--
> >
> > The graph tracer will not honor the "set_ftrace_notrace" in $INSTANCE3,
> > but still enable the *kernel_text_address traces. (Note that there are
> > no filters in the test, so *all* ftrace recs will be enabled.)
> >
> > Are we holding the graph tracer wrong?
>
> What do you get when you do:
>
>   # grep kernel_text_address available_filter_functions
>
> ?

We get:
kernel_text_address
__kernel_text_address

>
> >
> >
> > Happy thanksgiving!
> > Bj=C3=B6rn
>
> And Merry Christmas!
>
> -- Steve
>

And Happy New Year!


Andy
