Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD4C24A06B
	for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529932; cv=none; b=E4N/J7ZI9xiSkbh9PUAbxp87F8s4+vSB84xhgc70Zn8EBiW1o2XIuMwPvDQ1m39JVKCl0PVZUejQIJssboDMLv5VEaWRmssO5SDz3Nj/AvFATHJaJ4u6iw9axmNs/huzhco6BET51aTGo/L827XB0rgrZOELzooe4r0FLUEEUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529932; c=relaxed/simple;
	bh=GOINWpV503zhNSh0S7R/fd//+2YoOn40dCvVN4PqxrA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=I8gjO/4SoqDGTtGmXq24el2+CsrtoYuO9qK6G5xDpr3QTigyZGhW6i/efTFE/jEWGV6NHSC0/bFsTFM5sK+OcDHtVywUC9kjFaDD9PgKLM6Uf6QC9zsd0fo2dUbR10Ho5icIHNH47Gr5SwvmLn/mcj57Hx98moXll4vZRqoZTgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=watter.com; spf=pass smtp.mailfrom=watter.com; dkim=pass (2048-bit key) header.d=watter.com header.i=@watter.com header.b=gtQNS8NI; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=watter.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=watter.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=watter.com header.i=@watter.com header.b="gtQNS8NI"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b109c5ac7bso44230001cf.3
        for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=watter.com; s=google; t=1755529929; x=1756134729; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Onn0mFbzSZgX6/mRY4JJJAmbYjWdighwL+n/SYc6vis=;
        b=gtQNS8NIbl/711MbZ1WyVJ4ELfDbn4iX4tZp9Zo4/610L9oWcxcnyrYZb2GvtzE1RQ
         eP8bNer7KHNyL55QxPfdGi6JYdzLsPACKcvBohLvvenBYmXUXK2nZmLiiE0dXi8dJSyX
         lR1VBgV3oRSn7Vy4uQiH46fAxqGnJSi0F+cnM7kHOxZgYd3MRdH7ho6wUbacGNj+T2DQ
         rKlomEuy4AcRdAt6BZmYXo73OIZWjxnpo37tg9cVLQu1SazqU2O/BMzL7Pj9StwpXu86
         uvASTpyTa9HbH7MnFawwCBC0jYLM/uCmpIdkmBxJVEd767YomIgbA3dCA3J/KnKmQ4Zq
         vycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755529929; x=1756134729;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Onn0mFbzSZgX6/mRY4JJJAmbYjWdighwL+n/SYc6vis=;
        b=QGa6YWwPn323Pqxxqn0Yg4tUB8x3Kiw0MWP1IFqKvOP6gaKT1a1OIuJxg1IuS/sj4a
         Q4KcWVIywRZwOgDWYsxA1FCBiEQtBmHJheCmAR5d+FVj0AWED0p/2Pwd8BI1UmRI62RC
         Dm8wq3fM4s4KlPR/EK735XXXx+R5jEm5+NVqlGGQGRg/w4mTPKiqX9m37jMvN/HWl+JJ
         bb0SuhVfe0bUt0xzWNBdLYb1rnhIXAG5LlSgN1vlddOfNDgugIDDGbOM7dg7YauLDGY1
         ExgHzaaD7pDMn5eP8VBQzj3mN/hDwtXb+CzMRO9Fz0O0w4gx0DlnmPgmRwWMop/BSD7l
         ZwFg==
X-Forwarded-Encrypted: i=1; AJvYcCWKOvtM7fvtk2xKIKLwPwVbPVcRbHyOKjSodB4rreFSjfcPQOwapiWSoe3zczpkZaQiEcWB@lists.linux.dev
X-Gm-Message-State: AOJu0YxjhVHoDGXDw2KmWHvg0b7n/8P0Bb3nEjUQ0lCOuZ+7HQgREW2c
	t+Dq4BtdNw4Bt6+dRv3GkO8sF+Pl5K+FCSVNOV10R9iFMsL7lWc8zib8gvsYHizPiw==
X-Gm-Gg: ASbGncsmQ4F/z+VbfEPyqRWFk/fQZ9XltCVOsEVuKfdRRKPS1Z8JZhrI7nnnxYBIhSU
	Rffg71H/WOZUjsbJGPXXXrz5L72Z+KdiORTprSGMJ/4s5i2C9DxDLDhgodFZlk/ijlrdwmAhK9O
	q7L+J82dkgERiWuSWxcSGrn9KxAA43MDzESgdoSrcWPhLHG19X4j7nI76oAd8Z3QBGNEtBv+9pI
	3IF3ct7PpZNjS11vzQ6E3fKWvsLu46g4FsPoKAYgRRd5TxtLZxAGeWqlUreHMxkJ/KgFem1n7x9
	A3yq67GEYuYtQ+cfGrxgoiHQM4WUYxhlIuvU74sTeCkNTQy2t2GZXNbQJYqqDWBqRRMVFBAT5hk
	99qAOS8yVCtz0QP1KYna04/NHl+B38L779EpDn6TJr0sTRsLj4iXC
X-Google-Smtp-Source: AGHT+IGESdDWGXnHd26as9NY6mAqTBJBwr+tBkUOi+AoCrlKdcJhaufP8wlJwLtxeP0cwINMR5OIQg==
X-Received: by 2002:a05:622a:19a6:b0:4ab:ab85:e54e with SMTP id d75a77b69052e-4b11e0ae8e9mr168672791cf.8.1755529928994;
        Mon, 18 Aug 2025 08:12:08 -0700 (PDT)
