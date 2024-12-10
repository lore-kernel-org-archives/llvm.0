Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9480E21420C;
	Tue, 10 Dec 2024 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733856442; cv=none; b=u+GJfJPTttCGKma+K+cDnvIYsGbYVeLpGwlVIH7E1qUeK5kG96Mx9wWjxbrpGZFRfRe2+6ZlkQBdG0zqwAH/0xG6x3t0InCo0DD/5KY27meovclBGvuTi/Vnz7eJNmrwQor/FGdKTUUkZ3Q0IO8x2ck+s7NaxPqFawomYMSVjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733856442; c=relaxed/simple;
	bh=y8uKWPvlyJNbRagu/YscB/1CDFK+0rKVSfUZVfmYDKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=am8ZFwnZztCvROmOhp0VMQaP0IRcrWjha21+PuwuCwCgCmDckZxRBMIfEG81BM7DFPn/XWdcTjIO7v8eJoX3wXUlB5Wu/dd43m8wEMdTH2ZpmrtWXxqKKMxogSM4C0VM/cD5GGt5VZ1ACT8QhQnYybcCebNKq4/xI6oMzTe9vME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BU+l7QRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BU+l7QRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EC2C4CED6;
	Tue, 10 Dec 2024 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733856442;
	bh=y8uKWPvlyJNbRagu/YscB/1CDFK+0rKVSfUZVfmYDKk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BU+l7QRXUYvJ9aqWAUO+iB1N9VA1mkpSZry7QOObnFw8cWOHCvFXMt/hwCWdGWQ/J
	 bI6ujpF3SFCmhl885WjhwXGl1LQpTskXla0WOGJeuW2Fgi3icqfRBowP4pT3VktRB9
	 b577OI6jx2uyjAueszsEYVean0bWcqnOGt7/tBwzf9F+yFPbgopinGmZel+ArssO0I
	 stNRVsOPJAztlIgeSXnv4uwg1mnUiAIckCd8ZqkCQVGmVkJjj7z26rh27guUmaBon3
	 KmfyUuvNdlEgpJdrsBwaiSEW4Y31+Ua2iQ+7gnIZ0xkM3A7kHnRDduVmQyTKQ+KX/9
	 xqnIPUe4WwRKw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1D3FBCE0E79; Tue, 10 Dec 2024 10:47:22 -0800 (PST)
Date: Tue, 10 Dec 2024 10:47:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 47/49] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <41482ec9-5048-46ea-9c8b-9d33a05ea2a6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412041204.ys3dSglL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412041204.ys3dSglL-lkp@intel.com>

On Wed, Dec 04, 2024 at 12:04:15PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   48ca997e8632db65609dcc6a715207a1b6dded57
> commit: 13e3224fa73ec6c7dfeda04b2741c95787196588 [47/49] rcutorture: Include grace-period sequence numbers in failure/close-call
> config: arm-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412041204.ys3dSglL-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!

This commit has EXPORT_SYMBOL_GPL() for both the Tree and Tiny definitions
of both of these functions.  What am I missing here?

							Thanx, Paul
