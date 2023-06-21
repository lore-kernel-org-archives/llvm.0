Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691F2AB55;
	Wed, 21 Jun 2023 08:26:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51a1d539ffaso10553031a12.0;
        Wed, 21 Jun 2023 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687335964; x=1689927964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivOFqhONsWjGNS9OSTGh8qFu8QLsGx24fQPWOkbIcOA=;
        b=PRTlCJlzhVtTbsQGpkAsFY8cL2ND3c1PgW5pXp9daK7lUhZXHuR9gVqP/oR8NYGwa2
         nPXvP282lXJZ9zSL533fHtcfhFjSYs7QvpA2qdaDiu7jhX1cbfJ2Pyveu+OqV+OmVVPZ
         AYT9ml5vDK/ByGA5cdsfuWnPk/IA70DGeXVca7xQ3AIAMiMIW7rI9wpxXL8azTGSAeIC
         EfmoydJvcVuBN5VkKkJyzJbEKsA5P24GWZIGoeJ9baguQtwPzjk1T9d8iCB5cWPNYCrD
         UylmWSzwfcICtaxBbxJHtn8bRmbLnHGDK8c9vphodFA9DltwwKJv+t+crhnkCEm69YEO
         U/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687335964; x=1689927964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivOFqhONsWjGNS9OSTGh8qFu8QLsGx24fQPWOkbIcOA=;
        b=KcKzN6MDg1toE8vXE7mDgmwpJSEHbztw/yo4HHlt5srJlVCYcEIpKpDco5eAl7Qki1
         AaTeTabDwV+37h+J/Ui5EqWzHuGLVskYs/hipr4AwbJvHQmW5qn/f1+Sr3nhMYsEir6h
         s9wfAjdJvVOe+4HOmm3CPh/0084rxDTFy50ar6E1BARLRwvdMBXcDWosqa8wgrG/3dAp
         gmE+IC/k0cTdoZA/R563QTdKagE9NnpnW4YzSCBORUScy730RhF0hK05U81TyJ09VCto
         244F4c1otzTY20XMpq6lz7yklgSqjkGaRKPQa2cdkTDMVxOC0ukwYwK7q7yt/vwzQorv
         NZHg==
X-Gm-Message-State: AC+VfDxhCtfjcmSGBeFq7W1Btv8JxzLFPEjdJe0U3wjf7Ql0jIosE8nh
	eTiTfSaFlTmr+u+/JdmAQx74fjv/HSbM+mI1MCPuxtWOM8Y=
X-Google-Smtp-Source: ACHHUZ6ymUHOXQxnDoOi+pLGzY2/GyzcT0ruRj8/mp4dxEWEP7kbE/jw7tEQuAvl79Vslz0coTONZEy2zPi4V9H1ENQ=
X-Received: by 2002:a05:6402:125a:b0:51b:4449:2970 with SMTP id
 l26-20020a056402125a00b0051b44492970mr5826362edw.21.1687335964179; Wed, 21
 Jun 2023 01:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306211545.7b6CdqsL-lkp@intel.com>
In-Reply-To: <202306211545.7b6CdqsL-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Jun 2023 11:25:27 +0300
Message-ID: <CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
Subject: Re: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13:
 warning: result of comparison of constant 18446744073709551615 with
 expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned
 char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (un...
To: kernel test robot <lkp@intel.com>
Cc: Kim Seer Paller <kimseer.paller@analog.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 10:19=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tes=
ting
> head:   25e201cc6ff270abc062e13ff912292097cb2827
> commit: d3e93b67f934a477c5851d575a2278f07c6242fb [6/10] iio: adc: max1400=
1: New driver
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/2023=
0621/202306211545.7b6CdqsL-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211545=
.7b6CdqsL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306211545.7b6CdqsL-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):

Okay, you even haven't compiled your code :-(
This should probably use one of the functions from bitfield.h.
Like u32_encode_bits().


> >> drivers/iio/adc/max14001.c:135:13: warning: result of comparison of co=
nstant 18446744073709551615 with expression of type 'typeof (_Generic((mask=
), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (u=
nsigned char)0, unsigned short: (unsigned short)0, short: (unsigned short)0=
, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long: (unsi=
gned long)0, long: (unsigned long)0, unsigned long long: (unsigned long lon=
g)0, long long: (unsigned long long)0, default: (mask)))' (aka 'unsigned in=
t') is always false [-Wtautological-constant-out-of-range-compare]
>            reg_data =3D FIELD_PREP(mask, val);
>                       ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
>                    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");  =
  \
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bitfield.h:71:53: note: expanded from macro '__BF_FIELD_=
CHECK'
>                    BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >   =
  \
>                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~=
~~~
>    include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_=
ON_MSG'
>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                        ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
>    include/linux/compiler_types.h:397:22: note: expanded from macro 'comp=
iletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __C=
OUNTER__)
>            ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
>    include/linux/compiler_types.h:385:23: note: expanded from macro '_com=
piletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler_types.h:377:9: note: expanded from macro '__com=
piletime_assert'
>                    if (!(condition))                                     =
  \
>                          ^~~~~~~~~
>    1 warning generated.
>
>
> vim +135 drivers/iio/adc/max14001.c
>
>    117
>    118  static int max14001_reg_update(struct max14001_state *st,
>    119                                  unsigned int reg_addr,
>    120                                  unsigned int mask,
>    121                                  unsigned int val)
>    122  {
>    123          int ret;
>    124          unsigned int reg_data;
>    125
>    126          /* Enable SPI Registers Write */
>    127          ret =3D max14001_write(st, MAX14001_WEN, MAX14001_WRITE_W=
EN);
>    128          if (ret)
>    129                  return ret;
>    130
>    131          ret =3D max14001_read(st, reg_addr, &reg_data);
>    132          if (ret)
>    133                  return ret;
>    134
>  > 135          reg_data =3D FIELD_PREP(mask, val);
>    136
>    137          ret =3D max14001_write(st, reg_addr, reg_data);
>    138          if (ret)
>    139                  return ret;
>    140
>    141          /* Write Verification Register */
>    142          ret =3D max14001_write_verification_reg(st, reg_addr);
>    143          if (ret)
>    144                  return ret;
>    145
>    146          /* Disable SPI Registers Write */
>    147          return max14001_write(st, MAX14001_WEN, 0);
>    148  }
>    149
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
With Best Regards,
Andy Shevchenko
