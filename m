Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19DF2C3253
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898888; cv=none; b=TUK4/xouJQHLnHQK9OUPMa4vdg7kLAAGILAdpwM1gQe43ycl0V1B/JvX4Euy+ftxzWoR8yxrgSDsqvNrT5WLsKCIJHOkSCYpTl9NJa8rQyUOWEebNupLGpdOMkd2or2A+DwPGshLEnkeEueEC9pvQ0t2sDkMMBpcwOcXPWckB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898888; c=relaxed/simple;
	bh=ZeXrkIjyPgFTvd4aFSLXeU04UHGtJ1bsQeI2z6Dvnbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OldEfwK14rr7bTS1UhndQeszsftwWH3UsiBsvnejschrvtHSRRs5oj9625FLm+EusyWX14//6gTZ1QyyhdBcpkCBUhJFWIqMxtOkqt22hgHEv6GWQryCC+QMqgf1c5xZngloYqvVdYp+HToWiMmtQtBnOWcPhQwFNTbTogDr2+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cLmo0i/b; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cLmo0i/b"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad89ee255easo898810266b.3
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748898885; x=1749503685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8ftkWSSIMy816Jx/bO3t4iajWSXp+7OOwQXgXhutgE=;
        b=cLmo0i/bD+ACzeudBhuq6I1az9Ylr9+fLwa1R3j+tHiwaXcO07EImrdFmOFx1jAyIy
         UXjlbkRAQxW9xQlroJUBS1YzTkAZCkhglVvmzCNJK16UK9r49M/o+sXMfYJvOm6Rl+1k
         VIzRzwM8FSAuOaO+j8TIL9G8JhEdE6Cr1cWVVk16BwJm4m/eZnt6ZduEoCyK4KsRAnqO
         WTG+80rwotwVtH13FZZ8i8Ju0PKJM4wveqxgZfyvN8L7Wx062qKtQMheVzg3qWI3T5B1
         ilYXauWCEk3j35lRlqDXwS29cTT6etBfvypOVxq3pbVrze4oaF37oUqK3knwrA8gHYcs
         Tnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748898885; x=1749503685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8ftkWSSIMy816Jx/bO3t4iajWSXp+7OOwQXgXhutgE=;
        b=OOWS3/SFCDP7lZ4dAfmQqg2uC8ol6/XU2ID3VWxx1ffHMaLBTpUE6M/A6NQZBAAu8H
         I0DpbMct0bKEGqGNgbsWkrllIKqXzG46mIOIcrPZ88scib2RTWLReSoWpAJr8NaiJCRK
         oASQzDjs60gi1fbSjdkEOT6O7d8tUb6dv9cAYrh9NnTBjlVAj26XUo5JW5RuQOPvY1oM
         5hI+FD04ychRsQaTCFVBYD8qqUoER6YMco/eblV2+7jiG/LErwCC1bp+SCKwTdQ1AQsk
         rvZwEW/XCifw4e1CEbwR1tkbD1ecX79Zoh6wGnVbE/+U0yAyCpPuwnssnPLtequJAZz5
         tZDw==
X-Forwarded-Encrypted: i=1; AJvYcCV/pDaqyqsLjSi0OEq+QLOhqgXPDD17vmPvpMPyh69zZ02MkayP5yIwwGlNxSa70cVN4FXl@lists.linux.dev
X-Gm-Message-State: AOJu0YzXG9+dnnVZV4uhuNkkdVALYnxlrNNvsYDsb3RQA2Xn1BlMKoMp
	3Nbq6ivcL1QQ6tXuAGTBtzDFmyHEAU2QHEcaTY2TjfPnJSrlRPV/D0RLPJxnNabW0AWdcInVute
	jK9oG8H2Om0IcebFGgAhygJw7w3XZdLa37pTfHIc=
X-Gm-Gg: ASbGncu9mpkdPEfzKaHG6waVM2a3en23I1DU57RCrzqouqAf5aYztJqQzZ04TelHVTg
	0hMpbn0uXxY3/3dhEY6FodijO+Css7FX1jjHr/JC9qy9YvGgkAtrZSzHgRnjcCCJuaB470ovd5A
	kGzThUS9TTdtSAMiGtEhTCLX2XqLVoiTinFxubQG9M
