Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8DF1D2A9
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 21:39:41 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-25e89791877so3055851a91.2
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687383581; x=1689975581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMQGKrnwxJrYKagQrGNd4HzBWauMpUnU63pcxUio84Q=;
        b=RjsdU3Z7MemvIOsOm+J6epw1Da5oDqUFcQj7hPXtoM07I5aKCN1O/Ec61j/I+Bt/Jk
         iO/56fh+i5GjcvWZNRk0BPlV+rs2So+t6fS/USYtxV4JCEKZGpl5mqsnavtwqrFNhVf0
         SozDO4u4Xr7eFaEMsLVk+4LzP1IAL17XkogEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687383581; x=1689975581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMQGKrnwxJrYKagQrGNd4HzBWauMpUnU63pcxUio84Q=;
        b=E2w1EGC48RPI+JxcJNcPYhXqtZUcyyOk1TkF274nZ9akp3GD1cS0/JdkYI2K3nbQiw
         w3QVnY43T/Bc6HbyPw9STpnkivXnhHCINxHQUiJVTzB7s0IlIsLUTW8kzFAaagAJkVTh
         jEPCWYgF1jkeN2p577d6W2Pgk6N9IIFeIE55L/cTVwBuPZClrnFuljzqG+UPeNCtEZdU
         99vjOs6+RvekdBv5bxtMr1MdWd4FgSsMbf0ceH0OyO0MCy4GC8APyIpyxDvIaEhINeJm
         NUOJ9bsVtwpYzmoi/BVMtQKfZjN4GaFrXVd/HLkRx6/K+BD0HZvc1Gxu9+nT/4nv0p03
         92zA==
X-Gm-Message-State: AC+VfDyTcIJVCAvy8hYv0x1exV4A8pKsHd9MBQDpcKDXJK0yvfLDS8ew
	jundTA+wmnaCEsZtYQr04YleLA==
X-Google-Smtp-Source: ACHHUZ6ncMjo1q4HvqrqyxPoLFnGjEfqfAMeVa1q+LhlzHMxG2JfRgkZMMsKBe/2H+Zd9zkQ386CjA==
X-Received: by 2002:a17:90a:c905:b0:258:818a:fd65 with SMTP id v5-20020a17090ac90500b00258818afd65mr9890799pjt.30.1687383580740;
        Wed, 21 Jun 2023 14:39:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090a7f8300b002563e8a0225sm3591485pjl.48.2023.06.21.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 14:39:40 -0700 (PDT)
Date: Wed, 21 Jun 2023 14:39:39 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [linux-next:master 2819/11071] fs/ceph/addr.c:794:12: warning:
 stack frame size (2096) exceeds limit (2048) in 'ceph_writepages_start'
Message-ID: <202306211437.EDDEDA582@keescook>
References: <202306210637.TpfYq9gM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306210637.TpfYq9gM-lkp@intel.com>

On Wed, Jun 21, 2023 at 06:56:36AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9dbf40840551df336c95ce2a3adbdd25ed53c0ef
> commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [2819/11071] kbuild: Enable -fstrict-flex-arrays=3

This looks very much like:
https://lore.kernel.org/all/202306100035.VTusNhm4-lkp@intel.com/

> config: riscv-randconfig-r004-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210637.TpfYq9gM-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210637.TpfYq9gM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306210637.TpfYq9gM-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/ceph/addr.c:794:12: warning: stack frame size (2096) exceeds limit (2048) in 'ceph_writepages_start' [-Wframe-larger-than]
>    static int ceph_writepages_start(struct address_space *mapping,
>               ^
>    1820/2096 (86.83%) spills, 276/2096 (13.17%) variables
>    1 warning generated.

This appears to be a clang stack slot reuse issue. It continues to be
investigated.

-Kees

-- 
Kees Cook
