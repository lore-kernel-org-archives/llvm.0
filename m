Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0910FE;
	Mon, 28 Aug 2023 08:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1302C433C7;
	Mon, 28 Aug 2023 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693212373;
	bh=ShxAP8o2gjfAvr5N5Uh585qdijxqK7UHIqgxosZq5sQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DD6hkCiJLbbvDvlThdBiZfq9gC7sXdHeYgX9mQH5it0Dz38WDSSJES3r3jSOt+6Ey
	 hlISeRUaik3SnmapOZnmuGR2hSf1D5K1jgRU0UxX0IkLdCszahFwwpYJ9Oy6dZZi3M
	 VUVWxzoUFrMbsqC1GuPV5UNRBH1OlSHbkL0/DMFlIDdsDD7ixm1usZ7LvHVqPGqKzA
	 dTBvaLYtUbjkwGgd4ZSCaHthjFmze7ie2Sbxj0eDJ9PUkCoucYFY889H5yQ8Rsu0zY
	 suidRDyQ48sdvrm83PkqGgI0DI0CCY2VUlm9sXiMBZdPKgtF3Avj+F/XbUooK0YFHC
	 pudNYkQcUh+Yw==
Message-ID: <e74c2316-60d1-245f-c671-5cd19c3ef42c@kernel.org>
Date: Mon, 28 Aug 2023 10:46:09 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [stable:linux-6.4.y 600/1652] ERROR: modpost: __ex_table+0x222c
 references non-executable section '.rodata'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
References: <202308091247.i8jNaJgR-lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <202308091247.i8jNaJgR-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/08/2023 06:07, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.4.y
> head:   38ca69782268c8e9578ba2f1fccf931f643eb8da
> commit: 884756f0203f9478391389465f8d6184223572be [600/1652] w1: fix loop in w1_fini()
> config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230809/202308091247.i8jNaJgR-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091247.i8jNaJgR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308091247.i8jNaJgR-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 

...

> WARNING: modpost: vmlinux.o(__ex_table+0x2248): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
> ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux.o(__ex_table+0x225c): Section mismatch in reference from the (unknown reference) (unknown) to the variable .rodata.str1.1:.L.str.29
> ERROR: modpost: __ex_table+0x225c references non-executable section '.rodata.str1.1'
> WARNING: modpost: vmlinux.o: section mismatch in reference: fixed_mdio_bus_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: fixed_mdio_bus_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: smsc911x_cleanup_module (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: smsc911x_cleanup_module (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: mipid02_i2c_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: mipid02_i2c_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: w1_family_0d_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: w1_family_0d_exit (section: .exit.text) -> set_reset_devices (section: .init.text)

False positive. I don't think my patch caused it, but rather just
touched the file thus the same old warning pops up.

Best regards,
Krzysztof