X-Google-Smtp-Source: AGHT+IE+VipmkuZVXa5mLje8ADCcdaLzWX984KOU6BVdodEOK1iXNGSSjRNrCQhzWlytHUaZkqqZXjWCZ4J4ABYdziQ=
X-Received: by 2002:a17:907:3d02:b0:ad8:9c30:b66 with SMTP id
 a640c23a62f3a-adb36b31a52mr1209293266b.18.1748898884874; Mon, 02 Jun 2025
 14:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602102825-42aa84f0-23f1-4d10-89fc-e8bbaffd291a@linutronix.de>
 <20250602193718.GA915101@ax162>
In-Reply-To: <20250602193718.GA915101@ax162>
From: Bill Wendling <morbo@google.com>
Date: Mon, 2 Jun 2025 14:14:28 -0700
X-Gm-Features: AX0GCFsc2RMXbkJa80qarC-w9TN9ynL07wJ6BL7h65giiVy6nAFWHenYNCMcLgY
Message-ID: <CAGG=3QVoa=v0wdG64m5HT+TEj+Epg-zKcgJjTA+A+hUia84oUw@mail.gmail.com>
Subject: Re: [BUG?] clang miscompilation of inline ASM with overlapping
 input/output registers
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 12:37=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Thomas,
>
> On Mon, Jun 02, 2025 at 10:29:30AM +0200, Thomas Wei=C3=9Fschuh wrote:
> > I observed a surprising behavior of clang around inline assembly and re=
gister
> > variables, differing from GCC.
> >
> > Consider the following snippet:
> >
> >       $ cat repro.c
> >       int main(void)
> >       {
> >               register long in asm("eax");
> >               register long out asm("eax");
> >
> >               in =3D 0;
> >               asm volatile("nop" : "+r" (out) : "r" (in));
> >
> >               return out;
> >       }
> >
> > The relevant part is that the inline ASM has input and output register
> > variables both using the same register and the input one is assigned to=
.
> >
> >
> > Compile with clang (19.1.7, tested on godbolt.org with trunk):
> >
> >       $ clang -O2 repro.c
> >       $ llvm-objdump --disassemble-symbols=3Dmain a.out
> >       0000000000001120 <main>:
> >           1120: 90                            nop
> >           1121: c3                            retq
> >
> > The store of the variable "in" has been optimized away.
> >
> >
> > Compile with gcc (15.1.1, also tested on godbolt.org with trunk):
> >
> >       $ gcc -O2 repro.c
> >       $ llvm-objdump --disassemble-symbols=3Dmain a.out
> >       0000000000001020 <main>:
> >           1020: 31 c0                         xorl    %eax, %eax
> >           1022: 90                            nop
> >           1023: c3                            retq
> >           1024: 66 2e 0f 1f 84 00 00 00 00 00 nopw    %cs:(%rax,%rax)
> >           102e: 66 90                         nop
> >
> > The store to "eax" is preserved.
> >
> >
> > As far as I can see gcc is correct here. As the variable is used as an =
input to
> > ASM the compiler can not optimize away.
> > On other architectures the same effect can be observed.
> >
> >
> > The real kernel example for this issue is in the loongarch vDSO code fr=
om
> > arch/loongarch/include/asm/vdso/gettimeofday.h:
> >
> >       static __always_inline long clock_gettime_fallback(
> >                                               clockid_t _clkid,
> >                                               struct __kernel_timespec =
*_ts)
> >       {
> >               register clockid_t clkid asm("a0") =3D _clkid;
> >               register struct __kernel_timespec *ts asm("a1") =3D _ts;
> >               register long nr asm("a7") =3D __NR_clock_gettime;
> >               register long ret asm("a0");
> >
> >               asm volatile(
> >               "       syscall 0\n"
> >               : "+r" (ret)
> >               : "r" (nr), "r" (clkid), "r" (ts)
> >               : "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7",
> >                "$t8", "memory");
> >
> >               return ret;
> >       }
> >
> > Here both "clkid" and "ret" are stored in "a0". I can't point to the co=
ncrete
> > disassembly here because it is inlined into a much larger block of code
> > and removing the inlining hides the bug.

