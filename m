Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240601514F6
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176967; cv=none; b=jWLFn/U68+EPH8kXxde3zl4HUKYOsJCeoL+HMiC4TK8K8iPz5ogY0lXDMaqVIfdUUAHuw+wDkIu06bDixgpDSzF2UzdSHDR90MscE8psDJ7vGG8rol6dk9nx6MGHmvrAhw4gIVg+V4jXEF+C4bG/TxjR+rcotBLCstmuyOU/5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176967; c=relaxed/simple;
	bh=TPM09t71Gar0RR26L0B7e+mYMDtYgPmhg8NSDi6znNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2kFlBleHgNxkcqTA1ENDJBt7BbbSqa5ObtQ4gwpTV4nQKABD+fwkJ1uoUfTMrc8cj6I8AYHylS5F0/9cXQxY3VWcseNsvTX6Vucm6zW28Bss8h4wuP/V4SWZ7ie2CIzYs9MrQ0eVxU9axhbDXZTGBM+g1gpPaTmJOamYe9wuDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4lwEgCW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4lwEgCW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so16769725a91.2
        for <llvm@lists.linux.dev>; Mon, 06 Jan 2025 07:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736176965; x=1736781765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGQ+r7vqUQnRNc23J7HWAq90M1xR5Zs0BJ0WUhbygV8=;
        b=Q4lwEgCWjweSiOS4iqJ+BHE9QUj0dAFGMy5pPy8mEtr9qYVQJQCQX+Gq4COrNBjnj8
         SXibLT0hb9/ysyJFI+K45dMQtVPlHPtCVkhvfuY7caMmxSQGx3oaEpz0tPueY7RMZx22
         dZm59TRtaz/+rTVjqncgFnJV1Vu0c2YRKN+J+jXfHryOYFsRlcaP2R5plZegf81AyTKn
         1dghSYSsehQO4BeiMYw2iYKyusfEkriESXV5kFOC2mh2L4JALKTvifVlLAgb2Y6bxXqI
         DBYLJo1iFhN3p5kVUaD4zo1XwBi64CM27X4V7fMGcc25yPEs0AbWuxp69/nRGmuf9OxS
         KohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736176965; x=1736781765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGQ+r7vqUQnRNc23J7HWAq90M1xR5Zs0BJ0WUhbygV8=;
        b=BWB80MJER5/od0KXygChVw0F/z5Aws7ftaVVlP8xIoC+9LrdMTn0dvcxJimn5AT1hz
         tqatjn3xWx6vhgDI2jrYecqO3gATax8UmOcHT3QBEsoXgZF0f3b3wR0psGV9vhPW/hta
         /waVutP2M4xUvlU55MVVACShfS0zYimZvJQfwV5CgYav/0Tb0X25sdJ0bRwkfB16+IN8
         x8Z/xv/VtjQiCL+BLW/ofUKK2+B1o64YFva+pIKJ+P8WCD4eZiL9hIuSCgCNqEPLjwLa
         /tiVoW3/SYfu0VGwbUqzBL3P4SehBlze+Vs2NuqrZ5MQgTL0Y32JHh8VObaNW5HjiaQA
         7kXg==
X-Forwarded-Encrypted: i=1; AJvYcCXxIyas4DrFV7Vd96Slxqf0Xs324RQVqA5xshmDrGT5EUt0H+BKbkyrYlLSXk3T0dXv7gXG@lists.linux.dev
X-Gm-Message-State: AOJu0YweYLq1UwG+b9q8DST46DhyS74FTDmXfaV0kiaKlvEISVOdhzUr
	4/ZKAgCn0O7a1yL/ir3fw1ZORnQRESA6OJLgWbSs5pd363vvpwkK9BJi7NbvM/2bPUEKqvNCRFF
	zuAoc6yfYaSTgZfkoZsdHZZ8cMAA=
X-Gm-Gg: ASbGncvobirrqbt3B1OjQNyAaixIncIXOgo958B52NKC0aSWiWTL8JUdSLWZrriDrP7
	k6FKjypiw3azMtmdrqWWJ5acuDOmNlzsr+/H+l34=
X-Google-Smtp-Source: AGHT+IHNV6t/RuCj0nlxoSW4YsIl2uVS7K+lFjl5wPoBhxAWnUePntKbC0FpxYRocTQPkdjlgMlJoz/g+ddJ7DpRwsk=
X-Received: by 2002:a17:90b:3cc6:b0:2ee:a04b:92d3 with SMTP id
 98e67ed59e1d1-2f452eeda37mr76174111a91.34.1736176965234; Mon, 06 Jan 2025
 07:22:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <87frncmkre.fsf@all.your.base.are.belong.to.us>
 <20241223221556.1f5e598f@gandalf.local.home> <CAFTtA3Nb66VZGoMVfrVs6cYLorjbSX8GmThyKB1FFvfg2HknpA@mail.gmail.com>
