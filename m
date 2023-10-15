Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163615B4;
	Sun, 15 Oct 2023 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QratuqR8"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c4e30a3604so2315432a34.2;
        Sun, 15 Oct 2023 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697353408; x=1697958208; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLRkNFaYEa5fEuPGQ15E5Ms4Xg1BiQ5FIQ0TqbAruB8=;
        b=QratuqR8r7VJenwPZlvr2dQql7v7pQfFReVFgfZUTPh9mIprA3uSs44nYKQ6iyw66Y
         genSLIGStSlk58Sm9eaKVvr6APfK8fNR3hQSCvHb8GARjO42v/z1bQzgAfM5KGpKENQP
         EM/O6HEqrDzLUzu4bucibJ86GmaBZI63m19LM/sGF7N+KH+6S+LYfY5Na29PEeLXyGUZ
         Zl7c0RIkbs03cabbDWw91MnrIPGWjgLgr+m8OApY+m9RaUoLpxfI2ufGc0jbwF5VCBXX
         nLmGqHNJw+0/hU1Bv10ZLDQkTM0zThtL+eMJeiISvRuestxL/aam4IQixFnasSGGnY2z
         jMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697353408; x=1697958208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLRkNFaYEa5fEuPGQ15E5Ms4Xg1BiQ5FIQ0TqbAruB8=;
        b=fMJyhBIAT203vN2sFmsa7jhK61Q0ncVsn4rzKEFV7wY4vmX96o2cOhTuwl5lR85AIL
         LqYkMkcsRYHC5vMr3AB2jYvXGGP8oFQtcflxsej4pYH7vX1BvIrrsi8rXeJYwcYaT9Zs
         LmD0iU/1Bfxi9P6CxO0lJ6m7ojxsBSKMYYIgJGnwTX/IFWdEvm7mz5NY5WJ+HK/H68hp
         qWdqB6QpZ6mEobljLxsXETHDODE3ljbcIKPnv+dGS8st3xoHqCtrqce3qii6Ie+Ihdii
         VVduTPsFkL4rUhcT1OIFL9B98TiuzLFTU5dcuEiVLlMWhr7ZusquU8DyjdJ2U4PnuI7a
         ed8A==
X-Gm-Message-State: AOJu0Yw5od/Nahut4W6HBfAdoaLuHZR6bzJofYHoLoN4TzaUR3tYj6Lt
	BV7qTTpGTXhjYvHtsoLfU9aU9RjFCjk+jKSuWco=
X-Google-Smtp-Source: AGHT+IEvThvWI8FV/CqU2kJPc3U7/UyuJuKk10SW9jIKJzEha6TCiZLVqvS9n7R0UgdVq8Zh3tTIjQenawV67dQkuhY=
X-Received: by 2002:a05:6870:13d0:b0:1e9:cd89:433b with SMTP id
 16-20020a05687013d000b001e9cd89433bmr8844660oat.45.1697353408400; Sun, 15 Oct
 2023 00:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310150352.KyKovpbT-lkp@intel.com>
In-Reply-To: <202310150352.KyKovpbT-lkp@intel.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 15 Oct 2023 09:03:18 +0200
Message-ID: <CAMhs-H-KG_7evTk7o+KEce7EQyfeSNh7f=N52-6x1M_y0rgrPA@mail.gmail.com>
Subject: Re: drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmips_of_match'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 14, 2023 at 9:25=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   70f8c6f8f8800d970b10676cceae42bba51a4899
> commit: 6f3b15586eef736831abe6a14f2a6906bc0dc074 clk: ralink: add clock a=
nd reset driver for MTMIPS SoCs
> date:   4 months ago
> config: hexagon-randconfig-r016-20230817 (https://download.01.org/0day-ci=
/archive/20231015/202310150352.KyKovpbT-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231015/202310150352.KyKovpbT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310150352.KyKovpbT-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from drivers/clk/ralink/clk-mtmips.c:11:
>    In file included from include/linux/regmap.h:20:
>    In file included from include/linux/iopoll.h:14:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __raw_readb(PCI_IOBASE + addr);
>                              ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE +=
 addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded fro=
m macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/clk/ralink/clk-mtmips.c:11:
>    In file included from include/linux/regmap.h:20:
>    In file included from include/linux/iopoll.h:14:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:573:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE +=
 addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded fro=
m macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/clk/ralink/clk-mtmips.c:11:
>    In file included from include/linux/regmap.h:20:
>    In file included from include/linux/iopoll.h:14:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:584:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + add=
r);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + add=
r);
>                                                          ~~~~~~~~~~ ^
>    drivers/clk/ralink/clk-mtmips.c:309:9: warning: variable 'ret' is unin=
itialized when used here [-Wuninitialized]
>            return ret;
>                   ^~~
>    drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable '=
ret' to silence this warning
>            int ret, i;
>                   ^
>                    =3D 0
>    drivers/clk/ralink/clk-mtmips.c:359:9: warning: variable 'ret' is unin=
itialized when used here [-Wuninitialized]
>            return ret;
>                   ^~~
>    drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable '=
ret' to silence this warning
>            int ret, i;
>                   ^
>                    =3D 0
> >> drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmi=
ps_of_match' [-Wunused-const-variable]
>    static const struct of_device_id mtmips_of_match[] =3D {
>                                     ^
>    9 warnings generated.

I already sent this patch some time ago and still waiting for its review:

https://lore.kernel.org/lkml/20230827023932.501102-1-sergio.paracuellos@gma=
il.com/t/

[snip]

Thanks,
    Sergio Paracuellos
