Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34A189B91;
	Wed, 28 Aug 2024 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724856700; cv=none; b=WB1aaEJh4lkAAvgLJQJ/xbSdM8Iam9rVHMYeAsEB4MU4BIJ/M8lHaMF6tdetE17vdFTtyuYMvSS3HyX67cWFFUVLMsNpVnW+jNC29Pb88ZqBpesEMg0q0zcjlj6yCBclh665sEkPUPmKvFMzWeUXzHcWSX9exXQWoJCZIBnoQmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724856700; c=relaxed/simple;
	bh=4FHpHzVbMFWT7DROllR6n7Aj0djCGiLqWO/WUuaZc9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXBHNmRt/omRi6G/J91a6E5IQN85IiGd9nEQJEQAICDfbmsv7v4vlr4QNjqHWecSqzbJF6jxldplPcv3ByRa3NgoVtAA/GvkqWlKxqYo1DPeVBznRJY2/Fh2saXDPs/BaQlK4RMC/BdEk2RuB+8+lm0BsRmIuDYom7i5EyeIjGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+OqbC2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+OqbC2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C25DC51ED5;
	Wed, 28 Aug 2024 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724856699;
	bh=4FHpHzVbMFWT7DROllR6n7Aj0djCGiLqWO/WUuaZc9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T+OqbC2/APdPI2yNcDWSPkdPRXwTLoX9/Xaoh141sawzc8AU53TIAI6NDPOV5+bBV
	 zm6csvSjnRD/jU0W6sQRoFEdTkQaLSCrawWvJe59HRv4wKlICvmYSdNZ/u4jCQQmlg
	 YseNTjmnXxyPjg0s5UfIDTLQI6WbUqHmheyGn7yjRvFs4QUVmETslMIVE/DNS4wK/U
	 raC5psF+XetvYw6yGlddXTRNDyxqaYpFRB/Tu5Zy0VQYWFz8lWSaK8lJEk4ZgHLjWX
	 waUV3/i3i0HEBI1dKeyUDIpgNGzunMYNPbSHg3DVpu9qqCqn4whgImLJaAQ0tEOjCV
	 7JK9m7/D6COFg==
Message-ID: <7b28ccf9-63fe-4e32-8484-24b55432c2b6@kernel.org>
Date: Wed, 28 Aug 2024 16:51:33 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4179/4667]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: error: call to undeclared
 function 'pci_prepare_ats'; ISO C99 and later do not support implicit
 function declarations
To: kernel test robot <lkp@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Joerg Roedel <jroedel@suse.de>, Kevin Tian <kevin.tian@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
References: <202408150626.4kndgpL3-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <202408150626.4kndgpL3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2024 12:09 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
> commit: 2665d975db35f124d47e9584d448a3fb4d54f225 [4179/4667] iommu: Allow ATS to work on VFs when the PF uses IDENTITY
> config: arm64-randconfig-003-20240815 (https://download.01.org/0day-ci/archive/20240815/202408150626.4kndgpL3-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150626.4kndgpL3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408150626.4kndgpL3-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:15:
>    In file included from include/linux/crash_dump.h:5:
>    In file included from include/linux/kexec.h:18:
>    In file included from include/linux/vmcore_info.h:6:
>    In file included from include/linux/elfcore.h:11:
>    In file included from include/linux/ptrace.h:10:
>    In file included from include/linux/pid_namespace.h:7:
>    In file included from include/linux/mm.h:2228:
>    include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: error: call to undeclared function 'pci_prepare_ats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     3301 |                 pci_prepare_ats(to_pci_dev(dev), stu);
>          |                 ^
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: note: did you mean 'pci_enable_ats'?
>    include/linux/pci-ats.h:18:19: note: 'pci_enable_ats' declared here
>       18 | static inline int pci_enable_ats(struct pci_dev *d, int ps)
>          |                   ^
>    1 warning and 1 error generated.
> 
> 
> vim +/pci_prepare_ats +3301 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

Hi, this is still an issue on next-20240826

Konrad