In-Reply-To: <CAFTtA3Nb66VZGoMVfrVs6cYLorjbSX8GmThyKB1FFvfg2HknpA@mail.gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 6 Jan 2025 23:22:34 +0800
Message-ID: <CAFTtA3NjHibAJcdfLRD2ybf=Lb_D7OtR0V_S+3TVPVH_543cdQ@mail.gmail.com>
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

Andy Chiu <andybnac@gmail.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=883:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Steven Rostedt <rostedt@goodmis.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:15=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On Wed, 27 Nov 2024 22:25:57 +0100
> > Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrote:
> >
> > > Adding Steven.
> >
> > And this has been in my draft folder for almost a month :-p
> >
> > I kept coming to this email, but then got distracted by something else.
> >
> > >
> > > Andy Chiu <andybnac@gmail.com> writes:
> > >
> > > > This series makes atmoic code patching possible in riscv ftrace. A
> > > > direct benefit of this is that we can get rid of stop_machine() whe=
n
> > > > patching function entries. This also makes it possible to run ftrac=
e
> > > > with full kernel preemption. Before this series, the kernel initial=
izes
> > > > patchable function entries to NOP4 + NOP4. To start tracing, it upd=
ates
> > > > entries to AUIPC + JALR while holding other cores in stop_machine.
> > > > stop_machine() is required because it is impossible to update 2
> > > > instructions, and be seen atomically. And preemption must have to b=
e
> > > > prevented, as kernel preemption allows process to be scheduled out =
while
> > > > executing on one of these instruction pairs.
> > > >
> > > > This series addresses the problem by initializing the first NOP4 to
> > > > AUIPC. So, atmoic patching is possible because the kernel only has =
to
> > > > update one instruction. As long as the instruction is naturally ali=
gned,
> > > > then it is expected to be updated atomically.
> > > >
> > > > However, the address range of the ftrace trampoline is limited to +=
-2K
> > > > from ftrace_caller after appplying this series. This issue is expec=
ted
> > > > to be solved by Puranjay's CALL_OPS, where it adds 8B naturally ali=
gn
> > > > data in front of pacthable functions and can  use it to direct exec=
ution
> > > > out to any custom trampolines.
> > > >
> > > > The series is composed by three parts. The first part cleans up the
> > > > existing issues when the kernel is compiled with clang.The second p=
art
> > > > modifies the ftrace code patching mechanism (2-4) as mentioned abov=
e.
> > > > Then prepare ftrace to be able to run with kernel preemption (5,6)
> > > >
> > > > An ongoing fix:
> > > >
> > > > Since there is no room for marking *kernel_text_address as notrace[=
1] at
> > > > source code level, there is a significant performance regression wh=
en
> > > > using function_graph with TRACE_IRQFLAGS enabled. There can be as m=
uch as
> > > > 8 graph handler being called in each function-entry. The current
> > > > workaround requires us echo "*kernel_text_address" into
> > > > set_ftrace_notrace before starting the trace. However, we observed =
that
> > > > the kernel still enables the patch site in some cases even with
> > > > *kernel_text_address properly added in the file While the root caus=
e is
> > > > still under investagtion, we consider that it should not be the rea=
son
> > > > for holding back the code patching, in order to unblock the call_op=
s
> > > > part.
> > >
> > > Maybe Steven knows this from the top of his head!
> > >
> > > As Andy points out, "*kernel_text_address" is used in the stack
> > > unwinding on RISC-V. So, if you do a tracing without filtering *and*
> > > TRACE_IRQFLAGS, one will drown in traces.
> >
> > I tested set_ftrace_notrace on x86 and the function graph tracer does h=
onor
> > it. I wonder if there's a kernel
>
> After checking the log buffer, I can confirm that riscv does also
> honor set_ftrace_notrace. It does not print out "*kernel_text_address"
> in the trace buffer. Sorry for not making this clear.
>
> However, the problem is that the patch sites "*kernel_text_address"
> were enabled, allowing the code flow into ftrace and parts of fgraph.
> In particular, with TRACE_IRQFLAGS enabled, the functions are called
> extensively, causing the significant slow down.
>
> IIUC, it is reasonable to enable a patch site if there is at least one
> tracing instance that request the function. However, in another
> experiment, the patch sites of "*kernel_text_address"  are enabled
> even when all instances have them disabled. Here is a way to reproduce
> it:
>
> cd /sys/kernel/
> mount -t tracefs t tracing/
> cd tracing/
> mkdir instances/1
> mkdir instances/2
> cd instances/1/
> echo *kernel_text_address > set_ftrace_notrace
> echo *sched* > set_ftrace_filter # this is just to make the kernel
> more responsive
> cat set_ftrace_notrace
> echo function_graph > current_tracer
> cd ../2/
> echo *kernel_text_address > set_ftrace_notrace
> cat set_ftrace_notrace
> echo function_graph > current_tracer
>
> To figure out this problem, it is probably worth trying to understand
> why the patch site is enabled after the above sequence:
>
> It seems like the ftrace_ops being passed into
> __ftrace_hash_rec_update() at the start of the second tracer has an
> empty notrace hash. This leads to the eventual activation of the patch
> sites. However, graph_ops does not have the empty notrace hash when
> the user starts the first graph tracer. I am trying to understand this
> part of the code, and the relationship between graph_ops and ops in
> the fgraph_array.

