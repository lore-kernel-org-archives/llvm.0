Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEBD285068
	for <llvm@lists.linux.dev>; Mon, 23 Feb 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859915; cv=pass; b=Fe0fP8PnNq9a4BQICo3CC/RCz+ToprgXy0sMGW/Nod3UNXKacThallCSKQxC5qioOWTH388YTOqe7bLzlbC88Jh68gYFy3P0BAdjVxqs4iYeT9tlpQF035i6WeRS3TE4ptuVHuT83aoUNA+ZRPrbRhK0v8iRp0V3mdhP1SGtQkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859915; c=relaxed/simple;
	bh=Lvo6HDNcAYHdH+XP8vSwC94W7dGDj1WmpN8XPNoytFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPINvN5t31X+TzQjJ/QrHBhVRFbGdgr/0wELcBwrXzQMcSvIDeCo6o9QBpPQBjz+RTJG5fZNZTnAuguG6mPwBt1gO1nksYHaguTdjwTxZgGM5AuRGfai8ng/pbJdh43MXJJI73Dxc8HWbTaf60kWW1HxWh32gPX5ZKRwBnsG6AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlFfcSHs; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlFfcSHs"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b90bc00578cso54387466b.0
        for <llvm@lists.linux.dev>; Mon, 23 Feb 2026 07:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771859912; cv=none;
        d=google.com; s=arc-20240605;
        b=NWApHynTElPTAWxxU9O2Xz1TWMq6eyk5N/I/BHGCI4Xqj5oJX+FaulWCKVy+zUtLb0
         dDr2ekNwTX1kICcnM6rmEkDlKHLXsYfXM+Yxe9HPVyGz5rk6A+17K0MxPiBtfovinJIk
         1AL6TEjPABRqTTa3zMkCjKVeirFWXCNuq/icKo32enVb6H6YMWf4iyKwY8rjvxKlF1Ck
         kYIa39vxXHmAqOjljrD195KOFI4mBvK76iZdmp6uODAliyjyWflJZhQhzMr/x4KYdV2Z
         Zb6NJhr00A1np4QUwVNtMYhqSgXGKuj4VsdaYanU/P4WPVd5lgdhESJBaHN1LO/jWLRv
         IXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IR6gdiFdbL0vuUVLb+VE0oZt1IbckfphGrja6I7jXEs=;
        fh=nRnpqI4u92W/mwT2Hhx1CWykabRPwP6IE8HrgVjLEkM=;
        b=TDPSiux0w5JjNi4/HurzT3Yu3aykT/r0xFa44ATQqKz5PbPk80SBDykS+ijLRC7Z4N
         sCf4xvqBJkkRWcBOZcRdaoeqa9mUSSgYpUvKgu7BYEq5mMYN0URkkgOmxMRNGp7Fm8g9
         +vqEb5UFY6W1alA+0GimCIUg2z1ZkayR3v40GqluxFnV2X1K2/X6qi1bNsuZt+1cgQ8J
         8ifDkNzHnPYwUdsg/BGVvr5C9oEjd2R+nGHT291TpgNhvI45Fz5K+Kfz610ZfyNo2SKr
         RfXYfkNFXyTUR7N2fUD8Zs2ro1BA046jw914ckpXbdA9qnYzGATp4WdjeK8dsIAcI6py
         YPmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771859912; x=1772464712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR6gdiFdbL0vuUVLb+VE0oZt1IbckfphGrja6I7jXEs=;
        b=LlFfcSHsrIdPik/ddTosQeioql+7xPWq0YYaO4YxbBc88fly5L4aTlSyh+pap6RdNS
         hrwUZFGEYHp1VBB+ZC0b9oF0Ew6IFGoL62DTPVbSC4H2Y6QBziLv5YWhLN0Fsyb/18Jo
         /z2onPTL47i3Rf5mnFMgBHBb+V3YdpB7N/OXY7PkHNA2fDYkmyO/7Eo1bPmodOOp3yAG
         p/ms7pZUtUJvZFX2rK5mdCZTFXNp+/W8J6dGV66L37Lvdcp6oOuAl4rrv0L2MyUIPo7T
         Wvwdcrqc5vHUSIcfsiWZp931V410J68XiUahc2j9FPCL0X/uTfA0nKWrhxrW1dkhyS5j
         tQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859912; x=1772464712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IR6gdiFdbL0vuUVLb+VE0oZt1IbckfphGrja6I7jXEs=;
        b=U4cV/O85anAbi5uVz1UB922wQV+0/iJxbtfL7XmnjM2rFS76orlpNIiniTITP7QyOT
         0quUYtKOPOelfKCabNCBUn+JYc/sVd0dCxvryZt20aQvpU8DlWUVOazrntbCXzRfg/EH
         QVEMcGCdk6ziOOdHEH4oBbPoKvGjRDFy1rsmoGZH3p3uYyMinVcvm6DsbXr7a1I4nvcG
         F1uwl5Cyqk2GI/F4FCxxVZRBtG31InSvqD5jZMWruFUWAnTcIk+tqTuhMgL8O1Q8Jl27
         EjdayJ2/DQ0rD2VCq5AeH+YPbr8e9Dm72lXrJ7NDA8KFr3EK6gXe4E+4MurTrtrMI40S
         Ar7A==
