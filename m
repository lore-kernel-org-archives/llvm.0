Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A375C6441
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 23:11:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B9951650;
	Tue,  8 Mar 2022 15:11:45 -0800 (PST)
Received: from [10.57.41.254] (unknown [10.57.41.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 071B83FA20;
	Tue,  8 Mar 2022 15:11:43 -0800 (PST)
Message-ID: <7341895d-0c69-5a84-6dfe-f228a05df03b@arm.com>
Date: Tue, 8 Mar 2022 23:11:38 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: arm64 memcpy+memove 5.10 patch
Content-Language: en-GB
To: Nick Desaulniers <ndesaulniers@google.com>,
 Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Manoj Gupta <manojgupta@google.com>,
 Denis Nikitin <denik@google.com>, Will Deacon <will@kernel.org>,
 llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAKwvOd=iOS3HEUH1w-R4vYSNMwAzE7kr30FcXNZg0e1WBvpenQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAKwvOd=iOS3HEUH1w-R4vYSNMwAzE7kr30FcXNZg0e1WBvpenQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-03-08 22:38, Nick Desaulniers wrote:
> Dear stable kernel maintainers,
> Please consider cherry-picking
> 
> commit 6c23d54f4cb8 ("arm64: Import latest memcpy()/memmove() implementation")
> 
> to v5.10.y.  It first landed in v5.14-rc1.
> 
> It fixes a linkage failure observed when building kernels for ChromeOS
> under AutoFDO:
> 
> ld.lld: error: arch/arm64/lib/lib.a(memmove.o):(function __memmove:
> .text+0x8): relocation R_AARCH64_CONDBR19 out of range: -6331272 is
> not in [-1048576, 1048575]; references __memcpy
>>>> defined in arch/arm64/lib/lib.a(memcpy.o)
> 
> (The prior version of memmove used assembler conditional branches to
> memcpy; under AutoFDO the linker will decide where best to place
> memmove; it may be > 1MB away from memcpy. After this patch, memcpy
> and memmove are the same function).

Just beware that the new implementation turned out to be really good at 
finding places where __iomem pointers are erroneously being passed to 
memcpy(), by more readily triggering alignment faults, so there is a 
non-zero possibility of functional regressions if any of those places 
are still present in 5.10.y (particularly any which had "naturally" 
disappeared before 5.14). At least one of them still isn't fixed in 
mainline, but that one's so obscure I wouldn't consider it a major 
concern by itself.

Thanks,
Robin.
