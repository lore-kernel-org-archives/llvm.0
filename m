Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80218594C;
	Fri, 23 Aug 2024 17:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.110.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724434073; cv=none; b=INXquDL61cwk7Z+Qr1cNuWRmyIjEvZ4Cdp3RPpFxvLUAlgA2P4jzsTryQrwmlKNF/8c3S3iCQC1zvazpJX/zpxDwwQAp4CX9B0HcJ6XX8GL+MaEwB2aKvnjC75dXmdj/tR932aRfjKNqc8+zz6vl5lHe1OmbQhh4dwxEHwdHFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724434073; c=relaxed/simple;
	bh=um6S+Duvhw7LKg6INQDJ8MfmmB69sgx7ccxHFnKlY90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oi+nyBbGdl/2VfxnnzR067b/JgDThGrmJ/J61M73eiVyEW/iIDWHGaVimRNO+VCkBXwJC0Ss2Pew3Ae+uBJf1V96MQfHiO7MmwdguB2dnktIqOHvkyottvCFEl7CYwdTIWXwde7QMeuHYsyA4GEhy9pGaFyjX/mVA0iIapYKQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horms.net; spf=pass smtp.mailfrom=vergenet.net; arc=none smtp.client-ip=206.189.110.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horms.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vergenet.net
Received: from madeliefje.horms.nl (haye-23-b2-v4wan-167567-cust3213.vm28.cable.virginm.net [82.40.60.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by zeeaster.vergenet.net (Postfix) with ESMTPSA id D2ED12024E;
	Fri, 23 Aug 2024 17:27:49 +0000 (UTC)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
	id 904912AC6; Fri, 23 Aug 2024 18:27:49 +0100 (BST)
Date: Fri, 23 Aug 2024 18:27:49 +0100
From: Simon Horman <simon@horms.net>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [staging:staging-testing 36/53]
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c:640:7: warning: variable 'iv16'
 set but not used
Message-ID: <20240823172749.GA2164@vergenet.net>
References: <202408232049.UJef268y-lkp@intel.com>
 <20240823171649.GZ2164@vergenet.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823171649.GZ2164@vergenet.net>
X-Virus-Scanned: clamav-milter 0.103.10 at zeeaster
X-Virus-Status: Clean

On Fri, Aug 23, 2024 at 06:16:49PM +0100, Simon Horman wrote:
> On Fri, Aug 23, 2024 at 08:35:15PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
> > head:   5315266844ea3b0b8b6be9842d5901e439fa838a
> > commit: 5f1a6826ea4900f8540d5eeb29f97796860f2d08 [36/53] staging: rtl8192e: remove set but otherwise unused local variable iv32
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240823/202408232049.UJef268y-lkp@intel.com/config)
> > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232049.UJef268y-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408232049.UJef268y-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/staging/rtl8192e/rtllib_crypt_tkip.c:640:7: warning: variable 'iv16' set but not used [-Wunused-but-set-variable]
> >      640 |                 u16 iv16 = tkey->tx_iv16;
> >          |                     ^
> >    1 warning generated.
> 
> Sorry about this.
> 
> It seems that my patch, cited above, which removed a set but otherwise
> unused variable results in iv16 being set but otherwise unused.
> 
> I'll prepare a follow-up patch to address this.

Patch is here:

- [PATCH] staging: rtl8192e: remove set but otherwise unused local variable iv16
  https://lore.kernel.org/linux-staging/20240823-rtl8192e-iv16-v1-1-000702673065@kernel.org/T/#u
