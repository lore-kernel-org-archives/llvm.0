Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790D29AA
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651688052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0zlJgjvydDgnPqcmveoCO3N//MvSRzCyDmJy5zb+no=;
	b=ebjmJwc9ZF8Q4viNV5AJ1Hp8XTAYhSFPo28pvfs5XsUud7FtHWgDfs8Rm1ffbrlkT+CdEy
	9FJRyXTDnaqa63dF8kWZFquqY4WuqD8ocaGw7T/7Qh6bE00DcgiiXQoldPxuo68kGfGYxS
	6H9ACk77lVyedt97VsDOJNQG+4mzo6c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-Zfxvc7nrN9aj3BUdjSat_Q-1; Wed, 04 May 2022 14:14:09 -0400
X-MC-Unique: Zfxvc7nrN9aj3BUdjSat_Q-1
Received: by mail-ej1-f69.google.com with SMTP id qw30-20020a1709066a1e00b006f45e7f44b0so1297986ejc.5
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 11:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0zlJgjvydDgnPqcmveoCO3N//MvSRzCyDmJy5zb+no=;
        b=klp/I/VSmb9qq7bbnJSaTspGFSfWoXg8iR3QJtExkQV5KM/s0akcN175a32OzMgLDN
         pvY1GM/jqSZYZWjJJdp9AlyubcCrpssr3mIcPehIXQ7OFAnx9BtQ72D1LODpUgRiOvj0
         rhtdOtDVug0FMHNwQ1VNs6VxDSuvJDEqmcLgq0QipMnxXOCFMa7qEV6NIC3y4+SJMiPK
         GWrWgn8VkOkoFGINQnA6wUp1ObatMN14md4RCceVhdYBRUnChxFBsv6ccUQXu/052zY5
         K5E5IFat/F3GQurf2IdC0Avh8UswNwqSr89q1D9sYApGdD1qaa2slufblWB+DsVreQ3M
         tUyg==
X-Gm-Message-State: AOAM530nSIfejDT4PbFDo/+xl9iJeWGCEbQ/jNDlJquDJ8h5enS1lo4f
	g3YpE6cuEyjLFTKYmwdmFcxlOplOyygE2jqF/giqpLKKZVE+xpERZJkRmz3SzLBfgxymkj6jNIY
	S0Dd7Qnc0lVk0+cqSV2dwofqP8d/1Ug==
X-Received: by 2002:a05:6402:948:b0:425:ea37:96b8 with SMTP id h8-20020a056402094800b00425ea3796b8mr24153859edz.90.1651688047934;
        Wed, 04 May 2022 11:14:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTEBfb0ryOK/vx4ajvgOHhhpmbxc2K498YISD/TH1LmEO3NLmXijjaZhnJxBKsoUMIv486HQKaYcLmJx8MkqI=
X-Received: by 2002:a05:6402:948:b0:425:ea37:96b8 with SMTP id
 h8-20020a056402094800b00425ea3796b8mr24153831edz.90.1651688047690; Wed, 04
 May 2022 11:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205020637.JVJo3blw-lkp@intel.com> <YnK8f7cqMoHxSi0C@dev-arch.thelio-3990X>
In-Reply-To: <YnK8f7cqMoHxSi0C@dev-arch.thelio-3990X>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 4 May 2022 15:13:56 -0300
Message-ID: <CAJ6HWG5P6LXEY80tcXxtfvnPnhiNcqUvV+xyKygLbcw37UFvyw@mail.gmail.com>
Subject: Re: ld.lld: error: inline assembly requires more registers than
 available at line 523
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 2:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, May 02, 2022 at 06:29:38AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
> > commit: ba1f77c546966c12d86220d078e5838dcaeab348 x86/kvm: Fix compilation warning in non-x86_64 builds
> > date:   2 months ago
> > config: i386-randconfig-a012-20220502 (https://download.01.org/0day-ci/archive/20220502/202205020637.JVJo3blw-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba1f77c546966c12d86220d078e5838dcaeab348
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout ba1f77c546966c12d86220d078e5838dcaeab348
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: inline assembly requires more registers than available at line 523
> > >> ld.lld: error: inline assembly requires more registers than available at line 523
> >
>
> I don't think this bisection result is correct; this error is visible at
> v5.17-rc3, which this commit is based on. This is likely the same root
> cause as https://github.com/ClangBuiltLinux/linux/issues/1589, just with
> LTO. I'll reduce something down and comment there if it turns out to be
> different.
>
> Cheers,
> Nathan
>

Hello Nathan,
I went down on this issue, but I have no idea how to proceed. These
are my findings:
- This commit (ba1f77c546966c12d86220d078e5838dcaeab348) fixes the
build, thus allowing this error to happen later (in LTO stage)
- The commit that introduced this issue was 69d0db01e210, due to removing :
   ubsan-cflags-$(CONFIG_UBSAN_OBJECT_SIZE)       += -fsanitize=object-size
- Only by having this flag enabled in ubsan-cflags-y on
torvalds/master causes the build to succeed

At this point, given the commit message in 69d0db01e210 I was thinking
of finding & fixing the code that causes the ld.lld error to happen,
but I was lacking the skills to extract any filename from LTO step.

But it's also possible to create a patch just adding
'ubsan-cflags-$(CONFIG_SOMETHING)      += -fsanitize=object-size'
and fix this build.

What would you suggest?

Best regards,
Leo

