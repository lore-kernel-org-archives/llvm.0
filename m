Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55B44C50E
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518083; cv=pass; b=Fs5tXtQEBxD97uS3qOVHWZVAatwONUtgJ/A21MA7ElbH/v0+WAErEnSZ3vDmP1x9cIoBJ+kE6FO3qIpXVA5sF8p7SsjT6GtyNaIQX8mIzbt4wfgQPbFWrSOIUtbpDd8s0NmQkjwgG9/kx4U0TDispS5Ba/sxuDhd4jlLrxq9gKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518083; c=relaxed/simple;
	bh=QesLJjfO+CQSI1uPEdZ3w/rry6iX1InymxI+UL8wQKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ8joaWg26LVl2x9gR38Qu9/BKkw1x0u2TFdjJCp0TV133H2Ty5KBXJ6o3mnR2QaPHFUtfxc1wWVbcr2bwOGDn8rurhOxMtfByW4pxgvZgeDIyd9FxG5VFOfhAOBJOalpI2uOlhe5jnLmdOb4uZ/OSQNv/R8jPejFiPXNAelo7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQ8lf7SM; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQ8lf7SM"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a08a2b7e5bso680137a12.1
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 10:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518080; cv=none;
        d=google.com; s=arc-20260327;
        b=qlwant1hpvJHpjdMTtCaEGHh+zE/wXLxZ0v0YVMelja4x+CLc5+qCtkfU6Mr2E6Z+y
         XwtZaPJv7mX261yDA6I0NtQn6acqjj1UM4XoKY68WqSs2Y86g32MksdYlEjqZ6BeKaPs
         LvLCfAhL4ZcV81CjkxT1aQg1U2eR+MVRvQpc8l9NIs21S+ElVRvEoSyPasTMMMENjWpF
         FrdTDzbc8aG1n6gGxJV/gYFpI0qkDBpcx1Hsj5djkhCB8iAN0wwjeJp+ECpLvIT/QdT8
         b9NuKY2j5Mtkj9nfkFtYLJlujUtjU/jDaCjAYs3EouVRMwq5TYjHrKRaG6izbSusWMTo
         NmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHfwJhTJcZEKfM/V12t6FGxcs59B4/LW6Z/5dwS+YL8=;
        fh=znNxEwFHctWlp10vZgZY6MAeV0+zAWIcoUeTu2MOZmg=;
        b=oZ9rVoyZQtB0H79Uk2Pyue8IGM0vTcpOgKencyjQ5f7ZDpYvaO4wQXBdL3PnpDAcKa
         H+JiFBE6SmlQWsfsUNDBP9efgFxv1E3BSXHA/nne8SrCch1kXW1DAr6qTZ6RpZKlEpNW
         98QV84ahxi1sfDqt+qKUlEF/korBTAkYlEsiD3l5UWKJgjHNkMp3bg16UyRjnIADORY9
         30m83YhC8DjLWIH1RTe4j5984PLCLRn6oeTbPcohBAs+SZ4UcpmaegyTXaRhHdsau2ol
         E8DDax6pf+cymCCsReqGXNweZKUISXmizmw8HuJEz7vko+1ZitfYaWKlSKzzqmZ2MzF0
         jo/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785518080; x=1786122880; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHfwJhTJcZEKfM/V12t6FGxcs59B4/LW6Z/5dwS+YL8=;
        b=LQ8lf7SMoIeZD91Oez7N58UrD8JLKhs5V7YElaS16lryK04n2v360/W+BSkjI6cBSm
         8FOTR/zQqGWP4xR+Q40cECeyjqmOuFAW7A2GqgixIT0yFLh78nocFo0JJa8E8lVn7bvX
         7FIyf8XN+foplnCG/WtNOCjwJmEnQk7i7aDXGcQbLnixIMP4QZh3z/G8SHohVzznFS/+
         ti57WryBlO2Ivfbj9H0nTrrx4K4nFisOMTfFJg2NTKfOixII+eq5qOC+C/rrtXiTzbs0
         dyk3WFmmmxFFTQYSkm3aOfkbXLG/k/XYSPOYUK6hpzu06K2oseYK02qB/I8j29HkHp/I
         HcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518080; x=1786122880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHfwJhTJcZEKfM/V12t6FGxcs59B4/LW6Z/5dwS+YL8=;
        b=Z2aFWdAuPlNNRycBxxps1vYqs8bPBwZj7xDDpMyYbJoNhOmYpYmSjFcRos3h7b10t6
         u6ZroANGSopELH4d9JvvJhctWQmqFsqsz0cVgV5O4OLCHP8jAio8/l1Iwm55c+7VZOoP
         vm7oMBrOdaFGnumPo6YJ54VkgjdS2TOYVSEIT5FCIIgDO7P5nBDWP+LcvO0BzGnWl2vP
         uEyy2Alm2MBe/bDD8QwmpYlYdugoOc1Vt0s1ZOZbb5I/EMW4v3ycQgkJ1ZYtVDHL3P4w
         3NNvx2F2KEH5sBIYcA79h4yd6G7CoEuPCqdYpqNXpLfYYvtxbCSGZB1ehLgHWVMMvBWd
         dj2w==
