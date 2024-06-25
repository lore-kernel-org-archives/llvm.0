Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1B1779BA
	for <llvm@lists.linux.dev>; Tue, 25 Jun 2024 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719340084; cv=none; b=A2oEpyZ2HU09XsMet/CCu96xb/BzZQkp1lxomH9tp5JWmrnxI+3jMWTod65Mui41VwvSX5Exc7gCwUtTY8uJozi0yAJdOB/l9N2fPDwBkPFASFvMa81nFGsBOm7+vJZdPCcwpfqvS9R+Eh6FqqsSyIv0tb6gSx41emE2dqleJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719340084; c=relaxed/simple;
	bh=A+/Ky2PN9IRsbjU8WUJktiVC5R8r38dialqHvwCVtYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c062S7wb4GVKHf54rT/Aj7EH0q5P3mB/AJSei99nYB0fmpCKcXHyFGrZCOSDtiQOCgSTcU4eVxxIiKPzVUDOQz5mIIskWS+tMqLgAkrFGzxfJiziJhceI7WUEUhMtizOK4WFjGBwE94u6+tEaHjDEW2AKaTwd/y6jJOQUns2TkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZOzyWxEV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZOzyWxEV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7066c799382so3303444b3a.3
        for <llvm@lists.linux.dev>; Tue, 25 Jun 2024 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719340082; x=1719944882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vIU7FbHMAgqLqLMnCvHjiT4tfZr4IV9QAKsdnjusbk=;
        b=ZOzyWxEVMpiH6i7ngOfbPATss8JfWh77kcwsR2QE1jzODyZYy6Cv8croU+BWeXzTRV
         65VQjzl3am8yMaiGSOnGSo13J//kW6AY5pq9IxsUlFDV1m2VscOALDd0IWHKJxnivpXx
         NEpFyNxNqdjipYRGXkFAmlOdqc89X7uHejXbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340082; x=1719944882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vIU7FbHMAgqLqLMnCvHjiT4tfZr4IV9QAKsdnjusbk=;
        b=MoH/+dNfxyox7/rAxxs8XlKt7lwsJdtLn+jRD+NxFFOrSQONXLrvWSOcI746kUKt/R
         aobQQJOiR0n885WbUWdGGFLOOjhzcypTRK17id7+W2EZkfUvGm3Ho3w4l3alBmNdOEYj
         MAwlWP/Rz7Gj69HVPsi8c8EJvDLxE1rFxH3AuABLwdN9jpjVvwpZzyup/zfUAkC8cneL
         EeCE+D8c56Vbs4L3zSQOsAGVQ248nd43ORldSJ8BL0PehJBv6o1ja1MxKot51vXIpn0Y
         hHUNSkr2H9n/9lQ4l2HjtXIQ9FAAv0HjUsUhsUsqW6HaqyrM6JYwC84MyB63jfv8dDcf
         26YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJjZ31YUq+CYKQxw0NtojvjskcN5lsNgHvpvG0huRarORvvbor106gVUbV9zywv12UBhAVaNn960Dma9I0EXxpTILwwA==
X-Gm-Message-State: AOJu0YzOWbllnNO+TkFl0jL8wMBu99fl3UO+c6cL/3lgzuod1cgWquZV
	7BPycuK3N2m88QkhJ7dljH/vsn+Vy9mGISnvDvuwWJK9TV3ZdZVVJ+MW2cqVkA==
X-Google-Smtp-Source: AGHT+IEXU1A5mwPtAo/Q+OSf1rs0m//a4+MO0yyqLqDWDlRWJxcLz/D0LOTpOHslhiGSNzIzpioYzA==
X-Received: by 2002:a05:6a21:6d9a:b0:1b6:1a81:5dad with SMTP id adf61e73a8af0-1bcf7e7f88amr10256587637.14.1719340081619;
        Tue, 25 Jun 2024 11:28:01 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:64b9:a46b:e2d1:27d7])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7066c7fb9casm6466474b3a.94.2024.06.25.11.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 11:28:01 -0700 (PDT)
Date: Tue, 25 Jun 2024 11:27:59 -0700
From: Brian Norris <briannorris@chromium.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] cpumask: Switch from inline to __always_inline
Message-ID: <ZnsML1RYMmEhhdPP@google.com>
References: <20240514204910.1383909-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514204910.1383909-1-briannorris@chromium.org>

Hi Yuri, Rasmus,

On Tue, May 14, 2024 at 01:49:01PM -0700, Brian Norris wrote:
> On recent (v6.6+) builds with Clang (based on Clang 18.0.0) and certain
> configurations [0], I'm finding that (lack of) inlining decisions may
> lead to section mismatch warnings like the following:
> 
>   WARNING: modpost: vmlinux.o: section mismatch in reference:
>   cpumask_andnot (section: .text) ->
>   cpuhp_bringup_cpus_parallel.tmp_mask (section: .init.data) ERROR:
>   modpost: Section mismatches detected.
> 
> or more confusingly:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference:
>   cpumask_andnot+0x5f (section: .text) -> efi_systab_phys (section:
>   .init.data)
> 
> The first warning makes a little sense, because
> cpuhp_bringup_cpus_parallel() (an __init function) calls
> cpumask_andnot() on tmp_mask (an __initdata symbol). If the compiler
> doesn't inline cpumask_andnot(), this may appear like a mismatch.
> 
> The second warning makes less sense, but might be because efi_systab_phys
> and cpuhp_bringup_cpus_parallel.tmp_mask are laid out near each other,
> and the latter isn't a proper C symbol definition.
> 
> In any case, it seems a reasonable solution to suggest more strongly to
> the compiler that these cpumask macros *must* be inlined, as 'inline' is
> just a recommendation.
> 
> This change (plus more) has been previously proposed for other reasons
> -- that some of the bitmask 'const' machinery doesn't work without
> inlining -- in the past as:
> 
>   Subject: [PATCH 1/3] bitmap: switch from inline to __always_inline
>   https://lore.kernel.org/all/20221027043810.350460-2-yury.norov@gmail.com/
> 
> It seems like a good idea to at least make all cpumask functions use
> __always_inline; several already do.
> 
> According to bloat-o-meter, my ~29MB vmlinux increases by a total of 61
> bytes (0.00%) with this change.
> 
> [0] CONFIG_HOTPLUG_PARALLEL=y ('select'ed for x86 as of [1]) and
>     CONFIG_GCOV_PROFILE_ALL.
> 
> [1] commit 0c7ffa32dbd6 ("x86/smpboot/64: Implement
>     arch_cpuhp_init_parallel_bringup() and enable it")
> 
> Cc: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
>  include/linux/cpumask.h | 214 +++++++++++++++++++++-------------------
>  1 file changed, 113 insertions(+), 101 deletions(-)

Any thoughts here? scripts/get_maintainer.pl suggests you are
maintainer/reviewer here.

Regards,
Brian
