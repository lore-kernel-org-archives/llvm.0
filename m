Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518616088F;
	Fri, 25 Oct 2024 01:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729819270; cv=none; b=dvEkFf+l3RMNxB5DFbFmuDwtSDq+sFWYKrNcRkLu82kV+XqfrxyN10jCZ6Cn4yiHJq09onv6bk4gAHcTTo4W9Q0iwxn8NHF4+xAQy5A3N2Z30FB2Ke20p0sC3S39/XZgNH5QKrQyCpUywhoosYRlQ2YyRIqkSEUqsHvWRYuyytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729819270; c=relaxed/simple;
	bh=jVbNwVDXO0MbO9oMFqDUmXZFSDufQD1TXRTZ+jrvXfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVLsn3VEYCeSbA8fa+zdVHe/X+XeHrkV2PSlh5luTzFY/zZNuf5PVuWlixnIEWhXB2q/6qq7bAzLLOx/BPviTrmNQhkvAMkU772G/wxjJB+2C3ALXQW+LsBEDHG5UU/qwmhbXO50bRgfljOk/LKSfa4O9Vs81YC7XEEwte30Wt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7TR/Xtb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7TR/Xtb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17276C4CEC7;
	Fri, 25 Oct 2024 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729819270;
	bh=jVbNwVDXO0MbO9oMFqDUmXZFSDufQD1TXRTZ+jrvXfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7TR/XtbRM9FQxPi8ULbsPC7wGQWo3iDi4xbe78K3ToqB0Yv7uokrLigldlmaw30r
	 SQOt9tIOEfHh7tVMn4eMvtr3FUPL7AP4AalzHUrV8tRdNwfgYPf8k89yb5Vy2ZaXco
	 AsCq61MWN2P5wgiba/1pbivRJWoREcIzV9l9DiK+rHrK3sfMjFkY4OupRSHJBrEVe4
	 1EK8MsZVBGwKp0wSSDIvh31IJPmJgYL1hpRVelj72wpVkkSw05WFWSSmE2dps/wB9S
	 qT9D75Nxo0hSHhBZtaLZ6TWyffYWwNh5M1x8OpsrRXJY66h32pZXG00f4DjP1P+0HA
	 z1oc3i1tWTKfw==
Date: Thu, 24 Oct 2024 18:21:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [uml:next 25/45] InstrProfilingUtil.c:(.text.lprofAtExit+0x1):
 undefined reference to `atexit'
Message-ID: <20241025012108.GB740745@thelio-3990X>
References: <202410242238.SXhs2kQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410242238.SXhs2kQ4-lkp@intel.com>

On Thu, Oct 24, 2024 at 11:00:22PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
> head:   d61ac4a7496a7981947b8b894d40b0e35c316fa5
> commit: 89350defd1f0eb5a58a7e1155d9e322080f0bf15 [25/45] um: Fix passing '-n' to linker for stub_exe
> config: um-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242238.SXhs2kQ4-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242238.SXhs2kQ4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410242238.SXhs2kQ4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
>    /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `__llvm_profile_set_file_object':
>    InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x60): undefined reference to `free'

Without looking too hard, it seems like this is probably coming from the
flags in GCOV_OPT in arch/um/Makefile-skas, so maybe they needs to be
filtered from the stub_exe command, since it is a standalone binary.

Cheers,
Nathan
