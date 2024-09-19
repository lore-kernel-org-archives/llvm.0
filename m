Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997531991A3
	for <llvm@lists.linux.dev>; Thu, 19 Sep 2024 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726746772; cv=none; b=XxV31jQ08v1Bt/H7GMcVYyLV3QpxnCuu6Gule+5qBS1h47Hc+ZtTofgPzEuVmPUyl4MNvP3duuphpCw7OYa57mxH8/yAlVkwtUyfTYDh10auVQy40luT50dbflsMs/WruQEAnfkKtvWfmt5707LpMC3UJKEhk7cA2kixx9oZ4tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726746772; c=relaxed/simple;
	bh=n2c8rCWw8z/lpoN5wgFADrTYkKDIlTR04TekYHp1qSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bt63beBM0aj2ubebMvzIMrutSZIMq8AmUTluj9W4C7fKf71PQjOBV5z+Cv7k04Y+j49DWWS8uq+iyx9DpMyJyDLfYCvICyWU5F7d2dTH3WcGwCH4r/wRHTUnNrFH56YXqZGAr8IymXLc33GBmkSLizSoXQwxHx8o1WM/HZ6cTgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdzsI6kn; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdzsI6kn"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45815723c87so5658801cf.0
        for <llvm@lists.linux.dev>; Thu, 19 Sep 2024 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726746769; x=1727351569; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2c8rCWw8z/lpoN5wgFADrTYkKDIlTR04TekYHp1qSo=;
        b=OdzsI6kn3c3kW6ZKWify5ypiEgPW04lejtv5CEtcRjYtl8cCmzOG6V3cDnvc3nLx09
         iZJit+g5vOr/ffTz6BZFMvBOG/9gCyl0wxLniSIxCADvX4+7tI5r9ZbOsVAcJyKJobX5
         H+O4hVsxLF7Kk1nTzMy+Acu0h8mmmYonqqqEkK6nUuJIcEYfKCAuWlUUczXHa80VB5dC
         l5XrOdwCp8I3/r+hIKIdGH5fVrAhj8JX6eRDx/Zbzi/9w7hSsTguHqWMgrOUZ08FKcbs
         V2JJOxPRdrjOH/bhsepYCMTrgCoTRt3BJesMkucbUoRfIYZoOJOJAEnJlyasfhcXP1aB
         boPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726746769; x=1727351569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2c8rCWw8z/lpoN5wgFADrTYkKDIlTR04TekYHp1qSo=;
        b=AJFjco9IlinLIJottlfL7bxH/0cEadBZ9ga/fQCY7hI4fjtSKuyJQz0hoWmNhxJk9O
         MYk4ZAlb3jiV2c89E8upO+G9Qe/Pw3MWrXAHfJEMg7bHNr+3lnKTbiuBlUf4aiov8/Tg
         3jXgh3d4oHhF3xUYMHazFdIjbHXSdqZ0AsNRCASWyZUmgupoMgu4vaNDX5B4BgQrkhIz
         EISrpTYXzmvGJoa4MBExj2Z7aT2axIiU8l/Ftnc7gaPNqU+1BoLOkynPMQeZ7QO4pBo9
         NS6RqtSsRK8M9Lk+3UrseyAn9P9kH4FGXngL47P6RnpofFPmhyS0QOVDHOtirEY6RBv/
         RT9A==
X-Forwarded-Encrypted: i=1; AJvYcCWclzmSQtuYJiOKo3VkL68Zxk1wt49LUWgoK/+ZnnjvF0Sz7IwaUCUXIHxXukBSfJwPM7s1@lists.linux.dev
X-Gm-Message-State: AOJu0YxgDy5ztLaEQVD+JG/bFMuLPGmP5J16JCky6ybSlubztWN4r9e4
	EfbTUU8460XsvxbyylGoAaHIm1AchRyk1YyOHWwEzIxBItvipRp8
X-Google-Smtp-Source: AGHT+IGQcZIp8iyJg2gTDfan3U3gpkE7chV5pJXxPcG09Udi1LvNQFGlfel4EdOFjiYN4XeQ62uD+g==
X-Received: by 2002:a05:622a:1ba8:b0:456:953f:6fe6 with SMTP id d75a77b69052e-45b1602db49mr44449971cf.8.1726746769446;
        Thu, 19 Sep 2024 04:52:49 -0700 (PDT)
Received: from ?IPV6:2620:10d:c0a8:11d1::1023? ([2620:10d:c091:400::5:4589])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b1788f56dsm6783921cf.56.2024.09.19.04.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 04:52:48 -0700 (PDT)
Message-ID: <c65a07ef-6436-4e04-a263-7cad9758e9be@gmail.com>
Date: Thu, 19 Sep 2024 13:52:37 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] Add Propeller configuration for kernel build.
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>,
 Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vegard Nossum <vegard.nossum@oracle.com>, John Moon <john@jmoon.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens
 <hca@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Mike Rapoport <rppt@kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Eric DeVolder <eric.devolder@oracle.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Randy Dunlap <rdunlap@infradead.org>,
 Benjamin Segall <bsegall@google.com>, Breno Leitao <leitao@debian.org>,
 Wei Yang <richard.weiyang@gmail.com>, Brian Gerst <brgerst@gmail.com>,
 Juergen Gross <jgross@suse.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Kees Cook <kees@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev,
 Krzysztof Pszeniczny <kpszeniczny@google.com>,
 Stephane Eranian <eranian@google.com>
References: <20240728203001.2551083-1-xur@google.com>
 <20240728203001.2551083-7-xur@google.com>
Content-Language: en-US
From: Maksim Panchenko <max4bolt@gmail.com>
In-Reply-To: <20240728203001.2551083-7-xur@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, Jul 28, 2024 at 01:29:56PM -0700, Rong Xu wrote:
> Add the build support for using Clang's Propeller optimizer. Like
> AutoFDO, Propeller uses hardware sampling to gather information
> about the frequency of execution of different code paths within a
> binary. This information is then used to guide the compiler's
> optimization decisions, resulting in a more efficient binary.

Thank you for submitting the patches with the latest compiler features.

Regarding Propeller, I want to quickly mention that I plan to send a
patch to include BOLT as a profile-based post-link optimizer for the
kernel. I'd like it to be considered an alternative that is selectable
at build time.

BOLT also uses sampling, and the profile can be collected on virtually
any kernel (with some caveats).  There are no constraints on the
compiler (i.e., any version of GCC or Clang is acceptable), while Linux
perf is the only external dependency used for profile collection and
conversion. BOLT works on top of AutoFDO and LTO but can be used without
them if the user desires. The build overhead is a few seconds.

As you've heard from the LLVM discussion
(https://discourse.llvm.org/t/optimizing-the-linux-kernel-with-autofdo-including-thinlto-and-propeller)
and LPC talk (https://lpc.events/event/18/contributions/1921/), at Meta,
we've also successfully optimized the kernel and got similar results.

Again, this is a heads-up before the patch, and I would like to hear
what people think about having a binary optimizer as a user-selectable
alternative to Propeller.

Thanks,
Maksim

