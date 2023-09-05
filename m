Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D8613E;
	Tue,  5 Sep 2023 10:21:15 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-79277cfc73bso87110839f.1;
        Tue, 05 Sep 2023 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693909275; x=1694514075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5iVR5bVVhTjN21L5wxxSDIiBQBjdGSYkCA99/S83KI=;
        b=kou5b0Gz8JuFVnJ6m/FHUGpcb2bdWarsatPBpsVfQI17G6rEi8xUy5/q+Z5UI6CvY2
         Y+ExRpzBARf7D598sM893GESj58YtpElphOGsn8hbJdWFm3d4ZkvfFM0lzMATe8bucKy
         lSRNbJxiE7ddnBjmzIX56JHLo3xAG8etIHOjA/Ha4jn5n3BMu1eBLRb+6fVJDK325+oW
         ADdHFcLWgMViV2AgIwmQaKDo26hQT2cVAhwEEfmaotIESP2Qv0CO9Uelb0kqdUEv9kmz
         yLpgX9SVu/wnbY1/rT7E/ttNlMrxZK1Ngn4HODPSzwV67NuVU3BpRewLVLQ4FyhluGdj
         BH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693909275; x=1694514075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5iVR5bVVhTjN21L5wxxSDIiBQBjdGSYkCA99/S83KI=;
        b=jIUX1zZzV0q+nbvfOGexlTXyzCoEQm1gk1+MHOFHfR6cQvnJxr8DB9qoyEukgDWBE0
         70xTRoSbGlU2ReCvK2fCxoCHbnVJAWjtXZ2QDlo4LszQ1yYcK27J97WMPXtIHm65fd0B
         Al2CPK/ovLOQyjCxTO05VervPwc2twZ3sj8LKFdt4nFC6mHA2pkDvSfeDVx+UBoiEOkK
         RoW7CYGb8RVRZW3Vqe4XdkXZH+sK4DMtYXK5/oGgToOP4bth+bgBohqBtCbucCQTStSf
         Z0usxJLnFzk3Oz3nN4QCrGvvhSbj1SvzM5uFayPLtWABjJVR2xaF7OfCUJx9/TEKC3x7
         BPZg==
X-Gm-Message-State: AOJu0Yx76Fbtk0SzOO7eCnGijDrWQewbjQWG/Gvak/uKbXVll8YIABK8
	y+y0B2psCR7dJXpQcXQ6IhiX8GVd3Ej9/TAv0iw=
X-Google-Smtp-Source: AGHT+IEGR3XuuSXXoje0/tNx5+aVODlq1PUCLzbx8PjpAyUJBWpczVTptiyxd15X2xQSJmzHdBp4+r5KLH1kzqghvYQ=
X-Received: by 2002:a5e:9818:0:b0:790:b033:6ffc with SMTP id
 s24-20020a5e9818000000b00790b0336ffcmr11955422ioj.20.1693909274808; Tue, 05
 Sep 2023 03:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309020548.rbrIJu6S-lkp@intel.com>
In-Reply-To: <202309020548.rbrIJu6S-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 Sep 2023 11:20:17 +0100
Message-ID: <CA+V-a8v6P_BXKd+XzCToczNOV9g9jS=r3isisSAuh=xXfZ32UQ@mail.gmail.com>
Subject: Re: [linux-next:master 13230/13643] arch/riscv/errata/andes/errata.c:46:14:
 warning: result of comparison of constant 9223372036854811205 with expression
 of type 'unsigned long' is always true
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 1, 2023 at 10:58=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a47fc304d2b678db1a5d760a7d644dac9b067752
> commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv: err=
ata: Add Andes alternative ports
> config: riscv-randconfig-r015-20230902 (https://download.01.org/0day-ci/a=
rchive/20230902/202309020548.rbrIJu6S-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230902/202309020548.rbrIJu6S-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309020548.rbrIJu6S-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    arch/riscv/errata/andes/errata.c:29:16: error: variable has incomplete=
 type 'struct sbiret'
>       29 |         struct sbiret ret;
>          |                       ^
>    arch/riscv/errata/andes/errata.c:29:9: note: forward declaration of 's=
truct sbiret'
>       29 |         struct sbiret ret;
>          |                ^
>    arch/riscv/errata/andes/errata.c:35:8: error: call to undeclared funct=
ion 'sbi_ecall'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
>       35 |         ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_E=
XT_IOCP_SW_WORKAROUND,
>          |               ^
> >> arch/riscv/errata/andes/errata.c:46:14: warning: result of comparison =
of constant 9223372036854811205 with expression of type 'unsigned long' is =
always true [-Wtautological-constant-out-of-range-compare]
>       46 |         if (arch_id !=3D ANDESTECH_AX45MP_MARCHID || impid !=
=3D ANDESTECH_AX45MP_MIMPID)
>          |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning and 2 errors generated.
>
After applying the below four patches we shouldn't be seeing this
randconfig warnings:

https://patchwork.kernel.org/project/linux-riscv/patch/20230901105111.31120=
0-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20230901105858.31174=
5-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20230901110320.31267=
4-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20230901110936.31317=
1-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

>
> vim +46 arch/riscv/errata/andes/errata.c
>
>     40
>     41  static bool errata_probe_iocp(unsigned int stage, unsigned long a=
rch_id, unsigned long impid)
>     42  {
>     43          if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
>     44                  return false;
>     45
>   > 46          if (arch_id !=3D ANDESTECH_AX45MP_MARCHID || impid !=3D A=
NDESTECH_AX45MP_MIMPID)
>     47                  return false;
>     48
>     49          if (!ax45mp_iocp_sw_workaround())
>     50                  return false;
>     51
>     52          /* Set this just to make core cbo code happy */
>     53          riscv_cbom_block_size =3D 1;
>     54          riscv_noncoherent_supported();
>     55
>     56          return true;
>     57  }
>     58
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
