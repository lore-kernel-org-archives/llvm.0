Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3DA255F5C;
	Mon, 12 May 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046876; cv=none; b=PThMfzN+ZWaloXl3yAkK0vY8NZzeF6hhOfBUHKN7fsQRn4oYlG8cAOyzR6zGMuAvBKUnztEG87et3d9kP77wg0EGBDm34/gIQbk/UpWiStIFd6FvrosNK7TU0qqLYdDYx1G+MuW/b1Ao6ATHd9U6zuoNaEBsYpYpiYkTvdgavT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046876; c=relaxed/simple;
	bh=M5Mfvcmq4GMBQIzqzwbH+isZe+LiRry4yjMeQ+ArusY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nwcnmBEuUJABHe+0A+VYvMzZU1FURsF+zbQpC5u355LfGz71O4eg0qfIntES/ZazQWksQZKwgBqadwyys4sPR0Vc+hxQphKSwnZBLLViP93jrfVAk4PvtXQXmL92Y04uOvQTVMyGnT9Wm+BikquEVtDyQs9yiyXkRa6OIIhNROU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9319092009C; Mon, 12 May 2025 12:47:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8EED792009B;
	Mon, 12 May 2025 11:47:45 +0100 (BST)
Date: Mon, 12 May 2025 11:47:45 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>, 
    Marco Crivellari <marco.crivellari@suse.com>, llvm@lists.linux.dev, 
    oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5904/8679] <instantiation>:7:11: error:
 expected an immediate
In-Reply-To: <aB0Lt7e4tnRK355u@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2505121141400.46553@angie.orcam.me.uk>
References: <202505071331.Z0N2eSkr-lkp@intel.com> <20250508164308.GC834338@ax162> <aB0Lt7e4tnRK355u@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 May 2025, Thomas Bogendoerfer wrote:

> > If it is not easy to work around, we can probably just leave it broken
> > and tell anybody who notices to upgrade their compiler.
> 
> I wrapped my head around it today, but no idea how to solve it...

#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < vvv
#error Please upgrade to version vvv to build this source
#endif

-- or suchlike, I suppose.  Someone just needs to fill `vvv' in.

  Maciej
