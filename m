Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61B17CC
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 21:16:19 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s25so23587416lji.5
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 13:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dBpMcOCVV5he/0EMVbMC9YSaBhV8xepMwiscE4fAzc=;
        b=ptYKFLmwuYKLggkRzDBkp/DIYZrcQ/pqxsLwc7rEXKN34okqfMi0cOHOgU34X9ijtX
         VUCTukVzZqi56OJ6nP2Gg2M9//9ZLBqWNx0gWzFxmpaqHCQm2OGEowAuEVXymRorBejr
         4JChNI8fYY3lsF9SLkcHD1vjFl9NYlI99ZzvLjiDloBHgqN6bU7gVjx6XU+HlKm/EUTG
         k3AQjTzKAFH3UyMS6uzEbRIBFfH1OP4lYJmNh5IgkE6oqU90dXqmho1ss5egvro6eV66
         ks89Fm4eRG1hfMOTJU2+PwEP4qiNcn8cPZmJ1Lq7bMXH15NmIwUiFZjTa3Jxt8l/2LJJ
         nXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dBpMcOCVV5he/0EMVbMC9YSaBhV8xepMwiscE4fAzc=;
        b=zYFBLkbL1RS1S1eIjcqkF7pWnYVwqfCdS7IdaVo1rdrfmxGi4ajCIjggZfLbZsoxos
         vvGc0R1CUVj8THSvhJZ30o19jglYI3oV5ndOmsGymj6nvCSYEKn1EAMFJtuWA78TfRoa
         xWo+IeVBDNiuVw9RT/DbgxZfayf3arQfk8EdehT0BwHFpUHt67Od8JlIJ4Jpmy1SNxAs
         8go8CF9DQmI34hwdcxJRWF5JvqM7ovORrJVyxHMhYOYDoE0R4VuX5iAUpBbk39pLnTCY
         HfbiuPdZuPNv5jEMUskpelPxD/d5sJgkDSfOZZmEvzYPiBJc7znCF1xL9oQ0jp/CIr1A
         1p2A==
X-Gm-Message-State: AOAM530RqcdwoWHyzfbFGSQS37hBtDczoX9fBWZXOljYXNiI+AP/St5S
	JLy9ZjbT+4BhcJRYUFYcP3M4AzVgHIbK43xdUxmwdg==
X-Google-Smtp-Source: ABdhPJw7cIOlzXgz1J/YFnmXwlsnIAaUF+DK/pxxUuMfDeoNgehPmJyarbJf726dX2JI7grFZwcXfN53qHTGG+9+Gis=
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id
 m26-20020a2e871a000000b002460ee21109mr18069492lji.165.1646169376960; Tue, 01
 Mar 2022 13:16:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220224145138.952963315@infradead.org> <20220224151322.072632223@infradead.org>
In-Reply-To: <20220224151322.072632223@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 13:16:04 -0800
Message-ID: <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, joao@overdrivepizza.com, hjl.tools@gmail.com, 
	jpoimboe@redhat.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, 
	keescook@chromium.org, samitolvanen@google.com, mark.rutland@arm.com, 
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org, 
	mhiramat@kernel.org, alexei.starovoitov@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 24, 2022 at 7:17 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Debian (and derived) distros ship their compilers as -$ver suffixed
> binaries. For gcc it is sufficent to use:
>
>  $ make CC=gcc-12
>
> However, clang builds (esp. clang-lto) need a whole array of tools to be
> exactly right, leading to unweildy stuff like:
>
>  $ make CC=clang-13 LD=ld.lld-13 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
>
> which is, quite franktly, totally insane and unusable. Instead make
> the CC variable DTRT, enabling one such as myself to use:
>
>  $ make CC=clang-13
>
> This also lets one quickly test different clang versions.
> Additionally, also support path based LLVM suites like:
>
>  $ make CC=/opt/llvm/bin/clang
>
> This changes the default to LLVM=1 when CC is clang, mixing toolchains

No, nack, we definitely do not want CC=clang to set LLVM=1. Those are
distinctly two different things for testing JUST the compiler
(CC=clang) vs the whole toolchain suite (LLVM=1). I do not wish to
change the semantics of those, and only for LLVM.

LLVM=1 means test clang, lld, llvm-objcopy, etc..
CC=clang means test clang, bfd, GNU objcopy, etc..
https://docs.kernel.org/kbuild/llvm.html#llvm-utilities

I don't wish to see the behavior of CC=clang change based on LLVM=0 being set.

> is still possible by explicitly adding LLVM=0.

