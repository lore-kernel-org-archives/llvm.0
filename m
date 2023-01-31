Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE23CA92D
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 19:25:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id bg26so5285283wmb.0
        for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 11:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NufJ/Gm2hWIMuXWS7/Yr4/bvV59aXKh8fWz/B+yUXao=;
        b=NNpPQJIvzEVa7JHxZGX3t1feIq6c+thiHUtAfF58mqvN/SKhXzHPXZDa1vvjAWzVmg
         AY5pQHc2ITTj2y17FefwAgR460L72mY9jKlq8ppU+mJOzeybhSDyxieBE2VVjQrujDhR
         eLSjBS+ymIrF0qhuvun9NsVguCaa2qyU0K8RHHEThbXQY6Buw4hhyiDeTX1+3ZEOpcmv
         y3nRL1v/5W5hSmRwYeltSz054mTMMu2hXeb8Vp2NKJhqkMhIEj3EAPq6tjrjQcS18auc
         JPg8ccJ72q8hokUwIijLnZg89yENXnBj42qB39Nji0aNZhPDnLsSupHPNSdG+4oiaRZJ
         naOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NufJ/Gm2hWIMuXWS7/Yr4/bvV59aXKh8fWz/B+yUXao=;
        b=dIbb0g0xo4thiHZCR3MtJQ3O+bFipvsua2IVTRJ6KDO6jbRCM8lowDO0noxKRnI+s2
         /87lLprQQABK7TK0EDY4QYdDw0zdC15EBfvx9BwTAIQLWtBT1/c+vrQVp9uJwbYkqj0r
         dUptGpeFOBp0WU19cgxF4d9Uovcmtx7sbtBFyU2Pki1x0nq39wf0FoBwCf2rZ/KgiqwX
         XQasqLES20/izkxN86fJ67tvNl73lqS42Dmn6ISiADazjTUqrjIYqjJxvtZsHtGOfjCb
         0hBXQS6NAfHe1ELCdWz1wtyZLBXIWFpa5KeIlN3YMEFxKcrpbdGAN43IbTybg7oPY3TO
         MiKg==
X-Gm-Message-State: AFqh2koLHIQwQmxOnAtUoOveat9HDlYHDDcdied5His+UbdrzRcBsAgm
	W5GlX8VDKe47JLMy1ThoHN1rYQqw9V6tJnAfEn8UKQ==
X-Google-Smtp-Source: AMrXdXv0AzrWKGFqX1wNssEzgbOFOBooSuSAhIG9PlOWhXZjk4mHGGjT2qTdWvY0YXD8lWYOrXMfm4GToReLbdC73sU=
X-Received: by 2002:a05:600c:5405:b0:3d0:50c4:432c with SMTP id
 he5-20020a05600c540500b003d050c4432cmr3093884wmb.67.1675193150731; Tue, 31
 Jan 2023 11:25:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230124064324.672022-1-irogers@google.com> <20230124064324.672022-2-irogers@google.com>
 <Y9lN+H3ModGwwKV6@dev-arch.thelio-3990X> <CAP-5=fWvmEJ3DuKkhOEVg6zoiSKDGW-n=GFqRhse=2dP=C6i3Q@mail.gmail.com>
