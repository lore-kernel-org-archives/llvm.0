Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D115C9A
	for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 23:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C93C433D7;
	Wed, 16 Nov 2022 23:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668641086;
	bh=Ze8IBU6Ae4SmnHvzmqWYkPBOhcJB72cUAuToogN8qOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL89u5U1aLTSxOaV1bRFj8EPnlNq4A9lzck3YZFZlROelnIYNi+pNs4NC6PsyE8tg
	 zs77pyAv+F+4qPSZ3KlMB93z7K/QjuPLvspBPnSjmiupg+pTbV6+Ju1RS32TE3I5eB
	 83F0EujWD3wqvnQwdAo9ohUAtbVPOWdUxUQmzMY9qZIIrDW6OSWEIwIoHZMNzWbhCT
	 zDOFCJCa7nzqwtVsZVemF08HThYkss7QAXehHVi9nqGldBP6ulUfRscMj2j+fWtzGh
	 VGe1iq25U887xhwpFPv19wrPMRcbHhh1c7xIb9GE1rCwixd6/lNIb0idvz9Ouw64Iw
	 I1tXvXMzEbr+Q==
Date: Wed, 16 Nov 2022 16:24:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	Nathan Chancellor <natechancellor@gmail.com>, ojeda@kernel.org,
	sedat.dilek@gmail.com, clang-built-linux <llvm@lists.linux.dev>,
	Manoj Gupta <manojgupta@google.com>
Subject: Re: kbuild: check the minimum compiler version in Kconfig
Message-ID: <Y3VxPPQG3uqPtqxa@dev-arch.thelio-3990X>
References: <fe18ed06-12f1-1dcb-71ee-aec5a5d656ea@gmail.com>
 <CAKwvOdnx_hyf=3DZtU_P8icWa07jf1+baNgM9MBh_ojE-EK5=A@mail.gmail.com>
 <d7e0fbca-7e9d-fbe2-6f8c-6e60a78f56df@gmail.com>
 <CAKwvOdnNA7pFGNuord-yiArE55oPNCCwCOHdrVQiRiATtYC23g@mail.gmail.com>
 <CAKwvOdmP+VgjsJGuvuC9q3RbwpqUwoNg6cyv3f5SjAqLc2K3_Q@mail.gmail.com>
 <15631f6a-dae6-b996-6e74-1bf7304b30a0@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15631f6a-dae6-b996-6e74-1bf7304b30a0@gmail.com>

On Wed, Nov 16, 2022 at 03:16:32PM -0800, Florian Fainelli wrote:
> On 11/16/22 15:11, Nick Desaulniers wrote:
> > On Wed, Nov 16, 2022 at 3:10 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > > 
> > > On Wed, Nov 16, 2022 at 2:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > > > 
> > > > On 11/16/22 14:48, Nick Desaulniers wrote:
> > > > > On Wed, Nov 16, 2022 at 1:48 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > > > > > 
> > > > > > Hi Masahiro, Nick,
> > > > > > 
> > > > > > The compiler version check performed with
> > > > > > aec6c60a01d3a3170242d6a99372a388e1136dc6 ("kbuild: check the minimum
> > > > > > compiler version in Kconfig") can be defeated and prevent running the
> > > > > > *config targets if specifying LLVM=1 on the command line, in that way:
> > > > > > 
> > > > > > BR_BINARIES_DIR=/local/users/fainelli/buildroot-llvm/output/arm64/images
> > > > > > LLVM=1 LLVM_IAS=1 PKG_CONFIG_PATH="" /usr/bin/make -j49 -C
> > > > > > /local/users/fainelli/buildroot-llvm/output/arm64/build/linux-custom
> > > > > > HOSTCC="/usr/bin/gcc"
> > > > > > HOSTCC="/local/users/fainelli/buildroot-llvm/output/arm64/host/bin/ccache
> > > > > > /usr/bin/gcc -O2
> > > > > > -I/local/users/fainelli/buildroot-llvm/output/arm64/host/include
> > > > > > -DNDEBUG -L/local/users/fainelli/buildroot-llvm/output/arm64/host/lib
> > > > > > -Wl,-rpath,/local/users/fainelli/buildroot-llvm/output/arm64/host/lib"
> > > > > > ARCH=arm64
> > > > > > INSTALL_MOD_PATH=/local/users/fainelli/buildroot-llvm/output/arm64/target
> > > > > > CROSS_COMPILE="/local/users/fainelli/buildroot-llvm/output/arm64/host/bin/aarch64-linux-"
> > > > > > WERROR=0
> > > > > > DEPMOD=/local/users/fainelli/buildroot-llvm/output/arm64/host/sbin/depmod
> > > > > > INSTALL_MOD_STRIP=1 HOSTCC="/usr/bin/gcc" menuconfig
> > > > > >      UPD     scripts/kconfig/mconf-cfg
> > > > > >      HOSTCC  scripts/kconfig/mconf.o
> > > > > >      HOSTCC  scripts/kconfig/lxdialog/checklist.o
> > > > > >      HOSTCC  scripts/kconfig/lxdialog/inputbox.o
> > > > > >      HOSTCC  scripts/kconfig/lxdialog/menubox.o
> > > > > >      HOSTCC  scripts/kconfig/lxdialog/textbox.o
> > > > > >      HOSTCC  scripts/kconfig/lxdialog/util.o
> > > > > >      HOSTCC  scripts/kconfig/lxdialog/yesno.o
> > > > > >      HOSTLD  scripts/kconfig/mconf
> > > > > > ***
> > > > > > *** Compiler is too old.
> > > > > > ***   Your Clang version:    10.0.0
> > > > > > ***   Minimum Clang version: 10.0.1
> > > > > > ***
> > > > > > scripts/Kconfig.include:44: Sorry, this compiler is not supported.
> > > > > > 
> > > > > > Here, the compiler check is actually checking the host compiler clang
> > > > > > version installed on my Ubuntu 20.04 system, as opposed to the cross
> > > > > > compiler clang version that is being used.
> > > > > 
> > > > > LLVM=1 will use `clang` as found by your $PATH.  Where did you express
> > > > > to make what the "cross compiler clang version" is? (And why do you
> > > > > set HOSTCC three times)
> > > > 
> > > > We are setting CROSS_COMPILE to express the cross compiler clang prefix
> > > > to use.
> > > 
> > > Can you try setting CLANG_PREFIX rather than CROSS_COMPILE (to the same value)?
> > > 
> > > CLANG_PREFIX=/local/users/fainelli/buildroot-llvm/output/arm64/host/bin/aarch64-linux-
> > 
> > sorry, I meant LLVM_PREFIX
> 
> Same results unfortunately.

What kernel version is this?

If you are not using PATH to control which binaries are being used, you
can use

    $ make LLVM=.../

to use .../clang, .../ld.lld, etc (the trailing slash is critical for
this), which will behave similar to CROSS_COMPILE for GCC. When building
with LLVM, CROSS_COMPILE only controls the target triple and it is
unnecessary when using all LLVM tools. That LLVM behavior is relatively
new, see commit e9c281928c24 ("kbuild: Make $(LLVM) more flexible").

Cheers,
Nathan