Thanks for testing with LLVM, and even multiple versions of LLVM.

I'm still sympathetic, but only up to a point. A change like this MUST
CC the kbuild AND LLVM maintainers AND respective lists though.  It
also has little to do with the rest of the series.

As per our previous discussion
https://lore.kernel.org/linux-kbuild/CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com/
I'm still of the opionion that this should be solved by modifications
(permanent or one off) to one's $PATH.

To see what that would look like, let's test that out:

$ sudo apt install clang-11 lld-11

$ cd linux
$ dirname $(readlink -f $(which clang-11))
$ PATH=$(dirname $(readlink -f $(which clang-11))):$PATH make LLVM=1
-j72 -s allnoconfig all
$ llvm-readelf -p .comment vmlinux
String dump of section '.comment':
[     0] Linker: LLD 11.1.0
[    14] Debian clang version 11.1.0-4+build3


If that's too much for the command line, then add a shell function to
your shell's .rc file:

$ which make_clang
make_clang () {
  ver=$1
  shift
  if ! [[ -n $(command -v clang-$ver) ]]
  then
    echo "clang-$ver not installed"
    return 1
  fi
  PATH=$(dirname $(readlink -f $(which clang-$ver))):$PATH make CC=clang $@
}

$ make_clang 11 -j72 -s clean allnoconfig all
$ llvm-readelf -p .comment vmlinux
String dump of section '.comment':
[     0] Debian clang version 11.1.0-4+build3


Even stuffing the dirname+readlink+which in a short helper fn would let you do:

$ make CC=$(helper clang-11)

Also, Kees mentions this is an issue for testing multiple different
versions of gcc, too.  There perhaps is a way to simplify the builds
for BOTH toolchains; i.e. a yet-to-be-created shared variable denoting
the suffix for binaries?  The primary pain point seems to be Debian's
suffixing scheme; it will suffix GCC, clang, and lld, but not GNU
binutils IIUC.

>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  Makefile                       |   45 +++++++++++++++++++++++++++---------
>  tools/scripts/Makefile.include |   50 ++++++++++++++++++++++++++++-------------
>  2 files changed, 68 insertions(+), 27 deletions(-)
>
> --- a/Makefile
> +++ b/Makefile
> @@ -423,9 +423,29 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_C
>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>
> -ifneq ($(LLVM),)
> -HOSTCC = clang
> -HOSTCXX        = clang++
> +# powerpc and s390 don't yet work with LLVM as a whole
> +ifeq ($(ARCH),powerpc)
> +LLVM = 0
> +endif
> +ifeq ($(ARCH),s390)
> +LLVM = 0
> +endif
> +
> +# otherwise, if CC=clang, default to using LLVM to enable LTO
> +CC_BASE := $(shell echo $(CC) | sed 's/.*\///')
> +CC_NAME := $(shell echo $(CC_BASE) | cut -b "1-5")
> +ifeq ($(shell test "$(CC_NAME)" = "clang"; echo $$?),0)
> +LLVM ?= 1
> +LLVM_PFX := $(shell echo $(CC) | sed 's/\(.*\/\)\?.*/\1/')

Just curious, what prefixes have you observed in the wild?

