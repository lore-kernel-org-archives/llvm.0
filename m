Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E2241122;
	Wed,  2 Jul 2025 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492704; cv=none; b=HzggKvQn5rmuUoQyL73tgQZsW74S3Bh1tfdHRWpyh1dzLeO5Q8q2Kaa3ey+8z5qG9Us/c7wp5XiUr8x73KQPuyMM+tNqclvT60nYVAwYHaesnnZPGtnckw86hBuVXNnJD1OhFLTE3C3L2+N5u0e9ayut2eC5iyNME0VtvrIhKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492704; c=relaxed/simple;
	bh=iudsF8nVmG8oGl0zmzHmvta4a8W7ptqFfyRa1AggBd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4/ylINxQggtZmYDsZnwlQIDzgPSaRiCbud2lmTNr4WaHSWw0mceLc7oRk0Uvsp4uv10Y2zbPUQ78xr5/M3BmyJMcr6AcFNHRbNcaZ6yqa+kGIaPRjrf4TmBFGOv/zlu2k+iDK/znWN8RPTkaZSjmJjgd4LiofOnVc6Jd9Jc4m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIiuRoyO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIiuRoyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A85C4CEE7;
	Wed,  2 Jul 2025 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751492703;
	bh=iudsF8nVmG8oGl0zmzHmvta4a8W7ptqFfyRa1AggBd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIiuRoyOVtzYRB1q8bzyjSzhi+j0Vr307E5wjrquARxxfTFXy3p9OiVVj3WqBZK/p
	 QukRfwUwqFf8aPZIZUcHcMXDH7Hm88u1x3YdmPvqEiceLvQcOglU7u/PJnm3dQiD5g
	 0UVRdgkisLngPGl7dXxbmu4teLqnmkE/DGLi2Nl17DN+ErCZ1ju/thO6eQB0f9oprj
	 46sT/KacLeOZjSFkCzajY4n76XxtVWZSCujgbM7NCx1GEVEulLHw3mRir8DNuRKdXQ
	 KT8eWNXaToEzJu4nRmk6qUbeSEgjOjXQ6SVBNZMM6U1d54zfX4OzQmfH8tN+SQDQVD
	 rkx+GvWN4FLcg==
Date: Wed, 2 Jul 2025 14:44:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [linux-next:master 3022/4739] drivers/gpu/drm/msm/msm.o:
 warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section
 .text.msm_dp_ctrl_on_stream
Message-ID: <20250702214459.GC2103156@ax162>
References: <202506251051.7rmus46j-lkp@intel.com>
 <20250702213716.GA2103156@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702213716.GA2103156@ax162>

+ Dmitry's @kernel.org address, should these reports use .mailmap from
mainline to ensure they get sent to up to date addresses?

On Wed, Jul 02, 2025 at 02:37:16PM -0700, Nathan Chancellor wrote:
> On Wed, Jun 25, 2025 at 10:16:55AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   2ae2aaafb21454f4781c30734959cf223ab486ef
> > commit: 8583a655f2c2bb442e2a2668680f419aa4c511d1 [3022/4739] drm/msm/dp: move/inline ctrl register functions
> > config: x86_64-buildonly-randconfig-005-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/config)
> > compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506251051.7rmus46j-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> This appears to be a case similar to [1] and [2], where clang has been
> able to figure out that there will be a divide by zero in the else
> branch of msm_dp_ctrl_config_msa(). Should pixel_div be adjusted to 1 or
> should the divide by zero be avoided by returning early? I believe Bill
> is still looking into trying to make this less distructive in LLVM but
> it should still probably be fixed for LLVM 20, which is already
> released.
> 
> [1]: https://lore.kernel.org/CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com/
> [2]: https://lore.kernel.org/20250609213505.GA1634981@ax162/
> 
> Cheers,
> Nathan
> 
