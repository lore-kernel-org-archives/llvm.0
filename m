Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20412560;
	Fri, 17 Feb 2023 09:07:44 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id cs11so595804qvb.9;
        Fri, 17 Feb 2023 01:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uETbKlrc042hse1IeL+66tEEBop9Jun/9u11FjpcZk=;
        b=q4634C6/EA668M1sTY5X/yOxQ7Z7wQdYWSpd32Z9V3ZbFMqMr1Trorqig0dewvfuYx
         EtgwWf+4HRYNu6M1KvJLNicI3TTgFnvRhjtunqaZWmfhge6FeLFtgqV6ilLSFHaok+TB
         s3Zifv3Ioxbd9YicOy/eOvP2qVIMU5421DejCeOwnh3OAC7RfQ+9KmoNZXCn0B5msU9v
         r7QgELdppCMFzlimpLlX4xRRV/IKjH99ue/06yIe0S9RH9y6jwulKEKfUml3vJ9LH9+T
         nARCtFPfPOc+4gkuAjCmaayChSsAKjb53wGkjF0mBj/GvQkNAKfVgd2D63tx7A1lpGU/
         wDSg==
X-Gm-Message-State: AO0yUKWn9U9t+GeOMQ+EfyII6jMIgVebuLZjycZ84S5H5BOFwulRGfrJ
	cTeK/qIvQXKyoEs5diLE7iJ/7mmNVk8fOVDq
X-Google-Smtp-Source: AK7set/ciCuHO9DFHCkoW8KiQ+BxZtxXlm19YnkrrB7UauwpgGRSDe2krZhrregOLIM9/RPnDVVnzg==
X-Received: by 2002:a05:6214:19c9:b0:570:bf43:48c with SMTP id j9-20020a05621419c900b00570bf43048cmr1471051qvc.17.1676624863379;
        Fri, 17 Feb 2023 01:07:43 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id j68-20020a378747000000b00731fe65bef2sm2935674qkd.66.2023.02.17.01.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 01:07:42 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5342c9c53a0so29772607b3.2;
        Fri, 17 Feb 2023 01:07:42 -0800 (PST)
X-Received: by 2002:a0d:f347:0:b0:4fc:962d:7dc1 with SMTP id
 c68-20020a0df347000000b004fc962d7dc1mr1001435ywf.301.1676624862400; Fri, 17
 Feb 2023 01:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302171144.sffQigLX-lkp@intel.com>
In-Reply-To: <202302171144.sffQigLX-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Feb 2023 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3yhaqYo1bqN_AH3QFfiyMPwZ8TpiwzsAZTYML8ReFww@mail.gmail.com>
Message-ID: <CAMuHMdX3yhaqYo1bqN_AH3QFfiyMPwZ8TpiwzsAZTYML8ReFww@mail.gmail.com>
Subject: Re: drivers/iommu/io-pgtable-arm.c:330:8: error: instruction requires
 the following: RV64I Base Instruction Set
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-riscv

On Fri, Feb 17, 2023 at 4:50 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3ac88fa4605ec98e545fb3ad0154f575fda2de5f
> commit: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1 riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
> date:   3 months ago
> config: riscv-buildonly-randconfig-r003-20230216 (https://download.01.org/0day-ci/archive/20230217/202302171144.sffQigLX-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8292493c22c8e28b6e67a01e0f5c6db1cf231eb1
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iommu/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302171144.sffQigLX-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/iommu/io-pgtable-arm.c:330:8: error: instruction requires the following: RV64I Base Instruction Set
>            old = cmpxchg64_relaxed(ptep, curr, new);
>                  ^
>    include/linux/atomic/atomic-instrumented.h:1968:2: note: expanded from macro 'cmpxchg64_relaxed'
>            arch_cmpxchg64_relaxed(__ai_ptr, __VA_ARGS__); \
>            ^
>    include/linux/atomic/atomic-arch-fallback.h:60:32: note: expanded from macro 'arch_cmpxchg64_relaxed'
>    #define arch_cmpxchg64_relaxed arch_cmpxchg64
>                                   ^
>    arch/riscv/include/asm/cmpxchg.h:354:2: note: expanded from macro 'arch_cmpxchg64'
>            arch_cmpxchg((ptr), (o), (n));                                  \
>            ^
>    arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from macro 'arch_cmpxchg'
>            (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>                                 ^
>    arch/riscv/include/asm/cmpxchg.h:324:4: note: expanded from macro '__cmpxchg'
>                            "0:     lr.d %0, %2\n"                          \
>                            ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            0:      lr.d s4, 0(s0)
>                    ^

This is a bug in arch/riscv/include/asm/cmpxchg.h, which doesn't
cater for the CONFIG_32BIT=y case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