X-Forwarded-Encrypted: i=1; AJvYcCXmVLqFq6+yWqRw2BsWoNRiiyVAPJ3YAVpCH7UZJqckMHkYeB2PaJU+3ubPyEGbh3eLuaZa@lists.linux.dev
X-Gm-Message-State: AOJu0YzC7LqlqScFXYgxoIb2T9kMtYX2k/rJmZpliD0V1ceGVLp+vjoK
	4wcTcTjq77V4KXgSTLS2QdJfCMpgPxr8ttHw9lmtXE40m5lDz3qnVhEaXhAIddWtMzz1KIH/+1x
	UBtSaN4V6kDnqJlaL+WY/Q351L000X34=
X-Gm-Gg: AZuq6aLe6PBqhx7C1oy9rlTticm2BZKryECWd3z9vk71TvNpOSGebuFzOqo6NazxuIv
	nOAFsLcd1LiuTAdAAEAtYWA9CjILlMPWU6G6CX1QCG1RSejZaFLI05Icwyl8gWkG3A0yB4HjKgh
	m/+/KH5gOpN1tubbJ0ZQgEZp1nkaCEWqwvJFNmt61R8jb5DaV/bU9bCFQXYCtbmc1mr8Far/i3s
	6eDW7ebbZvVOTowU3wbxPmbiFGg3TyZsb/2G3b8w/xGJ3Mxchm38r6SEw+wPwlPUSUZYnS0lj5Y
	httPQX/LUydX/iAC9211dUM=
X-Received: by 2002:a17:907:3f1b:b0:b83:1327:920d with SMTP id
 a640c23a62f3a-b908170ccefmr553703966b.0.1771859911884; Mon, 23 Feb 2026
 07:18:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250407180838.42877-1-andybnac@gmail.com> <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud>
In-Reply-To: <20260221-repeal-emphatic-ddc2e9b94208@spud>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 23 Feb 2026 15:18:17 +0000
X-Gm-Features: AaiRm52DnZ_Fi6BjtZnXoERYPFEqT0aOWuS77yBEdHyKdXHXlOMFl2b2Fb35Czc
Message-ID: <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Conor Dooley <conor@kernel.org>
Cc: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org, 
	alexghiti@rivosinc.com, palmer@dabbelt.com, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Mark Rutland <mark.rutland@arm.com>, paul.walmsley@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com, 
	yongxuan.wang@sifive.com, samuel.holland@sifive.com, olivia.chu@sifive.com, 
	c2232430@gmail.com, arnd@arndb.de, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	pjw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 12:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> Hey,