Hi Thomas,

To help find a random inline assembly in your code, place comments
within the ASM block. Something like:

asm volatile(
  "# HEY! I'M RIGHT HERE\n\t"
  "syscall 0\n"
...

You can then search the assembly for that to see what's generated.

> > Also in my tests the bug only manifests for "_clkid" in the interval [1=
6, 23].
> > Other values work by chance.
> > Removing the aliasing by dropping "ret" and using "clkid" for both inpu=
t and
> > output produces correct results.
> >
> > Is this a clang bug, is the code broken or am I missing something?
>
> For the record, inline assembly semantics are a little out of my
> wheelhouse. Bill can probably comment more on what might be happening
> internally within clang/LLVM here but it does seem like there could be a
> clang code generation bug. Looking at the example you provided and GCC's
> assembly and local register documentation, which has a very similar
> example, it looks like the issue disappears when using "=3Dr" for the
> output constaint instead of "+r".
>
> https://godbolt.org/z/jo3T8o3hj
>
> Looking at the constraint string in both the unoptimized and optimized
> IR, it looks like eax appears an input twice in the list for broken(),
> likely because "+r" was internally expanded to "=3Dr" for the output and
> "r" for the input. In the optimized IR, we can see that the first eax
> will be the 2 that was assigned but the second eax is "undef"
> (undefined), which follows from the unoptimized IR. What I am guessing
> happens based on my investigation with '-mllvm -opt-bisect-limit=3D' on
> x86 is the second eax "wins" over the first one that has the actual
> value. Using an undef value is UB so the backend removes the initial
> write to eax altogether.
>
> It definitely seems like this could be handled better on the clang side
> but I do think that switching the constraints to "=3Dr" would be a proper
> fix, as "+r" is really an overspecification and that matches an almost
> identical example in the GCC local register documentation:
>
> https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.ht=
ml
>
[+Ian because he also knows inline assembly]

This might be a Clang bug, as it's well known that Clang's support of
GCC's extended asm is lacking in key areas...especially with regards
to local register variables.

I'm not confident I completely understand the documentation Nathan
pointed out. It states that the only supported use is for input and
output to extended asm, but then goes on to show an example where they
initialize a variable. (??)

Looking at this a bit closer, the LLVM IR initially generated by the
front end is this for the "+r" version (it's verbose, but not to
worry):

 1. %in =3D alloca i64, align 8
 2. %out =3D alloca i64, align 8
 3. store i32 0, ptr %retval, align 4
 4. store i64 0, ptr %in, align 8, !dbg !19
 5. %0 =3D load i64, ptr %out, align 8, !dbg !26
 6. %1 =3D load i64, ptr %in, align 8, !dbg !27
 7. %2 =3D call i64 asm sideeffect "nop",
"=3D{eax},{eax},{eax},~{dirflag},~{fpsr},~{flags}"(i64 %1, i64 %0) #2,
!dbg !26
 8. store i64 %2, ptr %out, align 8, !dbg !26

Notice instructions (1), (2), (5), and (6). Instructions (1) and (2)
are simply a way for LLVM to indicate that these are variables and are
64-bits in size. The "%in" variable is assigned the value "0" (zero)
with the "store" in (4), but notice that "%out" never has a value
assigned to it. The assembly block indicated that it *should* have a
value, because of the '+' modifier. This means that once all of the
stores and loads are reduced by later passes the "%out" variable will
have an undefined value.

One could argue that it *does* have a value, because it's in the same
register as "%in", but LLVM's middle end doesn't work like that. It
only sees two variables, not that they're in the same register. So
that's what adds the 'undef' that Nathan pointed out.. In Clang terms,
"undef" can mean "undefined behavior" (like here) and may elide code
that exhibits it.

One way you could resolve this is to say that the "out" variable has
an early clobber:

  : "+&r"(out)

This tells the compiler that the value is written before being read.
Therefore, the compiler won't assume that it has no value.

-bw
