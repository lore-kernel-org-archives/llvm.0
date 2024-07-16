Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA50197A6C
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132413; cv=none; b=s6DFTJABy4e6oOZj1xEtiZWEvvFE7zPuiX/sdBlXZ51tBvXRGyCrrN6RJJIacPNrdwM1YsJYdeIy4R2qVRE/bk3Kbdg/XNHRwFvQeJO3L91IOs3Fi3mOM76cNe0TDs74SQzBwb4mbHMLzc3tCSTbNKKm1AoKxVptc6rEWGOUHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132413; c=relaxed/simple;
	bh=NPFmz/N6G3Ip3lB/40h8jCNz3HQpYtZd62s4Uir8yVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJtP2QKapnRuafEx0TAxZUYx9y6c1rShTnQbkvSyPuYZWvFlWcpaO4cRJjKakNEr+e9y1EnRAO3FoL9y6zQxGYsI0WaJzz1FBHz/xrmRB2vEbX8Ifcve8dobZqkLFkAPgfqMtE7uEfEdYOjcKUwq5HYgL3xtofKlL3KrBFWUbcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=A534KACJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="A534KACJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b827so360522a12.1
        for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721132409; x=1721737209; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wgyK3rI/+GRYXc3I3puXIGSeacbfUlZLjUaC5dlWKs=;
        b=A534KACJUbE4EDuTIale47cBX6fhRiY0ttx/p/cxYCdbXq/GoE1u6BylYuASdg2BIX
         u39r7HkCUvz4CJPewyNLwB24gMorONtMCBQX7Lo7seklhWUapqniyX9xUhb35nzzFV03
         U1R+C118rG7V3hsP2E0FC5KXVDz+2SGO5lTFgFLjQTvtrcy52AzmqdpHk8er4WP5xeSw
         wD0NoqOX+aIW/vFELMG3PhkK3yisfTvTQdkb6eP/o4Q5y6wqFmE8geqtp1ychTPStsxh
         Y5zoloL576vECq/HAr2a2Gf7B959JIqKqQCHrOK58L0UrAxLigJJE1lhe8AHZuEAdK47
         fUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721132409; x=1721737209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wgyK3rI/+GRYXc3I3puXIGSeacbfUlZLjUaC5dlWKs=;
        b=GJCFrXiZlzf2rfIcNAKg3NyslGbMshRC5HhTJHp+f0arlb/FZ1HCqxY3q+AxMl10Js
         mAYHav4JNlzffcrlnYN5cE8xq8Ki56vLBj5LX1BkyO2BTto/yQ321DGkX3v2Vdi3I493
         Nv27TyFuZKwgW0wQO3M7Pvg4lTgsE3oBZaMH4W95Fal6R/pr8W2NWFKH+WdeEPb8ctjJ
         6RtGK//N5KrbVWmOa4zQDJCn2XEamuWI344P/+o0nWzjOZiD/DxlhAEznZqdsUjmVFQY
         mmM0jeyLdlnHkbOq7cCbgsk/XrJYUZ9iLuA7vxuOszsjLp1IkHHv3cI54whQrDWBsH0Q
         oAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVnhK1OzKUzlkQJk61ZjwNrdz3CgUXK9k2nLSH8jBiMiW1XV5SFm9Z72O0SBkaSmvPMJuP3VDrTIFz/U9JivuOZ766Pw==
X-Gm-Message-State: AOJu0YzRK+t/m2RSune6g9suutepMJvsRuZ5oB9rQNSJSbX6LgKBUJBi
	TgnWJyoX2NQesEN5XzlsLTMOZpm/gb2fScRGRcKPZd1QeKuNDI4A917CY9nZ6MHhLKqpwXuGnzG
	LygespYPNU+qVe+5ls0Nn2b/zqsbDdaifsMC2gg==
X-Google-Smtp-Source: AGHT+IG9FrD1fBVgqj60WTDAt3AQCQU/Sf+dX7Y3PES5xjXq+TMnTztj457Qr4E/dPajDDm9BXML7CFjSdsFPn+WNxQ=
X-Received: by 2002:a17:906:2409:b0:a6f:c268:ff2e with SMTP id
 a640c23a62f3a-a79ea3d7952mr139799466b.5.1721132408420; Tue, 16 Jul 2024
 05:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240626130347.520750-2-alexghiti@rivosinc.com>
 <202407041157.odTZAYZ6-lkp@intel.com> <20240705172750.GF987634@thelio-3990X>
