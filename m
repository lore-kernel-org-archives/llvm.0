Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EEA18DB0B;
	Wed, 12 Mar 2025 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741791646; cv=none; b=ZsO76kS/0Dt+8gLDaIW/871Hox98t84tkjgLZZaXb6CEA/PI+XAtOzUFrvv7WX4XpQ+2q5uKS3Sk+VLfusCSvhgF7vBz7HDS68Keclmabsob37eYqr1M5KJt78a3rAxrpb6PY2Uo3qzlQD7FOblznYty3xjWw8QChubRMYgF06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741791646; c=relaxed/simple;
	bh=ntRBGZheDVUnibGfmV7jHmvoI3j4FrSBf2s4i1D5vQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAW7Ytp3lzDyum703XKZC0VJZLiVNVDzLogBRDs315qgQ+QVPKS5omt/6eny+HGhb0vU4vuN8eovJjhG/IE3/A842gyJ8sSJlwt3yqwNEBXFwWvZ7YxAsaPaRMWp3N32BWfKxOoybVIxA19dfLtjKEUukmaFj4jF+vUofDQNXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A378512FC;
	Wed, 12 Mar 2025 08:00:54 -0700 (PDT)
Received: from [10.118.111.35] (G9L3377F54.austin.arm.com [10.118.111.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F603F5A1;
	Wed, 12 Mar 2025 08:00:43 -0700 (PDT)
Message-ID: <1f74fbf3-4b51-4f6e-b062-51a495fb17cc@arm.com>
Date: Wed, 12 Mar 2025 10:00:43 -0500
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
 <Z9EhqAxJjbsUiuC_@kernel.org> <Z9EiRDuWfPOkcjXN@kernel.org>
Content-Language: en-US
From: Stuart Yoder <stuart.yoder@arm.com>
In-Reply-To: <Z9EiRDuWfPOkcjXN@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> config TCG_ARM_CRB_FFA
>>         ~~~~~~~~~~~~~~~
>>         TCG_FTPM_FFA (and Kconfig put before TCG_FTPM_TEE)
>>
>>
>>          tristate "TPM CRB over Arm FF-A Transport"
>>          depends on ARM_FFA_TRANSPORT
>>          default y if (TCG_CRB && ARM_FFA_TRANSPORT)
>>                                   ~~~~~~~~~~~~~~~~~
>> 				 redundant given "depends on"
>>
>>          help
>>            If the Arm FF-A transport is used to access the TPM say Yes.
>>            To compile this driver as a module, choose M here; the module
>>            will be called tpm_crb_ffa.
>>
>> So I'll drop the whole series from my tree for the moment and you'll
>> have to respin.
> 
> Commit could use short summary in along the lines of:
> 
> "tpm: ftpm_ffa: <summary>"

It really isn't fTPM specific, the FF-A based TPM service could act as a
proxy to a discrete TPM chip.  But, perhaps: ffa_tpm ?

Thanks,
Stuart

