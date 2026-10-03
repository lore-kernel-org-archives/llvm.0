Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67815382F08
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060920; cv=none; b=A/QiI31COHi8DtIyL7dc1XAvaVKY7UZo7oKMOUYVy82vtFGytaeZaXT+AZZEcuiXmCeOxMy/Wa915r1wCmQMzksMN8mB7+rC7rnonmcm3fboPdQwornv5aASm4Y1clllaHez+p3woUmVuGSFR9uZR3o29wbdKACWPZLlyXsiMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060920; c=relaxed/simple;
	bh=ik7SfSihSd7srhBjbKZLRLCC+5A0g+MU1oxC+qFg0bs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UlHotXkZLjIWIGatYi6Xudg268bZFHeomX7PmWzaQiy3n9+OZq3XLfma/6Dm/0M4bWRiwspovtsF6tsZ/gpNHO6wall5Sv5tIt1q0VdqcZg9n4rcx4jyrEu4n3DtVPn4cIgHZoS1Q9sc1OauPEepQvnS3Qj+YxLk2h4UwZ83d5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ky8EfLvX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S7fsTYLj; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ky8EfLvX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S7fsTYLj"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1B1C71400071
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 16:55:17 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 03 Oct 2026 16:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791060907;
	 x=1791147307; bh=OfNciX7Kzw3HdRiwwkOeKUPFQ5qprTv16kcShTgN2+k=; b=
	Ky8EfLvXf0aC70x9f/nMD3WXA+ORYs4sALykdU2/byvq1nv0BBPHigAlpyAP/IqT
	4t4a7B77kJO33ETFg577Mcm1C64uJsiFhrOptkCHBDnhPOfOea06xKJxjoslPhny
	NU+6qCa4F9+i9LzVBCvpV59SwtCK0r6xZhlgkxCmxYytfqSon6hMPRqBlfGRttq2
	ErA4CulWUqFIR9sVNSk7cbv3os5GA3YemXOoMUiynnz3wdDzkfhE1tNXhzBkSDEP
	UgVbe+Yjvd0RpNOs4wuAcJXeyT6DUbaTOG0NHShsqP1wM7fExvHLA8M7iUXHdb4I
	5s2KK8dHRxOOXT4edsnK2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791060907; x=
	1791147307; bh=OfNciX7Kzw3HdRiwwkOeKUPFQ5qprTv16kcShTgN2+k=; b=S
	7fsTYLjnnNjAFIpV9EYHI9P4fZ8SL2NOH5xYHEmAezgIIrMGOKSjeIEgCvU0ro5k
	ceV6IEcXiw3jha2BPJwisPBO39rUSdXGa6M2nMqQldGF8uGfextNKsuROszwTUoi
	dVoDDQtAanLiF2lgALIhV9qoh4Y1Nj693i+Iy/rZQ4uiWe0iCrdysGCbXJwT3uEk
	K9SgzUGGWaJnBfNREMdKTKQ2jTiDyG5TZ+1GwhSKU+QO7sTNOPUeW6XE9lSmRic2
	ZB0UV7XHXfPXeP7bKDxJdci4fks4pKwTV3+elT9JJUnYlZ+mAkbqRhWJwqr2Sbfd
	9RYX0/1QQFWUk6TU4f93A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791060907; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:mZ+JwKS8Sh5FRNdBdbbTO5GkIlqqrf7idfcsTyLFEMVwt6W
	w5Pzbv4Px50TD3jjVkEyYw+VtIeV2xBPeqQkKmQ7amkZz4zrnp5M3IQoUsnzPLjc
	FFToOLP+fZqJHa8kfsiEIuLMkK+nDYzCioMyOLlCxok6WJwdvyW3ic+VbV/N9WX4
	S7TY/QaVtfzoYiqukaEtKrD+XgRu51zxiw+DKl95QIh2Njfj4cCGuoB58csambsm
	alwfN39nurmu5R4JpAKXINzfNPm0yPWysMs5dBUoNhDMnFBsfrJ8kjydMaQ2WxIR
	SxpxGbK0v6dzLdGudDpHrs+zWZEhPu1LaK2d5pA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GyCnERTPxeQJXOVuBs4/3L4C1Z0l5VIWw1a73NTjPwk=:ik7SfSihSd7srhBjbKZLRLCC+5A0g+MU1oxC+qFg0bs=;