X-Forwarded-Encrypted: i=1; AHgh+RpG2RPVPE9pfX9AXuupnAeUS2eykwZxlMCnherFOpZZLy//dVK2AVPi0OAq6ch2STcJQVCu@lists.linux.dev
X-Gm-Message-State: AOJu0YznbwaV1uCA1asENk8S9zGzMQ1Jg9belyQYQR4fm3kRYkY3GIal
	4rRnePNJRmkzS+ubfHnt7HVAsGWC5AbO8H+7KVm7dM/kF0XTxFiEtmTQ0eaOS1JYn0bRFAxhs7C
	jkZkp0Wo7C8rhWmIWuy/2BZSeuVojqpeXZg==
X-Gm-Gg: AR+sD135bPen2cQh4462NbRML0TnLmSa3HXL2yIVYmxIOgNXRAmRPycWQ8WKyijt4yh
	gJqpzIdsnkNWR6J/RM1cGODG2dN2KNMvb7IJsn+6ro23vBU35tuCdQfTPUVj0ThbMUdD6VdnuzR
	6WzNMucFomnTcVVXVQ9mOjr9Edk3PwP9XN2w41u8OPBZ1cH5xDhwrLz1zA3rE02KHD5euus6inW
	iEdT63GtQohM0wAhUZWUwOjyV3pQKYN1VvZ9e3Y+Hk7k3uCUrbJdR5cqXt+QO1oXCumTaupn2/0
	68fqgaREiqdY6IJ992IYoECEsvk0gn+ozZRG0xbf6KvKcqWdei8EgLea3FV2a9fGcpgR9KZM4+2
	BHTBJChQkXsIc4JXCBAYbMCpHTJQLI3mXAaODL3iMgrjRuQZ38vmQyUWt5KaZmVDedIAdt7fDbD
	A721ijAmeuQqhNHLly+UIehTYuAi9hNt4V6pInQGS9FXIow0BVl2qCPMaJNeoHFUIG10AHkh3xy
	Itc8g==
X-Received: by 2002:a05:6402:20c7:20b0:698:8857:9ff0 with SMTP id
 4fb4d7f45d1cf-6a09b1428f3mr1180287a12.16.1785518079567; Fri, 31 Jul 2026
 10:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731012130.1212640-1-rosenp@gmail.com> <20260731012130.1212640-2-rosenp@gmail.com>
 <amy5lCeSFyvmGixj@SMW015318>
