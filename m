Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3BD3C988E
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024350; cv=none; b=Jl+mf38iYpzoF81LusGy+9VOfGeSgN/s42LTdeilLdmEC6UUT42ltXTXj8MsQfM2epwYmMNrj3Mo7HxUJQW9MMuGPq+lcy1ju7ku8vAl2YXUd95iT9jmW073CjnDNlXDRcDcFalPw7cFcuF+qY8aUK5nbQmZX7DzjGJW1e3HSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024350; c=relaxed/simple;
	bh=zN8NwfOwTEFS4HgV6P2aMwyRYwUoOzd9vCuBgwE1hmQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CCRkJpi54nBzddjtKKsobBKwQaU2Q6zzkmdq92i4QDH4/wqyu1S3nAon3tPNnjCOEPcun3RiLYdUW9+uTe01kPzCupQz9Wd62nnH1Pkaz5bxTdj8nWxFXJ8wwBYnENIGmLp/YiN6A2R8rFmr+WJHih8Bisq3yP5yQ5k0mESpjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YLqUkDSL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=yosQDK5z; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YLqUkDSL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yosQDK5z"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 460F9140009A
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 06:45:47 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 03 Oct 2026 06:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791024337;
	 x=1791110737; bh=LbsAV9q1BJGs+RkHnrhLC9PjudY2w8K1olk814fYDss=; b=
	YLqUkDSLnOO5W2+kr3uyDUJms2s0k1nxGPVMI587cpcNfbbJinuDNNKBZULzoO0k
	VR43naVRki4CFgPaAWlo57/uuv0KbDiEohnV/ZcwfUwR0sNZMirQQDgdS1DhFxYO
	v6DyvC99DtCCnCECQpVUujjesdTs15J5BUiSPxik6AmW9JpsEj6hXp3k2REeYf0h
	Zai7P928NxVEiiXatDLohLMLCdbBgSQqQ0ryzyAGCM+AMHlTC+C+wpFG4bQC394j
	4SHNYj0TefUA8SFu0EfiJYkbdjSVYFHBdlmTLem1M0yqdvSrpSO1qXm2oRKRonOR
	nPrw/HpLL3NQ2SwfKMEGQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791024337; x=
	1791110737; bh=LbsAV9q1BJGs+RkHnrhLC9PjudY2w8K1olk814fYDss=; b=y
	osQDK5zING56/JOqlIJng/59CIrDqlEUjX4E5aeGvmHoZcR0CQC5lnwLmQc3f2NW
	Bh5aZilJtw+kppB/qC683hjzDcNmZrxyt00nplehAlHE58Icp4YqZTkd7eK9DbLz
	DclJOLn6A1VDzCVB2Tf6sjbQfjFwlyVaaRhe1/xqphs2SKPqeKTerazVYGz97sEh
	9JB1i0XrPp33wqyIfA8ZHsgoh5UfZJXbIft1j++dFtKhXpW13+1ngi0Uy6Gs/KE0
	ZCO2pN0y2sDxii2JBv/NZQkmP1nwwsehkBhGGcuDob1xPCdBRBFFWSdbYr2YzOV6
	Do+pLTuLtvp4oTxdRc1ew==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791024337; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:hPCh96TqOM5Swk5Oi5nhRLkWS7QRsMNPvHnYMgVqYIS7IsH
	RWqAqmw+DejP0N25DXozOCP91TlYsl93DcL64Qd1AY1AMHzlxsc/92MSfRxSrtj/
	TR86TM6dQSi/JzO4AHkpbq9LBQSlI36vMe4OktLr85ddDMEqEypo17Ho0rnEzZHO
	q+/2H5R+j30ftkIEd8yxolI9aTA8rB7pG+eaepRuJcDACQLAgCiAhMRTy7UWoh8E
	02hkn50iQo18z4ZOJhT+FU8VhqLuG4XSkC8i7W36mVjTp8ATYQEKcjrDX3EDTf31
	m4/56ggvdm0jzleqtW7kRI5aNnXJModAw4u0x5A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:j/98+heVyS4qQGyuupafB+vXRsAdPzNdRaTDbkxL6S0=:zN8NwfOwTEFS4HgV6P2aMwyRYwUoOzd9vCuBgwE1hmQ=;
X-ME-Sender: <xms:yNzAav20WObJrSLISZBjIvttufyxI7bnGL10KJ_JWUGKW_LIHE-1Eg>
    <xme:yNzAao4xK-H9_BLwiaqg6-0_45R0UmSND8EfeunishzlxayIIRm6BlAoS4h5G99tM
    ZGf34psl_spsEbmAJBGbGdAawa4WGIXYktKBiyGfB0RJS5dJcZjI-5->