Received: from smtpclient.apple ([70.32.192.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de1eaf8sm53354511cf.48.2025.08.18.08.12.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:12:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.2\))
Subject: Re: [PATCH 3/5] iio: mcp9600: Recognize chip id for mcp9601
From: Ben Collins <bcollins@watter.com>
In-Reply-To: <20250818150659.GA2948920@ax162>
Date: Mon, 18 Aug 2025 11:11:57 -0400
Cc: Jonathan Cameron <jic23@kernel.org>,
 kernel test robot <lkp@intel.com>,
 David Lechner <dlechner@baylibre.com>,
 =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <81628282-E80B-46BD-851E-6DCC48CCC953@watter.com>
References: <20250815164627.22002-4-bcollins@watter.com>
 <202508161646.PDl6V4EU-lkp@intel.com> <20250816110243.06fbf7fb@jic23-huawei>
 <20250818150659.GA2948920@ax162>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3864.100.1.1.2)


> On Aug 18, 2025, at 11:06=E2=80=AFAM, Nathan Chancellor =
<nathan@kernel.org> wrote:
>=20
> Hi Jonathan,
>=20
> On Sat, Aug 16, 2025 at 11:02:43AM +0100, Jonathan Cameron wrote:
>> On Sat, 16 Aug 2025 16:46:12 +0800
>> kernel test robot <lkp@intel.com> wrote:
>>=20
>>> Hi Ben,
>>>=20
>>> kernel test robot noticed the following build warnings:
>>>=20
>>> [auto build test WARNING on jic23-iio/togreg]
>>> [also build test WARNING on linus/master v6.17-rc1 next-20250815]
>>> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
>>> And when submitting patch, we suggest to use '--base' as documented =
in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>=20
>>> url:    =
https://github.com/intel-lab-lkp/linux/commits/Ben-Collins/dt-bindings-iio=
-mcp9600-Add-compatible-for-microchip-mcp9601/20250816-005705
>>> base:   =
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
>>> patch link:    =
https://lore.kernel.org/r/20250815164627.22002-4-bcollins%40watter.com
>>> patch subject: [PATCH 3/5] iio: mcp9600: Recognize chip id for =
mcp9601
>>> config: riscv-randconfig-001-20250816 =
(https://download.01.org/0day-ci/archive/20250816/202508161646.PDl6V4EU-lk=
p@intel.com/config)
>>> compiler: clang version 22.0.0git =
(https://github.com/llvm/llvm-project =
93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
>>> reproduce (this is a W=3D1 build): =
(https://download.01.org/0day-ci/archive/20250816/202508161646.PDl6V4EU-lk=
p@intel.com/reproduce)
>>>=20
>>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: =
https://lore.kernel.org/oe-kbuild-all/202508161646.PDl6V4EU-lkp@intel.com/=

>>>=20
>>> All warnings (new ones prefixed by >>):
>=20
> <trim unrelated -Wnull-pointer-arithmetic>
>=20
>>>>> drivers/iio/temperature/mcp9600.c:440:53: warning: invalid =
conversion specifier '\x0a' [-Wformat-invalid-specifier] =20
>>>     440 |                                 "Expected id %02x, but =
device responded with %02\n",
>>>         |                                                            =
                  ~~~^
>>>   include/linux/dev_printk.h:156:62: note: expanded from macro =
'dev_warn'
>>>     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, =
dev, dev_fmt(fmt), ##__VA_ARGS__)
>>>         |                                                            =
         ^~~
>>>   include/linux/dev_printk.h:19:22: note: expanded from macro =
'dev_fmt'
>>>      19 | #define dev_fmt(fmt) fmt
>>>         |                      ^~~
>>>   include/linux/dev_printk.h:110:16: note: expanded from macro =
'dev_printk_index_wrap'
>>>     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);          =
             \
>>>         |                              ^~~
>>>>> drivers/iio/temperature/mcp9600.c:441:26: warning: data argument =
not used by format string [-Wformat-extra-args] =20
>>>     440 |                                 "Expected id %02x, but =
device responded with %02\n",
>>>         |                                 =
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     441 |                                  chip_info->chip_id, =
dev_id);
>>>         |                                                      ^
>>>   include/linux/dev_printk.h:156:70: note: expanded from macro =
'dev_warn'
>>>     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, =
dev, dev_fmt(fmt), ##__VA_ARGS__)
>>>         |                                                            =
         ~~~     ^
>>>   include/linux/dev_printk.h:110:23: note: expanded from macro =
'dev_printk_index_wrap'
>>>     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);          =
             \
>>>         |                              ~~~    ^
>>>   drivers/iio/temperature/mcp9600.c:428:22: warning: unused variable =
'ret' [-Wunused-variable]
>>>     428 |         int ch_sel, dev_id, ret;
>>>         |                             ^~~
>>>   10 warnings generated.
>>>=20
>>>=20
>>> vim +/x0a +440 drivers/iio/temperature/mcp9600.c
>>>=20
>>>   422=20
>>>   423 static int mcp9600_probe(struct i2c_client *client)
>>>   424 {
>>>   425 const struct mcp_chip_info *chip_info =3D =
i2c_get_match_data(client);
>>=20
>> Probably a false positive as I don't think we can probe without =
something matching and hence
>> that not being NULL but an error check on that match is still a nice =
to have and should
>> resolve this build warning.  Note there is very little chance a =
compiler could ever figure
>> out if this can be NULL or not so it's a reasonable warning!
>=20
> I am not sure I follow if you are referring to the -Wformat warnings
> above. Isn't it pointing out that the second specifier is missing the
> actual type? Shouldn't it be '%02x' or something of the sort?

That actually was the issue and has already been fixed in follow up.

Thanks=
