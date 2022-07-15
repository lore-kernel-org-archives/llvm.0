Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4BB2F34
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 11:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CB2C341C8
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657883362;
	bh=rtsRiustw1jcqat2Hy4pt0UdCK21bQkCfWrR0Ji81xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rXtYe11kssl2UWw/7jxTAmDWgyYpkWgceOFf9WVSkaMpOSZ1sbKpLlNZYQgO2Nk7+
	 FwaTwR7skQCZkzWH8/U6R/wcLUccAdouOtU/T/Ijsvz6npE2kfEllxg2Tr1MjtQANF
	 1KhzYpExysakpOtKD8nOb+7gHQGx0LiOzhVIJo7EWX7hBtl4AYjshe97BmwOvuPhTs
	 wVAsXpToX9CKhAC6/H0glbtYL7Dh/fSokuT509B0ySvs4KIz2jrI7jeRtow6Lb/oEc
	 CzqtVOct09KMUoKG7WuT9RLUZBfchLFNfFt3qU9HuMVUKiH7ArXJJ3SJAKlY2FMdly
	 KfWDQiG6N3bmA==
Received: by mail-yb1-f173.google.com with SMTP id c131so7179522ybf.9
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 04:09:22 -0700 (PDT)
X-Gm-Message-State: AJIora8Dtj2jPu4ETfizouUHM4B9VZCQRQ58DO82KbV0tt+NvUXGQWtw
	b7/kf5yp2N6bzpR1P2y2l0Jftj8Xri/JiSGCy3Q=
X-Google-Smtp-Source: AGRyM1vJcN9sDyn046RuutLtimHnSVmCGeQYjrZwlEcPDPkv7YZM2bUWJzF9Z/2By4vgZdxgvE9+Cc5wXVjvZqdcdRg=
X-Received: by 2002:a25:73d1:0:b0:66e:aee4:feb3 with SMTP id
 o200-20020a2573d1000000b0066eaee4feb3mr13802426ybc.452.1657883361215; Fri, 15
 Jul 2022 04:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713145234.2356641-1-tytso@mit.edu> <202207150617.dHbSxB55-lkp@intel.com>
In-Reply-To: <202207150617.dHbSxB55-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jul 2022 13:09:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1zoKAhfZ+zoukwUTFbi9LYdVPFR7wMJ47WSOQ5zNVMRQ@mail.gmail.com>
Message-ID: <CAK8P3a1zoKAhfZ+zoukwUTFbi9LYdVPFR7wMJ47WSOQ5zNVMRQ@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem: add support for FS_IOC_[SG]ETFLAGS for tmpfs
To: kernel test robot <lkp@intel.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Hugh Dickins <hughd@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 1:01 AM kernel test robot <lkp@intel.com> wrote:
>
> >> mm/shmem.c:1062:22: error: use of undeclared identifier 'EXT2_APPEND_FL'
>            if (info->fsflags & EXT2_APPEND_FL)
>                                ^
> >> mm/shmem.c:1064:22: error: use of undeclared identifier 'EXT2_IMMUTABLE_FL'
>            if (info->fsflags & EXT2_IMMUTABLE_FL)
>                                ^
> >> mm/shmem.c:1066:22: error: use of undeclared identifier 'EXT2_NODUMP_FL'
>            if (info->fsflags & EXT2_NODUMP_FL)
>                                ^


I suppose this just needs to use FS_APPEND_FL/FS_IMMUTABLE_FL/FS_NODUMP_FL
instead of the ext2 alias names?

      Arnd
