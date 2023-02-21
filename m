Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9942EA4
	for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 22:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91A7C433EF;
	Tue, 21 Feb 2023 22:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677018813;
	bh=bhXxhbEaEnMf8ZbGJA8+1NxgqqmQSzTnoWAE5jD/z6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVzmVHC2Mo9UUrN5K2TNb49Gqxw9oXP8BcGJThwDJMllEgZ91pbLbLBT/9WqjPotG
	 zcXv+DyOXkZXUK2CqaOfZg77KLmS7hp6dg7iqm4D59SMfdVAolDcJ6Cv4mpJh2o3kc
	 8YmjMz18+B1z/6IrOgOdiAUHWmfgGT3Pc23L0fwXrmQme02Zsz82VaozJfB0TCrcCp
	 hRTAVUWb6dkq8ioxGhApimK3tMyzrujU5fozZ8ffMLDKVcen05MS6MSTBV+BZA2EuA
	 BaZrKGJjvZEDsLevE7rDdpG4LUhmIvJwphkJxxRamcB+wfTaorGAf5QXPQx2rQ/DjG
	 PuTOQrIWoocOQ==
Date: Tue, 21 Feb 2023 15:33:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, conor@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: stable-rc: 5.10: riscv: defconfig: clang-nightly: build failed -
 Invalid or unknown z ISA extension: 'zifencei'
Message-ID: <Y/VGu9IOJEKi6VwS@dev-arch.thelio-3990X>
References: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
 <Y/SLn5fto6+9xX0r@wendy>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/SLn5fto6+9xX0r@wendy>

On Tue, Feb 21, 2023 at 09:15:11AM +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 02:30:17PM +0530, Naresh Kamboju wrote:
> > The riscv defconfig and tinyconfig builds failed with clang-nightly
> > due to below build warnings / errors on latest stable-rc 5.10.
> > 
> > Regression on riscv:
> >   - build/clang-nightly-tinyconfig - FAILED
> >   - build/clang-nightly-defconfig - FAILED
> 
> > Build log:
> > ----
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=riscv
> > CROSS_COMPILE=riscv64-linux-gnu- HOSTCC=clang CC=clang LLVM=1
> > LLVM_IAS=1 LD=riscv64-linux-gnu-ld
> > riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> > Invalid or unknown z ISA extension: 'zifencei'
> > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > init/version.o
> > riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> > Invalid or unknown z ISA extension: 'zifencei'
> > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > init/do_mounts.o
> > riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> > Invalid or unknown z ISA extension: 'zifencei'
> > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > init/noinitramfs.o
> > riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> > Invalid or unknown z ISA extension: 'zifencei'
> > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > init/calibrate.o
> > riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> > Invalid or unknown z ISA extension: 'zifencei'
> 
> > Build details,
> > https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tinyconfig/details/
> 
> binutils 2.35 by the looks of things, I **think** that zifencei didn't
> land until 2.36. zicsr and zifence get added via cc-option-yn, which,
> IIRC, doesn't do anything with the linker. I dunno if anyone in RISC-V
> land cares this much about "odd" configurations back in 5.10, but while
> a fix is outstanding, you could use a newer binutils?

This is new in clang-17 so I bisected LLVM down to commit 22e199e6afb1
("[RISCV] Accept zicsr and zifencei command line options"), so I think
we need something like commit aae538cd03bc ("riscv: fix detection of
toolchain Zihintpause support") for zifencei to make sure all three
tools stay in sync, since I suspect that this is reproducible in
mainline with GNU ld. We just happen not to notice when using
LLVM=1 LLVM_IAS=1 since the tools have symmetrical support.

I can work up something like that change tomorrow if that seems like the
path worth taking.

Cheers,
Nathan
