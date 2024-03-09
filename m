Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEF015BE;
	Sat,  9 Mar 2024 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710002299; cv=none; b=coUojXnYZihJ0yZKOlCfI0W8CxAcfU8Y5VGPNxY9ES9SgNi8LFLYIaVZEB6gX+9ku23GxubJ58swTOOD7eHdo/YxgppZjmLvVmr6OFFJt7c8/4jvXZVu5RPUASN3CAbb4TTYZHCyWZz7bpfTQa75U3U7jFcZ/rqsFITrRU2mBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710002299; c=relaxed/simple;
	bh=T4PvgJ8OPQW9qM9vJqNiv+idcsVw17CjXHD5CBk3G6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq98QyJGn1jvSTY1Zm8K3gRh7+ZcVOIAwgAoILORMaLi1yos69lr0wTE/Iz8/jvXva6AWMpU0cMRm6bJslGFPnG7UF0Qa2tE2MwYCy0hlfe6Nqlz66wqKdVLLf0PFmOeoEUQX7ddK12hdkrC5BGz8nGKsCJ2dZdxttS+BeIreuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFhTU4DC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFhTU4DC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e8abc8a84so109989f8f.0;
        Sat, 09 Mar 2024 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710002296; x=1710607096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjzrBbJ3q1WHluCAGM0M2JzA/NUnA9jStCeKPFxC9Yc=;
        b=DFhTU4DCM2u52X3KboyEFEL/n5CUjCTskI1W1TpETbMTgeJSELblpc75wVrkfHMPfj
         xch/U1vMME5rTuxPhL6ywltZT7ALX9P/jkfwd0izG2qQVBz5M7zwpgRilplmLwUpu9n9
         1zC48OFCvzK0hK5tqbtt1Zil7CiQMuEIYNELAnqN5XUENHQHajrn/PZpuSw8SqNa8be6
         gHuoG4qmZpbNBXNKCFPk9kD/B1og4J08SYN8ZLiT5gH9xhilXBza4hQfk9DA8OJstEoH
         pfxLWy/9clAe7/9TcUgLARIXrXtrU3rIUnM8bxKQSjVRoqK9IlCWxSqbzXJ2t4FX3SfS
         bfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710002296; x=1710607096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjzrBbJ3q1WHluCAGM0M2JzA/NUnA9jStCeKPFxC9Yc=;
        b=nc5cTTGztjCvzdWHZetEcsMD67sD3rdXuYbnpjrCfo+3WBtJyWSDWa1/Bqkzm1Dd2N
         cjtUMtg3WTA4/B9jGBO33rlH45fovZCYql7goZmS+pBe23ofXs/6pzts8Fkwwlx6Rsn4
         fh+5naDDviE+O9dN+AorgUbNZ2jTa0sGHlMtxyqhLOl064D+rj9gv/NG/uuJCx43XauP
         4S3J59Vl5Clts2fn36ntDb2UBnImkpggFmQzTJH+EyELjcjHYIplWdmmyD/p2HppzUq1
         Iaf/gjuZ3ly+BJNhiiXHJ49tz8J0M6Ck7GQCwdePubX262/REvjdxCtFr0mIBp0zSIOx
         6d0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhXMO68DhHO3yGEqosGkeuFYvEloe+iJ8vEwbVhmCPfvKw9x5NJS8tpy1VVcAeT1pHFH0aZhik+Gx8GCpMTQUKtfHUOHBGBvt7kS1YPSEA76Rs7PwDDl2NhBLcIXNaij0n4o4=
X-Gm-Message-State: AOJu0YzTZned3aXevnqnaE01kgtlBZJri40OM+Q5GgNxzoB4In6MvUqj
	Jb/dNRGhVy2WjaWNodHcMx9pfSdTwHmcfgVCTfMCgQazxdiIkfugYAmuNopptyQbT9ENnqtu+Fs
	qECQhhK0dmdRgIJpWztGkvglRDJk=
X-Google-Smtp-Source: AGHT+IFjV+rvr7i2EnOF8AtRv8dFnwzYVN2YlnTMpQk1HId1lcnkfYoEwaXZtL4twfJDWVNJ170ZmaqvXcsf/jOtXBE=
X-Received: by 2002:adf:ef8f:0:b0:33e:7fcb:c0e with SMTP id
 d15-20020adfef8f000000b0033e7fcb0c0emr1215233wro.6.1710002295545; Sat, 09 Mar
 2024 08:38:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403092219.dhgcuz2G-lkp@intel.com>
