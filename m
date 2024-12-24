Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4889A13C9A6;
	Tue, 24 Dec 2024 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735010108; cv=none; b=fjyM0z1i3pAG7Ccwyd3F4xt7Q+HzrNog7xkBHCzZSnZZvNXK2tmeD0wsWa8E6i84ChLJhVYG/rCu4tMiaY4xrsycUgshFtOSniRJ9RAjT7s9xvjW+RI+ryBzMkimGHY389RIU2fPBDA2ty+ERF9S63LMP7kppqpi8acywjx+P/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735010108; c=relaxed/simple;
	bh=/OerEw+Wkp9Uh+oLYdywt5w/jPmZo0ox7xR+A/sD3hw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbX6S8P2Yy+8Nh68H5u6jjTAvfh4TplM+8bt68W4nNXEfmaLqcgHeevhZbEGnPLqf93mzoYHnNX1fbAHPTp3DAc6I6sb5zfwqI+tp1dwvAC9KHS/lVEcnbqlWHqh5bvh4K1zidxUseSOvld5vyCB2NvnHEXWfDruXE3dd6CAsV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5FEC4CED3;
	Tue, 24 Dec 2024 03:15:04 +0000 (UTC)
Date: Mon, 23 Dec 2024 22:15:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com,
 puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com,
 greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
 tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com,
 zong.li@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
Message-ID: <20241223221556.1f5e598f@gandalf.local.home>
In-Reply-To: <87frncmkre.fsf@all.your.base.are.belong.to.us>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <87frncmkre.fsf@all.your.base.are.belong.to.us>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Nov 2024 22:25:57 +0100
Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrote:

> Adding Steven.

And this has been in my draft folder for almost a month :-p

I kept coming to this email, but then got distracted by something else.

>=20
> Andy Chiu <andybnac@gmail.com> writes:
>=20
> > This series makes atmoic code patching possible in riscv ftrace. A
> > direct benefit of this is that we can get rid of stop_machine() when
> > patching function entries. This also makes it possible to run ftrace
> > with full kernel preemption. Before this series, the kernel initializes
> > patchable function entries to NOP4 + NOP4. To start tracing, it updates
> > entries to AUIPC + JALR while holding other cores in stop_machine.
> > stop_machine() is required because it is impossible to update 2
> > instructions, and be seen atomically. And preemption must have to be
> > prevented, as kernel preemption allows process to be scheduled out while
> > executing on one of these instruction pairs.
> >
> > This series addresses the problem by initializing the first NOP4 to
> > AUIPC. So, atmoic patching is possible because the kernel only has to
> > update one instruction. As long as the instruction is naturally aligned,
> > then it is expected to be updated atomically.
> >
> > However, the address range of the ftrace trampoline is limited to +-2K
> > from ftrace_caller after appplying this series. This issue is expected
> > to be solved by Puranjay's CALL_OPS, where it adds 8B naturally align
> > data in front of pacthable functions and can  use it to direct execution
> > out to any custom trampolines.
> >
> > The series is composed by three parts. The first part cleans up the
> > existing issues when the kernel is compiled with clang.The second part
> > modifies the ftrace code patching mechanism (2-4) as mentioned above.
> > Then prepare ftrace to be able to run with kernel preemption (5,6)
> >
> > An ongoing fix:
> >
> > Since there is no room for marking *kernel_text_address as notrace[1] at
> > source code level, there is a significant performance regression when
> > using function_graph with TRACE_IRQFLAGS enabled. There can be as much =
as
> > 8 graph handler being called in each function-entry. The current
> > workaround requires us echo "*kernel_text_address" into
> > set_ftrace_notrace before starting the trace. However, we observed that
> > the kernel still enables the patch site in some cases even with
> > *kernel_text_address properly added in the file While the root cause is
> > still under investagtion, we consider that it should not be the reason
> > for holding back the code patching, in order to unblock the call_ops
> > part. =20
>=20
> Maybe Steven knows this from the top of his head!
>=20
> As Andy points out, "*kernel_text_address" is used in the stack
> unwinding on RISC-V. So, if you do a tracing without filtering *and*
> TRACE_IRQFLAGS, one will drown in traces.

I tested set_ftrace_notrace on x86 and the function graph tracer does honor
it. I wonder if there's a kernel
	=09
>=20
> E.g. the ftrace selftest:
>   | $ ./ftracetest -vvv test.d/ftrace/fgraph-multi.tc
>=20
> will generate a lot of traces.
>=20
> Now, if we add:
> --8<--
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc=
 b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> index ff88f97e41fb..4f30a4d81d99 100644
> --- a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi.tc
> @@ -84,6 +84,7 @@ cd $INSTANCE2
>  do_test '*rcu*' 'rcu'
>  cd $WD
>  cd $INSTANCE3
> +echo '*kernel_text_address' > set_ftrace_notrace
>  echo function_graph > current_tracer
> =20
>  sleep 1
> -->8-- =20
>=20
> The graph tracer will not honor the "set_ftrace_notrace" in $INSTANCE3,
> but still enable the *kernel_text_address traces. (Note that there are
> no filters in the test, so *all* ftrace recs will be enabled.)
>=20
> Are we holding the graph tracer wrong?

What do you get when you do:

  # grep kernel_text_address available_filter_functions

?

>=20
>=20
> Happy thanksgiving!
> Bj=C3=B6rn

And Merry Christmas!

-- Steve

