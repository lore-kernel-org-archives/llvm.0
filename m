Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93D25DD1E
	for <llvm@lists.linux.dev>; Mon, 23 Feb 2026 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861304; cv=pass; b=C9cM6lJ7bS9EFEKPzsT8AYjJpT7dxKwc0E8JR2ugfpsjtlahi45vhxjtSFvgVZgl2ZtJCMKQ1Ztdfp8dFrMKUx6VtJfhfP7TMRgMfl/Io5DPTwJja8PD8I0twcSxZdcSjXmIK+fsleXl0fzpTlkQS6mFH8f58SslwyZjqPKxf/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861304; c=relaxed/simple;
	bh=+xOBx+UCo3QzeE1kqlENhtc/iVWEKspgc0vb6UbUrZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktYa5HAOMaaasygvqqu5pGSMcwpdJa3u8ugoPlubaMU/zGOwcNM6DashxozQv2hhOQFEDl5j6JzRQiVD8y/mzlFYYS7mRtVQVGL2PPa2A6AzCML7Ec7MATcRT7l4Q7Vgpfk4weUoJNia9mYulCU3jz29jGY1DL9rUt+97pFLTwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmZ6ok61; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmZ6ok61"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso5151128a12.1
        for <llvm@lists.linux.dev>; Mon, 23 Feb 2026 07:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861300; cv=none;
        d=google.com; s=arc-20240605;
        b=lq0/nkL8IOj91TE25ggWyEmXpxu16ZnchJ2xS0P3urVGi7dglIHkEokChdoQwM+rV/
         PIWu+POeckzoXVTw3c57iQw2rqNShU0Mwa2oMIGeVnNbkgvzeT6z/9dgBCzVQccQO8fG
         pETaABC2+7V52IYtvYU8HRo7f2gNW1+o02ynDZ1XKBV5aT44+4gHM4j0uU8iuKEAR6ZZ
         uU7/jIip16nRWGxPLLzw/e6vQxq0tu1h2PNVvouHK1tJkjXpjI2TACvPEGeDxC+m02pj
         EW5Xun/PL9j6B4C/EtwE6ndO/wAw6dLRfHaRBXAjUAQfnY9vhti6OHSkFYiK7t9z84cX
         vIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2P6NQWOxLOESUY715izY2+hrTfFuAY4zsORUdRvY0d0=;
        fh=NXzz9Gd1jWyxbSFrdBlIUbL06VUd2ojKUJYAt8NHrYA=;
        b=byw3HfuhgWujKsHX+3tFXKCADeXaFDozLYG81Bt9ypOkHrIs6sBO08T73Y02E/fxf0
         Qc26QCTbRe6tZIQnmKF6bFaMuy1c2R+6O5Ta621ZrqAamq5CJ4JkMZ4ffxJj9qDX0X2E
         7QRhMZciqq2hm9CFys3OYlX2QLWZrZVa0bnq1unPZRu+y/uEjp63S5aEkJDWpcS4WCHq
         wioyI4M95ekSjRBn81dD5H0Ye3hkxziLPiZ2K/35qMpqsgj0bFRyBOQW3y5sFBSLmUHm
         scRbKS6nFguJRd5AW0xnxjKXAwlfDdvm/dSgwWCksebKupU399SprUA6wAl7W6ghV5Up
         K+oA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771861300; x=1772466100; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P6NQWOxLOESUY715izY2+hrTfFuAY4zsORUdRvY0d0=;
        b=ZmZ6ok61BK+DYgV5p33Rq2nuzgwnyW4mgR/tPGrey5Bjp2uT0dW9w4RcYS5O4/o9rl
         S/ccTq7TykejLDCtRLlbZpEvtSo0A7a6vqelfixx+sB41OuTAWf11OdhoOXKrozBonfD
         ZLaW1IndncKR3AgGaeoupvUZAo83Uq8tzueSz0dbQRQ3wYV8v/hEPINemaea87eLi6uB
         x1YAYA9z5zWe2UICQSl5Z1P5mRtT0hdZYrHxRk8qdpiB7iC2mJ6W33ZN7Snm0TM/XmUc
         h8RwebZEAnbR0kw8HVWrpS9q//pTAPaHnpsBA9LnT9jCs8V7kylbUzsVCCtEvaYX8cD/
         DrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861300; x=1772466100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2P6NQWOxLOESUY715izY2+hrTfFuAY4zsORUdRvY0d0=;
        b=GDj8ogT+J26+DBGuadqZLffb0+/B7PY+ZizdEPDMrnREIZ1BePES47LVeC2CJnjRvU
         GQjDQO5UQcbDSlE9xBv9ZnNX3tejkEyzHhsuvMbiJU+MCLaMhjwPzsx1Ne5DFqu7ceHC
         FnhoHoG+Vq/Z9hKJe6zqDRsWN8SByU2R6YMBT3AVRZ2v69OBKfZlmscnXtUgDdNp9pwm
         ggc3h0dnw0jMIcl1mtXFKas1GjfkyVx0VnA3J1V0PRmELR6VH5TifuEdXsQY93LXjQ1k
         IvD8QnSh8Qpv2Iml92V8P5+9V2qPcaQ2rPlsin9udt22wvhn4E1q99v0Ba6tMd92GQ0m
         j8XA==
