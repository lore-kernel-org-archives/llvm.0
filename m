Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B2E41B8ED
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169519; cv=pass; b=fzSuaHiiw9lLKeOQJEZXewz11QojAAjY+EvPUlXbGs0p9GiVJm83KcEbheK18ICUAEDGdcOYEWdh25ErfVahn7bcFE3qtP9JyRCHObIfn8iyCbHX8noVKBiiPKw7gxw/pgyLBxrpBTu73FudOj4VlhSbLjkxrFHrqbVnxxXEtMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169519; c=relaxed/simple;
	bh=2sXXeOUTecGSlpRBlbqBWd3+w2nqQ7YS/Yst5f7bBcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIg9qoZlu8TCZFwiBom6qBUSQrlaiNEjSyVkpXiHZUr8tqWrAk+YqsQh6NBZWS92z8VtUoKkdapD75ya+o+L4xsIQXLKWyKkL1LWtmdKBQMQbFPBYBNetUzrKAwtc6uLEo+B2qoRkztTzchUfITPNFWaYK+e/yYkEl+TuM4Ek4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4y4XUCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8QQDngU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4y4XUCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8QQDngU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWVO3663455
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 16:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUpg5WJhVxRendPtKKb3JFNO3eljQXcRqiJSSpYHIDU=; b=W4y4XUCb914pBl0W
	UtvBTl+uJxKS7M45I2ewjQReQe0ifjVZi9mrSmztJifisNXzFa93XfiYvbfXNeEA
	Tp+bGBrd3vxeEp+vAFthKTwHCFxa+kXYEPP3HzNr9EItAyytaSZTfYAPdzS9Dda9
	oe1TtzCauYfKcfF5sXHLxYN/coQqVfnd58gM7CLDFRBt0pFfvnUARvzs5KoWS28B
	PYbg5n22w5KV72IJ7XhL2E5NWyXvmyH4nZ+88KYKTFckSkh6k5A1brrcwo+6jMXA
	8N5E2wL8f2L407LGUPSMqQFHoZj5trGgW2BadOAUhV38owlpWj3xgrMjwpGmEEeY
	1vO1Cg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2asjgcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 16:25:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907c59bd73bso56224466d6.3
        for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 09:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785169517; cv=none;
        d=google.com; s=arc-20260327;
        b=s2mZLTxxrCTXvAiDpWmT+rAEB9wWIMVUZTz2N/Gz86Krx5S6arBLThygKdz5CoE0vd
         wW4nn+G/z+E+upAhieymHHReAbnf6TUwZmZPOXu1t1UNpuznsd/yXFsJBx4CFZcUCJqx
         jtH3k4MzttKRbtUSFI/Q5QO1vSfkVREDCf3KtAxvgTal2rfKX6NbfFbFkKpbCHElFpVk
         PJMaP2iQlr1RsllfL2uNItwTKQ2WkDbGaHx4HhM8vSN/i35wrV7pTmXLX6AbiW+aODyz
         e3eJgBwf0TsyuPwkS3Cpbj5bECgYSsSC6PX6TG3lu7ZHoFickXzoF93wtNLT9HRp9+LH
         u2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dUpg5WJhVxRendPtKKb3JFNO3eljQXcRqiJSSpYHIDU=;
        fh=jHvYevI62T44EmZaBtk65f3pG2bJKK8gKymwbs3vL2g=;
        b=L2Kpcyw5V8z2zJjV6+rU3ZbszFHcIemFWW4b7iogzppAlgGGrXzEzZCg7kYyMyO7YO
         RitwxG3oIgBC+tLxEXZBhWgviH1gDf+k/cn3Miwabf0CMT/RtOP17GAP4TkfkI0O4uli
         5695QavRbrA3bHq2/8wwfRMcxLl+q59RS3TaAD+8HRS9mAFNrwF6oR2C+oCdv/LGHWzL
         8ACG/LulTPtSgFmsE3mbwxh/ovt5GzeiOlvUG+hO0lD2AePB8X1hJVBJVUWlCRZP+2jL
         xereZVgfUAZ32w3udNldtS3U34+4CsjNOc6MI2JvJsYttJnHGtKVpRIEkoDgWmyFbCpr
         n3kQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785169517; x=1785774317; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUpg5WJhVxRendPtKKb3JFNO3eljQXcRqiJSSpYHIDU=;
        b=K8QQDngUt9YhySI7mj91ALDSRz0/Eo4E5tDsIniWA3vN0bX4QjPNQa6wiJTl23tKGr
         J4FpUPPKsTayYQrDWUf38myETuYzUGlvmSsSnSJJ7+M7e0JUU+IDUiXEFyRm1Rs2T9Jm
         a0iz/V/3qLNpb+XrYg1Dbnj3j3mXpmDWA6gn2VNrfZd80ZKd0rQo7EdgLmX46XsJousB
         3ogCxYRJg6BtqZasGHBKOo3azaNpa2APDcV5LRIi8uf18zwxFxaNG61i1R8crGJxpx6c
         ms4p/dm6//N0ZYQ6eOHJEs68jx8OovPwytb/Ua1SVP504jWiJgTYSCXoxcVpSRVh+NIH
         sx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169517; x=1785774317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUpg5WJhVxRendPtKKb3JFNO3eljQXcRqiJSSpYHIDU=;
        b=AWQuNNfH+apuFhJQyk9dceMZMZre9yp2NVTcfXXBli9P9gIyrLKVy7/Pq86K21+me8
         Kx6MvFkK9rJaTDOtsx4HtqzpXshsxZcvYerAu7XU5Z4J1+WDq3U2v8CufmBrn0NR6leL
         etd773Ey7Z/x0eB4HejZ4AyU2JxM2HLYM0iNl70md7npuU8NYgMMBQWVM9JzZWeJISn3
         nN3xT+FK+7IYTPBVFTcTElricmNQHY7NezzodVhWqa6Yv25TLJWSv8/CSLQC1QPTS3Hd
         1AOBeKMV8xFqgwd25rlXGMLNUgSVvpODm1X6thRa8IkGc6HzukoLshrmqtXr1a4y7phh
         ieNg==
