Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793557323;
	b=gD8aQ8GaU7IBgWUu2zuA9aMgMS9IypxXb30Osgj9iWGkiIH3H5sN3W0vT3Sbx2hxsja4
	 zNcXQArWLO4fEN8G44czAZ2g6FiGkn7O8J6P/d9vKWErJnA76NObcqpjyp2SDj7ij9T+N
	 gMsX712Ltt3M4c8MNjkfN2yKJg5HpuLVq9ZtlKvY8atqJECCx8lcRuiRJG8JWdNv8qyFX
	 IzqehBsStM7MpQs2K3kYL+f3UW21wv+61X6BHWSCydro8Fks/O6juYU1OVrFleuH/YcVt
	 CfbVr7fMI3zOrmDYdFaVc2OT9s9obb9k8QW42DNvhnmvjBtJmCkzE0KQqf2lmaZh6cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
	b=YCZ8DIbHThaYETCC0Z8N+AT/7LQPpCw8VJUL42lvKzUsMk97T7qQNwArCiS8VkoPKY0+
	 oqdMec4qt/yy2wuvcKIyQ+X1uW8Lyms5DlTP6p+km2QqWd1r+4G4euyvXeADtRFVCuMBd
	 /HFt7oo5fZ3+j/YHM01dN9+e/8JNh0Y3/XU/JVLqso8mob2gYs3tjyyV+u+qvHZ2TBxZC
	 naN64YaA/iLURnKluCJcMC3XvUlk50g1fC/82TK76e8HLzjtFSDyn0OSH5lm25yFbcGq1
	 ljd3Gv0af1lYl0RAONkzE7WsfzBJYVIBzVF4Cqq87XI+xnZp5zcBJ0m31QFUkSgyJnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bcKBHZ4G;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AB606A326
	for <llvm@lists.linux.dev>; Sun,  1 Nov 2026 18:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88AB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bcKBHZ4G
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so17237785e9.3
        for <llvm@lists.linux.dev>; Sun, 01 Nov 2026 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793557321; x=1794162121; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
        b=bcKBHZ4GBVQDne/LJuvy+sS+1jPu1JcMkXqxnJv5ovuJ33mg8T+vLnz7XuaH++qQSb
         YBCCnPIDJKnna02ddomQFIApMxjLeu5/EleqelpEDpPJQyG5mQa52BeBC1p5SFPUTyHv
         dAtrGTjALKqrJi632o4IGppQy9jhcz8v4VuGHwEFD2Vh6FW4VPR3jYXMYCVSPmTCHFp+
         icp8oytixi5e/fHRSA230Gv0uygmdM2LlVXFlFgD+VJ0hXiAdbaFUE1R0K9MLlWTox4N
         PzTHE3aPj07zxanaJL/ce1pvL6MUWD/gDcV2XML/TJzA8U1EfjU1lwK55Prt9/+2qzLV
         Q6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557321; x=1794162121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
        b=GGxug75Wnwi4IV0L4D7QQAqzqSok+Gt66MUuuJjOjszTIuwCyTkhMGn3gat8hG8yx7
         xKcGIIFigO9fMToxwzdsTicKvojzBLZ9gm6IiMYcMv7rdu1AceAprrbjVg6RTcEgBj/Q
         t18KzlERyO/1hcBpSms9tk0oT2oiDcTf0T8+2OIvcbh3D6TrQZXRQhN4OmXO6dDSh3LK
         Mk7K/jF8JEejKNCWU+IkToYlApAzpLcZJ9peDhS0KufqOYT/uN4nC9iMcKaTKcMK0IOL
         SPjXcaSSJW2BvSOZm19YqxWyEc4TgRCTn3YIexXyLYoTf0FvHeicDX4afWAJ1pHtR6Mk
         22Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwnJN6i6MDvBQmEBkOAQkWaGddx0Ihhz7HY51pcROKxxf86jvlvSD7MSqPfNmXz01Rjr2OE@lists.linux.dev
X-Gm-Message-State: AFq9FYJygkiUHf32wp4M2/U6Zf9P8cqS5z62CMX7tCymo8MCa4MrAWuQ
	kFBjgftUatnFC19SU9fkEh7dLZFstNXjltWGB/WLhe2bEgBxQNmsm8zV
X-Gm-Gg: AYBFou1sjzAG7KxxIFO7S8oH/kSKXsev07889G7SYPphHbcIsIByGwnvPE41MeDQG0z
	y8ebxXg+lkpRDP+nHHt1L1fpL0ZJzChD4HyfvkeYSekujqbgt93YZOkRfUc9LabzfIjviQow41M
	eN9qfrRJvmt5BAc51w4v3/wzK1zE/UG5H0MklPGQ7hfYugQq8mxQKBmhdC5sy/xL1Ofu2MYJAgX
	H14+/XQwEJ8fsBvwut24PXYjLCNj39r0UnmztHZn7PWaOe0eZ/aPSS2DZsahVlwv0zXP90rVTvZ
	JsBJhg1UiZrjYNWIVLLex+GMygZ3N6fnUNEFb9eiSD+fFbVmvqSCDdOrhO/A34MhD1MRZ3l9ej0
	T2Gus+pmuauD/u9rFJjq4gezAW18WG5/J+f/g3nY+g8H2ZRRrzmYr4xe1U3cok0Taxgoh/Ngw3E
	pZEcWrz3whiH8HD55wDzydN6316BL4C95ZRlCazI7IPf6bomwqxmenILnnbWk2mwIHogOa2u3j6
	3eHIGIrZPxdGoVESYie6+UiBRqwogc3azyRO/b8Y4MXpZ1MItenPLo4xIfAV2U/cDrMPApdQ9Yn
	QN3OwB78y2PS/h4bIqHnZhmqbcn+WSFVRN9sygqRl5TJbjS55nwKuTeFgkqL+ZFk
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr181298545e9.23.1793557320864;
        Sun, 01 Nov 2026 10:22:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm216805675e9.2.2026.11.01.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:21:58 -0800 (PST)