X-Forwarded-Encrypted: i=1; AJvYcCVamxsWIQSIWBMmMQJ3MnQCgh6BOQ2OKaT9nzutm4SKDzjCSDNCTiyT2HI1ahBGu9SeFUDM@lists.linux.dev
X-Gm-Message-State: AOJu0YwuURuKKSJTnZ0RVqskeC3Fw5EwPHQVCQewrPtzjumbSnDNmD9d
	+hh7Smgvxst+bAxHTwQ9a249k/MzogwuUa9LRMZIv65/i1KcISbBMA05seP0m1sYk8wpTy8+o6v
	DSR0i0T/5H5dWYk9IiHcSdcWZk6dilxQ=
X-Gm-Gg: ATEYQzy0PNqwyQQy6jgB/Zmh0186Aoz9RsDBxjUmgefynLyvO+sEa5vRerv9rggwMGv
	mgDOg9TX/OtmDAGg5ws+GW85wkY1YZH+BVY+u51uHO+hyJ9rFNh6w4OoLog/7dmPVvxFbtl4Dvo
	enu5e49ZoOF7WDRI/jmSzO5phnfqlJXwvMjVvFJOtvm189aEtgxAvAemgdPuRVVUfz3765jLtAr
	2mbcVBAXAgdB4yCyn4ByP4RBCXx2gIpAblzCWzxcu3h5vLfWqJVxLAGc0unDMszHlwXU5HfTaLE
	YyUP/Q7yv2dueYhWFVva2f4=
X-Received: by 2002:a05:6402:399b:b0:65a:1a4e:7011 with SMTP id
 4fb4d7f45d1cf-65ea4ec7ce6mr3925099a12.12.1771861300030; Mon, 23 Feb 2026
 07:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250407180838.42877-1-andybnac@gmail.com> <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud> <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
 <20260223-respect-chaste-60c3403b5bc9@wendy>
In-Reply-To: <20260223-respect-chaste-60c3403b5bc9@wendy>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 23 Feb 2026 15:41:26 +0000
X-Gm-Features: AaiRm50JojpYOsvZRBJUEVlyRq3y2KfKJDvSlcDyzxZ4600W8UZy2QIVGXuTlWo
Message-ID: <CANk7y0jdzCeFaLVpj6-mnWiSZvv+rJF=9kgWDYF7g_rjCpiYsw@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, palmer@dabbelt.com, 
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

