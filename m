Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE07193
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 00:12:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41513d2cca7so173211cf.0
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 17:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695168740; x=1695773540; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmSmAfI5r0gZ2qbJSQz+FEQrEEm+G1rvNJLg8KLDqsI=;
        b=b2hF7UiUxIOya6OKDvwnh1fdQETEBgplj9ysfKU6eucjlrhRW3w3pBK6vHAGF+zUs9
         FbPCioLUU8RY2CuM5tY916A6DN1P2cc5K6hquBtdmjmnk9wAFG2g/Ofu8Br6IFyetZCe
         LC58Bo99jenMtqgSnx3WSoWYqeOMA4MAlW80B4J6rAC00ed19ft1iDHXcebpIQTGOR1a
         +gHhVTimWx3evWpLrzYFbOUyCRKCvYbZVtTjo2Qetfvh4HRJGgEpe9e3kBKXTV8ECr5d
         JRahVXeVoCtqi31f8CAU6lI4a932LBDZHLJ5MEreR/V24MqBa0ZMQOykv4aCb4sL1tMa
         Kdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695168740; x=1695773540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmSmAfI5r0gZ2qbJSQz+FEQrEEm+G1rvNJLg8KLDqsI=;
        b=CXcmoAcp/1aPmhQHezg/XwX1EHjxW/FR8VAeEKDmzvtpMacG4oIA4xxx/u6ibGBvsZ
         FITQvzpTV2zdkx/B5rD+hZTnAIkfotQwrmal8n+Mg3IKMZLbd6u/NX5S5jFhSSBHQyBN
         3m55g9lzmepkOUMbLT3kK8O984KNqaG+v7j9aRKgwBBLNi2I5dOjsMuhGfl5CbhHRvzC
         Od1ldWXRCB0EXDTK8QGFJoautbt75FgKR7ouIJJh4L/cLj0WWHTHP1EmpgHdKCroVyh9
         DRs+osOuSni9o2saEJrtEWBCPQDQnsrQp+5HMzHUrI3ItE6/D27h8JgCD6yyPkdKGf9N
         g+vA==
X-Gm-Message-State: AOJu0YwueVEMBaDuvZd4KTTwHA9EScrpriwbrHhAOW46dr0FPoeAsz4k
	0uneWfNKmhF3grprRfdEfO7NgZwLfkc057Bmrb0UhQ==
X-Google-Smtp-Source: AGHT+IFdQhZpJSkF1LTrDif/WOGqcbDdJdDn6ofqssakhT96CfXIPzofUA7uDJSS0VzfT7Cr4nj0zbzJGd3PDlTtfJc=
X-Received: by 2002:a05:622a:180b:b0:412:9cd:473b with SMTP id
 t11-20020a05622a180b00b0041209cd473bmr119191qtc.4.1695168740310; Tue, 19 Sep
 2023 17:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <CAKwvOdmni7Vqo0W1qgGkVx8GH4+D7JXO5QTQgqGv8D=Go4oPAA@mail.gmail.com>
 <CAHRSSEz=S_c=KmgDNL_FenUJ25jLmwKe-QXo7-_nUC-7avD0Gg@mail.gmail.com> <CAKwvOdkHE7rXgOUyUSCKZ690bjV88E9yVfmG-7vLH6iqqr2G-Q@mail.gmail.com>
