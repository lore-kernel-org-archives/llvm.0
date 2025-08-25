Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E51AAE28;
	Mon, 25 Aug 2025 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141256; cv=none; b=eEhZxWdOVa8qYV0To11AQlCmywcwrYH/+JDw5z8D03M2BQySm0ZCy0jdp4XLkZRMm7XaLg3gE6V2zBHlVT34xwqVvgmcSo7/NNOVjvbFRetihZ6hekcvNkvM+7o6vsTNiITYFylv3iQrE2dCrBl8F/uRrMN3clpOeUOcVRr2uEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141256; c=relaxed/simple;
	bh=1Z4ORSovtvvaNkQ+/6ndCHaX0jPA3Hwaci9NzSHhf6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oX2Wu8FgfGO1AWzumprt/WgaWwPYP+yZ4938M+UuVe9txZVxqSx7ZrNcuWNawoLIDW/caF19VerOo9OS3lx5CPsTM2Ob7afznWNpnngEF3/oFQimM/NsAE7e41/gOGVgSBnYI3Yue5aNvAibWLPpH4VBb12rc5EtppcG/SfnTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2vA+T68; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2vA+T68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02248C116C6;
	Mon, 25 Aug 2025 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756141256;
	bh=1Z4ORSovtvvaNkQ+/6ndCHaX0jPA3Hwaci9NzSHhf6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2vA+T68CnBMVPSzEkwD1YmdEYkHnhuTCjyuGS1j+ZepnDAZVnW/lr9J/EGMt/MHa
	 6uYnRxA60bAcSeVZ3oOgaoPLb69e36eSQjBNpzvYID9SsvuIROelTtpLuQMHHgxTBB
	 SscqAJbrGtzN0pODKosgr1mdQFxsVYTD9ryF8I+Lo6DlIUhF8RCNlY/Fc9Yw/NGKn+
	 KBBO4+MHOWyVY3Lt5nAxpwA5eANvMz2c//B2KsENCC0kUVTWkcEm0sSpes0ok4WVHf
	 K8xnx1PQF738U+GFG7ElSSGnWaF2VKeAeHTd8OehQwmTq+h8tf2OMo0kkSfRvXEGGL
	 M8lw9Ddn8shQQ==
Date: Mon, 25 Aug 2025 10:00:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Roman Kisel <romank@linux.microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
Message-ID: <20250825170051.GB2719297@ax162>
References: <202508240828.pVaUV45D-lkp@intel.com>
 <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>

Hi Naman,

On Sun, Aug 24, 2025 at 11:13:51PM +0530, Naman Jain wrote:
> 
> 
> On 8/24/2025 12:02 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0f4c93f7eb861acab537dbe94441817a270537bf
> > commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: hv: Introduce mshv_vtl driver
> > config: i386-buildonly-randconfig-2003-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_vp_registers'
> > > > error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_set_vp_registers'
> > > > error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_partition_property'
> >     3 errors generated.
> > 
> 
> +Nathan
> 
> I can see a bunch of similar warnings previously reported, in different
> functions, but could not find a fix for it, or if this
> is a blocking error:
> 
> https://lore.kernel.org/all/?q=s%3A%22ran+out+of+registers+during+register+allocation%22
> 
> These all are reported on below 32 bit config, compiled with LLVM:
> i386-buildonly-randconfig-*
> 
> Found previous comment from Nathan Chancellor, here, which seems to be
> related to this error:
> https://lore.kernel.org/all/20250507022649.GA1984217@ax162/
> 
> """
> This configuration has CONFIG_MATOM=y, which does not really work well
> with clang for this reason and some others that have come up in the
> past. Given it is likely that nobody will care enough to fix this on the
> LLVM side (since it is 32-bit), we should probably just block using
> MATOM with CC_IS_CLANG, which Arnd and I had talked about at the last
> ClangBuiltLinux meeting.
> """
> 
> This gives me an impression that we can safely ignore these errors from
> kernel test bot.
> Requesting Nathan to please correct me if I am wrong.

Yes, this is all correct. I will try to pursue an actual kernel side fix
for this in Kconfig but I think the Intel folks can also start ignoring
these reports for ARCH=i386 and CONFIG_MATOM so that they do not get
sent to other kernel developers for random changes.

Cheers,
Nathan
