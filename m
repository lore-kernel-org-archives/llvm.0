Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0D1DDEE;
	Tue, 11 Jul 2023 22:20:56 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e590a8ab5so3591219a12.2;
        Tue, 11 Jul 2023 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689114055; x=1691706055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijAc3WnxPpnwtqHq2IpzbsH58VD57C5vE29sFFjhsnw=;
        b=aAtUyZwFpJVEzYYVK1iByTFD1w1wFrsd1wYq3IYdJA8Pnyzt20Nefme6G0Uhv2dn3e
         MHPdNQCXCGMsWiAWqYACxROPufVAJaD+8p5PJWDseq+xglBV+KI4Lt2ZP9WV/UvLOKc8
         ah1AHOxiGU+mNj/e9K9Dl52aDhZicAM8EO26QXFELTy2h0edauQG1S9PC/0aZrYiHfdp
         OV3Y+TPFzIPXXOOh++zh4UBsQZAnResZg7yRLd04Yc9Fk3NjIUqxnJf0qyVQBFeLeskj
         YJUd5mw/bf+yQe/jQ02Zdg7VhoGkfCzNvDhx2rYjroUiqgvGzWX///dLgm+p+QrOEa9M
         +D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689114055; x=1691706055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijAc3WnxPpnwtqHq2IpzbsH58VD57C5vE29sFFjhsnw=;
        b=Ob/HmJMPzeagUL5in4OdUFb8Om1BUNSwUXHAhhvGviRPw4UjZKKRBzxHGAgc0t1Sn4
         r4C9XQ+Cx/V9+S1AOfRfuFxruWTAAq/PMHdLXS9f3HFrZewqbCtygTiiSlQLbTER7sXS
         d8O1iOjTJCCfNQrizmpbim5YHvmkJYnN5oevvPuHqcpSVnDa2CJNftBncIDFrwBkncRo
         7sG5Dj83fr1hwkHu2NXSo4691141oVZDJRj3Wxod67PVlv1YAhZw6F/S97ZgAwZbSK7k
         lRGd0YsTh1L71bbROQrzc9iAjCIw35WgQ0pBgiOEEDPY/lQpb6c3Zo667rW0nrc0inpZ
         QjxA==
X-Gm-Message-State: ABy/qLb7nqTNxR4dHDxWBK7aeOvCnDvPutId94nNMtTFpmnDjehWrcZw
	myt524c98trQnUm2eN3civmEMVwLxUQ0AhTEa0s=
X-Google-Smtp-Source: APBJJlHqYjoII5Q+Ju9XdZE0L4QYpoiJk+A5Jb80U7l4xeEERNXqbvqIwUPtWfQE8uYlUiWk1dYvWtQocW2iejUeSMk=
X-Received: by 2002:a05:6402:350:b0:51a:265a:8fca with SMTP id
 r16-20020a056402035000b0051a265a8fcamr18555340edw.27.1689114054998; Tue, 11
 Jul 2023 15:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307112158.3RFyuSZJ-lkp@intel.com>
In-Reply-To: <202307112158.3RFyuSZJ-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 11 Jul 2023 15:20:43 -0700
Message-ID: <CAEf4BzaWmYcJTLc5837wA8T4KOWcQaxgh6LpYR53kT-8HoQDSQ@mail.gmail.com>
Subject: Re: [linux-next:master 754/1391] /bin/bash: line 1: 50431
 Segmentation fault LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/pcmcia/pcmcia_core.ko
To: kernel test robot <lkp@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 6:52=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8e4b7f2f3d6071665b1dfd70786229c8a5d6c256
> commit: c628747cc8800cf6d33d09f7f42c8b6f91e64dc7 [754/1391] libbpf: only =
reset sec_def handler when necessary
> config: arm-randconfig-r032-20230710 (https://download.01.org/0day-ci/arc=
hive/20230711/202307112158.3RFyuSZJ-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git =
f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112158=
.3RFyuSZJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307112158.3RFyuSZJ-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD 8e4b7f2f3d6071665b1dfd70786229c8a5d6c256=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    die__process_unit: DW_TAG_subrange_type (0x21) @ <0x14a5b> not handled=
!
>    die__process_unit: tag not supported 0x21 (subrange_type)!
>    die__process_unit: DW_TAG_subrange_type (0x21) @ <0x1e457> not handled=
!
>    die__create_new_array: DW_TAG_union_type (0x17) @ <0x14a70> not handle=
d!
>    die__process_class: DW_TAG_compile_unit (0x11) @ <0x1e4bc> not handled=
!
>    die__process_class: tag not supported 0x11 (compile_unit)!
> >> /bin/bash: line 1: 50431 Segmentation fault      LLVM_OBJCOPY=3D"llvm-=
objcopy" pahole -J --btf_gen_floats -j --lang_exclude=3Drust --skip_encodin=
g_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/pcm=
cia/pcmcia_core.ko
>

Cc'ing Arnaldo and Eduard. I don't know if it's the same as [0], but
just in case please take a look.

  [0] https://lore.kernel.org/bpf/20230710200002.ca4okot5rrvewqvb@altlinux.=
org/

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