Date: Sun, 1 Nov 2026 18:21:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Biggers
 <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Marco
 Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261101182156.380dbaf6@pumpkin>
In-Reply-To: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 1 Nov 2026 14:33:49 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> Hi David,
>=20
> Sorry for the delay, I was in the middle of a company change.
>=20
> You are right about SG and TX csum, but only when the traffic goes
> straight to a NIC that offloads them. There is another side: software
> GSO (skb_segment() with !sg && !csum) hits this path on 100% of TCP
> payload over WireGuard (wg_xmit() -> skb_gso_segment(skb, 0)), and on
> drivers without SG/TX csum (u_ether/f_ncm, cdc_ncm, mt76, rtw88/89,
> ath9k).
>=20
> So in general the software copy+csum path is still alive.

I was partially worried that someone had just looked at the code and
noticed that arm didn't have the code to do checksum+copy and decided
to write it.

David

>=20
> On the other hand, NEON is useless here. skb_segment() splits GSO
> packets into 1-MSS segments before copying, so on these paths calls
> never exceed 1448 bytes (1368 on WireGuard). At that size
> kernel_neon_begin()/end() costs more than NEON saves, on real hardware
> v1 was ~3% slower in cycles/byte than the scalar loop on the slower
> cores. So that part can go.
>=20
> I would prefer to keep only the scalar version of the fused copy+csum.
> It reads the data once instead of twice, and on real Armv9 hardware it
> cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> depending on the core (+6-8% throughput). It uses only general-purpose
> registers, so there is no FPSIMD state to save and it is safe in any
> context.
>=20
> If you are OK with the scalar path, I can send v2 with NEON dropped,
> the scalar path only, and the KUnit fix for the x86 zero-length case
> Jakub reported.
>=20
> Thanks,
> Demian
>=20
> =D0=BD=D0=B4, 27 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:44 Da=
vid Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, 27 Sep 2026 15:17:56 +0200
> > Demian Shulhan <demyansh@gmail.com> wrote:
> > =20
> > > arm64 currently uses the generic csum_partial_copy_nocheck(), which
> > > performs memcpy() followed by a second pass for csum_partial(). This
> > > double pass exerts unnecessary pressure on the L1 cache. =20
> >
> > Which workload actually needs this?
> > Most modern ethernet MAC support checksum setting on transmit and
> > checking on receive.
> > So the software checksum shouldn't be needed very often.
> >
> > IIRC there is also code to defer UDP checksum validation until the
> > copy_to_user().
> > I'd bet (a few pints of beer) that the complication this adds isn't
> > actually worth while.
> > Even Linus can't remember why it was done, my guess is it improved the
> > performance of the userspace NFS (over UDP) daemon that would be
> > doing 8k UDP send/receive (fragmented by IP).
> >
> > There is certainly still code to checksum data during copy_from_user()
> > in send().
> > Last time I looked I couldn't see why send on TCP sockets didn't go thr=
ough it.
> > On x86 (in particular) copies can be done far faster than ones that
> > include a checksum.
> >
> > David
> > =20
> > >
> > > Replace it with a single-pass implementation. The new implementation
> > > provides a general-purpose register path for short buffers and atomic
> > > contexts, and a kernel-mode NEON path for lengths >=3D 1024 bytes.
> > >
> > > Measured in-kernel on an Ampere Altra (Neoverse-N1):
> > > - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> > > - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
> > >   4096 bytes.
> > > On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> > > 1.6-2.4x above. No length or alignment regresses on either
> > > microarchitecture.
> > >
> > > Patch 1 implements the fused routines and the dispatcher.
> > > Patch 2 adds KUnit test coverage for the new API and internal paths.
> > >
> > > Tested: in-kernel benchmark module on Neoverse-N1 with both
> > > implementations cross-checked (0 mismatches); KUnit suite under QEMU
> > > (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> > > testing of both routines against a naive reference with PROT_NONE gua=
rd
> > > pages, gcc 13 and clang 18 W=3D1 builds, checkpatch --strict.
> > >
> > > Demian Shulhan (2):
> > >   arm64: csum: Add fused copy and Internet checksum
> > >   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> > >
> > >  arch/arm64/include/asm/checksum.h |   3 +
> > >  arch/arm64/lib/Makefile           |   7 +-
> > >  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
> > >  arch/arm64/lib/csum-copy.c        | 108 +++++++
> > >  arch/arm64/lib/csum-copy.h        |  84 ++++++
> > >  arch/arm64/lib/csum.c             |  54 ++++
> > >  lib/Kconfig.debug                 |  10 +
> > >  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++=
++
> > >  8 files changed, 896 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/lib/csum-copy-neon.c
> > >  create mode 100644 arch/arm64/lib/csum-copy.c
> > >  create mode 100644 arch/arm64/lib/csum-copy.h
> > >
> > >
> > > base-commit: 93f51579e7df248780214094418f205253383cc5 =20
> > =20

