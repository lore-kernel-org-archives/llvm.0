Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D4526AABB
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745827; cv=none; b=q6vjqllwtkI4y7TScUhVyrZB/DQl+1XCitjij2tHvEJ6JRL7ny/eUsPhVpmiOhA9VbBwqYMzRFhEVG8vS/XUI/KHWLqdQajhlLHXOZmk2WiEaIBthVMNmJYOkrGHSf4jOOCMWOhsKCKqX7atqypKMzMcO33ennNtJCC9itsFq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745827; c=relaxed/simple;
	bh=QJlaGNw2Jqlyim50A/tecSVxZiHWEaao7R+wuGUHqK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuLawWi4uc925Ma+dEIKoknWLq9+S+eOS5iyQ/YfAsfOPZU3mWhThmE1ATaKvVzHFo5AId0aF8OU5+wV4xLwy+IbT4Bvd3ZvVUBNftagfhKkSE2vsqyrLMdhKkqEP9X7pcQcUXZ6msmQVYyZed8QUv93gXv/83yqML4PRI8iq+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AB831477;
	Fri, 28 Feb 2025 04:30:41 -0800 (PST)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D68363F6A8;
	Fri, 28 Feb 2025 04:30:23 -0800 (PST)
Message-ID: <02b4e5ba-b740-4da4-8a6b-9a5e325b3e8f@arm.com>
Date: Fri, 28 Feb 2025 12:30:22 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] selftests: vDSO: vdso_test_gettimeofday: Make
 compatible with nolibc
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
 <20250226-parse_vdso-nolibc-v2-15-28e14e031ed8@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20250226-parse_vdso-nolibc-v2-15-28e14e031ed8@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/02/2025 11:44, Thomas Weißschuh wrote:
> nolibc does not provide sys/time.h and sys/auxv.h,
> instead their definitions are available unconditionally.
> 
> Guard the includes so they are not attempted on nolibc.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> index 636a56ccf8e4e7943ca446fe3fad6897598ca77f..9ce795b806f0992b83cef78c7e16fac0e54750da 100644
> --- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> +++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> @@ -11,8 +11,10 @@
>   */
>  
>  #include <stdio.h>
> +#ifndef NOLIBC
>  #include <sys/auxv.h>
>  #include <sys/time.h>
> +#endif
>  
>  #include "../kselftest.h"
>  #include "parse_vdso.h"
> 

-- 
Regards,
Vincenzo

