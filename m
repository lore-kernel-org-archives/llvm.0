Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B769267B7A;
	Thu, 13 Mar 2025 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741878546; cv=none; b=bEQ0Mq3JxrVULV4s50LRNFq6gKNQvo8R/B2cY4LxOHoG6NqbhljdW4zOFZlHSkjTvm0BP9XpLR2lQfkAq2ugsR6bYCO7DwZfEOIGN87WgMd53mAZpdgb23Ez2Kfi/NBnDu0D5GwKr8Nkk9aRMYtqaeQuwO2xM1kfTHrZlGKS5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741878546; c=relaxed/simple;
	bh=Ig3dfZmX2MT2UdOxHRKve0P5e70PgmCJ5XghGbrSrU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGUgKuU6dWdNM1gQd8iuxQBAEWN4qCFjA4aghopMghrQq0kYr9XzcAArvHEnRMb/0mYztLa7NRPJO8pT/n0RaQRveDT2HXUjlIVuOQPiMEjoh7b1SBDlrzMhnuVfHIh68HUR8uTTL9/gIxMqtIsgc0S5xIAk81P0Qg77AyspvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZpJKWAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZpJKWAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC991C4CEDD;
	Thu, 13 Mar 2025 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741878545;
	bh=Ig3dfZmX2MT2UdOxHRKve0P5e70PgmCJ5XghGbrSrU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZpJKWAE97YXwEIMPtGpy8OW5niJNQDgMV73uasrGCIG1K7P2e6PeSHgZURMSFi0G
	 dlRStVdeIOLVj69WtPFAaZ50jMWb2XCR3dY5+aCxEOcP6cL5X9XVN0wwp8R5191dT9
	 doobm3w99PeUCPzjhGseQZ0sARC4FPxjZvlflJFso2EeUWcQiRfZfggQhA7P0S4Ctv
	 FbCxX+hUGsKCbCPmiNjo0/Du2638qicdP0uSMAX18FMHhgE61xtJiXrnU3HxsuERHQ
	 Y5hRRpQe9+wMd9mjneXsEOh+go61zIl5crm1AiHaoFEtx0V7VtpEvn8UqkTSl0oVJs
	 83190A98XVRbQ==
Date: Thu, 13 Mar 2025 16:09:02 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V8 2/6] perf: attach/detach PMU specific data
Message-ID: <20250313150902.GA2418865@ax162>
References: <20250312182525.4078433-2-kan.liang@linux.intel.com>
 <202503130756.2j1ZuGT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503130756.2j1ZuGT4-lkp@intel.com>

Hi Intel folks,

On Thu, Mar 13, 2025 at 07:46:26AM +0800, kernel test robot wrote:
...
> url:    https://github.com/intel-lab-lkp/linux/commits/kan-liang-linux-intel-com/perf-attach-detach-PMU-specific-data/20250313-022851
> base:   tip/perf/core
> patch link:    https://lore.kernel.org/r/20250312182525.4078433-2-kan.liang%40linux.intel.com
> patch subject: [PATCH V8 2/6] perf: attach/detach PMU specific data
> config: csky-randconfig-002-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130756.2j1ZuGT4-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130756.2j1ZuGT4-lkp@intel.com/reproduce)

I am noticing a number of recent reports that are being sent to our
mailing list (llvm@lists.linux.dev) when the compiler is not clang, is
something wrong with your filtering? Here are a number of examples:

https://lore.kernel.org/202503130708.AmtUDVfq-lkp@intel.com/
https://lore.kernel.org/202503131646.3EOj6ycs-lkp@intel.com/
https://lore.kernel.org/202503131715.Fb6CfjhT-lkp@intel.com/
https://lore.kernel.org/202503132205.Ajz52k8I-lkp@intel.com/
https://lore.kernel.org/202503132205.Vf8imlWS-lkp@intel.com/
https://lore.kernel.org/202503132256.f6p359iT-lkp@intel.com/

Cheers,
Nathan
