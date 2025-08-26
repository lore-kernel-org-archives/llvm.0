Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8BD2853E9;
	Tue, 26 Aug 2025 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756190461; cv=none; b=cdPJ4lccgY9xJ66y80yiOU4+F3TEgeapmfrOdBTMmqxQTm6f7FR7XDVY8xwa9nzuYmK5091IVvYbezztwJnMnINuyBAWOo28cu4s3voLpY4OCIkZWX+DP3afTmXFBOS+/9kEJPS8CDWnzvG+aTLtJrhp9xdhklrpybcF+uXAUnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756190461; c=relaxed/simple;
	bh=TTDSQsLEBYyrYsmc46nx5/yrcIhEliUXOyAujJOJPpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFyNCnu5Rr0H15CbdvQOuaND49f6wakYpwUcXdkL++6HuQcLsZhmXZ8ij81fAcB4lD5tuqFXmWq73nEm5VUovrPz+fpmqdFRZzxNArK9mmJQuCT7b/VmtwPlXoWws3rDgla47kg4lRgpy1764UIE3ue4aCPYW2FWztzDM3wmUfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=ZgyVdnr0; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ZgyVdnr0"
Received: from [100.79.0.226] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6759A2015BCE;
	Mon, 25 Aug 2025 23:40:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6759A2015BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756190455;
	bh=JVGCHPIrdH/5wbFB6BTPeap6EXGx7GMcHlqIHaSGOXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZgyVdnr064ai3X6OsYJyVFxcrB3rTBH5VVnvDdKAl235+dTLB9EtwAzrJXMGWn5Ao
	 JPXJsB9TKGL2U/6kilklbN8cHNJyb3Swqj6a5FGXygzXDYTxfa4YTOjwqpgUY+NZ7T
	 JTu0EnBIAVjoc+bSJHSc7bbCveL1NkLTDzfXF2Gg=
Message-ID: <344603f8-34df-4b9d-9909-c449de585e30@linux.microsoft.com>
Date: Tue, 26 Aug 2025 12:10:49 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
 Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
References: <202508240828.pVaUV45D-lkp@intel.com>
 <56833fbe-0ea1-4a0d-8d5b-809d983d3ab9@linux.microsoft.com>
 <20250825170051.GB2719297@ax162>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <20250825170051.GB2719297@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/25/2025 10:30 PM, Nathan Chancellor wrote:
> Hi Naman,
> 
> On Sun, Aug 24, 2025 at 11:13:51PM +0530, Naman Jain wrote:
>>
>>
>> On 8/24/2025 12:02 PM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   0f4c93f7eb861acab537dbe94441817a270537bf
>>> commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: hv: Introduce mshv_vtl driver
>>> config: i386-buildonly-randconfig-2003-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
>>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_vp_registers'
>>>>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_set_vp_registers'
>>>>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_partition_property'
>>>      3 errors generated.
>>>
>>
>> +Nathan
>>
>> I can see a bunch of similar warnings previously reported, in different
>> functions, but could not find a fix for it, or if this
>> is a blocking error:
>>
>> https://lore.kernel.org/all/?q=s%3A%22ran+out+of+registers+during+register+allocation%22
>>
>> These all are reported on below 32 bit config, compiled with LLVM:
>> i386-buildonly-randconfig-*
>>
>> Found previous comment from Nathan Chancellor, here, which seems to be
>> related to this error:
>> https://lore.kernel.org/all/20250507022649.GA1984217@ax162/
>>
>> """
>> This configuration has CONFIG_MATOM=y, which does not really work well
>> with clang for this reason and some others that have come up in the
>> past. Given it is likely that nobody will care enough to fix this on the
>> LLVM side (since it is 32-bit), we should probably just block using
>> MATOM with CC_IS_CLANG, which Arnd and I had talked about at the last
>> ClangBuiltLinux meeting.
>> """
>>
>> This gives me an impression that we can safely ignore these errors from
>> kernel test bot.
>> Requesting Nathan to please correct me if I am wrong.
> 
> Yes, this is all correct. I will try to pursue an actual kernel side fix
> for this in Kconfig but I think the Intel folks can also start ignoring
> these reports for ARCH=i386 and CONFIG_MATOM so that they do not get
> sent to other kernel developers for random changes.
> 
> Cheers,
> Nathan

Hi Nathan,
Thanks for confirming.

Regards,
Naman

