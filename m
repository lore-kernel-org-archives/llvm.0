Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B4420E8;
	Fri, 14 Jul 2023 13:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63029C433C8;
	Fri, 14 Jul 2023 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689342794;
	bh=5zsqN27CRP4fgT+KSU111Jy7baDcv6ghx8mp4s4VY/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLh1SnOB0d6V1mG2pR58QC7NXiw6JV/HeuQJGz3soO38ub4I66IjQ82dDit00sJ2O
	 L6//7voBISqK+Fg9yq8laLH8BnCkQ7zeme+VqIQ7fNO8jf2Z0/FDLsKnFLp/rfHjxQ
	 fAAnnOxF6/uGD8yZtI9eToo+O6dq3ch6bH0x4e7uI5pdU+9stONu83w9jP6PhFgjJf
	 tKWenroS6VlWVwprbS/fLQ/itp/sxecUZSfc24nRZWIBPSApJzqUhQfEdFqPf6sky6
	 awyynyYQdBrUIAQfq5tUJo8md8GxNBlVdLsvlk/UJT/hWIcjG2p3eLSdvJ3hmV/+B5
	 OyM07NvaASxqQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id DFE3140516; Fri, 14 Jul 2023 10:53:11 -0300 (-03)
Date: Fri, 14 Jul 2023 10:53:11 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>
Subject: Re: [linux-next:master 754/1391] /bin/bash: line 1: 50431
 Segmentation fault LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/pcmcia/pcmcia_core.ko
Message-ID: <ZLFTR+E1nQVtFbbB@kernel.org>
References: <202307112158.3RFyuSZJ-lkp@intel.com>
 <CAEf4BzaWmYcJTLc5837wA8T4KOWcQaxgh6LpYR53kT-8HoQDSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzaWmYcJTLc5837wA8T4KOWcQaxgh6LpYR53kT-8HoQDSQ@mail.gmail.com>
X-Url: http://acmel.wordpress.com

Em Tue, Jul 11, 2023 at 03:20:43PM -0700, Andrii Nakryiko escreveu:
> On Tue, Jul 11, 2023 at 6:52 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8e4b7f2f3d6071665b1dfd70786229c8a5d6c256
> > commit: c628747cc8800cf6d33d09f7f42c8b6f91e64dc7 [754/1391] libbpf: only reset sec_def handler when necessary
> > config: arm-randconfig-r032-20230710 (https://download.01.org/0day-ci/archive/20230711/202307112158.3RFyuSZJ-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112158.3RFyuSZJ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307112158.3RFyuSZJ-lkp@intel.com/
> >
> > Note: the linux-next/master HEAD 8e4b7f2f3d6071665b1dfd70786229c8a5d6c256 builds fine.
> >       It may have been fixed somewhere.
> >
> > All errors (new ones prefixed by >>):
> >
> >    die__process_unit: DW_TAG_subrange_type (0x21) @ <0x14a5b> not handled!
> >    die__process_unit: tag not supported 0x21 (subrange_type)!
> >    die__process_unit: DW_TAG_subrange_type (0x21) @ <0x1e457> not handled!
> >    die__create_new_array: DW_TAG_union_type (0x17) @ <0x14a70> not handled!
> >    die__process_class: DW_TAG_compile_unit (0x11) @ <0x1e4bc> not handled!
> >    die__process_class: tag not supported 0x11 (compile_unit)!
> > >> /bin/bash: line 1: 50431 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/pcmcia/pcmcia_core.ko
> >
> 
> Cc'ing Arnaldo and Eduard. I don't know if it's the same as [0], but
> just in case please take a look.
> 
>   [0] https://lore.kernel.org/bpf/20230710200002.ca4okot5rrvewqvb@altlinux.org/

I'll try to reproduce, but if the vmlinux and pcmcia_core.ko files that
were produced in this test run could be made available, that would speed
up things.

Otherwise I'll try to use https://download.01.org/0day-ci/archive/20230711/202307112158.3RFyuSZJ-lkp@intel.com/reproduce

Thise are not types that usually appear in C, so perhaps the
--lang_exclude=rust isn't working for some reason, i.e. looking at the
DW_TAG_compile_unit to se the DW_AT_language.

Processing arrays and getting a union type? Interesting :-)

- Arnaldo