X-ME-Proxy-Cause: dmFkZTEbg1jSKr1GfSmMC2AVkUcfFCIwA/48EoLzIZqsaRTiyliBq5GUXDoG8OlN3hWdR+
    OEoCH1iWD3Q6XYpoN9n/8kZ9MPqWLGQ/udEmnZSbPkpNZh2+bu0kE5lQgc8rFMxqJsrqIR
    gnlaHSqxSCzM3B5uSm2+4yJ26fS/OChfxe1+y2kn/yvPHuWFMeGzn7GPqgF688lRAEj8uJ
    jIMXjAqn2DFn88jbkSGLfIAzF9I/9Yd73/Ns54OHAWmmelfD/6rDlG2nwLJWBekaldgcO9
    59F0L2sSVceLXlQehYTRjBnUyER5PgS9zM1W3X9qKCQ3LtibKaf39+pv7TFSTWKPvbjPRA
    jskfXeD4lBCzvwU12IUiMxxRL7xUuvoXjLytayh0P/q6Vgvvym+a/pAM9/YYU5ImasQxs5
    RKoo1fIpbhwIqUc9nERpU9/218tv2aXj7QsdD7JV7iE1pgcbEtpqHgK54U90KeehazFHYN
    MtxGIwg1SSu1eR8gYoc/jBOZXy3KOJX2lTDWuBM+3DPK6buGSidzxGDFOGuL0ZANPgK244
    0s+cOyxFmJS8crMbyk3FZ0qmJ+Tq7cqIFej63zAgf5gwDI3YaHxNvFjLAMheDyduozNKtb
    /iAQWSlkfDZB4yXU2nklwlVHw279+nx5FJrsV3j/NnxEgkk6/6OLFoeX/hpQ
X-ME-Proxy: <xmx:zNzAaj-hnE1kKloc2GdI5cXKMNh49_ewuOBuO4HESOxIFSDq10WNLg>
    <xmx:zNzAapXF7ojCayMW7GP0vGjlwIJvGHfnX7QQXdx1Rx0HotMyUxnD6g>
    <xmx:zNzAakdm71pZpEMd-WXfK5EvQXu_s-HEu8ODynvx5d6O6fDWxX64vg>
    <xmx:zNzAamU2ThcEE0shuuKm3lmiSGL7O8OK8ohY7MZap-XEWl8EoRFoDA>
    <xmx:0dzAagZieGoLkWzHHGKjNvH3fbmD8fgX0zkJfeISpd65iWcq4O0wnSeJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 070D132A008A; Sat,  3 Oct 2026 06:45:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A-PcLBAcdglw
Date: Sat, 03 Oct 2026 12:45:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
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
Message-Id: <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
In-Reply-To: <20261003093827.77857-3-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 3, 2026, at 11:38, Karl Mehltretter wrote:
> HAVE_RUST is currently selected for CPU_32v7 only. The
> arm-unknown-linux-gnueabi target used for ARMv7 emits ARMv6
> instructions (+v6), so it cannot be used for ARMv5. Use rustc's
> built-in armv5te-unknown-linux-gnueabi target instead. It keeps the
> Linux EABI (no short enums, unlike the -none-eabi targets) and is
> soft-float and strict-align.
>
> Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
> lowest architecture and stay excluded. CPU_32v5 also covers the ARMv5T
> ARM1020. C code is already built with -march=armv5te there, so Rust
> matches.

None of this makes sense to me: The target should not control
the instruction set, that is what the -march= flag is needed for.
Does that not get passed for Rust?

If an ARMv7 kernel includes ARMv6 instructions, that is broken
on ARMv8 CPUs that are lacking the CP15 barriers and swp style
atomics, so that needs to be fixed.

I don't see what part of rust would depend on ARMv5 instructions,
it should just work on ARMv4T as well, though ARMv4 may be
trickier because missing bx instructions etc.

> ==============================================
> -``arm``        Maintained        ARMv7 Little Endian only.
> +``arm``        Maintained        ARMv5TE and ARMv7, Little Endian only.

Here you exclude ARMv6K and ARMv8-A-aarch32...

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ffbc7f386131..f6b14d9f0e1f 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -138,7 +138,7 @@ config ARM
>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ
> -	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> +	select HAVE_RUST if CPU_LITTLE_ENDIAN && (CPU_32v7 || (CPU_32v5 && 
> !CPU_32v4T && !CPU_32v4)) && !KASAN

but here you allow it, so I think one of them should change,
and you need to better explain what the dependency on !CPU_32v4T
is about, and what happens for an ARMv6K-only kernel, compared
to a combined ARMv6K+ARMv7-A one.

>  KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) 
> -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
> +ifdef CONFIG_CPU_32v5
> +KBUILD_RUSTFLAGS += --target=armv5te-unknown-linux-gnueabi
> +else
>  KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
> +endif

This looks wrong, the choice between armv5 and armv7 should work
the same way as the choice between armv6 and armv7/v8, if I read
the rustc docs correctly, this should be using the target-cpu=
argument on the generic arm-unknown-linux-gnueabi target.

      Arnd
