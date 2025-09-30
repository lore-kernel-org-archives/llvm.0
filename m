Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C9256B81
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759207989; cv=none; b=tib0LpQD4UXbqXjdQO9+msXAtxykTZBnML45Wtk8UeWqnxuW4b0+OMzesvIuY4GxEqA/uHThF0JKcdaDe6hHjNRyQGT5Xa0gDDENqJYBeDlCpOXGlrq3KzC9a9Q8rBbQGxsZbSwqTKoBpoU5bpkmOnmV+zUzMzfDIY4TQQXTZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759207989; c=relaxed/simple;
	bh=kUqau4wTFoipG/QDF0Z/vudmujI1Vk0pxAPg9rmsTqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uqo4pSNsapoS7Uzmg02SsDiNHeIGvwS38S1x16AO0H74rmv+ccpEOqQpJL8Z+iDX74Uantb+lj+11HKxIlhHnMB2e/er0RxsgwkwiJsCX1rH+01RBID8SR91rdFJjzP/qdBVhMDL4/UCF3/T9LSW1dGaTLd3XHDZwdZ8nyimOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B90182F;
	Mon, 29 Sep 2025 21:52:58 -0700 (PDT)
Received: from [10.164.18.53] (MacBook-Pro.blr.arm.com [10.164.18.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBB2C3F5A1;
	Mon, 29 Sep 2025 21:53:02 -0700 (PDT)
Message-ID: <486e0d6b-799e-4fec-9e6d-3ddfdd64418c@arm.com>
Date: Tue, 30 Sep 2025 10:22:59 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] selftests: cachestat: Fix warning on declaration under
 label
To: Sidharth Seela <sidharthseela@gmail.com>, nphamcs@gmail.com,
 hannes@cmpxchg.org, nathan@kernel.org, shuah@kernel.org, morbo@google.com,
 justinstitt@google.com, nick.desaulniers+lkml@gmail.com
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 david.hunter.linux@gmail.com
References: <20250929115405.25695-2-sidharthseela@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250929115405.25695-2-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 29/09/25 5:24 pm, Sidharth Seela wrote:
> Fix warning caused from declaration under a case label. The proper way
> is to declare variable at the beginning of the function. The warning
> came from running clang using LLVM=1; and is as follows:
> --
> -test_cachestat.c:260:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>    260 |                 char *map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
>        |
>
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> ---
>

Reviewed-by: Dev Jain <dev.jain@arm.com>