In-Reply-To: <20240705172750.GF987634@thelio-3990X>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 16 Jul 2024 14:19:57 +0200
Message-ID: <CAHVXubhvk_CbBX=hWFGt+1HEM4cj=cAc1NsCEknn=B8UDcXVSQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
To: Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Fri, Jul 5, 2024 at 7:27=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Thu, Jul 04, 2024 at 11:38:46AM +0800, kernel test robot wrote:
> > Hi Alexandre,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on soc/for-next]
> > [also build test ERROR on linus/master v6.10-rc6 next-20240703]
> > [cannot apply to arnd-asm-generic/master robh/for-next tip/locking/core=
]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/=
riscv-Implement-cmpxchg32-64-using-Zacas/20240627-034946
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for=
-next
> > patch link:    https://lore.kernel.org/r/20240626130347.520750-2-alexgh=
iti%40rivosinc.com
> > patch subject: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Z=
acas
> > config: riscv-randconfig-002-20240704 (https://download.01.org/0day-ci/=
archive/20240704/202407041157.odTZAYZ6-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7c=
bf1a2591520c2491aa35339f227775f4d3adf6)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240704/202407041157.odTZAYZ6-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> kernel/sched/core.c:11873:7: error: cannot jump from this asm goto s=
tatement to one of its possible targets
> >                    if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UN=
SET))
> >                        ^
> >    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded fr=
om macro 'try_cmpxchg'
> >            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
> >            ^
> >    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded fr=
om macro 'raw_try_cmpxchg'
> >            ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
> >                   ^
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded fr=
om macro 'raw_cmpxchg'
> >    #define raw_cmpxchg arch_cmpxchg
> >                        ^
> >    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'a=
rch_cmpxchg'
> >            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw=
\n")
> >            ^
> >    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_=
arch_cmpxchg'
> >                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,  =
    \
> >                    ^
> >    arch/riscv/include/asm/cmpxchg.h:144:3: note: expanded from macro '_=
_arch_cmpxchg'
> >                    asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,        =
    \
> >                    ^
> >    kernel/sched/core.c:11840:7: note: possible target of asm goto state=
ment
> >            if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
> >                 ^
> >    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded fr=
om macro 'try_cmpxchg'
> >            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
> >            ^
> >    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded fr=
om macro 'raw_try_cmpxchg'
> >            ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
> >                   ^
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded fr=
om macro 'raw_cmpxchg'
> >    #define raw_cmpxchg arch_cmpxchg
> >                        ^
> >    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'a=
rch_cmpxchg'
> >            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw=
\n")
> >            ^
> >    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_=
arch_cmpxchg'
> >                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,  =
    \
> >                    ^
> >    arch/riscv/include/asm/cmpxchg.h:161:10: note: expanded from macro '=
__arch_cmpxchg'
> >                                                                        =
    \
> >                                                                        =
    ^
> >    kernel/sched/core.c:11872:2: note: jump exits scope of variable with=
 __attribute__((cleanup))
> >            scoped_guard (irqsave) {
> >            ^
> >    include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_gu=
ard'
> >            for (CLASS(_name, scope)(args),                             =
    \
> >                              ^
> >    kernel/sched/core.c:11840:7: error: cannot jump from this asm goto s=
tatement to one of its possible targets
> >            if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
> >                 ^
> >    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded fr=
om macro 'try_cmpxchg'
> >            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
> >            ^
> >    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded fr=
om macro 'raw_try_cmpxchg'
> >            ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
> >                   ^
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded fr=
om macro 'raw_cmpxchg'
> >    #define raw_cmpxchg arch_cmpxchg
> >                        ^
> >    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'a=
rch_cmpxchg'
> >            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw=
\n")
> >            ^
> >    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_=
arch_cmpxchg'
> >                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,  =
    \
> >                    ^
> >    arch/riscv/include/asm/cmpxchg.h:144:3: note: expanded from macro '_=
_arch_cmpxchg'
> >                    asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,        =
    \
> >                    ^
> >    kernel/sched/core.c:11873:7: note: possible target of asm goto state=
ment
> >                    if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UN=
SET))
> >                        ^
> >    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded fr=
om macro 'try_cmpxchg'
> >            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
> >            ^
> >    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded fr=
om macro 'raw_try_cmpxchg'
> >            ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
> >                   ^
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded fr=
om macro 'raw_cmpxchg'
> >    #define raw_cmpxchg arch_cmpxchg
> >                        ^
> >    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'a=
rch_cmpxchg'
> >            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw=
\n")
> >            ^
> >    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_=
arch_cmpxchg'
> >                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,  =
    \
> >                    ^
> >    arch/riscv/include/asm/cmpxchg.h:161:10: note: expanded from macro '=
__arch_cmpxchg'
> >                                                                        =
    \
> >                                                                        =
    ^
> >    kernel/sched/core.c:11872:2: note: jump bypasses initialization of v=
ariable with __attribute__((cleanup))
> >            scoped_guard (irqsave) {
> >            ^
> >    include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_gu=
ard'
> >            for (CLASS(_name, scope)(args),                             =
    \
> >                              ^
> >    2 errors generated.
>
> Ugh, this is an unfortunate interaction with clang's jump scope analysis
> and asm goto in LLVM releases prior to 17 :/
>
> https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1645979=
992
>
> Unfortunately, 'if (0)' does not prevent this (the analysis runs early
> in the front end as far as I understand it), we would need to workaround
> this with full preprocessor guards...

Thanks for jumping in on this one, I was quite puzzled :)

>
> Another alternative would be to require LLVM 17+ for RISC-V, which may
> not be the worst alternative, since I think most people doing serious
> work with clang will probably be living close to tip of tree anyways
> because of all the extension work that goes on upstream.

Stupid question but why the fix in llvm 17 was not backported to
previous versions?

Anyway, I'd rather require llvm 17+ than add a bunch of preprocessor
guards in this file (IIUC what you said above) as it is complex
enough.

@Conor Dooley @Palmer Dabbelt WDYT? Is there any interest in
supporting llvm < 17? We may encounter this bug again in the future so
I'd be in favor of moving to llvm 17+.

Thanks again Nathan,

Alex

>
> I am open to other thoughts though.
>
> Cheers,
> Nathan
