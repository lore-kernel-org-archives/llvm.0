Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ECA173
	for <llvm@lists.linux.dev>; Mon,  3 Jan 2022 19:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78568C36AED;
	Mon,  3 Jan 2022 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641237729;
	bh=QILJGy9S8l79ulomvvAwvyNdKrpqypzxuAZq6LVF7yw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bR/7cQs6YAKMDPulq+sTpWLn9VnvyDbNI5b46vPat7KHS2ae0iNP5DSRrk4h0aool
	 EbRaK8fo6Fw6SQRGGhxMLqPfbzVu/KxgqB2DWcaIxLp9K8vFdoHJ3PLtHytPdlpwkd
	 pXwhskPEx1xE/jkIUAuBWd9YODgR1ISMnalDzsW54zIEVHtW2227lv6sGKAw4fS/9x
	 QG53hGrtGndEavVqf6ygK5uhOAYK6vDl2xGp+CuytFiP9N7tZR3CObcETNuiFfzb1L
	 cFQXzNJYOITB9eEoZtwC9krCmm0BYty4RTN5f1y8//KgQ4VZuvQTB7Y5yvX5rAtDX2
	 js0jTyfL1YIFA==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <maz@kernel.org>)
	id 1n4SuF-00Floz-G2; Mon, 03 Jan 2022 19:22:07 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 03 Jan 2022 19:22:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm-platforms:kvm-arm64/pmu-bl 4/5]
 arch/arm64/kvm/pmu-emul.c:895:24: error: use of undeclared identifier 'kvm'
In-Reply-To: <202201040228.xRreWFaE-lkp@intel.com>
References: <202201040228.xRreWFaE-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <1982120cc9c7e58e5a8b8c1f41e6068f@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lkp@intel.com, alexandru.elisei@arm.com, llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2022-01-03 18:39, kernel test robot wrote:
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> kvm-arm64/pmu-bl
> head:   877a6850e9bc0d29fa60dbedf345300c0f3396e4
> commit: 0071239cd4ab9fc0b5cb9b911b36adee31598f3f [4/5] KVM: arm64: Add
> KVM_ARM_VCPU_PMU_V3_SET_PMU attribute
> config: arm64-randconfig-r013-20220103
> (https://download.01.org/0day-ci/archive/20220104/202201040228.xRreWFaE-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project
> 104a827ea6de0cbe0f5faef4407552ede31d165c)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=0071239cd4ab9fc0b5cb9b911b36adee31598f3f
>         git remote add arm-platforms
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
>         git fetch --no-tags arm-platforms kvm-arm64/pmu-bl
>         git checkout 0071239cd4ab9fc0b5cb9b911b36adee31598f3f
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/arm64/kvm/pmu-emul.c:895:24: error: use of undeclared identifier 
>>> 'kvm'
>            if (irqchip_in_kernel(kvm)) {

Fixed branch pushed out, thanks for the heads up.

         M.
-- 
Jazz is not dead. It just smells funny...
