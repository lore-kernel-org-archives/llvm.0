Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F91302CC4;
	Mon, 25 Aug 2025 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142772; cv=none; b=MXGRRNjfe6lgpNdmjfzQNhoQ3KH/u6b1h2lHzgSlru9NxiJVN1BNcRVgqbhcJ4r2iUKXhCL4BlFfadA7klv5DMABaKzZ7gjgE0yXwGK/CEsZfAVbuSS646bLPvHXe4KK6GtDEUH4rN/d9LwlOrSr/kjgpE2wDGrnr5lHwk+7zFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142772; c=relaxed/simple;
	bh=PUJ5HIkUh42sX/ftQy6jAE/g9Z8l0O7YfbHM3lXiA24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpGXO4AEarX0KOYL9Z4ak3TCO9UmMbl8FTMIZ/rlmFl0N/U7KbE010d0yW5R0pH/C9fvpPRu7qtp/jnNxda/hQdg07gEe5MChyghsDsIbNnIGYOi13AXqRgGey/6+wExbfAqX9jaO7aWFXCfI131aZ+s0AraQixrXT0XrhNSv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOzm0w80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOzm0w80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37708C4CEED;
	Mon, 25 Aug 2025 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756142772;
	bh=PUJ5HIkUh42sX/ftQy6jAE/g9Z8l0O7YfbHM3lXiA24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOzm0w80AZfThXq6MOreXZcTNhIDn3mCTHtDxSZ3s7SuqRD3zT07e7tgXaUxC/jEG
	 EmZ4vcFInQQrp+jVskW6ni09AlD1yU0OZkZ1EKJU0ACkX4BOWi4hRtqIBBoGewW5/+
	 qPOSs6Ryzy6ZcbZiRhkiQGy6N0OfCgb+oxDud4ZAIwypRq/nZ+xZYcF3m/vZeCklfH
	 BY9255g7YRI/vYCEJ/SZhXCjxLeZ17f98CGh8oD+mTQ0sycy8t188ryiX9+f1EXwNt
	 eKmG8jM6MNijG7Fk32HHS7o2ZvreBtPDBHm/LYKbsQ2Kh7PqmFlLg9k8LR/FiJXpMu
	 Rhl+xG62GToSg==
Date: Mon, 25 Aug 2025 10:26:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Naman Jain <namjain@linux.microsoft.com>,
	kernel test robot <lkp@intel.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Wei Liu <wei.liu@kernel.org>,
	Roman Kisel <romank@linux.microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: Re: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
Message-ID: <20250825172607.GA704510@ax162>
References: <202508240828.pVaUV45D-lkp@intel.com>
 <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
 <SN6PR02MB415787F0ABF1E5BA8157E0C3D43EA@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB415787F0ABF1E5BA8157E0C3D43EA@SN6PR02MB4157.namprd02.prod.outlook.com>

On Mon, Aug 25, 2025 at 05:06:53PM +0000, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Sunday, August 24, 2025 10:44 AM
> > 
> > On 8/24/2025 12:02 PM, kernel test robot wrote:
> > > tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   0f4c93f7eb861acab537dbe94441817a270537bf
> > > commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: hv: Introduce mshv_vtl driver
> > > config: i386-buildonly-randconfig-2003-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
> > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_vp_registers'
> > >>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_set_vp_registers'
> > >>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_partition_property'
> > >     3 errors generated.
> > >
> 
> The other thing that's curious here is that these three functions are in
> drivers/hv/mshv_common.c, which is only built on x64 and when
> CONFIG_MSHV_ROOT or CONFIG_MSHV_VTL is set. None of these conditions 
> are true for the supplied config file, so why is mshv_common.c being compiled?

Yeah, that is odd... FWIW, these are not the only functions that display this
error. On mainline with the same configuration.

  error: <unknown>:0:0: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping'
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping_range'
  2 errors generated.
  make[6]: *** [scripts/Makefile.build:287: arch/x86/hyperv/nested.o] Error 1
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hyperv_flush_tlb_multi'
  1 error generated.
  make[6]: *** [scripts/Makefile.build:287: arch/x86/hyperv/mmu.o] Error 1
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_apicid_to_vp_index'
  1 error generated.
  make[6]: *** [scripts/Makefile.build:287: arch/x86/hyperv/hv_init.o] Error 1
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_map_interrupt'
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_unmap_interrupt'
  2 errors generated.
  make[6]: *** [scripts/Makefile.build:287: arch/x86/hyperv/irqdomain.o] Error 1
  make[6]: Target 'arch/x86/hyperv/' not remade because of errors.
  make[5]: *** [scripts/Makefile.build:556: arch/x86/hyperv] Error 2
  make[5]: Target 'arch/x86/' not remade because of errors.
  make[4]: *** [scripts/Makefile.build:556: arch/x86] Error 2
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_post_message'
  1 error generated.
  make[6]: *** [scripts/Makefile.build:287: drivers/hv/hv.o] Error 1
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_get_partition_id'
  error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_query_ext_cap'
  2 errors generated.
  make[6]: *** [scripts/Makefile.build:287: drivers/hv/hv_common.o] Error 1

Cheers,
Nathan
