Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08A38C42E
	for <llvm@lists.linux.dev>; Sun, 24 May 2026 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779601232; cv=pass; b=RurAP61st72iZVLeztWeIN5f+ZhNhCiYTYYEAJ00yC/jm5/hKdWceVsa8k/0KqSXw4cMooUdm5ZcmhaVVYfaTciCDucxIaFbXZChg2P2hNfatMTwnT1LvdLewgkJDO5ECRAkp0k63GmiWMMKNHCgz3jANrdKa3rYxnA9QK8mAKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779601232; c=relaxed/simple;
	bh=FFyU0Agp3duT3812ugXRwk1O62+C0JSc7BoLG3Q5SKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVE7DsND8vHQ3jVBSTjNVz0XspA32+h9vxguQVTtykOeFm91g5tE8jw3p8z8kbtjKG+RDuS5nCM2pFbECUsnb0yRLJb4kQhMJ94/Z3eBsvqATSZApUabFY/EMZLWAnXh9kt0wSzWF33VNRZu7Nxj/pbEPMTzSiTlez2h0HBVzPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVPc0ADE; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVPc0ADE"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65dead17c24so8056318d50.2
        for <llvm@lists.linux.dev>; Sat, 23 May 2026 22:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779601229; cv=none;
        d=google.com; s=arc-20240605;
        b=Mwyj/AAJCU8lg2jbVmHrx28qL1vVlsfKnBQmOxfK3sOZwi0k3hTas9Kb/7n3rgAWw1
         MvpcXfcZiBHUlDBVMIb4E0G1nvoanNkqFPt0pS4QPwWrOnsBKsXbAqO72kB6NmwnGWSj
         qtf8qutdDIY6LfUHdU56WrBaRiwqH84pIN77l1niQJhv8I8OsK52hMwJ746vkFBDQYRq
         YSs8G0ov7yzzmiHlPQls9Jc4ZDBIivvtexKu8yDyadU6ekQXlXenK/Z3WKVUuTrYtQgD
         kJLHdkHMDnkF3iUxLlDj/VbUkM42P0lltYxJLKYg7GORMukHtC558ODfp1K1efVpmK5s
         3mTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        fh=+6UpPgjjox2diVcR65FLk1trJqr8nKZo784bx/fNIq0=;
        b=GRkNEYfjqOB6q+xokjCpVFG6O9O3YTm6xDhDUK6TDJKCU4ATfPORvvnVNiR6M+RAqc
         N4AO3fMPRVee5PMgcKbsrfwaKb9LtgCiwIEkaWW2JxUPMMptk3nnfEqpdWFu3+ccZFTD
         d0mSucn7d1JOtnUkIcWOgptXmDCXJfqD1d/DWh+XrCBWFjD2r0Q0HKw1HACVw+nf9Rhi
         VLsJ8XszJSwukRxrg44D1Dg7USidy+2lMTonexwH7pW1X9RwreG7tckk7rbDVwYji2B8
         2K3l4DNJ/+2Yrc46h9HtklNHqYMSpxc/3ZiCJAZTn+Zn2nok5ihyMCxZsUDgTnZ2lFZO
         P5ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779601229; x=1780206029; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        b=ZVPc0ADEUdlx4GbEknh/WiI8I+Ywegi9JdQpUDsRjsMda21tBMhydng/wYKgTpanwa
         dyCNg06Xb4yODD5f2rT7qrE9HSPVZnxcUR2a2M2i38JMBreJG8CAqIhVnvtSiOOYWaVB
         eaeHmnnu5VVmtFVw6Agr0BsR3kbrIRzyvi/Gf4sjenH+KM/Q5i+tN6h5l205lqmy4PuP
         Nkv5pS/3Uj528bWGufXfejC2X9PcIYG5KxJfAQIRtUkl1uRMGiWcTJr05Zz4zfFwLWHI
         TuDtrdcEVhj1hTFgHkA0XhTkgzQlCFLWrEPzavu2PLoahTg3KZTT6a+9zvIYH9WeBpcw
         y2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779601229; x=1780206029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        b=p2SJD7tsOHXdXZWv3mBJfBX39Cqg2Kv79xvvOP8LohKtOvXKyt3u9ExH1qFosTZalq
         ZjN2iwrgdXLz1FdSff13OzjjuEKpSHI5J41XtWTVWkWiYwc2sKryYmj8LEKpk6JH0/6B
         pobFK25QWq8pSppPIe4Dr9Znl3gjXlBulqXbrhA0LA1kZRiWm1a6J7vT1i0qpCYA9vgu
         pKfoCopChBHai+xanjCh2U04OG199EbVljfYLWYrfwWvLqJyR7rwl+6xO0KaFxPknv3I
         1FTxwp8LYgdAY7xuuInvFf3tPlhG0ZooI0Xs7C3hDscPjgs06g1n9cr4X4hyIeUxqYVi
         ar3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+TalBNDTiVydDWix/55GFdfkDGgrlcyzfXd9T953oCBBHG3B64JdwZpKqX6ZIx7r811YYF@lists.linux.dev
