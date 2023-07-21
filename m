Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D97E565
	for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 23:38:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d023f558cbaso2306752276.0
        for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 16:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689982722; x=1690587522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oI2k+n70r09++ymnvAIa7Gl6vaz4ByDtPCwimW7Q90=;
        b=7d2WPgTOR161B95SSw69r7f+ijCvihtTNkLyDXwhknhcNvG4wFvEktHMAq7jt4OHEm
         a3e/VqagtHMG34iCPhuDyLhcuLMUwQ+ifw2gjSQjnhogyjHu/FI+nODzi2OoomWJhu2A
         9jsM16yblubZxqV5CF/Eis8Njtr+hy0EjuT8w7svSYzu6q8wePkRu0h9rMQf26EwIin6
         1Te2vN0ulcLxjqFjlngUBmIFjM2PkO9fZTXmDZtnkmCBsgdN2fMEsSy/UGtd5VVDVTAK
         m49iaey4dLHD8rUeVTsLKM4flB0RDLAiEdM9DfKUUReLU7MXwIlMoBmaxf8XkCAebF5P
         xL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689982722; x=1690587522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oI2k+n70r09++ymnvAIa7Gl6vaz4ByDtPCwimW7Q90=;
        b=NnOFBRitEiIrDvWy31ZCGetNZCNkZWhGDDA09lw1HmvjMBLsnJTEP3ph9arCIgZOmG
         wl2MeZiDBb4NIGuPZMkln+9eNlj26sialJ0m3kJKx+qeklw6g9UKXe0lmrMBhYedGGzu
         qfxnU5CBi4SUw/tdvhq4lGLbK3my41+zgsnhzUs2b0oAdEyOB1q8imZGOws+ADd+El1D
         55NVXKjrvz+hJCufkg7OctMOTH6szFsSDeUAig7H9XdEMUMnTYNSIYCBshFm+9We+b2c
         UGXPY7dzbPYsu61AYGRvJSYfrFVLhJOycVlVbUzXJ2PaWgbyV4QEgVbTUmgw4LpGzGxb
         XSFQ==
X-Gm-Message-State: ABy/qLYCctfdwbDtxC/msTlBMOKUnNTQ6et+DFajHXKTlsKHrYiN85JU
	YlQ9FEYznvO3bRGsJhr57LV0K4VtMpc=
X-Google-Smtp-Source: APBJJlFDs5FHNs5v+9qnY6bXeicf3eDutpz6ueu60Qhp8gCv6VpW/IJ7YNk3G+Pic8BM3apO9vN7wvtGcoA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c9c3:0:b0:d00:f564:509b with SMTP id
 z186-20020a25c9c3000000b00d00f564509bmr36019ybf.1.1689982722574; Fri, 21 Jul
 2023 16:38:42 -0700 (PDT)
Date: Fri, 21 Jul 2023 16:38:41 -0700
In-Reply-To: <202307211945.TSPcyOhh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202307211945.TSPcyOhh-lkp@intel.com>
Message-ID: <ZLsXAdjFuKLpd3ig@google.com>
Subject: Re: arch/powerpc/kvm/e500mc.c:95:15: error: invalid instruction
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 21, 2023, kernel test robot wrote:
> Hi Sean,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f7e3a1bafdea735050dfde00523cf505dc7fd309
> commit: e83ca8cfa286c9fc78b585b0e66df7f542bcbcf2 KVM: PPC: booke: Mark three local functions "static"
> date:   4 months ago
> config: powerpc-randconfig-r001-20230721 (https://download.01.org/0day-ci/archive/20230721/202307211945.TSPcyOhh-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211945.TSPcyOhh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307211945.TSPcyOhh-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/powerpc/kvm/e500mc.c:95:15: error: invalid instruction
>       95 |         asm volatile("tlbilxlpid");

I assume this is a binutils bug?  I ran into a similar problem on PPC a while
back where I couldn't cross-compile even relatively basic PPC code.
