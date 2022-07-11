Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB11FA6
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 18:44:17 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so9208712pjl.5
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J7LwcaH/4ZJxBfsg6OaMDgqa4Pbc62u2OyXlJzlw9do=;
        b=ntwjDY2nSfK73KyfSvT+W/5MoQK5AetF8XDSAEBubzlKS5FLSZ8UMwit+blTxvyUrr
         rz5Mbirtp81JlJDNuwDSU/t4vhlr4kVvmyjnDUu2ydqFXFKZ5Ug3dPxIWPMPzC5YSyav
         uvz09n2HmfJ3DqNVucEs3MImOhYyNhWCe0nCG5IcXc1cHxGbXghcmjSoZbMYKCcPrzIv
         VlnyCF5kbFhdbS4pEi3I4aNwvTgmECtAaTCI3MCUBtjK2yL7mKpPW+hTrouqpyi+oDN3
         VDSa5LG6aSr4CjYnk+lpAkQh71lLoPy2GkoEknygs68bF2yzu462J4NuhWLM6f7gkD+G
         uHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J7LwcaH/4ZJxBfsg6OaMDgqa4Pbc62u2OyXlJzlw9do=;
        b=M22NXHKiB/uKbhDwzQlYkFLIQiXe9Ao3MO9PzGzaw5cPslWHR0s5m+WKLHLm2EAtjs
         MmvoGIG0L3V55whPqb6D83n3HBs/B9EsyMG/ILbL77JOAKLwEgkXRa1Z52j7yasRsgEx
         ItyXYeT0Xq6t8BgwUHmmxwJS5At5kwc7/Y6PCTAufKEIJXV6QuyutT/jOrQu5cPWlVEO
         fsCIcffbWrnkabDe8tBHqvOGjIfFRQqW0s54FBWmsAnLMt+ZXUJ/K+Pfdv6Vzd2vam70
         K4lQVZ2c8C/zUSTKRo6gRUIs6V271i9CthY1zz0QDnDSf6wFvmN6sDnRQYlBXUf76RrF
         JJwQ==
X-Gm-Message-State: AJIora8W405hlxgYnmWXcb5AQQf31Szu0y+l6kVF6Ypdc6yrTF/RiMtG
	xm5WNuwyjAAhbZxPTlp9tIqFkALklrgapOAIc4dUTg==
X-Google-Smtp-Source: AGRyM1tfGXlm4xazcR7kvzTtVPgwxkaCg9LijfWYSCwwHrXilEf9eTDcbeFIk4hpupUm+gcikEf33SSuxEzSJWEpb4Y=
X-Received: by 2002:a17:903:1111:b0:16a:acf4:e951 with SMTP id
 n17-20020a170903111100b0016aacf4e951mr19787208plh.72.1657565057412; Mon, 11
 Jul 2022 11:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207100408.3Fsr7rOp-lkp@intel.com>
In-Reply-To: <202207100408.3Fsr7rOp-lkp@intel.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Mon, 11 Jul 2022 11:44:06 -0700
Message-ID: <CAKH8qBsadO3=RhEnd-=wd783XiErUorozW09rNKnnRmGCZqTwQ@mail.gmail.com>
Subject: Re: [linux-next:master 5835/8914] ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_current
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 9, 2022 at 1:07 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f2528c29385819a84480cacef4886b049761e2c5
> commit: 69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e [5835/8914] bpf: per-cgroup lsm flavor
> config: arm64-randconfig-r013-20220708 (https://download.01.org/0day-ci/archive/20220710/202207100408.3Fsr7rOp-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f6839980bfac61babb40d83772c51427011)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_current
>    >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
>    >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
>    >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
>    >>> referenced 1 more times
> --
> >> ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_socket
>    >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
>    >>> referenced by bpf_lsm.c:0 (kernel/bpf/bpf_lsm.c:0)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
> --
> >> ld.lld: error: undefined symbol: __cgroup_bpf_run_lsm_sock
>    >>> referenced by bpf_lsm.c:65 (kernel/bpf/bpf_lsm.c:65)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
>    >>> referenced by bpf_lsm.c:65 (kernel/bpf/bpf_lsm.c:65)
>    >>> bpf/bpf_lsm.o:(bpf_lsm_find_cgroup_shim) in archive kernel/built-in.a
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

More esoteric configurations:

CONFIG_BPF_LSM=y
# CONFIG_CGROUP_BPF is not set

Will fix it sometime this week along with the other warning about unused 'args'.
