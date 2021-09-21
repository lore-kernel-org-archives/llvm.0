Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F2272
	for <llvm@lists.linux.dev>; Tue, 21 Sep 2021 15:45:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2514960F56;
	Tue, 21 Sep 2021 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632239158;
	bh=oUXSwDhpKzYMmWBssLG6zMpEw0q4SlFhhZce92hja74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gisj6qXLFdDGaAM8XwoRaxY9MQxQtlFCjCNlrtL1R7TibJ36IfI07ckdQjM53rw3b
	 dps1oKCy0i+y84PXh7t7zZH0rYUxrdjeBet+Xagk1PvrsPX3tb3r9i920TAJ84af7J
	 +63EzTn8H77JzE3WbHLoAEDl0EhNT8UrkAZFQGWJ8GeEmRuyY0j66kBifrhr8Bt/gZ
	 tSLc2N62I6ot+mdB6PpThaBV+qUQUMvlI2yMQBQka54n6vFfBp3Wz4BAYYLGD/+msv
	 TYmXLW6Aa4q3xFux48P61habF9hqQcijS0P8HQT806aa9AUvYYsYpt59S/gsfi8xOP
	 OD5w0n39liU5w==
Date: Tue, 21 Sep 2021 08:45:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Helge Deller <deller@gmx.de>, arnd@linaro.org,
	linaro-toolchain@lists.linaro.org, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by linux: parisc: Declare
 pci_iounmap() parisc version only when CONFIG_PCI enabled
Message-ID: <YUn+MRw4dkxrMouZ@archlinux-ax161>
References: <342384227.4073.1632234888093@localhost>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342384227.4073.1632234888093@localhost>

On Tue, Sep 21, 2021 at 02:34:47PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by linux: parisc: Declare pci_iounmap() parisc version only when CONFIG_PCI enabled:
> commit 9caea0007601d3bc6debec04f8b4cd6f4c2394be
> Author: Helge Deller <deller@gmx.de>
> 
>     parisc: Declare pci_iounmap() parisc version only when CONFIG_PCI enabled
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 37
> # First few build errors in logs:
> 
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 20151
> 
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> 
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig
> 
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/build-9caea0007601d3bc6debec04f8b4cd6f4c2394be/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/build-31ad37bd6faf871c070650f72ac9488ceeeceeb0/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/

00:00:38 In file included from arch/arm64/kernel/asm-offsets.c:10:
00:00:38 In file included from ./include/linux/arm_sdei.h:8:
00:00:38 In file included from ./include/acpi/ghes.h:5:
00:00:38 In file included from ./include/acpi/apei.h:9:
00:00:38 In file included from ./include/linux/acpi.h:35:
00:00:38 In file included from ./include/acpi/acpi_io.h:5:
00:00:38 In file included from ./include/linux/io.h:13:
00:00:38 In file included from ./arch/arm64/include/asm/io.h:185:
00:00:38 ./include/asm-generic/io.h:1060:20: error: static declaration of 'pci_iounmap' follows non-static declaration
00:00:38 static inline void pci_iounmap(struct pci_dev *dev, void __iomem *p)
00:00:38                    ^
00:00:38 ./include/asm-generic/io.h:1059:21: note: expanded from macro 'pci_iounmap'
00:00:38 #define pci_iounmap pci_iounmap
00:00:38                     ^
00:00:38 ./include/asm-generic/pci_iomap.h:21:13: note: previous declaration is here
00:00:38 extern void pci_iounmap(struct pci_dev *dev, void __iomem *);
00:00:38             ^
00:00:38 1 error generated.
00:00:38 make[1]: *** [scripts/Makefile.build:121: arch/arm64/kernel/asm-offsets.s] Error 1
00:00:38 make[1]: Target '__build' not remade because of errors.
00:00:38 make: *** [Makefile:1219: prepare0] Error 2
00:00:38 make: Target '__all' not remade because of errors.

Already reported and fixed:

https://lore.kernel.org/r/YUeriU9EIJ5hiFjL@archlinux-ax161/
316e8d79a095 ("pci_iounmap'2: Electric Boogaloo: try to make sense of it all")

Cheers,
Nathan
