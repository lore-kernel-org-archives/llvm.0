Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F28260394
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745378; cv=none; b=hHtldXFAdSqwaTbCNDDZE9at849PJqjBs9Hvr1SWkRa7tnOZy+034g9dnGEX4Pq65Suhm4SDrzBzph0pUvXEDkH5AN2xw54EHt+/MHGZx1WEveDNQC5t4rYWEkV7Yjdio3weYsFF8wU9n4HLD4gtEmclBAaqXBhC/6Bh2qmIzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745378; c=relaxed/simple;
	bh=MHbTwnqBrBd0xBuGqPeLEKnnWa+OI56CGCm/aFKtFI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StMgRzgxtYwlIIfdVyGeKH2goKCjXkcprelEDqT3Ttf+rKDuvAybdFbZBrHb02v4bfi+ATvNI2b+uVDvSL0vryx3Ht07aEQIIgWEMeWGzl+a9fVMsC3eGxyU5+7oO6ghn8ruyIaJ+VNGzEVjCgMAHQO3+7+k4fPVDa6CBpcDAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72F071688;
	Fri, 28 Feb 2025 04:23:09 -0800 (PST)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFCF33F6A8;
	Fri, 28 Feb 2025 04:22:51 -0800 (PST)
Message-ID: <fe2c2f1f-8d6e-4f0d-8a25-9fa180d9062c@arm.com>
Date: Fri, 28 Feb 2025 12:22:50 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] MAINTAINERS: Add vDSO selftests
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Willy Tarreau <w@1wt.eu>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250226-parse_vdso-nolibc-v2-0-28e14e031ed8@linutronix.de>
 <20250226-parse_vdso-nolibc-v2-1-28e14e031ed8@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20250226-parse_vdso-nolibc-v2-1-28e14e031ed8@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/02/2025 11:44, Thomas Weißschuh wrote:
> These currently have no maintainer besides the default kselftest ones.
> Add the general vDSO maintainers, too.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa06545e2861abe46ea7029f9b4d3628e..959c8a86844eb1e5c6218e8fdbde6c3ebf68e25d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9777,6 +9777,7 @@ F:	include/asm-generic/vdso/vsyscall.h
>  F:	include/vdso/
>  F:	kernel/time/vsyscall.c
>  F:	lib/vdso/
> +F:	tools/testing/selftests/vDSO/
>  
>  GENWQE (IBM Generic Workqueue Card)
>  M:	Frank Haverkamp <haver@linux.ibm.com>
> 

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

-- 
Regards,
Vincenzo