In-Reply-To: <202403092219.dhgcuz2G-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 9 Mar 2024 08:38:04 -0800
Message-ID: <CAADnVQJ+6mFs56fu+KEvumQ5uqM-oLpYx0hGxLJfE9XUCtEWEA@mail.gmail.com>
Subject: Re: [bpf-next:master 5/7] kernel/bpf/core.c:900:5: warning:
 '__pte_index_size' is not defined, evaluates to 0
To: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, clang-built-linux <llvm@lists.linux.dev>, 
	oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Puranjay,

Looks like I have to drop this patch for now,
since PMD_SIZE is not a constant on all archs
that can be evaluated by a preprocessor.

We need to find a different way.


On Sat, Mar 9, 2024 at 7:04=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> head:   d0d131e3b655fd267d14bb1bed49e3f990a1465e
> commit: 643714ff18301f41bded2489e8f1f9d1b4782094 [5/7] bpf: cap BPF_PROG_=
PACK_SIZE to 2MB * num_possible_nodes()
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/202=
40309/202403092219.dhgcuz2G-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5=
03c55e17037436dcd45ac69dea8967e67e3f5e8)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240309/202403092219.dhgcuz2G-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403092219.dhgcuz2G-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from kernel/bpf/core.c:21:
>    In file included from include/linux/filter.h:9:
>    In file included from include/linux/bpf.h:21:
>    In file included from include/linux/kallsyms.h:13:
>    In file included from include/linux/mm.h:2188:
>    include/linux/vmstat.h:508:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      509 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:515:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      516 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:522:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:527:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      528 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:536:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      537 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/bpf/core.c:21:
>    In file included from include/linux/filter.h:9:
>    include/linux/bpf.h:739:48: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      739 |         ARG_PTR_TO_MAP_VALUE_OR_NULL    =3D PTR_MAYBE_NULL | A=
RG_PTR_TO_MAP_VALUE,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:740:43: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      740 |         ARG_PTR_TO_MEM_OR_NULL          =3D PTR_MAYBE_NULL | A=
RG_PTR_TO_MEM,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~
>    include/linux/bpf.h:741:43: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      741 |         ARG_PTR_TO_CTX_OR_NULL          =3D PTR_MAYBE_NULL | A=
RG_PTR_TO_CTX,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~
>    include/linux/bpf.h:742:45: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      742 |         ARG_PTR_TO_SOCKET_OR_NULL       =3D PTR_MAYBE_NULL | A=
RG_PTR_TO_SOCKET,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~
>    include/linux/bpf.h:743:44: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      743 |         ARG_PTR_TO_STACK_OR_NULL        =3D PTR_MAYBE_NULL | A=
RG_PTR_TO_STACK,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~
>    include/linux/bpf.h:744:45: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      744 |         ARG_PTR_TO_BTF_ID_OR_NULL       =3D PTR_MAYBE_NULL | A=
RG_PTR_TO_BTF_ID,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~
>    include/linux/bpf.h:748:38: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      748 |         ARG_PTR_TO_UNINIT_MEM           =3D MEM_UNINIT | ARG_P=
TR_TO_MEM,
>          |                                           ~~~~~~~~~~ ^ ~~~~~~~=
~~~~~~~
>    include/linux/bpf.h:750:45: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum=
-enum-conversion]
>      750 |         ARG_PTR_TO_FIXED_SIZE_MEM       =3D MEM_FIXED_SIZE | A=
RG_PTR_TO_MEM,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~
>    include/linux/bpf.h:773:48: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      773 |         RET_PTR_TO_MAP_VALUE_OR_NULL    =3D PTR_MAYBE_NULL | R=
ET_PTR_TO_MAP_VALUE,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:774:45: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      774 |         RET_PTR_TO_SOCKET_OR_NULL       =3D PTR_MAYBE_NULL | R=
ET_PTR_TO_SOCKET,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~
>    include/linux/bpf.h:775:47: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      775 |         RET_PTR_TO_TCP_SOCK_OR_NULL     =3D PTR_MAYBE_NULL | R=
ET_PTR_TO_TCP_SOCK,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:776:50: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      776 |         RET_PTR_TO_SOCK_COMMON_OR_NULL  =3D PTR_MAYBE_NULL | R=
ET_PTR_TO_SOCK_COMMON,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:778:49: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      778 |         RET_PTR_TO_DYNPTR_MEM_OR_NULL   =3D PTR_MAYBE_NULL | R=
ET_PTR_TO_MEM,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~
>    include/linux/bpf.h:779:45: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      779 |         RET_PTR_TO_BTF_ID_OR_NULL       =3D PTR_MAYBE_NULL | R=
ET_PTR_TO_BTF_ID,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~
>    include/linux/bpf.h:780:43: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-We=
num-enum-conversion]
>      780 |         RET_PTR_TO_BTF_ID_TRUSTED       =3D PTR_TRUSTED    | R=
ET_PTR_TO_BTF_ID,
>          |                                           ~~~~~~~~~~~    ^ ~~~=
~~~~~~~~~~~~~~
>    include/linux/bpf.h:891:44: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum=
-enum-conversion]
>      891 |         PTR_TO_MAP_VALUE_OR_NULL        =3D PTR_MAYBE_NULL | P=
TR_TO_MAP_VALUE,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~
>    include/linux/bpf.h:892:42: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum=
-enum-conversion]
>      892 |         PTR_TO_SOCKET_OR_NULL           =3D PTR_MAYBE_NULL | P=
TR_TO_SOCKET,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~
>    include/linux/bpf.h:893:46: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum=
-enum-conversion]
>      893 |         PTR_TO_SOCK_COMMON_OR_NULL      =3D PTR_MAYBE_NULL | P=
TR_TO_SOCK_COMMON,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~~~~
>    include/linux/bpf.h:894:44: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum=
-enum-conversion]
>      894 |         PTR_TO_TCP_SOCK_OR_NULL         =3D PTR_MAYBE_NULL | P=
TR_TO_TCP_SOCK,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~~~
>    include/linux/bpf.h:895:42: warning: bitwise operation between differe=
nt enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum=
-enum-conversion]
>      895 |         PTR_TO_BTF_ID_OR_NULL           =3D PTR_MAYBE_NULL | P=
TR_TO_BTF_ID,
>          |                                           ~~~~~~~~~~~~~~ ^ ~~~=
~~~~~~~~~~
> >> kernel/bpf/core.c:900:5: warning: '__pte_index_size' is not defined, e=
valuates to 0 [-Wundef]
>      900 | #if PMD_SIZE <=3D (1 << 21)
>          |     ^
>    arch/powerpc/include/asm/book3s/64/pgtable.h:208:26: note: expanded fr=
om macro 'PMD_SIZE'
>      208 | #define PMD_SIZE        (1UL << PMD_SHIFT)
>          |                                 ^
>    arch/powerpc/include/asm/book3s/64/pgtable.h:207:33: note: expanded fr=
om macro 'PMD_SHIFT'
>      207 | #define PMD_SHIFT       (PAGE_SHIFT + PTE_INDEX_SIZE)
>          |                                       ^
>    arch/powerpc/include/asm/book3s/64/pgtable.h:156:25: note: expanded fr=
om macro 'PTE_INDEX_SIZE'
>      156 | #define PTE_INDEX_SIZE  __pte_index_size
>          |                         ^
>    26 warnings generated.
> --
> >> kernel/bpf/core.c:900:5: warning: '__pte_index_size' is not defined, e=
valuates to 0 [-Wundef]
>      900 | #if PMD_SIZE <=3D (1 << 21)
>          |     ^
>    arch/powerpc/include/asm/book3s/64/pgtable.h:208:26: note: expanded fr=
om macro 'PMD_SIZE'
>      208 | #define PMD_SIZE        (1UL << PMD_SHIFT)
>          |                                 ^
>    arch/powerpc/include/asm/book3s/64/pgtable.h:207:33: note: expanded fr=
om macro 'PMD_SHIFT'
>      207 | #define PMD_SHIFT       (PAGE_SHIFT + PTE_INDEX_SIZE)
>          |                                       ^
>    arch/powerpc/include/asm/book3s/64/pgtable.h:156:25: note: expanded fr=
om macro 'PTE_INDEX_SIZE'
>      156 | #define PTE_INDEX_SIZE  __pte_index_size
>          |                         ^
>    1 warning generated.
>
>
> vim +/__pte_index_size +900 kernel/bpf/core.c
>
>    891
>    892  /* PMD_SIZE is not available in some special config, e.g. ARCH=3D=
arm with
>    893   * CONFIG_MMU=3Dn. Use PAGE_SIZE in these cases.
>    894   */
>    895  #ifdef PMD_SIZE
>    896  /* PMD_SIZE is really big for some archs. It doesn't make sense t=
o
>    897   * reserve too much memory in one allocation. Cap BPF_PROG_PACK_S=
IZE to
>    898   * 2MiB * num_possible_nodes().
>    899   */
>  > 900  #if PMD_SIZE <=3D (1 << 21)
>    901  #define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
>    902  #else
>    903  #define BPF_PROG_PACK_SIZE ((1 << 21) * num_possible_nodes())
>    904  #endif
>    905  #else
>    906  #define BPF_PROG_PACK_SIZE PAGE_SIZE
>    907  #endif
>    908
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
