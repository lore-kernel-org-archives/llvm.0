Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3189678F32;
	Thu,  8 May 2025 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723071; cv=none; b=LKBSDMR6vba1nP7sZk79O+4kZufhYOyhcoXcgkYNLAGmQYRy10SigTOr4smVtlRi2yLHAuCol/5a81+4nzNnjrez9TE1tcg7ORB/3F+vIUnprZ9GcSdOVi2u8GZ+kjf/uh85gEKC9hHhkZRy1TptqandZ5vbLA+sCP000pWD2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723071; c=relaxed/simple;
	bh=adj1s9ZtX4D8aDhjptEz9rjuON1M7LPV696P3s54AuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJfweRTAS/BTq70ucrgltqmy9fnKNjNYmRDEQTtxGlIcvKBmSdNYkIav+47ijRRyh2OZkM/RKRXgzoR2hIvBXf9gV/RUXM/nu8yIfhZ35Ih5R/jC6O6Pqh1JiJuVQbtqLULAHm9vG4aRaZYeS+tVGssk3HFDtUBNnta0lAN1owA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CB28JA4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB28JA4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAF7C4CEEB;
	Thu,  8 May 2025 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723070;
	bh=adj1s9ZtX4D8aDhjptEz9rjuON1M7LPV696P3s54AuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CB28JA4k1aNPc2VJZDJnrg4zI+XIK8KG3TKfBT655lDdnvQ2KXwRcCxA60/hdmvxF
	 /Xz0w+3WE/8wN++LR4mSFZAMIG3hlsj1NY3/JTqr5xrG3cwbHqOqqVUm5/QkGCl3rq
	 LxcGpxItrnS1NlE4fOgyzDhpj6Dfb9NJrvqnV/tjPVztXd+14u7Ts8TvZXoe8k2Aeo
	 vwROsaGwMCz7dhSdKVRZZ6JbFeTne6C6cipLI9XthsLY4Gsc5/pifP8ossr1RAOntw
	 A+XgwZ/fYrXz+R4kXAWf04R8BFoo58o2F9QnkHmAWfJbouw4Ff8ZRNkdMgXi8k0D2o
	 WLKvytJSjr4Vg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54fc36323c5so661993e87.0;
        Thu, 08 May 2025 09:51:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAj9up398m45a7DfziiGYTzIif6ll7Vm6xarYmg6MD6CQ+119J63Mga4QA9If5pYmUskV2UEAzPo6FCkB9@lists.linux.dev
X-Gm-Message-State: AOJu0YxgaMLZqLwZBUI9g/KPKYBwyyNTzDG0EOiSXobP08a1UqNgQTTe
	mDdW9ogPKUXj20YPuKWoCEi2yZS3+RdB/mtJUGQYV/Pf+FkyCfuaKySBVnpFwERnYpYVkyc19fj
	nsjKK2qm8jgpQKzsLnNfahkcXUp8=
X-Google-Smtp-Source: AGHT+IGNjWs1+IGJWQCuI91GRD71nHq/NY5PQyqItvGHIaL1LHK6EkU4XxTthkj1kk7esBeZYts7z61VH8Z6YZ97qNw=
X-Received: by 2002:a05:651c:513:b0:30b:c608:22bf with SMTP id
 38308e7fff4ca-326b75a7176mr17120381fa.9.1746723068995; Thu, 08 May 2025
 09:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505090001.FS7smjqJ-lkp@intel.com>
In-Reply-To: <202505090001.FS7smjqJ-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 May 2025 18:50:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>
X-Gm-Features: ATxdqUH1kEQLiV4VpbPUnYa_P_zZTyw1JaaitrjCogAC3TFf7PxDlQsfFk6Y7cA
Message-ID: <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>
Subject: Re: [ardb:for-kernelci 15/18] arch/x86/boot/startup/sev-startup.c:141:15:
 error: '__section__' attribute only applies to functions, global variables,
 Objective-C methods, and Objective-C properties
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey Nathan,

The error below looks bizarre to me. Any clue?

On Thu, 8 May 2025 at 18:20, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
> head:   f309d115ff0674e0ce4fe010e587d40bfb5b6e4e
> commit: 54ae382c92b4521365fde402a792038b968188f8 [15/18] x86/boot: Move startup code out of __head section
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505090001.FS7smjqJ-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
> >> arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
>      141 | static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
>          |               ^
>    include/linux/init.h:52:17: note: expanded from macro '__init'
>       52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
>          |                         ^
>    include/linux/compiler_attributes.h:321:56: note: expanded from macro '__section'
>      321 | #define __section(section)              __attribute__((__section__(section)))
>          |                                                        ^
> >> arch/x86/boot/startup/sev-startup.c:141:15: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>    include/linux/init.h:52:41: note: expanded from macro '__init'
>       52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
>          |                                                 ^
>    include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
>      113 | #define __cold                          __attribute__((__cold__))
>          |                                                        ^
>    1 warning and 1 error generated.
>
>
> vim +/__section__ +141 arch/x86/boot/startup/sev-startup.c
>
>    127
>    128  /*
>    129   * Initial set up of SNP relies on information provided by the
>    130   * Confidential Computing blob, which can be passed to the kernel
>    131   * in the following ways, depending on how it is booted:
>    132   *
>    133   * - when booted via the boot/decompress kernel:
>    134   *   - via boot_params
>    135   *
>    136   * - when booted directly by firmware/bootloader (e.g. CONFIG_PVH):
>    137   *   - via a setup_data entry, as defined by the Linux Boot Protocol
>    138   *
>    139   * Scan for the blob in that order.
>    140   */
>  > 141  static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
>    142  {
>    143          struct cc_blob_sev_info *cc_info;
>    144
>    145          /* Boot kernel would have passed the CC blob via boot_params. */
>    146          if (bp->cc_blob_address) {
>    147                  cc_info = (struct cc_blob_sev_info *)(unsigned long)bp->cc_blob_address;
>    148                  goto found_cc_info;
>    149          }
>    150
>    151          /*
>    152           * If kernel was booted directly, without the use of the
>    153           * boot/decompression kernel, the CC blob may have been passed via
>    154           * setup_data instead.
>    155           */
>    156          cc_info = find_cc_blob_setup_data(bp);
>    157          if (!cc_info)
>    158                  return NULL;
>    159
>    160  found_cc_info:
>    161          if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
>    162                  snp_abort();
>    163
>    164          return cc_info;
>    165  }
>    166
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
