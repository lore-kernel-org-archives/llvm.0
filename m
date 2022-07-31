Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB30F5C8B
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 20:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E3EC433D7
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659299344;
	bh=pD5duAqAKVwZ2XGf4smSm37mjDhEE7Ll6IHePEhQ14E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uBI78kQb9x7rrpHq6Y1xVQWgtZYUEklJu5OGxqC3/veTOEEvScCyUozot4WJX6YcT
	 cQBzUVc2UQk/DDdPHxRF0QbQ2IxPdDoIxYqtT7ssRmjLoaQWSGUxxLUrC6lhFUQ0Zy
	 jGnEIwu0C4D/n/zms1uqg8Wxodriu/gDuHGuFt4JLyFq1rG4+kuN+bLEbOjzfeDIuf
	 neRS7A9Av8T/9F+Fj3XIzJ5XSFBHkjGDcLqI9hPOCkau0Ba9cUhEi7ocJWt6+wTrN7
	 naWXLJGHO0y93fXQCylkMb5ycRjGFjFqUGwAVwKwUWyrfhx4F/QsnNhagwiAFc7bNO
	 QoFJPAODNOfUQ==
Received: by mail-wr1-f45.google.com with SMTP id z17so7110693wrq.4
        for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 13:29:04 -0700 (PDT)
X-Gm-Message-State: ACgBeo3uL2dg4op7c/OdglO1tcePAQTPQ1d/9H+DjIEJy1cDwGxi/o6X
	0Sn6CuAbxWCgbmfjcBB4SlCW7/Si78Ve0DGXSes=
X-Google-Smtp-Source: AA6agR79tdJ0bQV19BgfmBoGyMqfLrs/n9gMBlKcjvcWjFGe8T3+J9h0DQKmrIgZBhtlhS3+X8OG7Qh/6u7mKrTo2dU=
X-Received: by 2002:a05:6000:2a4:b0:21e:6e0e:df1f with SMTP id
 l4-20020a05600002a400b0021e6e0edf1fmr8362159wry.516.1659299342640; Sun, 31
 Jul 2022 13:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207301404.VdeSPptt-lkp@intel.com>
In-Reply-To: <202207301404.VdeSPptt-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 31 Jul 2022 22:29:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0w4iTQ9p+4Njfk8jPPv6dHn6dv-_VoE90rhToAwHY==A@mail.gmail.com>
Message-ID: <CAK8P3a0w4iTQ9p+4Njfk8jPPv6dHn6dv-_VoE90rhToAwHY==A@mail.gmail.com>
Subject: Re: [helgaas-pci:pci/header-cleanup-immutable 2/6]
 arch/x86/kernel/cpu/cyrix.c:277:3: error: use of undeclared identifier 'isa_dma_bridge_buggy'
To: kernel test robot <lkp@intel.com>
Cc: Stafford Horne <shorne@gmail.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 30, 2022 at 8:53 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/header-cleanup-immutable
> head:   933c5a4f87d92a865d1db76caf190f1a4a1927f9
> commit: abb4970ac33514c84b143516583eaf8cc47abd67 [2/6] PCI: Move isa_dma_bridge_buggy out of asm/dma.h
> config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220730/202207301404.VdeSPptt-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?id=abb4970ac33514c84b143516583eaf8cc47abd67

> >> arch/x86/kernel/cpu/cyrix.c:277:3: error: use of undeclared identifier 'isa_dma_bridge_buggy'
>                    isa_dma_bridge_buggy = 2;
>                    ^


This file now needs to #include the new linux/isa-dma.h header.

        Arnd
