Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D2933CA
	for <llvm@lists.linux.dev>; Fri,  6 Jan 2023 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673015846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P/zfGuEErfx9YxOb8v5xGvNVY0pRdOYDG3xC/nVLZ30=;
	b=LzahyLOiYxfBw8+iz6KJdvbXLzxyGKM38tJXuvZ99jWXkRaa/pWiyWxnw96ad3VDUa2eXu
	7q4jlekkasA/LqLYg9M/U5fpDBPx9jLNVaQku8V76TftuHrNV3w7hQrjxJbj82bVr65Szq
	yH27ihWZYsAqqHcHol1SvEh7iCg56mw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-PNN2D1krPcaa-CH_uECV-Q-1; Fri, 06 Jan 2023 09:37:25 -0500
X-MC-Unique: PNN2D1krPcaa-CH_uECV-Q-1
Received: by mail-il1-f198.google.com with SMTP id i14-20020a056e020d8e00b003034b93bd07so1207388ilj.14
        for <llvm@lists.linux.dev>; Fri, 06 Jan 2023 06:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/zfGuEErfx9YxOb8v5xGvNVY0pRdOYDG3xC/nVLZ30=;
        b=ZNswxpGTc+DR7PODokflhwdDcvf346YfJFHOh2yeX3Fi54ljLRtoP936bXBeClrn41
         rMxc+/8TXG9xLspHjPIS5V8qoVG9/vDJAQQx/IGxtebGptOxkD1ZPMMkgbQvzy8ABJNC
         g4CwBCNEeTLKovo/9YxuSdoIM2EFJZHdLN5FhcZ+eerNRnCGQwJapoJ+4CFb9oIG6ofz
         0XTS4A/ivrSMxdN2IMT1uJM+YA+W3bgN9KhZGyeTzPWjn2IgktKgpdoid+BN3nxK3ubE
         W6//j3UFmFBQbc4gTFOHRCmMPZfZRyu0M1j5p0lhDRPgWYYCYKqGF5jsmwS5/9TKjjZN
         ojLQ==
X-Gm-Message-State: AFqh2kpVNH1uZ7rgVMlxpCj5Qu3EeONGE9ttuE2HynyvJejVo5e7AkB7
	5TlvmQLKt0kwJULtk2tYZ0iYCjX+S6cT3Nl7nxQhdgQtawkkqt938CqsvSESZGW3qyHqQi550CV
	ju4ydW6wfKeM0ZctvWFwBgFBNUKUcYg==
X-Received: by 2002:a02:54c7:0:b0:38a:757f:dac9 with SMTP id t190-20020a0254c7000000b0038a757fdac9mr4442645jaa.84.1673015844323;
        Fri, 06 Jan 2023 06:37:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvM4bw2Ko76z00L7EjKh+skm8JncjwnAQJE6ihiSkxq86ANz2AZ+mFp90pOVnrlYrhleh2gJGZWL4Ra8my8I3c=
X-Received: by 2002:a02:54c7:0:b0:38a:757f:dac9 with SMTP id
 t190-20020a0254c7000000b0038a757fdac9mr4442635jaa.84.1673015844043; Fri, 06
 Jan 2023 06:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230106102332.1019632-9-benjamin.tissoires@redhat.com> <202301062140.zfdqzE9b-lkp@intel.com>
In-Reply-To: <202301062140.zfdqzE9b-lkp@intel.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 6 Jan 2023 15:37:12 +0100
Message-ID: <CAO-hwJK3RetR9T_=4C+3Fmj-ThNx-3XWgrOJGAL9VebM-PdgLw@mail.gmail.com>
Subject: Re: [PATCH HID for-next v1 8/9] HID: bpf: clean up entrypoint
To: kernel test robot <lkp@intel.com>
Cc: Greg KH <greg@kroah.com>, Jiri Kosina <jikos@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Tero Kristo <tero.kristo@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 2:42 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Benjamin,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on hid/for-next]
> [also build test WARNING on next-20230106]
> [cannot apply to shuah-kselftest/next shuah-kselftest/fixes char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.2-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/selftests-hid-add-vmtest-sh/20230106-182823
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> patch link:    https://lore.kernel.org/r/20230106102332.1019632-9-benjamin.tissoires%40redhat.com
> patch subject: [PATCH HID for-next v1 8/9] HID: bpf: clean up entrypoint
> config: i386-randconfig-a013
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/46336953b47885c5111b7c1a92403b3d94cf3d41
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Benjamin-Tissoires/selftests-hid-add-vmtest-sh/20230106-182823
>         git checkout 46336953b47885c5111b7c1a92403b3d94cf3d41
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/bpf/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/hid/bpf/hid_bpf_jmp_table.c:502:6: warning: no previous prototype for function 'call_hid_bpf_prog_put_deferred' [-Wmissing-prototypes]
>    void call_hid_bpf_prog_put_deferred(struct work_struct *work)
>         ^
>    drivers/hid/bpf/hid_bpf_jmp_table.c:502:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void call_hid_bpf_prog_put_deferred(struct work_struct *work)
>    ^
>    static
>    1 warning generated.
>
>
> vim +/call_hid_bpf_prog_put_deferred +502 drivers/hid/bpf/hid_bpf_jmp_table.c
>
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  501
> 0baef37335dd4d Benjamin Tissoires 2022-11-03 @502  void call_hid_bpf_prog_put_deferred(struct work_struct *work)
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  503  {
> ade9207f04dc40 Benjamin Tissoires 2023-01-06  504       /* kept around for patch readability, to be dropped in the next commmit */
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  505  }
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  506
>

Oops, this function should have been dropped in 8/9 "HID: bpf: clean
up entrypoint". It's now dead code. I'll fix it in v2.

Cheers,
Benjamin

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

