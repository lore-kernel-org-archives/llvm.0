Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0E63F
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683781987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXq0NGvaEl6Y4fwYw+aVxphEabJEfnjuvJNHNLaO6rE=;
	b=adofkFqONGW5oln+niB8H4Tm/xKTTfUny11+Sbn/XUHbcZ5SVrfajeNFosPdOM4pfEM8Sw
	PD5isBGZDL+IS/v6e1cIAh3z/wWwmAny023nbpxUqeS/4Q5JRtF3yuwpJfITFOviSNpMTs
	BKlOSsiyxb0oQLEwPnB0ned1awgQZ6s=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-zhR2uwrUM3q9dVtsDPMEfw-1; Thu, 11 May 2023 01:13:06 -0400
X-MC-Unique: zhR2uwrUM3q9dVtsDPMEfw-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3941c5de005so1567491b6e.2
        for <llvm@lists.linux.dev>; Wed, 10 May 2023 22:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683781985; x=1686373985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uo+qGSTvo4pu2L9Hp7yMuYb28kY5eo14mS2NSF3Z5E=;
        b=aAxENrNk/DxEkNfOfZeoHQ7YroIQb0j4BrDccmcagVnY14q7oiTDuqLlHkcpGuvyMr
         ZSjbv3UP6KrRjkOCHsG2nA2uuq/kjJjs1jOWVR5N81HfMohmDsI2rUe5zOnyR/DGKDUp
         JlTEYxUhpok5326OZ/sz+F5xqJegejOJiz81UsTlITrd6LK/1seUJsIIUnbDyZnULXE/
         af8uCQO9LklN1QVO9x1Xt22hMMkCjJjhiwQj7qNIEmL6PiTJl6uPDZAov2PnjdPfTwhu
         Sb+OadhPHv6GXjDOR5DUxBQj0ZzMDgHoUpwBBBTvsWjAc0JQlbIy3qx+C4lixYGFl+6B
         sbEA==
X-Gm-Message-State: AC+VfDx+wGE+0zLQzhOBQlWzSjmW0GqjSFe5uMyTHwqVdZkelUUB/agm
	YzhgVofD84pHXXSvHCdGXy6v9j47nxQG6UXCganyJvGm8579NW4fK0iczwz2Gauvs0pagKow9Vp
	3zOpXEbLCfL6gag==
X-Received: by 2002:a05:6808:356:b0:38d:eb23:e3f6 with SMTP id j22-20020a056808035600b0038deb23e3f6mr4543110oie.54.1683781985666;
        Wed, 10 May 2023 22:13:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fYjCrGSpdzuQcnUKYokAfndVCkRzUHk7KC9Wc2VdBsA1TSdOIFPzNf95qOS53lz/innugPQ==
X-Received: by 2002:a05:6808:356:b0:38d:eb23:e3f6 with SMTP id j22-20020a056808035600b0038deb23e3f6mr4543103oie.54.1683781985399;
        Wed, 10 May 2023 22:13:05 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a803:3602:abec:117:3c19:43b8? ([2804:1b3:a803:3602:abec:117:3c19:43b8])
        by smtp.gmail.com with ESMTPSA id s130-20020acac288000000b0038e8efd297fsm3043841oif.9.2023.05.10.22.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 22:13:04 -0700 (PDT)
Message-ID: <e20ccacc00c93917686162e0e1f539fe8fda2dd1.camel@redhat.com>
Subject: Re: [RFC PATCH v3 1/1] trace,smp: Add tracepoints around remotelly
 called functions
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Date: Thu, 11 May 2023 02:13:02 -0300
In-Reply-To: <202305110816.mcNeYnWd-lkp@intel.com>
References: <20230510230128.150384-1-leobras@redhat.com>
	 <202305110816.mcNeYnWd-lkp@intel.com>
User-Agent: Evolution 3.48.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-05-11 at 08:46 +0800, kernel test robot wrote:
> Hi Leonardo,
>=20
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.4-rc1 next-20230510]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/trac=
e-smp-Add-tracepoints-around-remotelly-called-functions/20230511-070554
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20230510230128.150384-1-leobras%=
40redhat.com
> patch subject: [RFC PATCH v3 1/1] trace,smp: Add tracepoints around remot=
elly called functions
> config: riscv-buildonly-randconfig-r004-20230509 (https://download.01.org=
/0day-ci/archive/20230511/202305110816.mcNeYnWd-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb=
98227c90adf2536c9ad644a74d5e92961111)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/fcef1c202a1635b9c=
7244f06bbad605562b83d43
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Leonardo-Bras/trace-smp-Add-trac=
epoints-around-remotelly-called-functions/20230511-070554
>         git checkout fcef1c202a1635b9c7244f06bbad605562b83d43
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Driscv olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202305110816.mcNeYnWd-lkp@i=
ntel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> > > kernel/smp.c:389:27: warning: passing 8-byte aligned argument to 32-b=
yte aligned parameter 3 of 'csd_do_func' may result in an unaligned pointer=
 access [-Walign-mismatch]
>                    csd_do_func(func, info, csd);
>                                            ^
>    1 warning generated.

Oh, ok, it makes sense.

On generic_exec_single(), the second parameter is a struct __call_single_da=
ta,
while csd_do_func() csd argument is a call_single_data_t.


In smp.h we have:

/* Use __aligned() to avoid to use 2 cache lines for 1 csd */
typedef struct __call_single_data call_single_data_t
=09__aligned(sizeof(struct __call_single_data));


Which makes call_single_data_t 32-byte aligned, while struct __call_single_=
data
is 8-byte aligned in 64BIT.

Changing like this should fix the warning:
-csd_do_func(smp_call_func_t func, void *info, call_single_data_t *csd)
+csd_do_func(smp_call_func_t func, void *info, struct __call_single_data *c=
sd)


I will send this on v4 shortly.


>=20
>=20
> vim +/csd_do_func +389 kernel/smp.c
>=20
>    369=09
>    370=09/*
>    371=09 * Insert a previously allocated call_single_data_t element
>    372=09 * for execution on the given CPU. data must already have
>    373=09 * ->func, ->info, and ->flags set.
>    374=09 */
>    375=09static int generic_exec_single(int cpu, struct __call_single_dat=
a *csd)
>    376=09{
>    377=09=09if (cpu =3D=3D smp_processor_id()) {
>    378=09=09=09smp_call_func_t func =3D csd->func;
>    379=09=09=09void *info =3D csd->info;
>    380=09=09=09unsigned long flags;
>    381=09
>    382=09=09=09/*
>    383=09=09=09 * We can unlock early even for the synchronous on-stack c=
ase,
>    384=09=09=09 * since we're doing this from the same CPU..
>    385=09=09=09 */
>    386=09=09=09csd_lock_record(csd);
>    387=09=09=09csd_unlock(csd);
>    388=09=09=09local_irq_save(flags);
>  > 389=09=09=09csd_do_func(func, info, csd);
>    390=09=09=09csd_lock_record(NULL);
>    391=09=09=09local_irq_restore(flags);
>    392=09=09=09return 0;
>    393=09=09}
>    394=09
>    395=09=09if ((unsigned)cpu >=3D nr_cpu_ids || !cpu_online(cpu)) {
>    396=09=09=09csd_unlock(csd);
>    397=09=09=09return -ENXIO;
>    398=09=09}
>    399=09
>    400=09=09__smp_call_single_queue(cpu, &csd->node.llist);
>    401=09
>    402=09=09return 0;
>    403=09}
>    404=09
>=20