On Mon, Feb 23, 2026 at 3:28=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Mon, Feb 23, 2026 at 03:18:17PM +0000, Puranjay Mohan wrote:
> > On Sat, Feb 21, 2026 at 12:15=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > Hey,
> > >
> > > On Tue, Apr 08, 2025 at 02:08:34AM +0800, Andy Chiu wrote:
> > > > From: Puranjay Mohan <puranjay12@gmail.com>
> > > >
> > > > This patch enables support for DYNAMIC_FTRACE_WITH_CALL_OPS on RISC=
-V.
> > > > This allows each ftrace callsite to provide an ftrace_ops to the co=
mmon
> > > > ftrace trampoline, allowing each callsite to invoke distinct tracer
> > > > functions without the need to fall back to list processing or to
> > > > allocate custom trampolines for each callsite. This significantly s=
peeds
> > > > up cases where multiple distinct trace functions are used and calls=
ites
> > > > are mostly traced by a single tracer.
> > > >
> > > > The idea and most of the implementation is taken from the ARM64's
> > > > implementation of the same feature. The idea is to place a pointer =
to
> > > > the ftrace_ops as a literal at a fixed offset from the function ent=
ry
> > > > point, which can be recovered by the common ftrace trampoline.
> > > >
> > > > We use -fpatchable-function-entry to reserve 8 bytes above the func=
tion
> > > > entry by emitting 2 4 byte or 4 2 byte  nops depending on the prese=
nce of
> > > > CONFIG_RISCV_ISA_C. These 8 bytes are patched at runtime with a poi=
nter
> > > > to the associated ftrace_ops for that callsite. Functions are align=
ed to
> > > > 8 bytes to make sure that the accesses to this literal are atomic.
> > > >
> > > > This approach allows for directly invoking ftrace_ops::func even fo=
r
> > > > ftrace_ops which are dynamically-allocated (or part of a module),
> > > > without going via ftrace_ops_list_func.
> > > >
> > > > We've benchamrked this with the ftrace_ops sample module on Spacemi=
t K1
> > > > Jupiter:
> > > >
> > > > Without this patch:
> > > >
> > > > baseline (Linux rivos 6.14.0-09584-g7d06015d936c #3 SMP Sat Mar 29
> > > > +-----------------------+-----------------+------------------------=
----+
> > > > |  Number of tracers    | Total time (ns) | Per-call average time  =
    |
> > > > |-----------------------+-----------------+------------------------=
----|
> > > > | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (=
ns) |
> > > > |----------+------------+-----------------+------------+-----------=
----|
> > > > |        0 |          0 |        1357958 |          13 |           =
  - |
> > > > |        0 |          1 |        1302375 |          13 |           =
  - |
> > > > |        0 |          2 |        1302375 |          13 |           =
  - |
> > > > |        0 |         10 |        1379084 |          13 |           =
  - |
> > > > |        0 |        100 |        1302458 |          13 |           =
  - |
> > > > |        0 |        200 |        1302333 |          13 |           =
  - |
> > > > |----------+------------+-----------------+------------+-----------=
----|
> > > > |        1 |          0 |       13677833 |         136 |           =
123 |
> > > > |        1 |          1 |       18500916 |         185 |           =
172 |
> > > > |        1 |          2 |       22856459 |         228 |           =
215 |
> > > > |        1 |         10 |       58824709 |         588 |           =
575 |
> > > > |        1 |        100 |      505141584 |        5051 |          5=
038 |
> > > > |        1 |        200 |     1580473126 |       15804 |         15=
791 |
> > > > |----------+------------+-----------------+------------+-----------=
----|
> > > > |        1 |          0 |       13561000 |         135 |           =
122 |
> > > > |        2 |          0 |       19707292 |         197 |           =
184 |
> > > > |       10 |          0 |       67774750 |         677 |           =
664 |
> > > > |      100 |          0 |      714123125 |        7141 |          7=
128 |
> > > > |      200 |          0 |     1918065668 |       19180 |         19=
167 |
> > > > +----------+------------+-----------------+------------+-----------=
----+
> > > >
> > > > Note: per-call overhead is estimated relative to the baseline case =
with
> > > > 0 relevant tracers and 0 irrelevant tracers.
> > > >
> > > > With this patch:
> > > >
> > > > v4-rc4 (Linux rivos 6.14.0-09598-gd75747611c93 #4 SMP Sat Mar 29
> > > > +-----------------------+-----------------+------------------------=
----+
> > > > |  Number of tracers    | Total time (ns) | Per-call average time  =
    |
> > > > |-----------------------+-----------------+------------------------=
----|
> > > > | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (=
ns) |
> > > > |----------+------------+-----------------+------------+-----------=
----|
> > > > |        0 |          0 |         1459917 |         14 |           =
  - |
> > > > |        0 |          1 |         1408000 |         14 |           =
  - |
> > > > |        0 |          2 |         1383792 |         13 |           =
  - |
> > > > |        0 |         10 |         1430709 |         14 |           =
  - |
> > > > |        0 |        100 |         1383791 |         13 |           =
  - |
> > > > |        0 |        200 |         1383750 |         13 |           =
  - |
> > > > |----------+------------+-----------------+------------+-----------=
----|
> > > > |        1 |          0 |         5238041 |         52 |           =
 38 |
> > > > |        1 |          1 |         5228542 |         52 |           =
 38 |
> > > > |        1 |          2 |         5325917 |         53 |           =
 40 |
> > > > |        1 |         10 |         5299667 |         52 |           =
 38 |
> > > > |        1 |        100 |         5245250 |         52 |           =
 39 |
> > > > |        1 |        200 |         5238459 |         52 |           =
 39 |
> > > > |----------+------------+-----------------+------------+-----------=
----|
> > > > |        1 |          0 |         5239083 |         52 |           =
 38 |
> > > > |        2 |          0 |        19449417 |        194 |           =
181 |
> > > > |       10 |          0 |        67718584 |        677 |           =
663 |
> > > > |      100 |          0 |       709840708 |       7098 |          7=
085 |
> > > > |      200 |          0 |      2203580626 |      22035 |         22=
022 |
> > > > +----------+------------+-----------------+------------+-----------=
----+
> > > >
> > > > Note: per-call overhead is estimated relative to the baseline case =
with
> > > > 0 relevant tracers and 0 irrelevant tracers.
> > > >
> > > > As can be seen from the above:
> > > >
> > > >  a) Whenever there is a single relevant tracer function associated =
with a
> > > >     tracee, the overhead of invoking the tracer is constant, and do=
es not
> > > >     scale with the number of tracers which are *not* associated wit=
h that
> > > >     tracee.
> > > >
> > > >  b) The overhead for a single relevant tracer has dropped to ~1/3 o=
f the
> > > >     overhead prior to this series (from 122ns to 38ns). This is lar=
gely
> > > >     due to permitting calls to dynamically-allocated ftrace_ops wit=
hout
> > > >     going through ftrace_ops_list_func.
> > > >
> > > > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > > >
> > > > [update kconfig, asm, refactor]
> > > >
> > > > Signed-off-by: Andy Chiu <andybnac@gmail.com>
> > > > Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> > >
> > > I bisected a boot failure to this commit [c217157bcd1df ("riscv:
> > > Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")] yesterday, that appear=
s
> > > to be affecting all LLVM versions that I currently have installed. Fr=
om
> > > some initial testing of Kconfig options, it looks like the issue is
> > > CFI_CLANG related because when I disable CFI_CLANG things work once
> > > more. Since this option depends on !CFI_CLANG, but is def_bool y, I
> > > modified Kconfig to force disable it at all times and tested
> > > !DYNAMIC_FTRACE_WITH_CALL_OPS && !CFG_CLANG, which did boot.
> > >
> > > I dunno anything about what's going on in this patch, but so little i=
n
> > > it relates to having DYNAMIC_FTRACE_WITH_CALL_OPS, that I was able to
> > > figure out that the problem is -fpatchable-function-entry=3D8,4
> > >
> >
> > DYNAMIC_FTRACE_WITH_CALL_OPS can't work together with CFI_CLANG.
> >
> > arm64 has:
> >
> > select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> > if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
> >    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
> >
> > would need something similar for riscv if not already done.
>
>
> I think you've misunderstood my email. We already have:
>
>         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_=
ARGS && !CFI)
>
> The problem is that the patch broke using CFI_CLANG, due to the
> fpatchable-function-entry change.


Yeah, sorry I did not see the patch,
the original one I sent had:

+ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS), y)
+ifeq ($(CONFIG_RISCV_ISA_C),y)
+ CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D8,4
+else
+ CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4,2
+endif
+else


The basic Idea is that we can't put nops before the function entry
when using CFI_CLANG, because they both interfere with each other.

the fix should be something like:

-- >8 --

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 371da75a47f9..94100810a6a4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -14,11 +14,19 @@ endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
        LDFLAGS_vmlinux +=3D --no-relax
        KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
 ifeq ($(CONFIG_RISCV_ISA_C),y)
        CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D8,4
 else
        CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4,2
 endif
+else
+ifeq ($(CONFIG_RISCV_ISA_C),y)
+       CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4
+else
+       CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
+endif
+endif
 endif

 ifeq ($(CONFIG_CMODEL_MEDLOW),y)

-- 8< --


Thanks,
Puranjay
