Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467015D9
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 23:02:26 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id g12so9080275pfb.3
        for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HiqBkou7TsDXWZ2bZ9jDnOVGt8hHICY7VSsWQ2Opi0I=;
        b=IS3SvA25XetUr6LNZ+s3A/JfWHVWla1uJ3dL+GWYRa3wB0jbYs2SaFtdR1ONZmuo/7
         gEQyEVKf8LgB8ubET2nLYEzmlU4jidwAl9vlHXILgkm8ipNaP6p8albKDo3Qd9JjmBFu
         QvYa2G5IE/CJ69chHtBUWAWPPfdRzKUyOBIcNYxMebCZt4664vxJdhxO5Qn0xaSeit/N
         hL2/0w+/miUhMW7Vnxg08jCjKTHSbncRsh5JW89AqX4h4uZgmb/Tfet8UdKaASW6DcQQ
         WaxBj1SIEj0Qt5L1OiML2vPalCr1uzng0aV6wNIWnqFGe4nA0oBkr+/+hRre0G4wKbNm
         3SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HiqBkou7TsDXWZ2bZ9jDnOVGt8hHICY7VSsWQ2Opi0I=;
        b=gBwJ/7Z6a7jZ56OXBO7v1FYM6NSFwF+kq5VDuQ35GViBPQ0+aE6sXaqYQhWze1PLXL
         B/g8qxy6aK/d/ouKmcQXBcvmkskdWdDl/YwkKMtwUP2OsI6FtHZ7c7TPlOssETcrLa6B
         MvFRZeweZUjhmuktRSI53da1ZjsKR0DACf3NNNVl4zhihrwjUa93rIZgtev8QvYMXLQA
         Bp30atELClDhK42DNBe67IXEkA5FQ01u/ptMkWZ7XRwfgYcK7PqTySQSj+pskGyMQz2C
         N1aElUdVsLdtNW6DuT7aqYFwTciYnzElelLBTze+nTrvpX7JJCmHsTLz/eoKRdFhREI+
         RCqw==
X-Gm-Message-State: AJIora8ryaT8arVt3+F0GuoCuVNHwViPtLAsqWLc6wKlgF1j3JN9K0rt
	fsPno1C34nWxr3YLRXSToHA=
X-Google-Smtp-Source: AGRyM1sE4jYBZfkZMDOxr5DyoRi73yAzT1WIcsVuRu8+at9KvBjAeMycEocydbJLxo1scKp+wpJ7bQ==
X-Received: by 2002:a63:d055:0:b0:41b:539c:7125 with SMTP id s21-20020a63d055000000b0041b539c7125mr10860043pgi.461.1659308545891;
        Sun, 31 Jul 2022 16:02:25 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b0016d710d8af7sm7957855pln.142.2022.07.31.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 16:02:25 -0700 (PDT)
Date: Mon, 1 Aug 2022 08:02:23 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [helgaas-pci:pci/header-cleanup-immutable 2/6]
 arch/x86/kernel/cpu/cyrix.c:277:3: error: use of undeclared identifier
 'isa_dma_bridge_buggy'
Message-ID: <YucJ/9tvO1t8EbZs@antec>
References: <202207301404.VdeSPptt-lkp@intel.com>
 <CAK8P3a0w4iTQ9p+4Njfk8jPPv6dHn6dv-_VoE90rhToAwHY==A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0w4iTQ9p+4Njfk8jPPv6dHn6dv-_VoE90rhToAwHY==A@mail.gmail.com>

On Sun, Jul 31, 2022 at 10:29:00PM +0200, Arnd Bergmann wrote:
> On Sat, Jul 30, 2022 at 8:53 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/header-cleanup-immutable
> > head:   933c5a4f87d92a865d1db76caf190f1a4a1927f9
> > commit: abb4970ac33514c84b143516583eaf8cc47abd67 [2/6] PCI: Move isa_dma_bridge_buggy out of asm/dma.h
> > config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220730/202207301404.VdeSPptt-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?id=abb4970ac33514c84b143516583eaf8cc47abd67
> 
> > >> arch/x86/kernel/cpu/cyrix.c:277:3: error: use of undeclared identifier 'isa_dma_bridge_buggy'
> >                    isa_dma_bridge_buggy = 2;
> >                    ^
> 
> 
> This file now needs to #include the new linux/isa-dma.h header.

There is a patch on the branch that adds the include but it was not added into
the patch 2/6 as we took the branch to be immutable to allow riscv to have
branch to resolve a merge conflict.

-Stafford
