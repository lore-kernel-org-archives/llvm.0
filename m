Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469022;
	b=u/am57A3GPnpoXvZ6j6gOdngZTGeZ6zePryg7qKFqKtSmXKNwyZv13MxrE2I5HSU46T4
	 leEKPdE5FejMl8LCP3iiZZdeQ7O/QbwQJr1+H5V3T0UcrItoQTShIrFSyO4QRnGu9WQrw
	 GBNMgXr0CSeG9kV6vQZIVGJqhy8XBbq4xRXD5t3TqOX1odruyaEs63G7MxzzbEq3QGlCc
	 P2wuvEP2FL1SAylQyWe0BnxWeMgOHLhJieirxKAT2g3OtwPVJLPJoG0kTd7wtEbby2/ce
	 9R7itv4BQ+D7i9CDSSRR8/SvLBhBK5vcsuJZroXfoedrCdLHW/lUOP7Tg1JmMSj6fbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469022;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=GFKS1M/ugygSth0KV1QCCg4c4RPGB7yY7RUQAx8Pqdc=;
	b=CIjrpbG0OI+LVudIsagjvydaA7sb+60YlbMie+OZkbYQSZRFQrXmha3q70iSl3//x+aV
	 2jqPGcWF9vCwR+5TQWT6rw9wFDYIRcrZfG7aj/J52ye23fmvjM6d/blrShuumvj6RXw/n
	 0CE7AxJ+O5xryR6tvcJeEOhU9BrQPpg3+kavj774l+7CFo8ZWCC99VbbcKm/VMUvfH3LF
	 shUUPd4ZAEfNNJ2x6JYjFs0oILo6czRWese8Yqf9tuYTGycO59Tk3226Lwsnu/LKdSXD9
	 4yl8HVkYFICeuLz3ytNfrVgjzYu4HUTUdWThmHImmL5mTeyPL7g4Yqnekep6fjM2bOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b89gdi9D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24996606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b89gdi9D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A281E1F000D2;
	Mon, 23 Nov 2026 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469021;
	bh=GFKS1M/ugygSth0KV1QCCg4c4RPGB7yY7RUQAx8Pqdc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=b89gdi9DouznMBe+ShzlOtiKgXgqNoFjhpKo5jKI7IEw6wTwCHIBXtebxKLh7blmT
	 PCFxTw5HKujQOYfAIE6F+i38Jc/rHZZe+2+pWCRv1gCa+r+SfcfjJdevoRgZQ0v5IM
	 c9FJTIphJFLJBT6HTYHLBsGN3X0pX0N6qSkPXCYL99zxAyVJlgn4VWnNgmZLhAmLA5
	 Mc3st0l6/LiKvGhtTg1oLYgwV2QcaSiSZqDykWCZvSN+zqEpyA6zIR19qrpWvVaZVT
	 fltciZtCP8kv9BPWLaxl7M842vgshfXpCll6XvOMPa2Im94bGnSkNbQUKWB7T9PleA
	 5befu3CpkWeJQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id C4887198003A;
	Mon, 23 Nov 2026 16:23:38 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 16:23:38 -0500
X-ME-Sender: <xms:2K4Ea0SSde7BXSoM6ODRwD9RArJol7NOgv00R7Bt1jYYukxjRxRNRA>
    <xme:2K4Ea8kyt9Mw3rSPUEcvE0uSz4u_nb9m7TBU26wyujiWQXVeWbYZ4YtEjr-h_IQ27
    5fdGvAop2QeEsegZFOVeQ04alZQWZRsX6ZoGD0qHmMsgaIWNUznFquf>
