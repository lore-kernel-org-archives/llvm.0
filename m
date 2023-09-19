Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FF36B10
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 23:19:24 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-65649c60858so19910546d6.3
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 16:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695165564; x=1695770364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmScHZrrPctAnyRe5gPF7RCSRzwc3e64G4tl/4ZoDFs=;
        b=zQHvvZlZxP6uuBcmKEJmr8h3iD8eUHJYj+xKoWzemcuJSANlcAzAh4o0OevvICqCIn
         X94hEhONeoSicPhHfjqSoqBfHk/PaO7+9Dd/JKeEg13uUKYBo2x80hYaquSIeL6RqBpt
         /rlAvGG8kMq14o2ovFRpOm49RyRgGm6BqRIcQHnjWRJY2cVGdwQ6y98qOvYa3PwsPum9
         hWZG4hRyNOdk2zb33xzHkKH6RcPQHICNwEj78xrwqJIiH3EfkcsoSoBNqIo1mQxAu//U
         q8SIUXZW5YX3w/OCVi65vtFXXrEPkL30UbI7FhSdjAJpdobYNBi0Z00rtUzwGrJm+hdU
         2ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695165564; x=1695770364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmScHZrrPctAnyRe5gPF7RCSRzwc3e64G4tl/4ZoDFs=;
        b=wHHas2RfcieBwA/HKVBU8W1KrZhxh/0DlDlGY1Iyqeg+d47Dl+6/yMFrYGWVJKbecq
         HSOwdOGRcb+XR6iLqwF+F0yFK+35esiUPgyZCuoaIBZ5vXpQV1++oUzRyrbk49LgHtr0
         kNB5ha7ZD1vSigv1WifH81RGWsaOGjzwUQcVmJbLGXoSx/dToRWkf/ZAMia7E/umL0u+
         64bGgb0bmv8nInVi8M67sWwBTKVvsMhALxbuRNqPioe4MmA2BVMY41iawAJv5ElbQOBT
         nzobD4gtN98MFvKitQA438CNPI7Iw2Xql3T9vjeZAlIzJbguOAgpe9d4mzneD2PtMYgO
         Mj6A==
X-Gm-Message-State: AOJu0YwXHV6HAiDX/T+nP7ucz0zdyz6l1H21JWZbM/8sXG5nC/PUSKTC
	ua7Qtg/A4shOWNcHIeQCLydp1elKsKWExiw+rc+BcQ==
X-Google-Smtp-Source: AGHT+IFB96wrWOBn8okFdo/4Cs2hhspvWNE0nmCvq72foFsmGS2fYauQwFb3mta3KdBXraSglOFQHwtFWLuvDYa//J8=
X-Received: by 2002:a0c:f10e:0:b0:658:2500:31ee with SMTP id
 i14-20020a0cf10e000000b00658250031eemr858747qvl.11.1695165563613; Tue, 19 Sep
 2023 16:19:23 -0700 (PDT)
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
 <CAKwvOdmni7Vqo0W1qgGkVx8GH4+D7JXO5QTQgqGv8D=Go4oPAA@mail.gmail.com> <CAHRSSEz=S_c=KmgDNL_FenUJ25jLmwKe-QXo7-_nUC-7avD0Gg@mail.gmail.com>
In-Reply-To: <CAHRSSEz=S_c=KmgDNL_FenUJ25jLmwKe-QXo7-_nUC-7avD0Gg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Sep 2023 16:19:10 -0700
Message-ID: <CAKwvOdkHE7rXgOUyUSCKZ690bjV88E9yVfmG-7vLH6iqqr2G-Q@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Todd Kjos <tkjos@google.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, kernelci@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 4:12=E2=80=AFPM Todd Kjos <tkjos@google.com> wrote:
>
> On Tue, Sep 19, 2023 at 4:02=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Sep 19, 2023 at 3:54=E2=80=AFPM Todd Kjos <tkjos@google.com> wr=
ote:
> > >
> > > Guillaume,
> > >
> > > How about this for android trees:
> > >
> > > 1) same compilers as current config (gcc-10, clang-14)
> > > 2) archs: arm, arm64, i386, x80_64, riscv
> > > 3) same configs as current android tests
> > > 4) plus configs used by corresponding stable kernel
> > > (https://linux.kernelci.org/job/stable) not included in #3
> > >
> > > We get a nice benefit from sync'ing with the stable kernels since it
> > > allows us to tell which issues originate upstream and which are
> > > introduced by android changes. It's also useful to build each with
> > > both toolchains so we can expose the cases where gcc-10 is OK but
> > > clang-14 has issues (and visa-versa).

Also, why clang-14? Clang 18 is ToT, clang 17 is latest release.

> > >
> > > I don't think we need to build all of the combinations if there are
> > > too many builds - we could trim out some of the configs from #4 (you
> > > can recommend which).
> > >
> > > We'd also like to start in an all-green state. So let's trim out the
> > > error cases that aren't caused by android kernel code. I think there
> > > are some 32-bit cases that fail with the clang-14 tools and some othe=
r
> > > cases that fail in stable.
> >
> > That would be news to me. Got any more info on that?
>
> We've talked about it. You said at the time that they were known
> issues with clan and old arm architectures, but you didn't have time
> to deal with them. We're not building any of those cases now with the
> reduced test set, but here is an example from June 15:
>
> https://linux.kernelci.org/build/android/branch/android13-5.10/kernel/ASB=
-2023-06-05_13-5.10-9-g4d9cc0c1eadb2/