In-Reply-To: <CAP-5=fWvmEJ3DuKkhOEVg6zoiSKDGW-n=GFqRhse=2dP=C6i3Q@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 31 Jan 2023 11:25:38 -0800
Message-ID: <CAP-5=fWJzTOYj167maEP8=k=iWQJcrF-zOdbkTAUw94qrVOL5g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tools/resolve_btfids: Alter how HOSTCC is forced
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Connor OBrien <connoro@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 10:08 AM Ian Rogers <irogers@google.com> wrote:
>
> On Tue, Jan 31, 2023 at 9:21 AM Nathan Chancellor <nathan@kernel.org> wro=
te:
> >
> > Hi Ian,
> >
> > On Mon, Jan 23, 2023 at 10:43:24PM -0800, Ian Rogers wrote:
> > > HOSTCC is always wanted when building. Setting CC to HOSTCC happens
> > > after tools/scripts/Makefile.include is included, meaning flags are
> > > set assuming say CC is gcc, but then it can be later set to HOSTCC
> > > which may be clang. tools/scripts/Makefile.include is needed for host
> > > set up and common macros in objtool's Makefile. Rather than override
> > > CC to HOSTCC, just pass CC as HOSTCC to Makefile.build, the libsubcmd
> > > builds and the linkage step. This means the Makefiles don't see thing=
s
> > > like CC changing and tool flag determination, and similar, work
> > > properly.
> > >
> > > Also, clear the passed subdir as otherwise an outer build may break b=
y
> > > inadvertently passing an inappropriate value.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > >  tools/bpf/resolve_btfids/Makefile | 17 +++++++----------
> > >  1 file changed, 7 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_bt=
fids/Makefile
> > > index 1fe0082b2ecc..daed388aa5d7 100644
> > > --- a/tools/bpf/resolve_btfids/Makefile
> > > +++ b/tools/bpf/resolve_btfids/Makefile
> > > @@ -18,14 +18,11 @@ else
> > >  endif
> > >
> > >  # always use the host compiler
> > > -AR       =3D $(HOSTAR)
> > > -CC       =3D $(HOSTCC)
> > > -LD       =3D $(HOSTLD)
> > > -ARCH     =3D $(HOSTARCH)
> > > +HOST_OVERRIDES :=3D AR=3D"$(HOSTAR)" CC=3D"$(HOSTCC)" LD=3D"$(HOSTLD=
)" ARCH=3D"$(HOSTARCH)" \
> > > +               EXTRA_CFLAGS=3D"$(HOSTCFLAGS) $(KBUILD_HOSTCFLAGS)"
> > > +
> > >  RM      ?=3D rm
> > >  CROSS_COMPILE =3D
> > > -CFLAGS  :=3D $(KBUILD_HOSTCFLAGS)
> > > -LDFLAGS :=3D $(KBUILD_HOSTLDFLAGS)
> > >
> > >  OUTPUT ?=3D $(srctree)/tools/bpf/resolve_btfids/
> > >
> > > @@ -56,12 +53,12 @@ $(OUTPUT) $(OUTPUT)/libsubcmd $(LIBBPF_OUT):
> > >
> > >  $(SUBCMDOBJ): fixdep FORCE | $(OUTPUT)/libsubcmd
> > >       $(Q)$(MAKE) -C $(SUBCMD_SRC) OUTPUT=3D$(SUBCMD_OUT) \
> > > -                 DESTDIR=3D$(SUBCMD_DESTDIR) prefix=3D \
> > > +                 DESTDIR=3D$(SUBCMD_DESTDIR) $(HOST_OVERRIDES) prefi=
x=3D subdir=3D \
> > >                   $(abspath $@) install_headers
> > >
> > >  $(BPFOBJ): $(wildcard $(LIBBPF_SRC)/*.[ch] $(LIBBPF_SRC)/Makefile) |=
 $(LIBBPF_OUT)
> > >       $(Q)$(MAKE) $(submake_extras) -C $(LIBBPF_SRC) OUTPUT=3D$(LIBBP=
F_OUT)    \
> > > -                 DESTDIR=3D$(LIBBPF_DESTDIR) prefix=3D EXTRA_CFLAGS=
=3D"$(CFLAGS)" \
> > > +                 DESTDIR=3D$(LIBBPF_DESTDIR) $(HOST_OVERRIDES) prefi=
x=3D subdir=3D \
> > >                   $(abspath $@) install_headers
> > >
> > >  LIBELF_FLAGS :=3D $(shell $(HOSTPKG_CONFIG) libelf --cflags 2>/dev/n=
ull)
> > > @@ -80,11 +77,11 @@ export srctree OUTPUT CFLAGS Q
> > >  include $(srctree)/tools/build/Makefile.include
> > >
> > >  $(BINARY_IN): fixdep FORCE prepare | $(OUTPUT)
> > > -     $(Q)$(MAKE) $(build)=3Dresolve_btfids
> > > +     $(Q)$(MAKE) $(build)=3Dresolve_btfids $(HOST_OVERRIDES)
> > >
> > >  $(BINARY): $(BPFOBJ) $(SUBCMDOBJ) $(BINARY_IN)
> > >       $(call msg,LINK,$@)
> > > -     $(Q)$(CC) $(BINARY_IN) $(LDFLAGS) -o $@ $(BPFOBJ) $(SUBCMDOBJ) =
$(LIBS)
> > > +     $(Q)$(HOSTCC) $(BINARY_IN) $(KBUILD_HOSTLDFLAGS) -o $@ $(BPFOBJ=
) $(SUBCMDOBJ) $(LIBS)
> > >
> > >  clean_objects :=3D $(wildcard $(OUTPUT)/*.o                \
> > >                              $(OUTPUT)/.*.o.cmd           \
> > > --
> > > 2.39.0.246.g2a6d74b583-goog
> > >
> >
> > I just bisected a linking failure when building resolve_btfids with
> > clang to this change as commit 13e07691a16f ("tools/resolve_btfids:
> > Alter how HOSTCC is forced") in the bpf-next tree.
> >
> > It appears to be related to whether or not CROSS_COMPILE is specified,
> > which we have to do for certain architectures and configurations still.
> > arm64 is not one of those but it helps demonstrate the issue.
> >
> >   # Turn off CONFIG_DEBUG_INFO_REDUCED and turn on CONFIG_DEBUG_INFO_BT=
F
> >   $ make -skj"$(nproc)" ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-=
 HOSTLDFLAGS=3D-fuse-ld=3Dlld LLVM=3D1 defconfig menuconfig
> >
> >   $ make -skj"$(nproc)" ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-=
 HOSTLDFLAGS=3D-fuse-ld=3Dlld LLVM=3D1 prepare
> >   ld.lld: error: $LINUX_SRC/tools/bpf/resolve_btfids//resolve_btfids-in=
.o is incompatible with elf64-x86-64
> >   clang-17: error: linker command failed with exit code 1 (use -v to se=
e invocation)
> >   ...
> >
> > Before your change, with V=3D1, I see:
> >
> > clang -Wp,-MD,$LINUX_SRC/tools/bpf/resolve_btfids/.main.o.d -Wp,-MT,$LI=
NUX_SRC/tools/bpf/resolve_btfids/main.o -Wall -Wmissing-prototypes -Wstrict=
-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11 -Wdeclaration-after-state=
ment -g -I$LINUX_SRC/tools/include -I$LINUX_SRC/tools/include/uapi -I$LINUX=
_SRC/tools/bpf/resolve_btfids/libbpf/include -I$LINUX_SRC/tools/bpf/resolve=
_btfids/libsubcmd/include -D"BUILD_STR(s)=3D#s" -c -o $LINUX_SRC/tools/bpf/=
resolve_btfids/main.o main.c
> >
> > After, I see:
> >
> > clang -Wp,-MD,$LINUX_SRC/tools/bpf/resolve_btfids/.main.o.d -Wp,-MT,$LI=
NUX_SRC/tools/bpf/resolve_btfids/main.o --target=3Daarch64-linux-gnu -g -I$=
LINUX_SRC/tools/include -I$LINUX_SRC/tools/include/uapi -I$LINUX_SRC/tools/=
bpf/resolve_btfids/libbpf/include -I$LINUX_SRC/tools/bpf/resolve_btfids/lib=
subcmd/include -D"BUILD_STR(s)=3D#s" -c -o $LINUX_SRC/tools/bpf/resolve_btf=
ids/main.o main.c
> >
> > We seem to have taken on a '--target=3Daarch64-linux-gnu' (changing the
> > target of resolve_btfids-in.o) and we dropped the warning flags.
> >
> > I think this comes from the clang block in
> > tools/scripts/Makefile.include, which is included into the
> > resolve_btfids Makefile via tools/lib/bpf/Makefile.
> >
> > I am not super familiar with the tools build system, otherwise I would
> > try to provide a patch. I tried moving CROSS_COMPILE from a recursive t=
o
> > simple variable ('=3D' -> ':=3D') and moving it to HOST_OVERRIDES but t=
hose
> > did not appear to resolve it for me.
> >
> > If there is any other information I can provide or patches I can test,
> > please let me know.
> >
> > Cheers,
> > Nathan
>
> Thanks Nathan, and thanks for all the details in the bug report. I'm
> looking into this.
>
> Ian

Given the somewhat complicated cross compile I wasn't able to get a
reproduction. Could you see if the following addresses the problem:

```
diff --git a/tools/bpf/resolve_btfids/Makefile
b/tools/bpf/resolve_btfids/Makefile
index daed388aa5d7..a06966841df4 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -19,10 +19,9 @@ endif

# always use the host compiler
HOST_OVERRIDES :=3D AR=3D"$(HOSTAR)" CC=3D"$(HOSTCC)" LD=3D"$(HOSTLD)"
ARCH=3D"$(HOSTARCH)" \
-                 EXTRA_CFLAGS=3D"$(HOSTCFLAGS) $(KBUILD_HOSTCFLAGS)"
+                 EXTRA_CFLAGS=3D"$(HOSTCFLAGS) $(KBUILD_HOSTCFLAGS)"
CROSS_COMPILE=3D""

RM      ?=3D rm
-CROSS_COMPILE =3D

OUTPUT ?=3D $(srctree)/tools/bpf/resolve_btfids/
```

Thanks,
Ian
