Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1A136D;
	Wed,  7 Dec 2022 09:10:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h10so17574944wrx.3;
        Wed, 07 Dec 2022 01:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XexAGe1dnyO8Tb1PpjMLyG9UePGMuGERQkoS5jrCkxE=;
        b=e34dKlDQUU9jG8gMwSv+lmeNSvVk9AqDs0cFDBPGxZtmE2HkLYI8u+P8B4UsHorkvV
         +T7nMj/8qHBWPiwY/Bk9XBEFCNDA0cDc0u9g+bih7bxCqXgj2lXoHIK1JzXC0I/kBmLg
         0ZS+Fo5MA4743ZOka++V/+77lz2rxUWNiooxXBF+Ll8cvz2vx3vkMP9sjz+zl78vnMyJ
         YeReYOJDwj3Mgxp3uRbAs66Fo9v7W5E6YnVL6YyP7tKAq1SGpFTA4Wyd5KkhtNS3612e
         JeVOGABcXvoc8gUmEuEAtYxj33CMOcCCprSoPX855ZbX8xvCdwNY8Sl8Ri4UUeNFR69b
         TfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XexAGe1dnyO8Tb1PpjMLyG9UePGMuGERQkoS5jrCkxE=;
        b=sGTpxKLLQVBp2DJCIVKdJM4VIeHF8BF4YMk4HnTPeEsuckdiz266kTl0Kxv8pQd03R
         YuCV2zI6Ci5sasHzMWusDSHm1z0khn50uJXsex1WNj8Gk1BtXoDUbMizyfvc8OlVJPcL
         wkSMnbd0a2Ch732H+/Ogusxdg96o+JrReyEJn9gvSZ0iQ9yYxjOAQmxI17XkwPVaKnCf
         Y+LFzgPq+e3M5M8apxyIcjQLSKxmQzI8DqSWWGO8471gDhZHtpFIMwNavKwzc3NkVmNZ
         mCyWFjL/hynLz0tgxF36kDJXXaTfySrPReXwVoFjdkyY/pSDxLOUeTHnNIVullmHqPB8
         9kyw==
X-Gm-Message-State: ANoB5pmLp1/jxFyRN+D8+MRlVvdvn9ElRGxsbsGNQnF1NGJvz/usR2HW
	nuXuEDxBcNeit8A0ktODQRo=
X-Google-Smtp-Source: AA0mqf47GL83IXl3JYGx/NF4AFWYddX1aErxcLfNCLyAHNzagQY1/KZBMHFyKUjMJe59lam/qmWt+Q==
X-Received: by 2002:a05:6000:1290:b0:242:733b:af28 with SMTP id f16-20020a056000129000b00242733baf28mr217195wrx.5.1670404198855;
        Wed, 07 Dec 2022 01:09:58 -0800 (PST)
Received: from gmail.com ([81.168.73.77])
        by smtp.gmail.com with ESMTPSA id a16-20020a5d4570000000b00242109cf587sm19103840wrc.28.2022.12.07.01.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:09:58 -0800 (PST)
Date: Wed, 7 Dec 2022 09:09:55 +0000
From: Martin Habets <habetsm.xilinx@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: drivers/net/ethernet/sfc/siena/selftest.c:46:15: warning: field
 ip within 'struct efx_loopback_payload' is less aligned than 'struct iphdr'
 and is usually due to 'struct efx_loopback_payload' being packed, which can
 lead to unaligned accesses
Message-ID: <Y5BYY71+ifu3D45z@gmail.com>
References: <202212050514.lAJ4GhwN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212050514.lAJ4GhwN-lkp@intel.com>

On Mon, Dec 05, 2022 at 06:09:17AM +0800, kernel test robot wrote:
> Hi Martin,
> 
> FYI, the error/warning still remains.

We are looking into this, it will take a bit of a rewrite for fix
the warning. We have not had reports of an actual unaligned accesses
happening.

Martin

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c2bf05db6c78f53ca5cd4b48f3b9b71f78d215f1
> commit: c5a13c319e10e795850b61bc7e3447b08024be2e sfc: Add a basic Siena module
> date:   7 months ago
> config: arm-randconfig-r012-20221205
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c5a13c319e10e795850b61bc7e3447b08024be2e
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout c5a13c319e10e795850b61bc7e3447b08024be2e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/ethernet/sfc/siena/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/net/ethernet/sfc/siena/selftest.c:46:15: warning: field ip within 'struct efx_loopback_payload' is less aligned than 'struct iphdr' and is usually due to 'struct efx_loopback_payload' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct iphdr ip;
>                         ^
>    1 warning generated.
> 
> 
> vim +46 drivers/net/ethernet/sfc/siena/selftest.c
> 
> d48523cb88e0703 Martin Habets 2022-05-09  37  
> d48523cb88e0703 Martin Habets 2022-05-09  38  /*
> d48523cb88e0703 Martin Habets 2022-05-09  39   * Loopback test packet structure
> d48523cb88e0703 Martin Habets 2022-05-09  40   *
> d48523cb88e0703 Martin Habets 2022-05-09  41   * The self-test should stress every RSS vector, and unfortunately
> d48523cb88e0703 Martin Habets 2022-05-09  42   * Falcon only performs RSS on TCP/UDP packets.
> d48523cb88e0703 Martin Habets 2022-05-09  43   */
> d48523cb88e0703 Martin Habets 2022-05-09  44  struct efx_loopback_payload {
> d48523cb88e0703 Martin Habets 2022-05-09  45  	struct ethhdr header;
> d48523cb88e0703 Martin Habets 2022-05-09 @46  	struct iphdr ip;
> d48523cb88e0703 Martin Habets 2022-05-09  47  	struct udphdr udp;
> d48523cb88e0703 Martin Habets 2022-05-09  48  	__be16 iteration;
> d48523cb88e0703 Martin Habets 2022-05-09  49  	char msg[64];
> d48523cb88e0703 Martin Habets 2022-05-09  50  } __packed;
> d48523cb88e0703 Martin Habets 2022-05-09  51  
> 
> :::::: The code at line 46 was first introduced by commit
> :::::: d48523cb88e0703055c1b33e61eb644a7976f92b sfc: Copy shared files needed for Siena (part 2)
> 
> :::::: TO: Martin Habets <martinh@xilinx.com>
> :::::: CC: Jakub Kicinski <kuba@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
