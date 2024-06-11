Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC8984E18
	for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130609; cv=none; b=uH6wm12DXR1rOKZjwVJvC+xyWzOFVB21ddbK6vIQlMm2bwSGVoq8VVs0Fjd1i8UwCGNFGDK+DnqnVMjOrF/1S0FQSjd9Jotv8axoczdz//7zB3XRnGK1bPEd706sGRh2zjhNj04D39+RBjemaMmtUahhp8W0Et1RyBmaTKPjyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130609; c=relaxed/simple;
	bh=vmJlB5Vx85oOAvr/aM38OCLvx/FPwgawAx4TV4XmcSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZcCrqwlXNX71AOrDHzEoNin9aFoc6t1+7r5ofoK8yMkBJFA/H74oyPOMmgz5kQBdv54UqI2YyvKSWur2qzZUI/knCzZPrUjUDQP7Y6RTXn7d97BDouRW4wkQI/8wIA/b1Ky/feiSpWkeGtuaCVJmOlbUW49bj2MxGPya0vDLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m+vIL19g; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m+vIL19g"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f70131063cso11780995ad.2
        for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718130608; x=1718735408; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XE4BOZRZpuQSDr/bb7Z6GCdUYJnxu9albyuBquTmaIo=;
        b=m+vIL19gdviOs5qDCNzVbxgVe28JoJiWKTtVZI+9RH1SpBwqVDIlwMEBbzw8GPK8Na
         DZJUV1E8lzGxNAaaZkBlPy0aPZPOnt6wDDXMyk5qvETfQQfVR8wWVVYhB5VTHelaAl53
         bxK2jgpJELD4yHfei3GvftEVE8HZ3IqFjvd8bQKudp0XTorTtkgq7WD5sIW9yzSBUBmj
         mDQTVNOlBHaayUQrAVt/tiCmgZAjRGVUPxgO3hZHiYw//L2goH/Y98NIU2ynwzcPuIPP
         kN4/SvbZPGKHBqN/FX53YcDpH22O52DT6AepoB7Ewd9xDn6WA0kvJPagWWTq1KJe3KwI
         JYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718130608; x=1718735408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE4BOZRZpuQSDr/bb7Z6GCdUYJnxu9albyuBquTmaIo=;
        b=d9KqRoW5aEltKarcxH2gMuVSy8yPk3MbEBcteAwbHU/NFamTldtkhtitHYPb7T+isR
         ZDDRMZco19cDyUufhqvGFev3LC6SdKermzpghPQ6jijibPK8tFKiDJOI1Zy//pqZw3U2
         RyTzh3QcjCWop/LGSpjfEgVGFwNrnToawf3lDGAH/PGeIJORXPF3tCXOBtEuBEs2FO+q
         5flIHYZgHDEus0VQBNrv3q6AUhdBpnIFS2zflhk0ShEK/dUnvGKLzyf9iFQw7Ooqj/7d
         xI/uKtUSJBObuHd3IUNvZv2b+luf61toZNRFBKQlwjNXsBcPZ07iCy+dY3+V3qcpPvIv
         8WDw==
X-Forwarded-Encrypted: i=1; AJvYcCW7oZcVasZSsj7yZOhwXBea8Zy13jX/nwJtMmOuo3tMDVAo1zycwFyflQV+laEw4CeFv5ETappmPdCAMSbr+7KyjqW1lw==
X-Gm-Message-State: AOJu0Yweq7OzdOOf/JSAc2cvGCY/j5Zm+JChVl5UDPhbx7xj4MRiSze8
	QEp1vegT6I60lEbiRH+9ZTB93G/wTnx2H7fDmrVnGz/AEhJauxq25sCcJvsJ3Q==
X-Google-Smtp-Source: AGHT+IEUxjBQ03FSwMcOa7Q1C9oBhVDpqO23pvs6QZZKLHfe2UWqfYR6fTAzVkLY2GOOR2DFyw1XZA==
X-Received: by 2002:a17:902:f54d:b0:1f7:340e:71ac with SMTP id d9443c01a7336-1f7340e7491mr23223975ad.50.1718130604876;
        Tue, 11 Jun 2024 11:30:04 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f72110e4b5sm30490685ad.125.2024.06.11.11.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:30:04 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:30:00 +0000
From: Carlos Llamas <cmllamas@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kselftest@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2] selftests/vDSO: fix clang build errors and warnings
Message-ID: <ZmiXqOHYaLLX557z@google.com>
References: <20240527211622.290635-1-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527211622.290635-1-jhubbard@nvidia.com>

On Mon, May 27, 2024 at 02:16:22PM -0700, John Hubbard wrote:
> When building with clang, via:
> 
>     make LLVM=1 -C tools/testing/selftests
> 
> ...there are several warnings, and an error. This fixes all of those and
> allows these tests to run and pass.

It might be best to split the 4 _different_ fixes into separate patches.

> 
> 1. Fix linker error (undefined reference to memcpy) by providing a local
>    version of memcpy.
> 
> 2. clang complains about using this form:
> 
>     if (g = h & 0xf0000000)
> 
> ...so factor out the assignment into a separate step.

There has been multiple attempts to fix this. I can see these two:
https://lore.kernel.org/all/20211206102931.1433871-1-anders.roxell@linaro.org/
https://lore.kernel.org/all/20240501002150.1370861-1-edliaw@google.com/

... I guess we somehow missed those?

> 
> 3. The code is passing a signed const char* to elf_hash(), which expects
>    a const unsigned char *. There are several callers, so fix this at
>    the source by allowing the function to accept a signed argument, and
>    then converting to unsigned operations, once inside the function.
> 

There is also a v4 fix for this item that was sent out here:
https://lore.kernel.org/all/20240506181951.1804451-1-edliaw@google.com/

> 4. clang doesn't have __attribute__((externally_visible)) and generates
>    a warning to that effect. Fortunately, gcc 12 and gcc 13 do not seem
>    to require that attribute in order to build, run and pass tests here,
>    so remove it.
> 
> [1] https://lore.kernel.org/all/20240329-selftests-libmk-llvm-rfc-v1-1-2f9ed7d1c49f@valentinobst.de/

What is this about? Left over from v1 maybe?

> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

I would prefer to pick up the fixes from folks who sent out the patches
first but I'm fine either way.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
