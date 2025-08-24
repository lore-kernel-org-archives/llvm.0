Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1EC2DC355;
	Sun, 24 Aug 2025 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756057442; cv=none; b=cABvCc28TxPFwxMWnRTdDvmVfB4VgrRsogzozAP5S24NQhuWCkkMaIXMPhsCkYFwUpgXtDeHkjU7uqcZjC1imM+ZkoDdH408YT3R3XBbarkJMUsSAb1SdGJSgiMYrQ5qzx0daVp9U1obV64pDP6WiFsWyINN4pta90nrsfGr6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756057442; c=relaxed/simple;
	bh=fKKBCDgUBePXVDOxgPRxedKP3baoXFYKKa0DZ/3j7xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf+/Q134o6qhlU0rQf4j+iWni2Kz7FsQYhBwwnFVJZLnwXUXShSGOxqLjYhj0ntZZiCGYxB13ZBCRJF4IZmaMC0DKhrRJJ+AVQiZ9pf5Okz4f6/hxl7S381JjmzgD8xUkchwJO9qhgnsC6qR6ji7vm1XbesMUy/CrA2xrbNF6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=HXTjeD8J; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="HXTjeD8J"
Received: from [100.79.64.24] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6E4F52015BC6;
	Sun, 24 Aug 2025 10:43:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6E4F52015BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756057438;
	bh=0GvJth3/NOI5jMxwpFSNuthJoMldO/z01iZn+Q/FeAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HXTjeD8Jzca7nx049vaSf8skLYlaYnd7mgZTy1S1ALenXUNAiKyScO+3+fwDuKb/4
	 qjaVQPJ3XDMfwbGE8FHdF4EbevhuNAXZhvE+EvTuLzGnN1bqYvZync70AaIv8U40E5
	 tH+ZRerHOoqgbStIWW/aFevperbtQvtE6kkOf1d0=
Message-ID: <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
Date: Sun, 24 Aug 2025 23:13:51 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Wei Liu <wei.liu@kernel.org>, Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
References: <202508240828.pVaUV45D-lkp@intel.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <202508240828.pVaUV45D-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/24/2025 12:02 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0f4c93f7eb861acab537dbe94441817a270537bf
> commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: hv: Introduce mshv_vtl driver
> config: i386-buildonly-randconfig-2003-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_vp_registers'
>>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_set_vp_registers'
>>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_partition_property'
>     3 errors generated.
> 

+Nathan

I can see a bunch of similar warnings previously reported, in different
functions, but could not find a fix for it, or if this
is a blocking error:

https://lore.kernel.org/all/?q=s%3A%22ran+out+of+registers+during+register+allocation%22

These all are reported on below 32 bit config, compiled with LLVM:
i386-buildonly-randconfig-*

Found previous comment from Nathan Chancellor, here, which seems to be
related to this error:
https://lore.kernel.org/all/20250507022649.GA1984217@ax162/

"""
This configuration has CONFIG_MATOM=y, which does not really work well
with clang for this reason and some others that have come up in the
past. Given it is likely that nobody will care enough to fix this on the
LLVM side (since it is 32-bit), we should probably just block using
MATOM with CC_IS_CLANG, which Arnd and I had talked about at the last
ClangBuiltLinux meeting.
"""

This gives me an impression that we can safely ignore these errors from 
kernel test bot.
Requesting Nathan to please correct me if I am wrong.

Regards,
Naman