> +LLVM_SFX := $(shell echo $(CC_BASE) | cut -b "6-")
> +endif
> +
> +# if not set by now, do not use LLVM
> +LLVM ?= 0
> +
> +ifneq ($(LLVM),0)
> +HOSTCC = $(LLVM_PFX)clang$(LLVM_SFX)
> +HOSTCXX        = $(LLVM_PFX)clang++$(LLVM_SFX)
>  else
>  HOSTCC = gcc
>  HOSTCXX        = g++
> @@ -442,15 +462,15 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS)
>
>  # Make variables (CC, etc...)
>  CPP            = $(CC) -E
> -ifneq ($(LLVM),)
> -CC             = clang
> -LD             = ld.lld
> -AR             = llvm-ar
> -NM             = llvm-nm
> -OBJCOPY                = llvm-objcopy
> -OBJDUMP                = llvm-objdump
> -READELF                = llvm-readelf
> -STRIP          = llvm-strip
> +ifneq ($(LLVM),0)
> +CC             = $(LLVM_PFX)clang$(LLVM_SFX)
> +LD             = $(LLVM_PFX)ld.lld$(LLVM_SFX)
> +AR             = $(LLVM_PFX)llvm-ar$(LLVM_SFX)
> +NM             = $(LLVM_PFX)llvm-nm$(LLVM_SFX)
> +OBJCOPY                = $(LLVM_PFX)llvm-objcopy$(LLVM_SFX)
> +OBJDUMP                = $(LLVM_PFX)llvm-objdump$(LLVM_SFX)
> +READELF                = $(LLVM_PFX)llvm-readelf$(LLVM_SFX)
> +STRIP          = $(LLVM_PFX)llvm-strip$(LLVM_SFX)
>  else
>  CC             = $(CROSS_COMPILE)gcc
>  LD             = $(CROSS_COMPILE)ld
> @@ -461,6 +481,7 @@ OBJDUMP             = $(CROSS_COMPILE)objdump
>  READELF                = $(CROSS_COMPILE)readelf
>  STRIP          = $(CROSS_COMPILE)strip
>  endif
> +
>  PAHOLE         = pahole
>  RESOLVE_BTFIDS = $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
>  LEX            = flex
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -51,12 +51,32 @@ define allow-override
>      $(eval $(1) = $(2)))
>  endef
>
> -ifneq ($(LLVM),)
> -$(call allow-override,CC,clang)
> -$(call allow-override,AR,llvm-ar)
> -$(call allow-override,LD,ld.lld)
> -$(call allow-override,CXX,clang++)
> -$(call allow-override,STRIP,llvm-strip)
> +# powerpc and s390 don't yet work with LLVM as a whole
> +ifeq ($(ARCH),powerpc)
> +LLVM = 0
> +endif
> +ifeq ($(ARCH),s390)
> +LLVM = 0
> +endif
> +
> +# otherwise, if CC=clang, default to using LLVM to enable LTO
> +CC_BASE := $(shell echo $(CC) | sed 's/.*\///')
> +CC_NAME := $(shell echo $(CC_BASE) | cut -b "1-5")
> +ifeq ($(shell test "$(CC_NAME)" = "clang"; echo $$?),0)
> +LLVM ?= 1
> +LLVM_PFX := $(shell echo $(CC) | sed 's/\(.*\/\)\?.*/\1/')
> +LLVM_SFX := $(shell echo $(CC_BASE) | cut -b "6-")
> +endif
> +
> +# if not set by now, do not use LLVM
> +LLVM ?= 0
> +
> +ifneq ($(LLVM),0)
> +$(call allow-override,CC,$(LLVM_PFX)clang$(LLVM_SFX))
> +$(call allow-override,AR,$(LLVM_PFX)llvm-ar$(LLVM_SFX))
> +$(call allow-override,LD,$(LLVM_PFX)ld.lld$(LLVM_SFX))
> +$(call allow-override,CXX,$(LLVM_PFX)clang++$(LLVM_SFX))
> +$(call allow-override,STRIP,$(LLVM_PFX)llvm-strip$(LLVM_SFX))
>  else
>  # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
>  $(call allow-override,CC,$(CROSS_COMPILE)gcc)
> @@ -68,10 +88,10 @@ endif
>
>  CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
>
> -ifneq ($(LLVM),)
> -HOSTAR  ?= llvm-ar
> -HOSTCC  ?= clang
> -HOSTLD  ?= ld.lld
> +ifneq ($(LLVM),0)
> +HOSTAR  ?= $(LLVM_PFX)llvm-ar$(LLVM_SFX)
> +HOSTCC  ?= $(LLVM_PFX)clang$(LLVM_SFX)
> +HOSTLD  ?= $(LLVM_PFX)ld.lld$(LLVM_SFX)
>  else
>  HOSTAR  ?= ar
>  HOSTCC  ?= gcc
> @@ -79,11 +99,11 @@ HOSTLD  ?= ld
>  endif
>
>  # Some tools require Clang, LLC and/or LLVM utils
> -CLANG          ?= clang
> -LLC            ?= llc
> -LLVM_CONFIG    ?= llvm-config
> -LLVM_OBJCOPY   ?= llvm-objcopy
> -LLVM_STRIP     ?= llvm-strip
> +CLANG          ?= $(LLVM_PFX)clang$(LLVM_SFX)
> +LLC            ?= $(LLVM_PFX)llc$(LLVM_SFX)
> +LLVM_CONFIG    ?= $(LLVM_PFX)llvm-config$(LLVM_SFX)
> +LLVM_OBJCOPY   ?= $(LLVM_PFX)llvm-objcopy$(LLVM_SFX)
> +LLVM_STRIP     ?= $(LLVM_PFX)llvm-strip$(LLVM_SFX)
>
>  ifeq ($(CC_NO_CLANG), 1)
>  EXTRA_WARNINGS += -Wstrict-aliasing=3
>
>


-- 
Thanks,
~Nick Desaulniers
