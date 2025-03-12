Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E5E1EB1A9;
	Wed, 12 Mar 2025 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741791466; cv=none; b=Au4/5eT19vHiK+Y5+4XnKq5BIz/WsxlyXfv2ZU36ymuL+nBN1HW4LL/N+2Xo4+AZuLisPvMJGA4ohC1EUtgK8oMHYTn8sp3L5YPmzqNHPWG8qOam0V2Q8B9lum+BLMaNhFX4NGZH/NShbhakV/6UjgAMcISWUCmvZSLa/wCpqwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741791466; c=relaxed/simple;
	bh=UNXrQnjMB0OStNMkZ3hyJ7LHA9XnhRVkB2DHEQ50UmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=md5l7VZ/aKOH6OnD9+Qyw83o+S1c7Kq8Hyowvruu1485QpUt9yELSo0t1kZodP4n7KRLU5AjLx4qQk3yfJlcvixbItmPRRLy4vg/6gfu4bLZyN5Cz11Obih+6I7fs76N5IVX/krug6zorfP3AVe0JfhgfHmglOT0BIWD9iXJiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61FAA1515;
	Wed, 12 Mar 2025 07:57:54 -0700 (PDT)
Received: from [10.118.111.35] (G9L3377F54.austin.arm.com [10.118.111.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84CAD3F5A1;
	Wed, 12 Mar 2025 07:57:43 -0700 (PDT)
Message-ID: <4e0baa1f-99c4-4345-800d-b0b8964c70b0@arm.com>
Date: Wed, 12 Mar 2025 09:57:43 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9090/10334] ld.lld: error: undefined symbol:
 tpm_crb_ffa_init
To: Jarkko Sakkinen <jarkko@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202503120916.TnY8Xobl-lkp@intel.com>
 <Z9EhqAxJjbsUiuC_@kernel.org>
Content-Language: en-US
From: Stuart Yoder <stuart.yoder@arm.com>
In-Reply-To: <Z9EhqAxJjbsUiuC_@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/12/25 12:54 AM, Jarkko Sakkinen wrote:
> On Wed, Mar 12, 2025 at 09:51:04AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   eea255893718268e1ab852fb52f70c613d109b99
>> commit: 9b2015ee9b5bba20097ea1e1f4188067624f4fa3 [9090/10334] tpm_crb: add support for the Arm FF-A start method
>> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/config)
>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503120916.TnY8Xobl-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: tpm_crb_ffa_init
>>     >>> referenced by tpm_crb.c
>>     >>>               drivers/char/tpm/tpm_crb.o:(crb_acpi_add) in archive vmlinux.a
>> --
>>>> ld.lld: error: undefined symbol: tpm_crb_ffa_start
>>     >>> referenced by tpm_crb.c
>>     >>>               drivers/char/tpm/tpm_crb.o:(__crb_request_locality) in archive vmlinux.a
>>     >>> referenced by tpm_crb.c
>>     >>>               drivers/char/tpm/tpm_crb.o:(__crb_relinquish_locality) in archive vmlinux.a
>>     >>> referenced by tpm_crb.c
>>     >>>               drivers/char/tpm/tpm_crb.o:(crb_send) in archive vmlinux.a
>>     >>> referenced 1 more times
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 
> Stuart, I did not go through this but this does not look correct even with
> a quick peak:
> 
> config TCG_ARM_CRB_FFA
>         ~~~~~~~~~~~~~~~
>         TCG_FTPM_FFA (and Kconfig put before TCG_FTPM_TEE)
> 
> 
>          tristate "TPM CRB over Arm FF-A Transport"
>          depends on ARM_FFA_TRANSPORT
>          default y if (TCG_CRB && ARM_FFA_TRANSPORT)
>                                   ~~~~~~~~~~~~~~~~~
> 				 redundant given "depends on"
> 
>          help
>            If the Arm FF-A transport is used to access the TPM say Yes.
>            To compile this driver as a module, choose M here; the module
>            will be called tpm_crb_ffa.
> 
> So I'll drop the whole series from my tree for the moment and you'll
> have to respin.

Will do.  The intent was that if both TCG_CRB and ARM_FFA_TRANSPORT were
enabled that TCG_ARM_CRB_FFA would default to on.  But, something is
wrong here that needs to be fixed and I will respin.

Thanks,
Stuart
