Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E61D54FE;
	Sun,  2 Mar 2025 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740949833; cv=none; b=Fp0eVgFLFjJgRSgUQx4QsGngCatfChWfG1Jd47nz4l3ypAKoFf7qzFys0gccKKhI714+OEL0IPCqUsldrazdLzYAtNHfdyWxGNzj67Er4Yuudb7QqpEGqkF/8IReISQwOJQ0e6QkcxvHFRDipnW7bWacL5oEt+zeI7XKlKrfMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740949833; c=relaxed/simple;
	bh=e/d4xxwsmbqDlnGZJi6Yg7yngx6s63RZmADLBMMH3DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYiUJ6bxatJYNGGiilOhpkXXgaRHWo7OXvhumOJ9FK1R8LOBLKN67Jmpb3wzDgJETtDIzMpzuWYIInxwmG30OYtQxQn3Zh9AB05XYweOxNeRW+bnZAoBBck41j1ADvuzy9J1HX0FDAXYEqI8hIlO2KNqr/mYpLZ6sz9xLDaY7Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFpp4OCB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFpp4OCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB802C4CED6;
	Sun,  2 Mar 2025 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740949833;
	bh=e/d4xxwsmbqDlnGZJi6Yg7yngx6s63RZmADLBMMH3DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFpp4OCBiyz1WmeliAhAo/CspDajXTGWn+kHPADV9ENf4EjHLQ9JURgPIlgMAm6Yr
	 OJVL74fcYpAWImeR6MengUiMHhkGlltyfgLme9wethzYbjPdI4O17n+9EKsMjgI2hV
	 Ec2wnxAysA6lO8bCzwga9wjg3v+aqY9MTpVn5A3TqW/e5y7V7rreWKfRNViHxqjia/
	 WR5tDb9eppwOk+fDsDgYaA5+itse9ar3XdVjoR7wL+sk7+zp6H8+Z3fNevLekYc12m
	 cWEQKT9p3K9ySKUTt+Fekp/ax39oXUPROEkcwT0Ua9aFRENLXsxF7SLHqU1JFFLEnz
	 Pgctw1YkeVx8w==
Date: Sun, 2 Mar 2025 14:10:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [linux-next:master 2357/7423] drivers/bluetooth/hci_vhci.o:
 warning: objtool: .text: unexpected end of section
Message-ID: <20250302211029.GA46461@ax162>
References: <202503011220.Y2e5vz4w-lkp@intel.com>
 <5jkf4f2bqmomecoxzzdyhdo2qg7dso2jihzwcox6zufnurrwtm@o5gqbsgmpldy>
 <dc1b62ed-8a86-4424-8a1d-bc20866fb4d9@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc1b62ed-8a86-4424-8a1d-bc20866fb4d9@stanley.mountain>

On Sun, Mar 02, 2025 at 03:35:01PM +0300, Dan Carpenter wrote:
> On Sat, Mar 01, 2025 at 11:15:46AM -0500, Ethan Carter Edwards wrote:
> > On 25/03/01 12:30PM, kernel test robot wrote:
> > > Hi Ethan,
> > > 
> > > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > > 
> > 
> > Thanks for the email, kernel test bot. I'm not sure my patch would be
> > the cause of this error, especially since my patch did not touch
> > bluetooth at all. Only the ham radio driver. 
> > 
> > I did find an email [0] from a year ago with the exact same error in
> > the same file.
> > 
> > Dan, what your thoughts?
> > 
> 
> Is this a Clang bug?
> 
> I can't imagine what's going on here.  I didn't try the reproducer, but I
> I downloaded the .config and did a clang19 build and it worked for me.  I
> wouldn't worry about it.

Yes, I think it is pretty obvious that the fingered change is not
responsible for the warning, it is present in mainline. It is more than
likely a Clang problem, I will do some investigating.

Cheers,
Nathan