X-ME-Sender: <xms:omvBauSuhQ9ggYy7989JCPhwB6R-s7ru-2oqUNtMJuJlcqt_drIV_w>
    <xme:omvBaukiy4RtVekt9T-yEl6ngW4FNAbq5hY6x1nS_MzUEkZ1LH80gpQuVS5z-rJEX
    ulZRvyDbtuqhWHFaQe7TrOO57-ZhP9pUGdvaab0E4BfIb_JVAVZETU>
X-ME-Proxy-Cause: dmFkZTGqH8D9AZ6i468pJhQ4wce95TqgvWhQCyTKZkCG4CrneDArON+7/8DMt2wEyyJ7OD
    D3pMjg1tDeDiOgWCeMuJ1436+gm3Us7QCtRXM6sLINq66msbS3UsULBA6yhM3Q7fnWFHb9
    N5i6fPBFDRCnd8M6jh7BeeFKr1WvING5wnczFTvlr12bejiGMrRnKq53guQRIJkf3sfbjv
    Z6jLx8VvQdtwlxix5W09SkU/bLFM4BeUQtlfLuAMzxVNy5goDBeDFqLs+0GzF2OMA8rTuq
    pDDPsid/yCcdhRBdYsMj/XKICHStxjoecO5Cc2TN0apwn1EEF8TUtps7HjyOJF5nWWRihe
    gVmvANIo9weSefu3A7KOOmck9frk3x8YsjLZgPBi9/KGkAXyFujXcKWPK4Unqqdd88F7uE
    RT4uzvp4dgWgsIH3Lc527rWyvdTGQrPBFj9ElH8RMnr9rezUz8kRcoy4WRqyBQw7PHhf0R
    O/HnmN4GzSW2Vn+VZv8titcAqBOuzlm25EA++2DeUln4VezeM63EY3qv9jKkic+gi79V5L
    T9wnwnzwtwVWc1/hztNmYbR64lDrBjl28EO7whK3Jh+QtkjBOcEwtBqTgYHy3f2nElM2B7
    oDxzOh1bkURtFbvfuCi4lXdUvZcxDFZHq8rGh/s5qOmE90PtoBkSSnz06A6Q
X-ME-Proxy: <xmx:p2vBai5fGbqic6xOPaGn7iuoMwyr8WkQ1Cax7uQWG-mDOJl1L4hGoQ>
    <xmx:p2vBalheBCeok7JKOnC49lqszB57hW1aDK4w7eAEsISLrtf5t71UdA>
    <xmx:p2vBak6jJP8_83eqUPlZg8VIIEIwR3qWHMvFYiy4QW3RvKIccFM1bQ>
    <xmx:p2vBamB8QStobUsUf2LgrNhs1Sb_6kP3ctE7Ya2atwurpH18c7Oz-A>
    <xmx:q2vBajK4fHg2k9GM_8swAZyfBQok5fZlrrX7qFBzzNoZQWYPACbz5o8N>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AEE9032A008A; Sat,  3 Oct 2026 16:54:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A-PcLBAcdglw
Date: Sat, 03 Oct 2026 22:54:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Linus Walleij" <linusw@kernel.org>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Bradley Morgan" <brads@mainlining.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>
In-Reply-To: <asEzZ1wOQ_MbgEsk@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
 <asEzZ1wOQ_MbgEsk@gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 3, 2026, at 19:07, Karl Mehltretter wrote:
