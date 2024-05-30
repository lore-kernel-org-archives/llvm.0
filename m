Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E49186E5B
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081099; cv=none; b=sJJq09bDnmxgaE+2Kc1pMD/qRDD/qWQE7kgiAXNC8zO1N4/Wl5yCOUBoEh/ZuOkHxETkMK7+HmjtP3mbsIIl1RRYtGWDhr1raebkg4mtJRs2rxzAF3orjxip7zq8NZHnGVA5brmz2uKYDVqSotus95Pe9Z0yR9Ea28Cjbbdp0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081099; c=relaxed/simple;
	bh=6frT2cUqOy2QZwW8Jb/ICL917q3xtkQYsWty0q3A7EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyEVCNH6b04gS+GgDN6qrChsZFmzst+Lk52TK81aBomfifml9UtSeV5OsiC3bspV0tSuhSMKV5yA7mSYai+da1Br/QCMVOhRd9/164CS+uf6q+2JADhHcNa7uMdC+6Iz/Qs2yruqrY3rLCdAEskJ4jfS5NFoX2grVUbK9gQkN9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E4Hv4uP1; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E4Hv4uP1"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7e8e7306174so4229139f.2
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717081097; x=1717685897; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYQWkDbOOCMyq/o0QgNOHjrEjyrRmklhwNgybQNhet8=;
        b=E4Hv4uP1J0x6X65a3PK++bYdsWr7GeZe3kCwphJISu+XtNSlpsQ8rrMiy/WVmKF/h7
         Di+tkGF8Gsw3OL4kJXLvkJSSmDpYjY9YL1YYzC7iLgJCKoUD7iHk0K4qDx0f9LizLaIf
         95tDrVqLSN6nGRVqjZQbzFI7/HKDP5LcE3zrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081097; x=1717685897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYQWkDbOOCMyq/o0QgNOHjrEjyrRmklhwNgybQNhet8=;
        b=GHPAxsQetPWbPhXS03DcN5CR4NJ6RrEb2znLDJSlLWj1SirD1navvfQfwAiuwuT5u1
         ZfvkfxGcf0OMcFUTym++c5rOe+jWKNQUTVBuKGjzkhO67zMQ0CHwAY5R3vqd/kLDN1zQ
         lRqj2BltWFe0yErE3HgzmVDA5gPSmgJC2DuCMWsWuN6O4TUpjSTVJxc91GyEkv3jGq3U
         eud0jl//bNMziQwmViRhFGbBq+TtHk4SXFldqoAjwacT8eZsIg3fcVIlfAygFfY3avtj
         TuCIXRt1Lo/Xc+US/NKvYnm6xxbvV1BcYbHLlbKkdGBbKbP6xcvdITs8Mxe3UflLB8LM
         Zlqw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2KIlhSneeQhiSQG04/lFTLRUI9p7tWqhwy5Kq3KFoUuDFerZLwY5lTGzWfauR9GucQ+LH2YnilwTRrLNKH3gxMLt8g==
X-Gm-Message-State: AOJu0YwOsOytB8ifmF500jqZ45B4LS/BSRDBMxYJEvnX0WPGd1ZFUhzM
	WC3uBDnhJ5mUSfc79YrikM7JMWJIxLSkcziPph+2jTfoqQPORU6AL++eWmAGkbI=
X-Google-Smtp-Source: AGHT+IF+c5SyF4FomowgTAfuj5YYGj0MkoKjfwfa0To8fH/UHJshVIcQ2oirqjk7Q32H9m4sYBF/7A==
X-Received: by 2002:a5d:970c:0:b0:7e1:d865:e700 with SMTP id ca18e2360f4ac-7eaf5d9611amr259019339f.2.1717081097098;
        Thu, 30 May 2024 07:58:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b0f152442asm1842750173.173.2024.05.30.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:58:16 -0700 (PDT)
Message-ID: <f4877afd-dc2c-4e54-8b53-c681d3eed045@linuxfoundation.org>
Date: Thu, 30 May 2024 08:58:15 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] selftests/x86: fix build errors and warnings found
 via clang
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Ingo Molnar <mingo@kernel.org>
Cc: angquan yu <angquan21@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, x86@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240527210042.220315-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240527210042.220315-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/24 15:00, John Hubbard wrote:
> Hi,
> 
> Just a bunch of build and warnings fixes that show up when
> building with clang. Some of these depend on each other, so
> I'm sending them as a series.
> 
> Changes since the first version:
> 
> 1) Rebased onto Linux 6.10-rc1

x86 test patches usually go through x86 tree.

This series requires x86 maintainer review and ack for me
to take this through kselftest tree.


> 
> Enjoy!
> 
> thanks,
> John Hubbard
> 
> John Hubbard (6):
>    selftests/x86: build test_FISTTP.c with clang
>    selftests/x86: build fsgsbase_restore.c with clang
>    selftests/x86: build sysret_rip.c with clang
>    selftests/x86: avoid -no-pie warnings from clang during compilation
>    selftests/x86: remove (or use) unused variables and functions
>    selftests/x86: fix printk warnings reported by clang
> 
>   tools/testing/selftests/x86/Makefile          | 10 +++++++
>   tools/testing/selftests/x86/amx.c             | 16 -----------
>   .../testing/selftests/x86/clang_helpers_32.S  | 11 ++++++++
>   .../testing/selftests/x86/clang_helpers_64.S  | 28 +++++++++++++++++++
>   tools/testing/selftests/x86/fsgsbase.c        |  6 ----
>   .../testing/selftests/x86/fsgsbase_restore.c  | 11 ++++----
>   tools/testing/selftests/x86/sigreturn.c       |  2 +-
>   .../testing/selftests/x86/syscall_arg_fault.c |  1 -
>   tools/testing/selftests/x86/sysret_rip.c      | 20 ++++---------
>   tools/testing/selftests/x86/test_FISTTP.c     |  8 +++---
>   tools/testing/selftests/x86/test_vsyscall.c   | 15 ++++------
>   tools/testing/selftests/x86/vdso_restorer.c   |  2 ++
>   12 files changed, 72 insertions(+), 58 deletions(-)
>   create mode 100644 tools/testing/selftests/x86/clang_helpers_32.S
>   create mode 100644 tools/testing/selftests/x86/clang_helpers_64.S
> 
> 
> base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
> prerequisite-patch-id: 39d606b9b165077aa1a3a3b0a3b396dba0c20070

thanks,
-- Shuah

