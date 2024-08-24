Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058D1DA3D;
	Sat, 24 Aug 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724479656; cv=none; b=B3JXlYT+dok9ytkAFOclHErAut6e7U9b3Obr/252CRoZMKq/wrIVIii3CgPj9fQoYM8SHnZbos0vkRP6xsIdlT8jycfgl0KlUYrCfTHyHDipSoOjOj2seKJswQCtdGYHUZ386iwPZ5cXlRFwt33ymWKVzLoRuYkVXpHmxh0/Xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724479656; c=relaxed/simple;
	bh=eHlrQulkBc/F/ibLxs2zEc0PFjIJ603YRZi4jUmM3Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA+lHg8uOIRfUD32yvna6vuLwyHWuBpETJUWNdMGrixuWjgNqRRoA5WopoeYazQl0M4l/W4xKBmyQkKK589em2uU0k/jjvoV1+TlKdgozy8DV7vpZFQZ/4hThKrw5ZD0m+3U/dkOk6iruNtafAYL0zpMHjR/MweoXHVWuOdI/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nzABCM9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nzABCM9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31AFC32781;
	Sat, 24 Aug 2024 06:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724479656;
	bh=eHlrQulkBc/F/ibLxs2zEc0PFjIJ603YRZi4jUmM3Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzABCM9hUHX3HqFG5NTwm0UAtGSNJ0q+k8hDPiMHEQ4fQFHV8I/YcdzsETXFdSvDG
	 930In0ExU2leElkuLh/knJLwHymwrl1S6rWn4tLXMTOa9IGUiYz4t+OwZHYkIW6oeD
	 u2Xa4cvoFkYDdlZ8bJSf7gua2A8ngGi+jObmf9TY=
Date: Sat, 24 Aug 2024 08:07:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Simon Horman <simon@horms.net>
Cc: kernel test robot <lkp@intel.com>, devel@driverdev.osuosl.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [staging:staging-testing 36/53]
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c:640:7: warning: variable 'iv16'
 set but not used
Message-ID: <2024082424-crescent-delta-7191@gregkh>
References: <202408232049.UJef268y-lkp@intel.com>
 <20240823171649.GZ2164@vergenet.net>
 <20240823172749.GA2164@vergenet.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823172749.GA2164@vergenet.net>

On Fri, Aug 23, 2024 at 06:27:49PM +0100, Simon Horman wrote:
> On Fri, Aug 23, 2024 at 06:16:49PM +0100, Simon Horman wrote:
> > On Fri, Aug 23, 2024 at 08:35:15PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
> > > head:   5315266844ea3b0b8b6be9842d5901e439fa838a
> > > commit: 5f1a6826ea4900f8540d5eeb29f97796860f2d08 [36/53] staging: rtl8192e: remove set but otherwise unused local variable iv32
> > > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240823/202408232049.UJef268y-lkp@intel.com/config)
> > > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232049.UJef268y-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202408232049.UJef268y-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/staging/rtl8192e/rtllib_crypt_tkip.c:640:7: warning: variable 'iv16' set but not used [-Wunused-but-set-variable]
> > >      640 |                 u16 iv16 = tkey->tx_iv16;
> > >          |                     ^
> > >    1 warning generated.
> > 
> > Sorry about this.
> > 
> > It seems that my patch, cited above, which removed a set but otherwise
> > unused variable results in iv16 being set but otherwise unused.
> > 
> > I'll prepare a follow-up patch to address this.
> 
> Patch is here:
> 
> - [PATCH] staging: rtl8192e: remove set but otherwise unused local variable iv16
>   https://lore.kernel.org/linux-staging/20240823-rtl8192e-iv16-v1-1-000702673065@kernel.org/T/#u

Now applied, thanks for the quick response!