In-Reply-To: <amy5lCeSFyvmGixj@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 10:14:26 -0700
X-Gm-Features: AUfX_mzFrlXDrgTTIRJCLGV2of7qZMoZSDe2mpZqZ_ZmRsSrWJc1TipvLntE12k
Message-ID: <CAKxU2N-dbMD-F8A16+KEkf8Hvq4=m2YO7X4jx7Q9zEfqGmbzkA@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resource()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, York Sun <york.sun@nxp.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 8:05=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 06:21:28PM -0700, Rosen Penev wrote:
> > Replace the open-coded of_address_to_resource() plus devm_request_mem_r=
egion()
> > and devm_ioremap() sequence with devm_platform_ioremap_resource(), whic=
h folds
> > the resource lookup, region reservation and mapping into one step and r=
eturns
> > an ERR_PTR checked with IS_ERR()/PTR_ERR().
> >
> > Behaviorally equivalent with respect to region reservation: the driver
> > already reserved the region, so the non-overlapping reg requirement was
> > already satisfied. Drop the now-unused linux/of_address.h include.
> >
> > Remove devres stuff. Not needed. devm is already used.
> >
> > Fix a mistaken return code of -ENOMEM when PTR_ERR should be used.
> >
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
>
> Need change log here.
>
> You missed my review-by and tested-by tags. If you delete it by some reas=
on
> like big changes, you should said here explicit.
I changed some stuff yeah. I had them added but removed just in case.
>
> Frank
>
> >  drivers/edac/fsl_ddr_edac.c | 39 +++++++------------------------------
> >  1 file changed, 7 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index 2a545e5812e7..3745eec67335 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -22,7 +22,6 @@
> >  #include <linux/gfp.h>
> >
> >  #include <linux/of.h>
> > -#include <linux/of_address.h>
> >  #include "edac_module.h"
> >  #include "fsl_ddr_edac.h"
> >
> > @@ -495,13 +494,14 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       struct mem_ctl_info *mci;
> >       struct edac_mc_layer layers[2];
> >       struct fsl_mc_pdata *pdata;
> > -     struct resource r;
> > +     void __iomem *mc_vbase;
> >       u32 ecc_en_mask;
> >       u32 sdram_ctl;
> >       int res;
> >
> > -     if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
> > -             return -ENOMEM;
> > +     mc_vbase =3D devm_platform_ioremap_resource(op, 0);
> > +     if (IS_ERR(mc_vbase))
> > +             return PTR_ERR(mc_vbase);
> >
> >       layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
> >       layers[0].size =3D 4;
> > @@ -511,10 +511,8 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       layers[1].is_virt_csrow =3D false;
> >       mci =3D edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
> >                           sizeof(*pdata));
> > -     if (!mci) {
> > -             devres_release_group(&op->dev, fsl_mc_err_probe);
> > +     if (!mci)
> >               return -ENOMEM;
> > -     }
> >
> >       pdata =3D mci->pvt_info;
> >       pdata->name =3D "fsl_mc_err";
> > @@ -531,33 +529,12 @@ int fsl_mc_err_probe(struct platform_device *op)
> >        * Default is big endian.
> >        */
> >       pdata->little_endian =3D of_property_read_bool(op->dev.of_node, "=
little-endian");
> > -
> > -     res =3D of_address_to_resource(op->dev.of_node, 0, &r);
> > -     if (res) {
> > -             pr_err("%s: Unable to get resource for MC err regs\n",
> > -                    __func__);
> > -             goto err;
> > -     }
> > -
> > -     if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r)=
,
> > -                                  pdata->name)) {
> > -             pr_err("%s: Error while requesting mem region\n",
> > -                    __func__);
> > -             res =3D -EBUSY;
> > -             goto err;
> > -     }
> > -
> > -     pdata->mc_vbase =3D devm_ioremap(&op->dev, r.start, resource_size=
(&r));
> > -     if (!pdata->mc_vbase) {
> > -             pr_err("%s: Unable to setup MC err regs\n", __func__);
> > -             res =3D -ENOMEM;
> > -             goto err;
> > -     }
> > +     pdata->mc_vbase =3D mc_vbase;
> >
> >       if (pdata->flag =3D=3D TYPE_IMX9) {
> >               pdata->inject_vbase =3D devm_platform_ioremap_resource_by=
name(op, "inject");
> >               if (IS_ERR(pdata->inject_vbase)) {
> > -                     res =3D -ENOMEM;
> > +                     res =3D PTR_ERR(pdata->inject_vbase);
> >                       goto err;
> >               }
> >       }
> > @@ -637,7 +614,6 @@ int fsl_mc_err_probe(struct platform_device *op)
> >                      pdata->irq);
> >       }
> >
> > -     devres_remove_group(&op->dev, fsl_mc_err_probe);
> >       edac_dbg(3, "success\n");
> >       pr_info(EDAC_MOD_STR " MC err registered\n");
> >
> > @@ -646,7 +622,6 @@ int fsl_mc_err_probe(struct platform_device *op)
> >  err2:
> >       edac_mc_del_mc(&op->dev);
> >  err:
> > -     devres_release_group(&op->dev, fsl_mc_err_probe);
> >       edac_mc_free(mci);
> >       return res;
> >  }
> > --
> > 2.55.0
> >
> >