X-Gm-Message-State: AOJu0YynHJMDz3T4E/GKzEmUycgccxgai56ubHU5zXjYT0xbzj/eSlrk
	KCuaoIjCktX05cpIf74jwbpBRM1szKkst2eqYJkOJawbWgjVRUalf+uW/148+dSn1C6ZsCOpD41
	fcGue34iaM/MtxpczrsBdxMqMszFIxyg=
X-Gm-Gg: Acq92OFu47xn4d7wSQaHECUmQXj8WCfEf+4YA9+zFd6fKFJ55GiHjM54VW+0rJWygFA
	hHO3Zqnux/M4Q5r19FPzU/6O/KDxIBVWFkcCpBuoB8q9DRw7mYmjM2SjY1Pn2kT9ixcJkOM7xa5
	TZCNGgaMFSjvdJ59hScyjoZhN+VMVQDjMMofb1FbQ7h3M6DWwV27OrhKga1B9BlivpHA+xx9INB
	HGS/3J19442mllVKZAWYbZpcBEkXkiGFE/36W++lr0ZvVkeszncmPEQ9K7miumBRysD1yphwCS3
	aaJmiOsGtnOfrcUd9XVlpCjE0f7Lpn3lK6H3h3b+Ebpcp87rYZOq5/7pvY/BzE0psIp3E6b2AST
	gxNr5UCxkSuxuzuL0wOjIDqha9KNUP1ytRedcI+/y2LujPF8HpZGjf5n5Qpk=
X-Received: by 2002:a05:690e:d02:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-65ec9938bb6mr10304651d50.44.1779601229184; Sat, 23 May 2026
 22:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523174440.9629-2-hardikprakash.official@gmail.com> <202605240959.Kcf1lIg4-lkp@intel.com>
In-Reply-To: <202605240959.Kcf1lIg4-lkp@intel.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Sun, 24 May 2026 11:10:17 +0530
X-Gm-Features: AVHnY4KFGm1FRMDp57VE89vJQfBy8s3Xij_f6JIE9wMxIq8ViEfXwrWfjlI0icU
Message-ID: <CANTFpSWd3ysA7qNurHFuCPmEah1dGSfDTiFJRteU08A3kHE3=w@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, May 23, 2026 at 23:27, Mario Limonciello wrote:
> Is patch 1 still needed with this approach?

No. Tested v6 alone (without patch 1) on a tree based on
63d2059cd665 (the commit immediately before patch 1 in Walleij's
fixes branch). Touchscreen and stylus fully functional, no arbitration
errors.

This confirms your original concern was correct -- the existing
amd_gpio_irq_enable() flow works fine once probe ordering is fixed.
Patch 1's manual IRQ restoration was only necessary because the race
prevented amd_gpio_irq_enable() from ever being called.

v6 is sufficient as a standalone fix. Patch 1 in Linus Walleij's tree
can be reverted if desired.

Also noting that the kernel test robot flagged an unused 'ret' variable
in check_child_gpioint() -- I have a fix ready and will send v7 once
the question of patch 1 is settled.

Thanks,
Hardik

On Sun, 24 May 2026 at 07:18, kernel test robot <lkp@intel.com> wrote:
>
> Hi Hardik,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 3812a9e84265a5cdd90d29fe8d97a023e91fb945]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Hardik-Prakash/i2c-designware-defer-probe-if-child-GpioInt-controllers-are-not-bound/20260524-014648
> base:   3812a9e84265a5cdd90d29fe8d97a023e91fb945
> patch link:    https://lore.kernel.org/r/20260523174440.9629-2-hardikprakash.official%40gmail.com
> patch subject: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt controllers are not bound
> config: x86_64-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240959.Kcf1lIg4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240959.Kcf1lIg4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/i2c/busses/i2c-designware-platdrv.c:192:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>      192 |         int ret;
>          |             ^
>    1 warning generated.
>
>
> vim +/ret +192 drivers/i2c/busses/i2c-designware-platdrv.c
>
>    187
>    188  static int check_child_gpioint(struct acpi_device *adev, void *data)
>    189  {
>    190          struct gpio_dep_ctx *ctx = data;
>    191          struct list_head res_list;
>  > 192          int ret;
>    193
>    194          INIT_LIST_HEAD(&res_list);
>    195
>    196          ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
>    197          acpi_dev_free_resource_list(&res_list);
>    198
>    199          if (ctx->ret < 0)
>    200                  return ctx->ret;
>    201
>    202          return 0;
>    203  }
>    204
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