In-Reply-To: <CAKwvOdkHE7rXgOUyUSCKZ690bjV88E9yVfmG-7vLH6iqqr2G-Q@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 19 Sep 2023 17:12:08 -0700
Message-ID: <CAHRSSEzD=nMKjnmJxsGuPdMy2iqc-jxcppna_eKOb8PH0SQOXA@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, kernelci@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 4:19=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Sep 19, 2023 at 4:12=E2=80=AFPM Todd Kjos <tkjos@google.com> wrot=
e:
> >
> > On Tue, Sep 19, 2023 at 4:02=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Tue, Sep 19, 2023 at 3:54=E2=80=AFPM Todd Kjos <tkjos@google.com> =
wrote:
> > > >
> > > > Guillaume,
> > > >
> > > > How about this for android trees:
> > > >
> > > > 1) same compilers as current config (gcc-10, clang-14)
> > > > 2) archs: arm, arm64, i386, x80_64, riscv
> > > > 3) same configs as current android tests
> > > > 4) plus configs used by corresponding stable kernel
> > > > (https://linux.kernelci.org/job/stable) not included in #3
> > > >
> > > > We get a nice benefit from sync'ing with the stable kernels since i=
t
> > > > allows us to tell which issues originate upstream and which are
> > > > introduced by android changes. It's also useful to build each with
> > > > both toolchains so we can expose the cases where gcc-10 is OK but
> > > > clang-14 has issues (and visa-versa).
>
> Also, why clang-14? Clang 18 is ToT, clang 17 is latest release.

Those are just the defaults in kernelci today. I'm obviously fine with
moving forward to clang-18 if it is available in kernelci.

>
>
> > > >
> > > > I don't think we need to build all of the combinations if there are
> > > > too many builds - we could trim out some of the configs from #4 (yo=
u
> > > > can recommend which).
> > > >
> > > > We'd also like to start in an all-green state. So let's trim out th=
e
> > > > error cases that aren't caused by android kernel code. I think ther=
e
> > > > are some 32-bit cases that fail with the clang-14 tools and some ot=
her
> > > > cases that fail in stable.
> > >
> > > That would be news to me. Got any more info on that?
> >
> > We've talked about it. You said at the time that they were known
> > issues with clan and old arm architectures, but you didn't have time
> > to deal with them. We're not building any of those cases now with the
> > reduced test set, but here is an example from June 15:
> >
> > https://linux.kernelci.org/build/android/branch/android13-5.10/kernel/A=
SB-2023-06-05_13-5.10-9-g4d9cc0c1eadb2/
>
> Ah, the long tail of configs.  I guess since ACK doesn't have a
> gki_defconfig for ARCH=3Darm, a grab bag of arbitrary configs is the
> next best thing.

Much of the kernelci tests for us are really about kernel hygiene. We
do a lot of testing internally of gki_defconfig for the architectures
we support, but there are non-GKI downstream users of our kernels and
kernelci is the primary way we make sure we aren't breaking other
builds with different configs. It is also the only place where
gki_defconfig is built with gcc which is useful to make sure we
haven't accidentally broken gcc builds.

>
> Half of the red exclamation marks on that link are are "0 warnings - 0
> errors".  What's up with that?

This more recent build has "0 warnings - 0 errors":
https://linux.kernelci.org/build/android/branch/android15-6.1/kernel/ASB-20=
23-07-05_14-6.1-2620-gf2d0380464d3/

Here is the error (not sure why it bubbled up as 0/0):

  AR      drivers/base/power/built-in.a
../fs/namei.c:2172:13: error: use of bitwise '|' with boolean operands
[-Werror,-Wbitwise-instead-of-logical]
        } while (!(has_zero(a, &adata, &constants) | has_zero(b,
&bdata, &constants)));

~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   ||
../fs/namei.c:2172:13: note: cast one or both operands to int to
silence this warning
  CC      drivers/base/firmware_loader/builtin/main.o
1 error generated.
make[3]: *** [../scripts/Makefile.build:250: fs/namei.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:500: fs] Error 2

>
> For the ones with errors, clicking logs gives you HTTP 404.  Guessing
> those aren't retained very long? Surprised then the landing page is.

Agreed. If you want to take action on them, we'd need to retry those
builds (probably can do that locally since you have the branch,
toolchain, and config info).

I'd like to just abandon those builds for old architectures so our
builds are clean unless we break something.

