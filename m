Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477132F22
	for <llvm@lists.linux.dev>; Wed, 21 Dec 2022 20:03:15 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id m4so16615355pls.4
        for <llvm@lists.linux.dev>; Wed, 21 Dec 2022 12:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bo52z4bIyyHZqqPH6LANgXVILYMNk+fl/sMenmQKibE=;
        b=ppCdHlGkIneSJOlvqgV2cZr8pFbcpOBGGIkzAfj1VsYmDhnDAqGVaD6G7hLgjqmtWy
         A+/XR72LKV56NwLsjAbLfMs9ESoiyna+mJamltpTV2wd1yvhaizwwqT+AWtjTwcL5YvI
         lvIMcf0ll8i6HgY0APSRprRtY1OQ6tWnss7mbOuVrWnBUqjwL7ku10smlO0l7ZsxKK5y
         6xTHJiMBFxYQDMBAzI0mIcKdUDHN07e3oztKcysBZcOpzGx6MnKe9bAc1l9x/ylIxJ6p
         v0iVu/GoinWrtchnbJlEvYTxcPSat1JaifjoR4NzxQ2Z0DJ2TEl+WnD+/yQ43tnX5HQq
         rmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo52z4bIyyHZqqPH6LANgXVILYMNk+fl/sMenmQKibE=;
        b=zNTuIAiKYjWFGVph5BescL5tjdL23INfQTOOASnXxJ5q6srNaaFEYwPzLEzqMGCTAH
         o6nlWwLmRI7kBGfqwA08YGvZBR1VMVIjrZ0pqZqug37IqK0yd5gRISn2KlaIC6/s7f/W
         TMkOalinh7tVM0KAM7iacDM+QmP2sNlG0IT7ZdEfahvxyWMjSTzU1uROIMrdhawhNO5P
         22WEwKMjGHFneKzSiouJ6QBBLZ6kVGlHNapJ2WIQaGHlC3j2BvakKvv73xS2/gVdwJ7d
         ejBZvlIE43gk4ATiPMocc3ndju39FfR9HYUgCZ0psCgcaff0aLJzZ28qWWgkEN+R+EAm
         D7og==
X-Gm-Message-State: AFqh2kq/9pqZceJNBzwD5GVUsz8wDNwhgKRwPdu/gGWFuRQ4/DetimOn
	nA2uFylCB/9+WCoHz6MDkEQwZscTks7RGZvLIPwxUQ==
X-Google-Smtp-Source: AMrXdXvNTUHijNFCO3PzK99U6zNM6gEecV4J87yBRejegveP7NKT2iq76YbaMTuqToMienh/C8d08Rc5kVmKWdMPyns=
X-Received: by 2002:a17:90a:6845:b0:221:5597:5de7 with SMTP id
 e5-20020a17090a684500b0022155975de7mr297116pjm.147.1671652994517; Wed, 21 Dec
 2022 12:03:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221072003.551091-1-alvaro.karsz@solid-run.com>
In-Reply-To: <20221221072003.551091-1-alvaro.karsz@solid-run.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 21 Dec 2022 12:03:03 -0800
Message-ID: <CAKwvOdk39E2PuKbQhhUSq46e3sHyJEVZ2fJ18ADWe4FZnCH3Ww@mail.gmail.com>
Subject: Re: [PATCH] virtio: vdpa: fix snprintf size argument in snet_vdpa driver
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtualization@lists.linux-foundation.org, mst@redhat.com, 
	Nathan Chancellor <nathan@kernel.org>, Jason Wang <jasowang@redhat.com>, Tom Rix <trix@redhat.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 20, 2022 at 11:20 PM Alvaro Karsz
<alvaro.karsz@solid-run.com> wrote:
>
> The buffer size and the size passed to snprintf don't match, causing
> clang warnings.
>
> This patch increases a little bit the size of the buffer, and uses
> sizeof() to get the buffer size.
>
> This patch should be applied on top of the following patch:
>
> virtio: vdpa: new SolidNET DPU driver,
> by Alvaro Karsz alvaro.karsz@solid-run.com
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>

Thanks for the fix!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/vdpa/solidrun/snet_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/vdpa/solidrun/snet_main.c b/drivers/vdpa/solidrun/snet_main.c
> index d438a89b359..9ceacf96de0 100644
> --- a/drivers/vdpa/solidrun/snet_main.c
> +++ b/drivers/vdpa/solidrun/snet_main.c
> @@ -540,7 +540,7 @@ static const struct vdpa_config_ops snet_config_ops = {
>
>  static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
>  {
> -       char name[25];
> +       char name[50];
>         int ret, i, mask = 0;
>         /* We don't know which BAR will be used to communicate..
>          * We will map every bar with len > 0.
> @@ -558,7 +558,7 @@ static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
>                 return -ENODEV;
>         }
>
> -       snprintf(name, SNET_NAME_SIZE, "psnet[%s]-bars", pci_name(pdev));
> +       snprintf(name, sizeof(name), "psnet[%s]-bars", pci_name(pdev));
>         ret = pcim_iomap_regions(pdev, mask, name);
>         if (ret) {
>                 SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
> @@ -575,10 +575,10 @@ static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
>
>  static int snet_open_vf_bar(struct pci_dev *pdev, struct snet *snet)
>  {
> -       char name[20];
> +       char name[50];
>         int ret;
>
> -       snprintf(name, SNET_NAME_SIZE, "snet[%s]-bar", pci_name(pdev));
> +       snprintf(name, sizeof(name), "snet[%s]-bar", pci_name(pdev));
>         /* Request and map BAR */
>         ret = pcim_iomap_regions(pdev, BIT(snet->psnet->cfg.vf_bar), name);
>         if (ret) {
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
