Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6E8C09;
	Tue,  8 Nov 2022 17:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD81C433D6;
	Tue,  8 Nov 2022 17:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667927182;
	bh=E+bZsqTRa32Dj6VxSOdNs9JRYHbzHOK4jtOCaPVc9Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKqBYV0/A+LFG5w8O6GNy3XMhJ3Dpkr04OFMSE9klnws6UxOnbB4YnYw9ipOxfJpv
	 LVQLFVGIqmcYvVHEPogEnGrOPjQg/WxEy90IXFMDigcQ7OdLuwAkTZcANFHRRnMlPc
	 JsHXrBEpNQvyAFvy3oTqNb16c1JGpbbF1T7VrjNQiH+uQ7oQMAXpLW7K66foYfUNRy
	 0uCmzzjTlCaKTYzegD9kBMk3prcj4v41ATK3yHMdybMznqEhEBsl+NGeUe8EaCrpmk
	 eluURC/dJ6l7IKn5+fR5OKbqlC7/zyGDR1WrHlGeRFZ/GRngUKmkIp03rVnqYGDRE0
	 GBO8hAbBpQSFg==
Received: by pali.im (Postfix)
	id 82E1D818; Tue,  8 Nov 2022 18:06:19 +0100 (CET)
Date: Tue, 8 Nov 2022 18:06:19 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [helgaas-pci:pci/enumeration 3/3] drivers/pci/probe.c:909:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is
 true
Message-ID: <20221108170619.jmcfvcuggkwjfo7j@pali>
References: <202211081120.s8hX7ZW3-lkp@intel.com>
 <20221108130816.GA464595@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108130816.GA464595@bhelgaas>
User-Agent: NeoMutt/20180716

On Tuesday 08 November 2022 07:08:16 Bjorn Helgaas wrote:
> Why did the bot tell me the build was *SUCCESSFUL* even though this is
> clearly a problem?  Here's the "success" message:
> 
>   https://lore.kernel.org/all/636a47ad.UocsB2qjv%2FcFWvK2%25lkp@intel.com/
> 
> On Tue, Nov 08, 2022 at 03:21:20PM +0800, kernel test robot wrote:
> 
> > >> drivers/pci/probe.c:909:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> >            if (bus->domain_nr < 0)
> >                ^~~~~~~~~~~~~~~~~~
> 
> I set "err = -EINVAL" here; let me know if you prefer something
> different.

Hello! I agree that there is missing err= assignment.

Instead of -EINVAL you can use also bus->domain_nr as it is negative and
would contained error code (from ida_alloc() call).