>
> >
> > Here are the errors/warnings:
> >
> > Build Logs Summary
> >
> > Errors Summary
> >
> > 19drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2447:9: error: shift
> > count >=3D width of type [-Werror,-Wshift-count-overflow]
> > 5drivers/net/ethernet/i825xx/ether1.c:237:1: error: invalid
> > instruction, did you mean: ldrb, ldrexb?
> > 5drivers/net/ethernet/i825xx/ether1.c:175:1: error: invalid
> > instruction, did you mean: strb, strexb?
> > 4drivers/net/ethernet/i825xx/ether1.c:238:1: error: invalid
> > instruction, did you mean: strb, strexb?
> > 4drivers/net/ethernet/i825xx/ether1.c:174:1: error: invalid
> > instruction, did you mean: ldrb, ldrexb?
> > 2fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
> > 2arm-linux-gnueabihf-gcc: error: unrecognized -march target: armv3m
> > 2arm-linux-gnueabihf-gcc: error: missing argument to =E2=80=98-march=3D=
=E2=80=99
> > 1lib/bitfield_kunit.c:93:1: error: the frame size of 4192 bytes is
> > larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
> > 1ld.lld: error: undefined symbol: clock_task_mult
> > 1fs/namei.c:2131:13: error: use of bitwise '|' with boolean operands
> > [-Werror,-Wbitwise-instead-of-logical]
> > 1drivers/usb/gadget/udc/pxa25x_udc.c:2328:11: error: invalid % escape
> > in inline assembly string
> > 1arch/arm/mach-ep93xx/crunch-bits.S:99:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:98:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:97:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:96:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:95:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:191:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:190:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:189:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:188:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:187:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:186:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:185:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:184:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:183:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:182:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:181:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:180:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:179:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:178:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:177:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:176:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:174:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:173:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:172:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:171:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:170:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:169:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:168:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:167:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:166:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:165:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:164:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:163:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:162:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:161:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:160:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:159:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:158:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:157:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:156:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:155:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:154:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:153:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:152:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:151:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:149:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:148:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:144:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:141:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:140:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:138:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:137:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:136:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:135:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:134:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:133:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:132:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:131:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:130:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:129:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:128:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:127:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:126:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:125:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:124:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:123:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:122:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:121:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:120:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:119:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:118:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:117:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:116:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:115:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:109:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:108:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:107:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:106:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:105:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:104:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:103:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:102:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:101:2: error: invalid instruction
> > 1arch/arm/mach-ep93xx/crunch-bits.S:100:2: error: invalid instruction
> > 1<stdin>:830:2: error: syscall fstat64 not implemented [-Werror,-W#warn=
ings]
> > 1<stdin>:830:2: error: #warning syscall fstat64 not implemented [-Werro=
r=3Dcpp]
> > 1<stdin>:1127:2: error: syscall fstatat64 not implemented [-Werror,-W#w=
arnings]
> > 1<stdin>:1127:2: error: #warning syscall fstatat64 not implemented [-We=
rror=3Dcpp]
> > 1:1: error: invalid instruction, did you mean: ldrb, ldrexb?
> > 1/tmp/kci/linux/build/../kernel/sched/fair.c:4998: undefined reference
> > to `clock_task_mult'
> > 1/tmp/kci/linux/build/../kernel/sched/fair.c:4983: undefined reference
> > to `clock_task_mult'
> > 1/tmp/kci/linux/build/../kernel/sched/fair.c:11476: undefined
> > reference to `clock_task_mult'
> >
> > Warnings Summary
> >
> > 2163ld.lld: warning: lld uses blx instruction, no object with
> > architecture supporting feature detected
> > 188clang: warning: argument unused during compilation:
> > '-march=3Darmv7-a' [-Wunused-command-line-argument]
> > 92clang: warning: argument unused during compilation: '-march=3Darmv6k'
> > [-Wunused-command-line-argument]
> > 5clang: warning: argument unused during compilation: '-march=3Darmv7-m'
> > [-Wunused-command-line-argument]
> > 2cc1: all warnings being treated as errors
> > 22 warnings generated.
> > 2./usr/include/linux/bcache.h:355:2: warning: field '' with variable
> > sized type 'union jset::(anonymous at
> > ./usr/include/linux/bcache.h:355:2)' not at the end of a struct or
> > class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> > 2./usr/include/linux/bcache.h:354:2: warning: field '' with variable
> > sized type 'union jset::(anonymous at
> > ./usr/include/linux/bcache.h:354:2)' not at the end of a struct or
> > class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> > 1fs/namei.c:2131:13: note: cast one or both operands to int to silence
> > this warning
> > 1WARNING: modpost: module pstore uses symbol sync_filesystem from
> > namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> > but does not import it.
> > 1WARNING: modpost: module pstore uses symbol clear_inode from
> > namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> > but does not import it.
> > 1WARNING: modpost: module dax uses symbol unlock_new_inode from
> > namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> > but does not import it.
> > 1WARNING: modpost: module dax uses symbol inode_init_once from
> > namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> > but does not import it.
> > 1WARNING: modpost: module dax uses symbol iget5_locked from namespace
> > VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does
> > not import it.
> > 1#warning syscall fstatat64 not implemented
> > 1#warning syscall fstat64 not implemented
> >
> >
> > >
> > > >
> > > > Could we start with all of the builds for #1 - #4 and then tune it =
up
> > > > after a few runs to get rid of long-failing cases and/or to just
> > > > reduce the load on the build service?
> > > >
> > > > -Todd
> > > >
> > > >
> > > >
> > > > On Wed, Sep 6, 2023 at 12:50=E2=80=AFPM Todd Kjos <tkjos@google.com=
> wrote:
> > > > >
> > > > > +Viktor Martensson +Betty Zhou
> > > > >
> > > > > Guillaume,
> > > > >
> > > > > I think that's a great idea. I'll get back to you with the set of
> > > > > configs, arch, compilers we'd like to have coverage for.
> > > > >
> > > > > -Todd
> > > > >
> > > > >
> > > > > On Wed, Sep 6, 2023 at 11:46=E2=80=AFAM Guillaume Tucker
> > > > > <guillaume.tucker@collabora.com> wrote:
> > > > > >
> > > > > > Hi Todd,
> > > > > >
> > > > > > On 05/09/2023 19:18, Todd Kjos wrote:
> > > > > > > On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@goog=
le.com> wrote:
> > > > > > >>
> > > > > > >>
> > > > > > >>
> > > > > > >> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <gu=
illaume.tucker@collabora.com> wrote:
> > > > > > >>>
> > > > > > >>> Hi Todd,
> > > > > > >>>
> > > > > > >>> On 11/07/2023 00:41, Todd Kjos wrote:
> > > > > > >>>> Please add the following new Android branches to kernelci =
testing.
> > > > > > >>>>
> > > > > > >>>> repo: https://android.googlesource.com/kernel/common
> > > > > > >>>> branches:
> > > > > > >>>> - android15-6.1
> > > > > > >>>> - android14-6.1-lts
> > > > > > >>>> - android14-5.15-lts
> > > > > > >>>
> > > > > > >>> I've created this PR accordingly:
> > > > > > >>>
> > > > > > >>>   https://github.com/kernelci/kernelci-core/pull/2002
> > > > > > >>>
> > > > > > >>> Please note that we're now operating with reduced build cov=
erage
> > > > > > >>> due to some temporary limitations with our Azure subscripti=
on.  I
> > > > > > >>> know the Android kernel builds should be covered by the GCP
> > > > > > >>> clusters but right now the system is designed to distribute
> > > > > > >>> kernel builds randomly across all clusters so we can't easi=
ly tie
> > > > > > >>> Android builds to the Android clusters.  Hopefully we'll fi=
nd a
> > > > > > >>> solution to go back to normal coverage within a week or two=
.
> > > > > > >>
> > > > > > >>
> > > > > > >> Hi Guillaume, Any ETA for when the full set of builds is res=
tored? We still have greatly reduced build coverage and it's been a month.
> > > > > > >
> > > > > > > Ping. We are getting a lot less value out of kernelci with th=
e greatly
> > > > > > > reduced set of builds for the Android kernels. When will the =
full
> > > > > > > build coverage be resumed?
> > > > > > >
> > > > > > > If it needs to stay reduced, can we decide precisely which bu=
ilds are
> > > > > > > done for Android kernels?
> > > > > >
> > > > > > Sorry for the slow reply.
> > > > > >
> > > > > > I think it's fine now to re-enable the Android builds and maybe
> > > > > > we should also take this opportunity to confirm which ones are
> > > > > > the most relevant to you guys.  As part of the process of
> > > > > > adjusting the build coverage, I also fixed the GKI builds which=
 I
> > > > > > thought were the main ones.  Even if there is enough build
> > > > > > capacity to build "everything", keeping it streamlined to what =
is
> > > > > > really useful makes the overall system more effective.
> > > > > >
> > > > > > Are there any particular combinations of arch, config, compiler=
s
> > > > > > you care about more than others?
> > > > > >
> > > > > > Thanks,
> > > > > > Guillaume
> > > > > >
> > > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
