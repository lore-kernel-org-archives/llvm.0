Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF1D2C8B
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 06:55:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A1956136F
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634799326;
	bh=34zpGNXpzvVCbYQ1aEikfdAFYF+0jvNvk3BDxBNPokA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MKcYeLNVHGX+I4hOjUzVVl14PYQdcj2GJFS8XP/x38TFmXNDlELcZMKCa1la7vU1U
	 Stn5BVdLdlyJTbToHTwAe64JYeMYqZLvvJTHbQxKJZhwpADyn9HL3FJMyAf56Ce5jd
	 1UOjtPMhwvP4xbkKW6hQ2yDesR0oKGLGIi+aVgTjImq3nS5zTNngKtAmWX3Qi1bTEz
	 kNuZLEGYsqVUW7Cn7w8d/FDbZDZBEw5pjqgLythp+2Zh1WCsDMvMCKrDMT3LU4g6yj
	 VdF2O0pKQdP7wCEmpQdCGXwix1mcFKQhDoQArmrzOfb9Q6pdzbmWXIiydGJ5B1I8t1
	 7IQH881FezObw==
Received: by mail-wm1-f50.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso13267730wmb.3
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 23:55:26 -0700 (PDT)
X-Gm-Message-State: AOAM530ISoSMXzZvwaaIM1dNHPHrqx4abFCaLo3WLE0cGvBJDtxzQREv
	cLUgi95YfrKJJiNn/0moYKbHC1P93Ej9elE1CTQ=
X-Google-Smtp-Source: ABdhPJzn1dt269iT+Q+EyDaq5VPrY1mkBxgu8/HoFco/P3uBmivFdK4zhEqqqTrwjewpHuzyiVau24mWLDh7p4XjsZ8=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr4590078wmg.35.1634799325010;
 Wed, 20 Oct 2021 23:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110051030.J3Ub7djT-lkp@intel.com>
In-Reply-To: <202110051030.J3Ub7djT-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Oct 2021 08:55:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3uOV=AMmOTP09rBhyq2zJutDJiof-4uQ-7MbX9xyVivg@mail.gmail.com>
Message-ID: <CAK8P3a3uOV=AMmOTP09rBhyq2zJutDJiof-4uQ-7MbX9xyVivg@mail.gmail.com>
Subject: Re: [ardb:arm-vmap-stacks 5/20] arch/arm/mm/context.c:112:28: error:
 no member named 'task' in 'struct thread_info'
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Packard <keithpac@amazon.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 4:03 AM kernel test robot <lkp@intel.com> wrote:
>

> All errors (new ones prefixed by >>):
>
> >> arch/arm/mm/context.c:112:28: error: no member named 'task' in 'struct thread_info'
>            pid = task_pid_nr(thread->task) << ASID_BITS;
>                              ~~~~~~  ^
>    1 error generated.

I ran into this as well on my randconfig builds, though it happens very rarely.

Apparently CONFIG_THREAD_INFO_IN_TASK is incompatible with
CONFIG_PID_IN_CONTEXTIDR, but should be easy to fix by changing that
one line to do the right thing.

       Arnd
