Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29B67EA;
	Mon, 27 Mar 2023 06:08:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBCBD4B3;
	Sun, 26 Mar 2023 23:09:26 -0700 (PDT)
Received: from [10.162.42.7] (a077893.blr.arm.com [10.162.42.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7193F6C4;
	Sun, 26 Mar 2023 23:08:39 -0700 (PDT)
Message-ID: <4feeae36-f6fe-1422-9f0f-081b9106e91c@arm.com>
Date: Mon, 27 Mar 2023 11:38:36 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: Disable EL2 traps for BRBE instructions executed
 in EL1
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20230324055127.2228330-1-anshuman.khandual@arm.com>
 <202303250802.KytExIHw-lkp@intel.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <202303250802.KytExIHw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/23 06:07, kernel test robot wrote:
> All errors (new ones prefixed by >>):
> 
>>> <instantiation>:36:14: error: expected compatible register or logical immediate
>     orr x0, x0, #HFGITR_EL2_nBRBIALL
>                 ^
>    <instantiation>:10:2: note: while in macro instantiation
>     __init_el2_fgt
>     ^
>    arch/arm64/kernel/head.S:577:2: note: while in macro instantiation
>     init_el2_state
>     ^
>    <instantiation>:37:14: error: expected compatible register or logical immediate
>     orr x0, x0, #HFGITR_EL2_nBRBINJ
>                 ^
>    <instantiation>:10:2: note: while in macro instantiation
>     __init_el2_fgt
>     ^
>    arch/arm64/kernel/head.S:577:2: note: while in macro instantiation
>     init_el2_state
>     ^

I guess these build errors are caused by unavailability of the pre-requisite
patches from Mark Brown, in this test environment ?

https://lore.kernel.org/all/20230306-arm64-fgt-reg-gen-v3-0-decba93cbaab@kernel.org/
 