> On Sat, Oct 03, 2026 at 12:45:07PM +0100, Arnd Bergmann wrote:
>>
>> > Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
>> > lowest architecture and stay excluded. CPU_32v5 also covers the ARMv5T
>> > ARM1020. C code is already built with -march=armv5te there, so Rust
>> > matches.
>> 
>> None of this makes sense to me: The target should not control
>> the instruction set, that is what the -march= flag is needed for.
>> Does that not get passed for Rust?
>
> No. arch/arm/Makefile only passes --target=arm-unknown-linux-gnueabi,
> no CPU or feature flags. That target has "+v6" built in, so Rust code
> in an ARMv7 kernel is built as ARMv6 today.

How do you build ARMv7-A rust code in user space? If the default is
ARMv6, doesn't that rule out things like thumb2, vfpv3 and sensible
(inlined) atomics?

In the kernel, we don't normally allow neon code, but it sounds like
we may need to make rust depend on !CONFIG_THUMB2_KERNEL, as that
may be problematic when linking with v6 code.

> I tried the generic target with CPU flags (libcore for versatile on
> v7.3-rc1, rustc 1.99.0, CPU arch from the build attributes of core.o):
>
>   --target=arm-unknown-linux-gnueabi
>       ARMv6, uses uxtb/uxth/sxth/rev
>   --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
>       still ARMv6
>   --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s

Ok, so I guess this is more like -mtune= in clang and gcc?

>  -Ctarget-feature=-v6
>      ARMv5TE, but every rustc call warns
>      "unstable feature specified for `-Ctarget-feature`: `v6`"
...
> So -Ctarget-cpu can add features but does not remove the +v6. The
> generic target also declares 64-bit atomics, armv5te and armv4t only
> 32 bit. Below ARMv6 I only see the separate targets.

Maybe this should be "+v7-a" instead of "-v6" to allow allow the
compiler to use all ARMv7-A features instead? It would be surprising
if they added 32-bit Arm support to Rust without a way to target what
is in almost every single chip and Linux distro today.

>> I don't see what part of rust would depend on ARMv5 instructions,
>> it should just work on ARMv4T as well, though ARMv4 may be
>> trickier because missing bx instructions etc.
>
> Agreed. !CPU_32v4T only came from the armv5te target, which emits clz
> and blx. With the armv4t target it can go. ARMv4 has no rustc target.

Ok, makes sense.

>> This looks wrong, the choice between armv5 and armv7 should work
>> the same way as the choice between armv6 and armv7/v8, if I read
>> the rustc docs correctly, this should be using the target-cpu=
>> argument on the generic arm-unknown-linux-gnueabi target.
>
> There is no choice between ARMv6 and ARMv7 today. Both get the generic
> target without flags and so ARMv6 code. And target-cpu= on the generic
> target does not get below ARMv6, see the table above. That is why I
> used a separate target for ARMv5.
>
> For a v2 of this I would
>
> - pick the rustc target next to the -march lines: armv4t for
>   CPU_32v4T, armv5te for CPU_32v5, the generic one from ARMv6K upwards
> - select HAVE_RUST for everything except CPU_32v4 and plain CPU_V6

I would leave out CPU_V7M as well, it's not worth trying to
support, and likely going away soon. It's probably not supported
by rust either, as this requires building with -march=armv7 or
-march=armv7-m and is definitely incompatible with -march=armv7-a
and -march=armv6k.

> - make arch-support.rst say the same
>
> I have this running in QEMU on v7.3-rc1 with
> - sx1 (OMAP310, ARM925T, ARMv4T), omap1_defconfig
> - versatilepb (ARM926EJ-S), versatile_defconfig
> - raspi0 (ARM1176), bcm2835_defconfig without ARCH_MULTI_V7
>
> Would that be ok for you?

Yes, sounds fine to me, though I would still hope to get native
ARMv7-A support in place of "build for v6 and hope for the best"
approach eventually. 

      Arnd