Ah, the long tail of configs.  I guess since ACK doesn't have a
gki_defconfig for ARCH=3Darm, a grab bag of arbitrary configs is the
next best thing.

Half of the red exclamation marks on that link are are "0 warnings - 0
errors".  What's up with that?

For the ones with errors, clicking logs gives you HTTP 404.  Guessing
those aren't retained very long? Surprised then the landing page is.

>
> Here are the errors/warnings:
>
> Build Logs Summary
>
> Errors Summary
>
> 19drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2447:9: error: shift
> count >=3D width of type [-Werror,-Wshift-count-overflow]
> 5drivers/net/ethernet/i825xx/ether1.c:237:1: error: invalid
> instruction, did you mean: ldrb, ldrexb?
> 5drivers/net/ethernet/i825xx/ether1.c:175:1: error: invalid
> instruction, did you mean: strb, strexb?
> 4drivers/net/ethernet/i825xx/ether1.c:238:1: error: invalid
> instruction, did you mean: strb, strexb?
> 4drivers/net/ethernet/i825xx/ether1.c:174:1: error: invalid
> instruction, did you mean: ldrb, ldrexb?
> 2fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
> 2arm-linux-gnueabihf-gcc: error: unrecognized -march target: armv3m
> 2arm-linux-gnueabihf-gcc: error: missing argument to =E2=80=98-march=3D=
=E2=80=99
> 1lib/bitfield_kunit.c:93:1: error: the frame size of 4192 bytes is
> larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
> 1ld.lld: error: undefined symbol: clock_task_mult
> 1fs/namei.c:2131:13: error: use of bitwise '|' with boolean operands
> [-Werror,-Wbitwise-instead-of-logical]
> 1drivers/usb/gadget/udc/pxa25x_udc.c:2328:11: error: invalid % escape
> in inline assembly string
> 1arch/arm/mach-ep93xx/crunch-bits.S:99:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:98:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:97:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:96:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:95:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:191:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:190:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:189:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:188:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:187:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:186:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:185:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:184:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:183:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:182:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:181:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:180:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:179:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:178:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:177:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:176:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:174:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:173:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:172:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:171:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:170:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:169:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:168:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:167:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:166:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:165:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:164:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:163:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:162:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:161:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:160:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:159:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:158:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:157:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:156:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:155:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:154:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:153:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:152:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:151:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:149:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:148:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:144:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:141:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:140:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:138:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:137:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:136:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:135:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:134:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:133:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:132:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:131:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:130:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:129:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:128:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:127:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:126:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:125:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:124:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:123:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:122:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:121:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:120:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:119:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:118:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:117:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:116:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:115:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:109:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:108:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:107:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:106:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:105:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:104:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:103:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:102:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:101:2: error: invalid instruction
> 1arch/arm/mach-ep93xx/crunch-bits.S:100:2: error: invalid instruction
> 1<stdin>:830:2: error: syscall fstat64 not implemented [-Werror,-W#warnin=
gs]
> 1<stdin>:830:2: error: #warning syscall fstat64 not implemented [-Werror=
=3Dcpp]
> 1<stdin>:1127:2: error: syscall fstatat64 not implemented [-Werror,-W#war=
nings]
> 1<stdin>:1127:2: error: #warning syscall fstatat64 not implemented [-Werr=
or=3Dcpp]
> 1:1: error: invalid instruction, did you mean: ldrb, ldrexb?
> 1/tmp/kci/linux/build/../kernel/sched/fair.c:4998: undefined reference
> to `clock_task_mult'
> 1/tmp/kci/linux/build/../kernel/sched/fair.c:4983: undefined reference
> to `clock_task_mult'
> 1/tmp/kci/linux/build/../kernel/sched/fair.c:11476: undefined
> reference to `clock_task_mult'
>
> Warnings Summary
>
> 2163ld.lld: warning: lld uses blx instruction, no object with
> architecture supporting feature detected
> 188clang: warning: argument unused during compilation:
> '-march=3Darmv7-a' [-Wunused-command-line-argument]
> 92clang: warning: argument unused during compilation: '-march=3Darmv6k'
> [-Wunused-command-line-argument]
> 5clang: warning: argument unused during compilation: '-march=3Darmv7-m'
> [-Wunused-command-line-argument]
> 2cc1: all warnings being treated as errors
> 22 warnings generated.
> 2./usr/include/linux/bcache.h:355:2: warning: field '' with variable
> sized type 'union jset::(anonymous at
> ./usr/include/linux/bcache.h:355:2)' not at the end of a struct or
> class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> 2./usr/include/linux/bcache.h:354:2: warning: field '' with variable
> sized type 'union jset::(anonymous at
> ./usr/include/linux/bcache.h:354:2)' not at the end of a struct or
> class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> 1fs/namei.c:2131:13: note: cast one or both operands to int to silence
> this warning
> 1WARNING: modpost: module pstore uses symbol sync_filesystem from
> namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> but does not import it.
> 1WARNING: modpost: module pstore uses symbol clear_inode from
> namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> but does not import it.
> 1WARNING: modpost: module dax uses symbol unlock_new_inode from
> namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> but does not import it.
> 1WARNING: modpost: module dax uses symbol inode_init_once from
> namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver,
> but does not import it.
> 1WARNING: modpost: module dax uses symbol iget5_locked from namespace
> VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does
> not import it.
> 1#warning syscall fstatat64 not implemented
> 1#warning syscall fstat64 not implemented
>
>
> >
> > >
> > > Could we start with all of the builds for #1 - #4 and then tune it up
> > > after a few runs to get rid of long-failing cases and/or to just
> > > reduce the load on the build service?
> > >
> > > -Todd
> > >
> > >
> > >
> > > On Wed, Sep 6, 2023 at 12:50=E2=80=AFPM Todd Kjos <tkjos@google.com> =
wrote:
> > > >
> > > > +Viktor Martensson +Betty Zhou
> > > >
> > > > Guillaume,
> > > >
> > > > I think that's a great idea. I'll get back to you with the set of
> > > > configs, arch, compilers we'd like to have coverage for.
> > > >
> > > > -Todd
> > > >
> > > >
> > > > On Wed, Sep 6, 2023 at 11:46=E2=80=AFAM Guillaume Tucker
> > > > <guillaume.tucker@collabora.com> wrote:
> > > > >
> > > > > Hi Todd,
> > > > >
> > > > > On 05/09/2023 19:18, Todd Kjos wrote:
> > > > > > On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@google=
.com> wrote:
> > > > > >>
> > > > > >>
> > > > > >>
> > > > > >> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <guil=
laume.tucker@collabora.com> wrote:
> > > > > >>>
> > > > > >>> Hi Todd,
> > > > > >>>
> > > > > >>> On 11/07/2023 00:41, Todd Kjos wrote:
> > > > > >>>> Please add the following new Android branches to kernelci te=
sting.
> > > > > >>>>
> > > > > >>>> repo: https://android.googlesource.com/kernel/common
> > > > > >>>> branches:
> > > > > >>>> - android15-6.1
> > > > > >>>> - android14-6.1-lts
> > > > > >>>> - android14-5.15-lts
> > > > > >>>
> > > > > >>> I've created this PR accordingly:
> > > > > >>>
> > > > > >>>   https://github.com/kernelci/kernelci-core/pull/2002
> > > > > >>>
> > > > > >>> Please note that we're now operating with reduced build cover=
age
> > > > > >>> due to some temporary limitations with our Azure subscription=
.  I
> > > > > >>> know the Android kernel builds should be covered by the GCP
> > > > > >>> clusters but right now the system is designed to distribute
> > > > > >>> kernel builds randomly across all clusters so we can't easily=
 tie
> > > > > >>> Android builds to the Android clusters.  Hopefully we'll find=
 a
> > > > > >>> solution to go back to normal coverage within a week or two.
> > > > > >>
> > > > > >>
> > > > > >> Hi Guillaume, Any ETA for when the full set of builds is resto=
red? We still have greatly reduced build coverage and it's been a month.
> > > > > >
> > > > > > Ping. We are getting a lot less value out of kernelci with the =
greatly
> > > > > > reduced set of builds for the Android kernels. When will the fu=
ll
> > > > > > build coverage be resumed?
> > > > > >
> > > > > > If it needs to stay reduced, can we decide precisely which buil=
ds are
> > > > > > done for Android kernels?
> > > > >
> > > > > Sorry for the slow reply.
> > > > >
> > > > > I think it's fine now to re-enable the Android builds and maybe
> > > > > we should also take this opportunity to confirm which ones are
> > > > > the most relevant to you guys.  As part of the process of
> > > > > adjusting the build coverage, I also fixed the GKI builds which I
> > > > > thought were the main ones.  Even if there is enough build
> > > > > capacity to build "everything", keeping it streamlined to what is
> > > > > really useful makes the overall system more effective.
> > > > >
> > > > > Are there any particular combinations of arch, config, compilers
> > > > > you care about more than others?
> > > > >
> > > > > Thanks,
> > > > > Guillaume
> > > > >
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
