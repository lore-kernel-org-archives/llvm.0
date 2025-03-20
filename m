Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849101C6F55;
	Thu, 20 Mar 2025 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742449404; cv=none; b=XIAbI+Q1TlduhZWXw6eYRNTzweZzhnEVyuc59tDSrLiaz8NWun74m0l2PpjV1fm6ssDn9+M8Ncr5B1+jTNkD+saPg55KJoCkbEurCnsEzYnfqWWHbNsho3kkiOiQuBwl2NxuOfOkb2D/DzYzVEpFV3vKVL7o/tKYiN3ssiEMKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742449404; c=relaxed/simple;
	bh=qHCFtESSH+gkbtA8Q6yENB/ys9cpK53s6Vsi3+KGaDE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=psbYurHVdgv+ZlbyBKtbS+As8Z9eZiNNcnuLMQzZ9ezA6xhNZRnmFBRNJLwIboNInvj9CzFzAxDe3Lvmn1MN2xJT37QGNgGhaEZaWT17HEnET+HDIeq7ig7h0i4nBKiaZKsRKFdBRdrDB5pJA1fRxn8tGWtGV6bOQJSlSCR20as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GEPqQItx; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GEPqQItx"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52K5hD0n1917517
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 19 Mar 2025 22:43:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52K5hD0n1917517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1742449393;
	bh=mW0VY7G4Mj9xAgiCN/w/UmAjV16d507r/zUQczyqmvg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GEPqQItxyHZwo+vPy63upJzOjYxdYe3ETvNlL6Gb+8g2v5cNClqO1bZ3w0BFo+tOf
	 5f8LEu0nO0mJJeY8Tcig2pPkH9jYASvpU+btWv2oQKdCy2PTvAWzH3lfgtovllkjvk
	 y6YUnr/Un35aRxvabeT7Gm1E53XuhIRNSYsDKdA1xzUP6D0UjrfF59Jd1+AMBcS4KY
	 RL/YYPOv5Omwc4+BX45vjcm4o497u507FApkYb07HsRN5oZe2d2IPqHn+hCha6AeTP
	 kQfuy/C1ysJYmsjdPaPAlG4bEV0TFMqfGfEbsvqBGj3Bcdalx1oMMaH1mrw9tO1uPE
	 /OHyALgmMvrXg==
Message-ID: <0fc86279-296e-4d61-bf24-fa9cb2f10629@zytor.com>
Date: Wed, 19 Mar 2025 22:43:13 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xin Li <xin@zytor.com>
Subject: Re: [PATCH v3 1/3] x86/fred: Allow variable-sized event frame
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20250319071009.1390984-2-xin@zytor.com>
 <202503200325.iKcHqUsb-lkp@intel.com>
Content-Language: en-US
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <202503200325.iKcHqUsb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/2025 12:45 PM, kernel test robot wrote:
> Hi Xin,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 60c162a51180cb2b05d7505a565ab079bfa9cf12]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Li-Intel/x86-fred-Allow-variable-sized-event-frame/20250319-151307
> base:   60c162a51180cb2b05d7505a565ab079bfa9cf12
> patch link:    https://lore.kernel.org/r/20250319071009.1390984-2-xin%40zytor.com
> patch subject: [PATCH v3 1/3] x86/fred: Allow variable-sized event frame
> config: i386-buildonly-randconfig-003-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200325.iKcHqUsb-lkp@intel.com/config)
> compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200325.iKcHqUsb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503200325.iKcHqUsb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> init/init_task.c:68:17: error: use of undeclared identifier '__top_init_kernel_stack'
>        68 |         .thread_info    = INIT_THREAD_INFO(init_task),
>           |                           ^
>     arch/x86/include/asm/thread_info.h:76:36: note: expanded from macro 'INIT_THREAD_INFO'
>        76 |         .user_pt_regs   = (struct pt_regs *)__top_init_kernel_stack,    \
>           |                                             ^
>     1 error generated.
> 

Okay, I need to add:

extern unsigned long __top_init_kernel_stack[];

Unfortunately my configs don't expose the build issue.

Thanks!
       Xin




