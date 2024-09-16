Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7517142E77;
	Mon, 16 Sep 2024 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476518; cv=none; b=qmikrUxeuy0fqivdqLccr9PkXCpVbgthjC3cdV+PD3T9DRb4IwblSSkne0AjgwHqXVW5LinzFh/2avJ6fuHK5JzX5K4acm1FyQhTnt3wR/zdmE79id+Ks2wqSujV8WCRUlB7eYXxQi1yXptCat+PG3FZIoVoMxGPSB9zgP9fdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476518; c=relaxed/simple;
	bh=wMEw+O32kPOdB78c5Nosgma+FyxCKzmalJs08g+2P6k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=PdYtxBvyWX0Nl6m9fgw4K5MuaS2Lb5pO6qniysYuB0yzCn6xbAQsCYIPJw1x/wCPzYNDPMB2/KflkbwFfaZbRMbKdLOLjF1OkodE5RaDniIcNYbsG/HLDdH6KAyyKO2qj+83DXGncidpePt3X6Rg36ocL/dyqcVek1aV65Ez0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USOTt8lU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USOTt8lU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E99C4CECC;
	Mon, 16 Sep 2024 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726476518;
	bh=wMEw+O32kPOdB78c5Nosgma+FyxCKzmalJs08g+2P6k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=USOTt8lUX27HLEXxrYmbGOmiP8iqbleNMBLZuxTQo9fRhtUethCdjUtScIFQPnFle
	 9euuarKiL4tE1ecRTn4A4NcyndFNkad4mODto3TGJ6B/tJEYW9utnOVlRMc+6YbZks
	 AWdSnZdDvTB3s+QmTEgFjofJYj17qGKKUlLHK3XF5kmLQiYOiunTM9LUGiOinEOuXY
	 IL8/NF0a34Mwc+AAvYSA1dHS0VKZzFAGgb5DtCAUOWHHGekURykmSX6Lr9dZ2uNXun
	 JvDkoNKXuYqA4crqQp6zm7ia0zXz1sUeyZyocTXqkN4Da4IJ+Ge+td7xvGmfldoMgy
	 WTKBn4qBHAW5A==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,  llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,  Jeff Johnson <jjohnson@kernel.org>,
  ath12k@lists.infradead.org,  Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: [ath:ath12k-mlo 34/63]
 drivers/net/wireless/ath/ath12k/mac.c:4289:8: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is true
References: <202409151616.hnCxh90B-lkp@intel.com>
Date: Mon, 16 Sep 2024 11:48:34 +0300
In-Reply-To: <202409151616.hnCxh90B-lkp@intel.com> (kernel test robot's
	message of "Sun, 15 Sep 2024 16:57:47 +0800")
Message-ID: <87ikuwdlwd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
> head:   8f61af03fddc0a30bdf49e06a13eafff3cec91b0
> commit: ec3755e39b7ae8f7ed9853e6169fa5e307b9fb90 [34/63] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
> config: x86_64-allyesconfig
> (https://download.01.org/0day-ci/archive/20240915/202409151616.hnCxh90B-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20240915/202409151616.hnCxh90B-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151616.hnCxh90B-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath12k/mac.c:4289:8: warning: variable
>> 'ret' is used uninitialized whenever 'if' condition is true
>> [-Wsometimes-uninitialized]

I fixed this now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
