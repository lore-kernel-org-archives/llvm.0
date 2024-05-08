Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81CD38F9A
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715187217; cv=none; b=MXATSudouqBrzMgSvR1yZiXxTMZ+/V684cl+KSyoUP+vBQJa9H77URTOBUyqvZHXHQVa8x2f0AjKMlX23VOOegsRpNoKbtkWBy8pRUglQoyqWcQT/TC0gQgEgxgBFm7j04sNuv34xxLq5/8IKzR7/M96CA/3YyKAIlJJ2D7emIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715187217; c=relaxed/simple;
	bh=ZRyAR2mBMNqdi9nPsWt11Yl2kx65ROj3Il3Aorbo+gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNZpb0rQ7jtJjac1JHc0oqnv/JG30w9/3218wpHJLUCjgST5vig7S5rVFsxWQBdmRetKtGqjjlJcKHh56SPK8qranZQQBGTZF/VFyryqzp/EeDAp9mJI63IT3wA/FljiZ82JkTimdfe9faU9vs8UYDuq+Hejymz7Kq4RN7/TtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YGgTNpVG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YGgTNpVG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e3ca546d40so36632575ad.3
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715187215; x=1715792015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pkrtW/maB8r6WHs69e6l7rrcyayXYpss1wCPpNutgY=;
        b=YGgTNpVGwj+OJxqy+ZBjRrdvhDdvBGA93WOVgvUnaCO/rokJtEAwgDoxAKco78HXtZ
         75ootcNG57scno2oaviKlrR3+cg5eATuf77jthze39YZAFjnr/cvO9c3ZZWdwffVn5le
         rrZjBF2eZeNRPL4wj9njg+OU+tmcu4pypMqME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715187215; x=1715792015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pkrtW/maB8r6WHs69e6l7rrcyayXYpss1wCPpNutgY=;
        b=Z774lZbR/pbzsr22coCWbdcRSxWc/YeymAoDiYe/K/2WKy6NZHl/J984ESorZKlZ+G
         0iJGcjFDV6NcrEQt89g1ktweCqrmcfE7lDJxHNi86UhPYaClw9JNXHj4YzoX0/aRg4Gb
         VyxCEVmobySOqA5vDSctG8B7bJ9roAnQHvH6qtWTyw6AAW1WQDFk0BjXSSB+RSQxivSv
         s/YFyFIMJSQC+sazoHiQv4mwlPtpXBxLhqrlmWXcXrdUImiA0CtsYZvzXkq5kd0W8wJN
         YKHsYe1LNKveDolLvyvldwTSRxDaB+h5DYmF5LS2CDonCCmpqa7oydcW5na8z84fdZnW
         379w==
X-Forwarded-Encrypted: i=1; AJvYcCXL3l3zX9UH8bzw5DuNvF1x6QcNb0fmIhwBeOtp+UiTxtoo14QA/AHEE4cTsowNJkPWB6WyGgzhGX7b20FVoAa7Zt8xMw==
X-Gm-Message-State: AOJu0YyTqikP6I2H7UWaFtU+XHXdNDxl0rEI28IAPPHIXDwyWfA9mU5Z
	yKVhVNf/1/fASv7vekxLWj+Vt5Rk6ZubjpJQfcz4kW55M/xo41kxl4lxJcKAsTuecU4sTKp97uA
	=
X-Google-Smtp-Source: AGHT+IHvGJnFyMfNwSbDGLiCuhHhmZ9YT2/hUUVyZWRhVPeHnis9Jk0r16sKMqRVQN2ZqvFdS2lcBQ==
X-Received: by 2002:a17:902:f712:b0:1eb:51a4:3685 with SMTP id d9443c01a7336-1eeb05a1792mr41909655ad.52.1715187215161;
        Wed, 08 May 2024 09:53:35 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n8-20020a170903110800b001e22860c32asm12065479plh.143.2024.05.08.09.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:53:34 -0700 (PDT)
Date: Wed, 8 May 2024 09:53:34 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Allen Pais <apais@linux.microsoft.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vijay Nag <nagvijay@microsoft.com>
Subject: Re: [linux-next:master 11772/12060] fs/coredump.c:67:27: warning:
 unused variable 'core_file_note_size_min'
Message-ID: <202405080953.5E9B78A9CA@keescook>
References: <202405081838.tuETPvPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405081838.tuETPvPf-lkp@intel.com>

On Wed, May 08, 2024 at 06:30:25PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e7b4ef8fffaca247809337bb78daceb406659f2d
> commit: 13513eafc3ea08cdb70aebe56a7e43083302a809 [11772/12060] fs/coredump: Enable dynamic configuration of max file note size
> config: i386-buildonly-randconfig-005-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081838.tuETPvPf-lkp@intel.com/config)
> compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081838.tuETPvPf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405081838.tuETPvPf-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/coredump.c:67:27: warning: unused variable 'core_file_note_size_min' [-Wunused-const-variable]
>       67 | static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~
>    fs/coredump.c:68:27: warning: unused variable 'core_file_note_size_max' [-Wunused-const-variable]
>       68 | static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~
>    2 warnings generated.

Thanks. I folded in a fix to move these under CONFIG_SYSCTL.

-Kees

-- 
Kees Cook