X-ME-Proxy-Cause: dmFkZTFInon+c5sIa6I1naIOJZlzN6rFeuvwKb3zVD+CP6sukxXXVdc4xoOYAJTOf3U4ZX
    HitTXuaAwYPC3JUsPNSBwWNHDVNKNH2hfrnWxyTOALciBMUl/v24zohAjAtB6AvB/KcPe4
    wtFwEZdbYYRn+nar04E46w6/ycWBsApcKhJRAGzOOripbpWwDM6dfxvXAJQjXp7Qc5WJDB
    U1W0RbDoRP//cg7tpuvlcMgileqv9EG6rDxoKRm+6+9bL7kR61TJIt4rSgmYHFUXEtkEjP
    1gBlsEE/QA09CI1ISO5TKIcL9RGMqQq6Zw6vugr0vuxZyhICjY3Npj0vlCWVwemZ1wQ4ml
    U5/zdjlUrdvsDKWnIdEkcwSVwA1yuGz7UM3PFEYdUM0BCC0fztjVz2vWMr+XY0SDeU/DCm
    9ZvSU/2fLyruVDr/5KcEKiPkTOqha3xHZAWT3n/OVoV1o6wdU+DoFEkjQJu5e+Hk8sH8lX
    BVnE4CFxf+A1L2tAtx8UvsmZ1/5zqlEwvLyLygMicgdbp/aufndnA03xOIjvIL72SRKueu
    uJFSl5SdORSFh0q20NWC8+fjo4Zl2Yvm6Iyu8pYZPgyffJ7EtQoBxfT5x3e1hCk6xQegfT
    qD4j+d2nYHzTHwGsoqL6Ks+7IwNE3Dc8DrK1w2dSKbqaVNmBOidFJxEiukOQ
X-ME-Proxy: <xmx:2q4Ea5G5Zd9fky5VJDa77IBnVw0oFgW3HpwUyfJnzKrQRQ5FREO5rw>
    <xmx:2q4Ea7CUXmDw307bZ5kAtoMIwCladoHbXBdW4mP9DAtwRSVxGmHp-A>
    <xmx:2q4Ea_BRCS4nptObegFBoFTZdzgZwJk0rc82DoY7RMB11IpSc8LkPA>
    <xmx:2q4Ea5N2m0AHrQeTIkagCLA8eZ-o0MPxNh7lvVyjiiYafSSztAbBvQ>
    <xmx:2q4EazPctL83sAJklw-MIz9I__KeAaLT92pjBAEvfAlNSZtHjNURbyUV>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 43F71F8008E; Mon, 23 Nov 2026 16:23:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AiuDo6z7Qkcc
Date: Mon, 23 Nov 2026 22:23:16 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, "Bill Wendling" <morbo@google.com>
Cc: linux-kernel@vger.kernel.org,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Waiman Long" <longman@redhat.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev
Message-Id: <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
In-Reply-To: 
 <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
References: <20261122105646.2223131-2-ardb+git@google.com>
 <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock pointer if
 unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
> On Sun, Nov 22, 2026 at 2:56=E2=80=AFAM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> When lock debugging is disabled, local_lock_acquire() and friends are
>> empty, and so the per-CPU lock pointer that is passed to them, which =
is
>> usually computed using this_cpu_ptr(), is not used at all.
>>
>> However, on x86, when the compiler does not support named address spa=
ces
>> (i.e., Clang), this_cpu_ptr() is based on inline asm with a memory
>
> I had to look this one up ("named address spaces").
>
> https://gcc.gnu.org/onlinedocs/gcc/Named-Address-Spaces.html#x86-Named=
-Address-Spaces
>
> So __seg_fs / __seg_gs ?
>
> CC_HAS_NAMED_AS : arch/x86/Kconfig#2331
>
> Weird, clang _does_ seem to support these, since clang-11 (clang-17 is
> the current minimum supported default).
> https://godbolt.org/z/cfhj8r69E
>
> commit 47ff30cc1be7 ("x86/percpu: Enable named address spaces for all
> capable GCC versions")
> added a
>
> depends on CC_IS_GCC
>
> What happens if you turn that off?
>
> Ah, a week after that commit was authored, the same author filed
> https://github.com/llvm/llvm-project/issues/93449
>
> (currently assigned to Bill; Bill, can you PTAL?)
>
> They also filed
> https://github.com/llvm/llvm-project/issues/93449
>
> https://github.com/llvm/llvm-project/issues/187893 looks like possible
> a dup of one of the above.  Bill, can you please take a look at those
> 3?
>
>> operand, and Clang does not discard such inline asm even if its result
>> is unused. So the computation of the per-CPU address of the lock is
>> emitted regardless, e.g., on every local_lock_nested_bh() in
>> process_backlog() and on every local_lock() in the folio batching cod=
e.
>
> I'm more so curious how you even noticed this problem? Was there a
> thread? Were you looking at some assembler and wondering what was
> going on here? Or was there another thread about this?
>

No it manifested in local testing of my fgkaslr implementation.

I'm doing some very detailed profiling to ensure it does not regress
performance.

> Very detailed commit message, but you kind of bury the lede here on
> what the actual problem this patch is fixing *is*.
>

Apologies. I'll trim it down,

The TL;DR is that non-volatile asm() statements with memory input
operands are not elided by Clang if their output is never used.

