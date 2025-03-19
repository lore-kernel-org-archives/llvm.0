Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FC79C4;
	Wed, 19 Mar 2025 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742343092; cv=none; b=Flgm6HIvt11Pxd9WAMPWTR71B+iOStAMN3gcRInF8c6s1lk3H39IfzUj4UtGz6lIDC4Fd5DOzHxBdVixicqeXrx741rdncLPcwjKZI1c2hGTlpsUp4+3F69+nDbER+fdn3P8vc10ivXX0mMao9ZIExXwzhV7X57w9zAk8yu6Lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742343092; c=relaxed/simple;
	bh=oQzLwjaqsUTldnGHT26MdiHmjaJfE6ks1na9DLZfqTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gB0Mtd0c0XnnLddaUSVsfHtRvXcy13qXbXwfpdlgnGimiFNmQPp8m0S8f7JxIi046Xsrh7y3+53+KdsrDyp0IXATeIA5yt2ITaMlzkPRqCf4B+mjZsOvme8zaOFS64VgG4Y74o7r7NlBEgI56JwTONL9gRo6iPj4LoBhSmFZB70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG7GOoMh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG7GOoMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1046AC4CEDD;
	Wed, 19 Mar 2025 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742343092;
	bh=oQzLwjaqsUTldnGHT26MdiHmjaJfE6ks1na9DLZfqTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RG7GOoMhQyKfAnaC0yViG6wHxlGd9WNyqp/6FyP3ouMsvNfV9zfeJF2mKAjOq1JNk
	 1W687QgtOlCEYjpfk4iyo70kweLxOl9Q+ZvcbZsPP1qb7hn3opaRaMXRrQGfyy3YDd
	 muLRNcHWQVOgHwOF+5kdS9cixV8uxHzYmO24qAws8893U3OcOsOtkPPWTENESOk6fd
	 4o3wDpPtST1rLc+utMFjYPiv4Ft6LdCcetigZxo85i63T4Dp12iqnKHMTy4+QXbqah
	 BnDRlfz5j+TnYhNklwXqemMfrdlTsJnQsQDo2QdAIPuuaO2JFie2f5OojX2UWeM6Uc
	 H2VEBJzzFZvTg==
Date: Wed, 19 Mar 2025 00:11:30 +0000
From: Wei Liu <wei.liu@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: Re: [linux-next:master 11611/12094]
 drivers/hv/mshv_root_main.c:597:8: warning: variable 'schednm' set but not
 used
Message-ID: <Z9oLsgJyAfJFkjmw@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <202503190403.qLewkFbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503190403.qLewkFbn-lkp@intel.com>

On Wed, Mar 19, 2025 at 04:49:51AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c4d4884b67802c41fd67399747165d65c770621a
> commit: 3ee7bc04bd48f70b6a37ad7d63b7d5202569ec68 [11611/12094] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250319/202503190403.qLewkFbn-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190403.qLewkFbn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503190403.qLewkFbn-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/hv/mshv_root_main.c:597:8: warning: variable 'schednm' set but not used [-Wunused-but-set-variable]
>      597 |         char *schednm;
>          |               ^
>    1 warning generated.
> 
> 
> vim +/schednm +597 drivers/hv/mshv_root_main.c
> 
>    590	
>    591	static_assert(sizeof(struct hv_message) <= MSHV_RUN_VP_BUF_SZ,
>    592		      "sizeof(struct hv_message) must not exceed MSHV_RUN_VP_BUF_SZ");
>    593	
>    594	static long mshv_vp_ioctl_run_vp(struct mshv_vp *vp, void __user *ret_msg)
>    595	{
>    596		long rc;
>  > 597		char *schednm;
>    598	
>    599		schednm = hv_scheduler_type == HV_SCHEDULER_TYPE_ROOT ? "root" : "hv";

This can be removed. In the not yet posted code we have a trace function
which uses this variable. We can add this back when we add trace support
to the driver.

Wei.
