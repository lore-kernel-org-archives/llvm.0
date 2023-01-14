Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9132F51;
	Sat, 14 Jan 2023 11:54:30 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4d13cb4bbffso199008677b3.3;
        Sat, 14 Jan 2023 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DvI+CeRWVTNSV0B6ZD8unPvEj5NWZi+Y8Deb7v55YoY=;
        b=obs3qgE0+zvSCRapk7kQUptHOZhGx5/1ml6Sv6M8tfTLW78/OpEGuIF6ivNT2DznoN
         qc0h6Jk/gUOb99J8LHLS8RlW//6Qxukx+XIY9WxxdPu5jvP8Xwlv+eUl92CQOJqlXGms
         VsfQ0HmgeAdCLUFypUlITrFEjD+UYkUGs8WP8NpgGabqrp/SG45OHx4lzpgFxRUIPebA
         /1oVaBvgIRzzJGYJxyMjRt12mUQJ2a3G7A7EBfbr1QIV8Z0yud82o/vpacYRKYDukKq7
         lK8PxPjKHp77iQGZ+niHI2AyKhh5V0f5CNWLN0LiyOqF69HmEvCab0jjE1Zi0TOmwCpD
         h0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvI+CeRWVTNSV0B6ZD8unPvEj5NWZi+Y8Deb7v55YoY=;
        b=Mp5Z0UsTAVwHv+LmMku/gdMHtT9XBw/2qyTlaRiFVFi7z80fA9kgBWFAZFK+tIjTDd
         JdFtVYWpQjSPmzFG5jYrL82xfaFCfhjZFV3a+Bw+1/BkOaW000+xYmnz0ht4z2nzr/WP
         4qJaNYiFsKV+qQPGsidDzM4Iew50RHts3T5Ia578lZKJCwmR150O3nHeladRWxwZEarU
         m8f5oQssSdtV5PfWh/4tmMp9O6De41H5E/EuJPbxm1lm6C30ICAYJImLkDUtq3UfcFbI
         NIU3scMimpUq24RTO39pNa0Oye98sKrylY6erSGJto1f9xE/duvoDfwquZkcp1pkFQal
         gvIg==
X-Gm-Message-State: AFqh2ko1orGfxeRcTzAaFTKKfLoODLhPVP/rod9ZTit+clOkj2MDIUDU
	9X8YaighZSLhFSixaGRwRG1DvuNfSDEbe6IY7H4=
X-Google-Smtp-Source: AMrXdXsHvE5WGQ376cJ83wcrMjHUP7gkRhA+MFh3+5ocRmga++VS9xB2WtHu9iAZtBiT5ohucaA0SFrAXQvxtbrJr14=
X-Received: by 2002:a0d:fb07:0:b0:3bc:7270:cb70 with SMTP id
 l7-20020a0dfb07000000b003bc7270cb70mr2902582ywf.83.1673697269958; Sat, 14 Jan
 2023 03:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212272003.rgQDX8DQ-lkp@intel.com> <Y6r4mXz5NS0+HVXo@zn.tnic>
 <CANiq72kc60aPcx5LwFhOGL4AXOhZsZj32iOg75K5ZxLaaRaYkg@mail.gmail.com>
 <Y7i1h3lCMKfxB532@zn.tnic> <CANiq72khMLU6tF8vGD9fs7mLNAAQu8wJ2n1SLM3th2QMMfGPPA@mail.gmail.com>
 <Y8Ax/I5qOcVDZljG@zn.tnic>
In-Reply-To: <Y8Ax/I5qOcVDZljG@zn.tnic>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Jan 2023 12:54:18 +0100
Message-ID: <CANiq72kXpDwRO3R+tjqYgOcbFT7rwnpH=KhVyry-+CUsJa7mRQ@mail.gmail.com>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, 
	Yujie Liu <yujie.liu@intel.com>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 5:14 PM Borislav Petkov <bp@alien8.de> wrote:
>
> Right, or at least the repro instructions should state it clear.
>
> Btw, this is part of a long-running feedback process we're giving to the 0day
> bot in order to make their reports as user friendly as possible.

Sounds very useful, thanks for the effort!

> Well, I find having an --explain option too much. But there are perhaps reasons
> for it.
>
> One improvement could be, IMHO, they could turn on --explain automatically when
> it results in a build error. So that you don't have to do it yourself.
>
> What would be better, tho, is if there were no --explain option at all and the
> warnings are as human readable as possible.

Sometimes one can get quite a few errors/warnings, so printing all the
docs for all those would be probably too much.

I think `--explain` is intended to provide a way to have longer
documentation about a particular diagnostic message without filling
the terminal too much those that already know what the error/warning
is about (in this particular case, the error first line looks fine to
me -- but of course the machine-translated bindings from `bindgen` are
harder to read due to the generated identifiers).

> so the struct is:
>
> struct alt_instr {
>         s32 instr_offset;       /* original instruction */
>         s32 repl_offset;        /* offset to replacement instruction */
>
>         union {
>                 struct {
>                         u32 cpuid: 16;  /* CPUID bit set for replacement */
>                         u32 flags: 16;  /* patching control flags */
>                 };
>                 u32 ft_flags;
>         };
>
>         u8  instrlen;           /* length of original instruction */
>         u8  replacementlen;     /* length of new instruction */
> } __packed;
>
> and everything is naturally aligned.
>
> So I'm guessing this is a rust bindings glue shortcoming or so...

Yeah, this is https://github.com/rust-lang/rust-bindgen/issues/2179 (I
mentioned it in my reply to Alexander above, in case you didn't see
it, as well as the usual workarounds we use).

There are also other related issues related to GCC's `packed` and
`aligned` attributes: aligned fields in general are not supported
(including just adding the attribute), neither are structs declared
both packed and aligned. So only a subset of possibilities are handled
properly. I collected some links to related issues at
https://github.com/Rust-for-Linux/linux/issues/353.

From what I could tell reading some old discussions the other day, the
`bindgen` maintainer (Cc'ing Emilio) is aware of the issues but nobody
has put the time to solve it within the bindings generator.

Ideally, I think, Rust could support providing alignment for
individual members in `repr(C)` structs in order to tweak its
described layout algorithm, in order for users to mimic GCC/MSVC/...
extensions as needed. That way it can be useful also for everyone
(even those not using `bindgen`), and `bindgen`'s implementation would
be easier, I imagine.

Cheers,
Miguel
