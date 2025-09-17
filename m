Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2DE226D0F;
	Wed, 17 Sep 2025 22:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758147141; cv=none; b=k1YiudG2cdaeBbXq+PcglJ1JNZovFwMoJ3XD6j6TZiCYL4WR7iExWoJSkiteXuHUrPuBWo996JPrs/0DPvHQ7O33EL56FqQUdRggixnw9AUUdIOW64oguqq+aTwiVJytBxbz/GqXfTAMTLcl5VqadkBxZVhXuThW090mmNt3aBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758147141; c=relaxed/simple;
	bh=Naj1kSJiyrj7asx9r5GjSntcBHk8TTQNoxoL3rusSzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd857agbRX/h3kfyBOm3xm6AWhf4v2vkLUrfWPS404RBQLnj0UEhfnl8vt010zwQsc2Qs+SWAxGzta0oR6K6ulki6NHM8m5CINn/FnCaoF296DrJwcUmE2rPFZzmstL8ieCoJ1g6hOnVMYPEhyfc41hmz+5fbp/z2NWd3CHz6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ1Axqd1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ1Axqd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88CBC4CEE7;
	Wed, 17 Sep 2025 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758147141;
	bh=Naj1kSJiyrj7asx9r5GjSntcBHk8TTQNoxoL3rusSzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQ1Axqd1S2UIn9uYamQuSw/vys2cYcDeYCWgsJiqqFbUVP8LFyQGmSSmPfAIzRyt8
	 xfHTytvtPU46eZ2kk4D9foSje1LDk5hg6gyHFdHv0OfTntwZbP1HOmEasBqM1gLNTM
	 SlbaSSVv5F2mwzlD9J8AAdI89c+oACjji8xDJImX2RmyieDAWMNGdcr9yFTgpE82Ui
	 /p+vinah12V8O97CDHt0YcvAdkMRGPv+ECnQwkHwtSJ2U0eOtHm2sZzsUVUxQ2+N1+
	 tu9zUfmIOEnqKA972XJLhWSjRSv9P6ulLu2tlBeckPjn71iHlKwnLNhGQmc+QJ25u1
	 jyZRvkzer1A5A==
Date: Wed, 17 Sep 2025 15:12:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Oliver Sang <oliver.sang@intel.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20250917221217.GA650176@ax162>
References: <202508271856.ixwxgh3g-lkp@intel.com>
 <20250902124856.GE186519@nvidia.com>
 <aMj38M8HeDSQHQPf@xsang-OptiPlex-9020>
 <20250916141256.GF1086830@nvidia.com>
 <20250917022043.GB3106929@ax162>
 <20250917112214.GY1086830@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917112214.GY1086830@nvidia.com>

On Wed, Sep 17, 2025 at 08:22:14AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 16, 2025 at 07:20:43PM -0700, Nathan Chancellor wrote:
> > as the bad commit, which certainly makes sense, as C23 made this GCC
> > extension as part of the standard so clang needed to account for that.
> > As far as I can tell, GCC did the same thing in
> > 
> >   https://gcc.gnu.org/cgit/gcc/commit/?id=3b3083a598ca3f4b6203284e01ed39ab6ff0844f
> > 
> >   "The standard feature gives all the values of such an enum the enumerated
> >   type (while keeping type int if that can represent all values of the
> >   enumeration), where previously GCC only gave those values outside the range
> >   of int the enumerated type... this patch makes the change to types of
> >   enumerators unconditionally (if that causes problems in practice we could
> >   always make it conditional on C2x mode instead)."
> 
> That makes sense, I did not know it had changed like that
> 
> But still, I'd expect the compiler to retain the original behavior
> unless std23/gnu23 is specified given that it does change codegen and
> causes errors.
> 
> Though that is even more perplexing if gcc has been working this way
> since 13 why does it avoid the udiv..

Looking at the preprocessed source and making some educated guesses, I
am guessing with inlining and constant folding, GCC turn division into
multiplication by the reciprocal. Clang implements some of these
optimizations but not all, if I remember correctly.

Cheers,
Nathan
