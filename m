Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C4329A8
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 18:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6437CC433D7;
	Tue, 27 Sep 2022 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664304996;
	bh=sa98CoI0Pz5krrosWCkCPJFrPPIZ3oZz2nSGxO+RFCw=;
	h=Date:From:To:Cc:Subject:From;
	b=A76iRts0gKky9iRxy6fYxmeVHQXX6Q3EFhn9aPoWBNFd8tvqCR2lVTN/1z/i4x4yU
	 Zsa8m7O3plZ1zIP986A9sVqkZETO4KZXJ2J7WdGPrxxI+NJQOhDsGl4oFUswQ0J1gF
	 5Ckipr//eLc7FG82RiruGeE4PN4fkaIiwkOO8v0YWgacPvqR4898jCaaosxTB/R45e
	 RNFALgykpenm2TrNmu2ZNjSl6jxYzMQ8hcoMxjYfyMzqCB4wbvkchtJ+hemNkMhKnk
	 4smpPqnroSNLFufnv8yVw7RT5w25RZU7qEURrbzTpYYJvZoH6kriH7Gcjut6QTw+KI
	 RGM/CJT7ya0dA==
Date: Tue, 27 Sep 2022 11:56:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: dwarves@vger.kernel.org, llvm@lists.linux.dev
Subject: die__process_unit: DW_TAG_label (0xa) @ <0x7b> not handled!
Message-ID: <YzNHYoI4EZOQdCQ0@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnaldo,

When building a kernel with LLVM and CONFIG_DEBUG_INFO_BTF after commit
32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files") in
the kernel, I see the following spew of warnings, which appear to come
from pahole:

$ clang --version
clang version 15.0.0 (Fedora 15.0.0-3.fc38)
Target: x86_64-redhat-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

$ pahole --version
v1.24

$ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 defconfig

$ scripts/config \
    -d DEBUG_INFO_NONE \
    -e BPF_SYSCALL \
    -e DEBUG_INFO_BTF \
    -e DEBUG_INFO_DWARF5

$ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 olddefconfig all
...
die__process_unit: DW_TAG_label (0xa) @ <0x7b> not handled!
die__process_unit: tag not supported 0xa (label)!
die__process_unit: DW_TAG_label (0xa) @ <0x97> not handled!
die__process_unit: DW_TAG_label (0xa) @ <0xbd> not handled!
die__process_unit: DW_TAG_label (0xa) @ <0xed> not handled!
die__process_unit: DW_TAG_label (0xa) @ <0x109> not handled!
die__process_unit: DW_TAG_label (0xa) @ <0x12a> not handled!
die__process_unit: DW_TAG_label (0xa) @ <0x146> not handled!
die__process_unit: DW_TAG_label (0xa) @ <0x16f> not handled!
...

Is this a problem with LLVM or pahole? I do not see this when building
with GCC + GNU as but that could just be a red herring. I assume that
there could be something missing for processing debug info from
assembly, perhaps? If there is any further information I can provide or
anything I can test, I am more than happy to do so.

Cheers,
Nathan
