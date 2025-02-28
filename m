Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A0826B2DE
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745721; cv=none; b=MosAeCYhgygO1ASCIrYELje4FHxxoWfIID+WgIH9ZOxrVfoIBfQRJrs1hyMGcj197ZJKLoaFdDK6IBIegzikho2/rTVgkYIkwqITIltWj7MVgkYK5uipqPFF8ogRrk2Z0Zln9wZIIvlchLr+8gTiIwIPHgAz2qNHgp2Gg0rMHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745721; c=relaxed/simple;
	bh=wI5CVRWn1sNuo9TOC2fIPEX2ief3+V0gfEx8elt7LUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feMPFz+IK2KgS84mBpyA7/QL1tVmCESe8qJqwp/zYaNqu4EuUJ4xRf7Fdkw3gVacnj/IaRnOin2h70lZvx8crsw1zMWcT5T4URPpPZwUSDB5pPrE+WJ5tTofA3Nsj91yH6IO8HRdx1FuF8LYDyPeAzb8iDsKIGRczcUqPE9puz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E5F11688;
	Fri, 28 Feb 2025 04:28:53 -0800 (PST)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCB8C3F6A8;
	Fri, 28 Feb 2025 04:28:35 -0800 (PST)
Message-ID: <63018d3b-9c80-465f-be5c-34eb8255109c@arm.com>
Date: Fri, 28 Feb 2025 12:28:34 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] selftests: vDSO: parse_vdso: Drop
 vdso_init_from_auxv()
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
 <20250226-parse_vdso-nolibc-v2-11-28e14e031ed8@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20250226-parse_vdso-nolibc-v2-11-28e14e031ed8@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/02/2025 11:44, Thomas Weißschuh wrote:
> There are no users left.
> 
> This also removes the usage of ElfXX_auxv_t,
> which is not formally standardized.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  tools/testing/selftests/vDSO/parse_vdso.c | 14 --------------
>  tools/testing/selftests/vDSO/parse_vdso.h |  1 -
>  2 files changed, 15 deletions(-)
> 
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
> index 2fe5e983cb22f1ed066d0310a54f6aef2ed77ed8..3638fe605e80ca41b29d43c6ac452964eef35d56 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -297,17 +297,3 @@ void *vdso_sym(const char *version, const char *name)
>  
>  	return 0;
>  }
> -
> -void vdso_init_from_auxv(void *auxv)
> -{
> -	ELF(auxv_t) *elf_auxv = auxv;
> -	for (int i = 0; elf_auxv[i].a_type != AT_NULL; i++)
> -	{
> -		if (elf_auxv[i].a_type == AT_SYSINFO_EHDR) {
> -			vdso_init_from_sysinfo_ehdr(elf_auxv[i].a_un.a_val);
> -			return;
> -		}
> -	}
> -
> -	vdso_info.valid = false;
> -}
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.h b/tools/testing/selftests/vDSO/parse_vdso.h
> index de0453067d7cd0d8b63f7d3738842f60370db813..09d068ed11f97f0c5c8f4e7b341f08fa261c9735 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.h
> +++ b/tools/testing/selftests/vDSO/parse_vdso.h
> @@ -26,6 +26,5 @@
>   */
>  void *vdso_sym(const char *version, const char *name);
>  void vdso_init_from_sysinfo_ehdr(uintptr_t base);
> -void vdso_init_from_auxv(void *auxv);
>  
>  #endif
> 

-- 
Regards,
Vincenzo