X-Forwarded-Encrypted: i=1; AHgh+RoTVxEggfnpX4rzIVG9mnBZjylkJrxACkF0ZjRn9ip2Y/h8Kvrm0U0coKEfIS7KH7NuPRpQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxXBaqXjcqZIu7A4UsCmmTKNtm/TYpghGslwTaCilXTRzuR/r69
	E99iNbfACXZxR5H6enD1fg6ox4ks8uvZvX4NbHR7CTzmmdEGwBX/DFFMY8n4k2XDdpdq7ywGv8u
	OOjPAmTQmJj7RCVvLebPmH1QZvcAWJ2k74W80QX3/LxvzOXACdkSEdYA1CMEiGLXdTYsmidddPO
	PwGrGAXxWubFfs4fE9oWIizDT1BYWqUos=
X-Gm-Gg: AR+sD13/gNXD2ZVVU4P1ri7nVgAlu6IdnDzivJJ246/Ba1qYf7AZeAdvzQdsCIDynIu
	YZH1ly/DJgdPWaBwZtrm6GAthmgKGrbgzLR8vqGAnluLhqkk0rAESFUSG+9vxHkzmZHMHo0rh9k
	yvbEACfN528chfS3FRRtQeIho7Vx1lBqeVUyPrdyvsI/F8tc4Q8pWBZor/eA==
X-Received: by 2002:a05:6214:e69:b0:8fd:6dc5:946 with SMTP id 6a1803df08f44-907ec8ae409mr114279656d6.59.1785169516633;
        Mon, 27 Jul 2026 09:25:16 -0700 (PDT)
X-Received: by 2002:a05:6214:e69:b0:8fd:6dc5:946 with SMTP id
 6a1803df08f44-907ec8ae409mr114279356d6.59.1785169516256; Mon, 27 Jul 2026
 09:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722204643.502879-1-rosenp@gmail.com>
In-Reply-To: <20260722204643.502879-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:25:05 +0200
X-Gm-Features: AUfX_mwIlILr2rkiwKFRHTdkwkW_WPdmrj8v9YFucTPbonDZhHT9qNMkK66JGCA
Message-ID: <CAPx+jO_1g00otxNP+CfFxbr2qjbH08RB3FFOU3=WnyEQC=G4sw@mail.gmail.com>
Subject: Re: [PATCH] mmc: moxart: use platform helpers for resource and IRQ
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX1+P2fFIEakS7
 5QwjLLgwsTs6ybZYUGRcoxMKFNN5ScZZP5Lv17deEgMv2JZwje37T2sW0C5gv4GuDA+hn7MpNlF
 2EWyKIkBpFizr2BlkxcA6pqgGJpZ+9wql7hcZCFLjB13h4nVcGxu82KzDkrlEDjunAyiHNw4Tmu
 3f4aSW+gsPW4e5VneBb8hJcxtnWX0GvaP0H7kgz9iOkvqxoMJNT07dszzgYIMi0UZm0oDEMLORx
 7doBwkJZh+Oq7E7Z0PI6ZIE8luF3ZbUF7kgPa0wdDORzEIUY4He2dLa5phVsoaxXre0RuK9g/EQ
 ufKtF1yYvjt7YZOTyoVUBMyBgSW8ELSqMWhqVqxlm+Gko9HozfXFnNonPxmNBQufh2Hl4R9WDCA
 0h3V9saSZTJG3F1Z/WiZUjPwY6tiQny7r5Xz29ueXEWHz9vrpq9cOjDp1RmNVNJl0u5KcemPpMc
 45O7r+ouOMV1T5Spcyw==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a67866d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=3grdSASEes32PKoHFTkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX680B18EZzqQ3
 3X2BTeJTu3VIewPS9sLBCNSycwUh/iwcUyhO5RaD7cEe4laIrtnC14YHTSp95saHTK/mydwjpv4
 iLVcs4yH5BGf6pDHpIUPmo70uPiCW4E=