>
> On Tue, Apr 08, 2025 at 02:08:34AM +0800, Andy Chiu wrote:
> > From: Puranjay Mohan <puranjay12@gmail.com>
> >
> > This patch enables support for DYNAMIC_FTRACE_WITH_CALL_OPS on RISC-V.
> > This allows each ftrace callsite to provide an ftrace_ops to the common
> > ftrace trampoline, allowing each callsite to invoke distinct tracer
> > functions without the need to fall back to list processing or to
> > allocate custom trampolines for each callsite. This significantly speed=
s
> > up cases where multiple distinct trace functions are used and callsites
> > are mostly traced by a single tracer.
> >
> > The idea and most of the implementation is taken from the ARM64's
> > implementation of the same feature. The idea is to place a pointer to
> > the ftrace_ops as a literal at a fixed offset from the function entry
> > point, which can be recovered by the common ftrace trampoline.
> >
> > We use -fpatchable-function-entry to reserve 8 bytes above the function
> > entry by emitting 2 4 byte or 4 2 byte  nops depending on the presence =
of
> > CONFIG_RISCV_ISA_C. These 8 bytes are patched at runtime with a pointer
> > to the associated ftrace_ops for that callsite. Functions are aligned t=
o
> > 8 bytes to make sure that the accesses to this literal are atomic.
> >
> > This approach allows for directly invoking ftrace_ops::func even for
> > ftrace_ops which are dynamically-allocated (or part of a module),
> > without going via ftrace_ops_list_func.
> >
> > We've benchamrked this with the ftrace_ops sample module on Spacemit K1
> > Jupiter:
> >
> > Without this patch:
> >
> > baseline (Linux rivos 6.14.0-09584-g7d06015d936c #3 SMP Sat Mar 29
> > +-----------------------+-----------------+----------------------------=
+
> > |  Number of tracers    | Total time (ns) | Per-call average time      =
|
> > |-----------------------+-----------------+----------------------------=
|
> > | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (ns) =
|
> > |----------+------------+-----------------+------------+---------------=
|
> > |        0 |          0 |        1357958 |          13 |             - =
|
> > |        0 |          1 |        1302375 |          13 |             - =
|
> > |        0 |          2 |        1302375 |          13 |             - =
|
> > |        0 |         10 |        1379084 |          13 |             - =
|
> > |        0 |        100 |        1302458 |          13 |             - =
|
> > |        0 |        200 |        1302333 |          13 |             - =
|
> > |----------+------------+-----------------+------------+---------------=
|
> > |        1 |          0 |       13677833 |         136 |           123 =
|
> > |        1 |          1 |       18500916 |         185 |           172 =
|
> > |        1 |          2 |       22856459 |         228 |           215 =
|
> > |        1 |         10 |       58824709 |         588 |           575 =
|
> > |        1 |        100 |      505141584 |        5051 |          5038 =
|
> > |        1 |        200 |     1580473126 |       15804 |         15791 =
|
> > |----------+------------+-----------------+------------+---------------=
|
> > |        1 |          0 |       13561000 |         135 |           122 =
|
> > |        2 |          0 |       19707292 |         197 |           184 =
|
> > |       10 |          0 |       67774750 |         677 |           664 =
|
> > |      100 |          0 |      714123125 |        7141 |          7128 =
|
> > |      200 |          0 |     1918065668 |       19180 |         19167 =
|
> > +----------+------------+-----------------+------------+---------------=
+
> >
> > Note: per-call overhead is estimated relative to the baseline case with
> > 0 relevant tracers and 0 irrelevant tracers.
> >
> > With this patch:
> >
> > v4-rc4 (Linux rivos 6.14.0-09598-gd75747611c93 #4 SMP Sat Mar 29
> > +-----------------------+-----------------+----------------------------=
+
> > |  Number of tracers    | Total time (ns) | Per-call average time      =
|
> > |-----------------------+-----------------+----------------------------=
|
> > | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (ns) =
|
> > |----------+------------+-----------------+------------+---------------=
|
> > |        0 |          0 |         1459917 |         14 |             - =
|
> > |        0 |          1 |         1408000 |         14 |             - =
|
> > |        0 |          2 |         1383792 |         13 |             - =
|
> > |        0 |         10 |         1430709 |         14 |             - =
|
> > |        0 |        100 |         1383791 |         13 |             - =
|
> > |        0 |        200 |         1383750 |         13 |             - =
|
> > |----------+------------+-----------------+------------+---------------=
|
> > |        1 |          0 |         5238041 |         52 |            38 =
|
> > |        1 |          1 |         5228542 |         52 |            38 =
|
> > |        1 |          2 |         5325917 |         53 |            40 =
|
> > |        1 |         10 |         5299667 |         52 |            38 =
|
> > |        1 |        100 |         5245250 |         52 |            39 =
|
> > |        1 |        200 |         5238459 |         52 |            39 =
|
> > |----------+------------+-----------------+------------+---------------=
|
> > |        1 |          0 |         5239083 |         52 |            38 =
|
> > |        2 |          0 |        19449417 |        194 |           181 =
|
> > |       10 |          0 |        67718584 |        677 |           663 =
|
> > |      100 |          0 |       709840708 |       7098 |          7085 =
|
> > |      200 |          0 |      2203580626 |      22035 |         22022 =
|
> > +----------+------------+-----------------+------------+---------------=
+
> >
> > Note: per-call overhead is estimated relative to the baseline case with
> > 0 relevant tracers and 0 irrelevant tracers.
> >
> > As can be seen from the above:
> >
> >  a) Whenever there is a single relevant tracer function associated with=
 a
> >     tracee, the overhead of invoking the tracer is constant, and does n=
ot
> >     scale with the number of tracers which are *not* associated with th=
at
> >     tracee.
> >
> >  b) The overhead for a single relevant tracer has dropped to ~1/3 of th=
e
> >     overhead prior to this series (from 122ns to 38ns). This is largely
> >     due to permitting calls to dynamically-allocated ftrace_ops without
> >     going through ftrace_ops_list_func.
> >
> > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> >
> > [update kconfig, asm, refactor]
> >
> > Signed-off-by: Andy Chiu <andybnac@gmail.com>
> > Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
>
> I bisected a boot failure to this commit [c217157bcd1df ("riscv:
> Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")] yesterday, that appears
> to be affecting all LLVM versions that I currently have installed. From
> some initial testing of Kconfig options, it looks like the issue is
> CFI_CLANG related because when I disable CFI_CLANG things work once
> more. Since this option depends on !CFI_CLANG, but is def_bool y, I
> modified Kconfig to force disable it at all times and tested
> !DYNAMIC_FTRACE_WITH_CALL_OPS && !CFG_CLANG, which did boot.
>
> I dunno anything about what's going on in this patch, but so little in
> it relates to having DYNAMIC_FTRACE_WITH_CALL_OPS, that I was able to
> figure out that the problem is -fpatchable-function-entry=3D8,4
>

DYNAMIC_FTRACE_WITH_CALL_OPS can't work together with CFI_CLANG.

arm64 has:

select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
   (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))

would need something similar for riscv if not already done.

Thanks,
Puranjay