Here might be the possible reason: the updated notrace hash for
Manager's ops is not reflecting the intersections of all users'
notrace hashes. According to the comment section at
ftrace_startup_subops():

         *   o If either notrace_hash is empty then the final stays empty
         *      o Otherwise, the final is an intersection between the hashe=
s

It seems like wrong arguments were passed into the intersect_hash().
Instead of user's notrace hash, the filter hash was passed into the
function. As a result, even if the function is marked as notrace in
all ftrace instances, the notrace hash in Manager's ops would not
contain notrace function, leading to enabled call site at the
notrace'd function. If I understand correctly, we should pass notrace
hash instead of filter hash, as shown in the following modification.

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 4c28dd177ca6..3a194559d220 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3515,18 +3515,17 @@ int ftrace_startup_subops(struct ftrace_ops
*ops, struct ftrace_ops *subops, int
            ftrace_hash_empty(subops->func_hash->notrace_hash)) {
                notrace_hash =3D EMPTY_HASH;
        } else {
-               size_bits =3D max(ops->func_hash->filter_hash->size_bits,
-                               subops->func_hash->filter_hash->size_bits);
+               size_bits =3D max(ops->func_hash->notrace_hash->size_bits,
+                               subops->func_hash->notrace_hash->size_bits)=
;
                notrace_hash =3D alloc_ftrace_hash(size_bits);
                if (!notrace_hash) {
-                       free_ftrace_hash(filter_hash);
+                       free_ftrace_hash(notrace_hash);
                        return -ENOMEM;
                }

-               ret =3D intersect_hash(&notrace_hash, ops->func_hash->filte=
r_hash,
-                                    subops->func_hash->filter_hash);
+               ret =3D intersect_hash(&notrace_hash,
ops->func_hash->notrace_hash,
+                                    subops->func_hash->notrace_hash);
                if (ret < 0) {
-                       free_ftrace_hash(filter_hash);
                        free_ftrace_hash(notrace_hash);
                        return ret;
                }

I can confirm that callsites at *kernel_text_address are no longer
patched after applying the above patch, if they are set as notrace in
each ftrace instance. I can send out a fix patch if this sounds like a
proper fix.

>
> >
> > >
> > > E.g. the ftrace selftest:
> > >   | $ ./ftracetest -vvv test.d/ftrace/fgraph-multi.tc
> > >
> > > will generate a lot of traces.
> > >
> > > Now, if we add:
> > > --8<--
> > > diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-mult=
i.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> > > index ff88f97e41fb..4f30a4d81d99 100644
> > > --- a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> > > +++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> > > @@ -84,6 +84,7 @@ cd $INSTANCE2
> > >  do_test '*rcu*' 'rcu'
> > >  cd $WD
> > >  cd $INSTANCE3
> > > +echo '*kernel_text_address' > set_ftrace_notrace
> > >  echo function_graph > current_tracer
> > >
> > >  sleep 1
> > > -->8--
> > >
> > > The graph tracer will not honor the "set_ftrace_notrace" in $INSTANCE=
3,
> > > but still enable the *kernel_text_address traces. (Note that there ar=
e
> > > no filters in the test, so *all* ftrace recs will be enabled.)
> > >
> > > Are we holding the graph tracer wrong?
> >
> > What do you get when you do:
> >
> >   # grep kernel_text_address available_filter_functions
> >
> > ?
>
> We get:
> kernel_text_address
> __kernel_text_address
>
> >
> > >
> > >
> > > Happy thanksgiving!
> > > Bj=C3=B6rn
> >
> > And Merry Christmas!
> >
> > -- Steve
> >
>
> And Happy New Year!
>
>
> Andy

Thanks,
Andy