X-Proofpoint-ORIG-GUID: 7W6tL3YznkLKaQC16H4n5aUvoOe-9NvA
X-Proofpoint-GUID: 7W6tL3YznkLKaQC16H4n5aUvoOe-9NvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270152

On Wed, Jul 22, 2026 at 10:46=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> Replace of_address_to_resource() and the following devm_ioremap_resource(=
)
> with a single devm_platform_get_and_ioremap_resource() call in
> moxart_probe(). This requests the register region and maps it once, which
> is equivalent to the previous devm_ioremap_resource() behavior, and drops
> the now-redundant separate resource lookup.
>
> Similarly replace irq_of_parse_and_map() with platform_get_irq(), which
> returns a negative errno on failure (including -EPROBE_DEFER) instead of
> 0, and tighten the error check to irq < 0.
>
> Both substitutions are equivalent for a DT-backed platform device. The
> remaining OF usage (mmc_of_parse() and the of_device_id table) is covered
> by already-included headers, so linux/of_address.h and linux/of_irq.h
> are dropped.
>
> No functional change; the MMC register window is requested and mapped
> exactly once, so there is no overlapping region claim.
>
> Built for ARM (allmodconfig + CONFIG_MMC_MOXART) with LLVM=3D1;
> drivers/mmc/host/moxart-mmc.o compiles cleanly.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/moxart-mmc.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.=
c
> index 4a4d8b19b18c..28aed13549a6 100644
> --- a/drivers/mmc/host/moxart-mmc.c
> +++ b/drivers/mmc/host/moxart-mmc.c
> @@ -26,8 +26,6 @@
>  #include <linux/mmc/sd.h>
>  #include <linux/sched.h>
>  #include <linux/io.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
>  #include <linux/clk.h>
>  #include <linux/bitops.h>
>  #include <linux/of_dma.h>
> @@ -555,8 +553,7 @@ static const struct mmc_host_ops moxart_ops =3D {
>  static int moxart_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *node =3D dev->of_node;
> -       struct resource res_mmc;
> +       struct resource *res_mmc;
>         struct mmc_host *mmc;
>         struct moxart_host *host =3D NULL;
>         struct dma_slave_config cfg;
> @@ -565,30 +562,24 @@ static int moxart_probe(struct platform_device *pde=
v)
>         int irq, ret;
>         u32 i;
>
> +       reg_mmc =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res_=
mmc);
> +       if (IS_ERR(reg_mmc))
> +               return PTR_ERR(reg_mmc);
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
>         mmc =3D devm_mmc_alloc_host(dev, sizeof(*host));
>         if (!mmc) {
>                 dev_err(dev, "devm_mmc_alloc_host failed\n");
>                 return -ENOMEM;
>         }
>
> -       ret =3D of_address_to_resource(node, 0, &res_mmc);
> -       if (ret)
> -               return dev_err_probe(dev, ret,
> -                                    "of_address_to_resource failed\n");
> -
> -       irq =3D irq_of_parse_and_map(node, 0);
> -       if (irq <=3D 0)
> -               return dev_err_probe(dev, -EINVAL,
> -                                    "irq_of_parse_and_map failed\n");
> -
>         clk =3D devm_clk_get(dev, NULL);
>         if (IS_ERR(clk))
>                 return PTR_ERR(clk);
>
> -       reg_mmc =3D devm_ioremap_resource(dev, &res_mmc);
> -       if (IS_ERR(reg_mmc))
> -               return PTR_ERR(reg_mmc);
> -
>         ret =3D mmc_of_parse(mmc);
>         if (ret)
>                 return ret;
> @@ -596,7 +587,7 @@ static int moxart_probe(struct platform_device *pdev)
>         host =3D mmc_priv(mmc);
>         host->mmc =3D mmc;
>         host->base =3D reg_mmc;
> -       host->reg_phys =3D res_mmc.start;
> +       host->reg_phys =3D res_mmc->start;
>         host->timeout =3D msecs_to_jiffies(1000);
>         host->sysclk =3D clk_get_rate(clk);
>         host->fifo_width =3D readl(host->base + REG_FEATURE) << 2;
> --
> 2.55.0
>
