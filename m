Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4612EFD95
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164073; cv=pass; b=qggWZMn0GkMzG9C5U2/gWPRzELGqJbtR+8zKlgMZek9GZaV2ZP21j568XYXXf16IBAhhA5wdDX/jbPV+0ludZL5fUllSrjJfBkwMG5Cf/rgvXzAxzZdrkvaTFYYXevS15yjupTzst8PJ8IejY6hscK16uN7kxvxpmUIqo0cOeME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164073; c=relaxed/simple;
	bh=ZN75BNxVhUMX1Jg1VcWsYYID9KMPww5Z2eyKKPXfyeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHXyR7kBvv3aw0b0UwPZ5G2tJ/LowPVkgQdXj70gltEyssy/34Ws4aJXbUNVGvK5H9DoxoQXdwRxHQUmmFpOdJlBICqRlrcKFMdiQNIQFRh3Lqn2FYjnjJrNmYCQTnmF1LZnWMcrzyFs1hLE2vDTTcpkwKobLFeOVNdGzzSAm1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+kUjm7A; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+kUjm7A"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c09c1d000so3885265d50.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 21:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779164071; cv=none;
        d=google.com; s=arc-20240605;
        b=bZrv7i91uT8/DlnpFXszOV5JXeddJxpZwEPyCvGpjNJoHZ6Rn9lFeehfppcz2kTOfx
         5gWdgray+lrc3SOynsgAS9SFiyYBt17lG3YeTh+rHuUMq2VPSfvGNyHZumN5D/3Yr9Ia
         GQWmQS+zkDP34tkmqtfppV0k0b/5g7IU5SkiZgxWkw6rFUQqNpk3N9yC4krwye2USHaT
         AdQ6fM6NjFJrU9F2qOIXQhX6l9SdqP1dtWOKEybiqWI9t+OYwQDjceRu4uYH0Lsaq9Yp
         RLoPKPKXToije539WerkpI24/tDcBU1PbW8S9iTshWMWH0rsWsrdnjm38LZ6pAK+Gaec
         G8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        fh=lb039jDUgFmJ0DecTwoOTzMgEj2vD4Y71VSlcblLRMk=;
        b=k1gnZHO0b76xXVrrkDgDNFz8+5uRXCREBVs+dDq/xUWq63mfTlGbvB43wIanLac5Z7
         NFLOSkqy5MOBSHULhSweXcS/XdJmM7XdoblRll3eQnis/KB//K2gGRWRpm9UvX5Yo+En
         4mEs8hm3DZm7H8NviaVYY9XMSl6Y1ipCkMW2DDBb6oc3m4dlfdghMbYNU9obPpSGqtix
         +mVZSkstS6xx9cPFnrJGZFxi2WKYHVf/lLrXFX4KITZzAFfCafDVqYia8SUVUlrUptAF
         T4xeeUIFndS7yF2Z9gvihIi28GJyuT5iBYg/xPZmtWcLF3n+lzeBti94PZVHyO7hTcMD
         +4Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779164071; x=1779768871; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=n+kUjm7A6PhmZSXdNPLFAo1BdOVNOqqkIC1T2SrG1tNYzWVK7ftxRKjo0X5jEh7BoU
         WalzCeEqsXrLixU/wgXi0F4W3TZVheCKXBQXHOsdu1quGbLrRvwJfenxeUVgCxYKkdBm
         RsXqRowMI6AnxQamQvuaY5RenCqwL4wY384PQ7IpWcLPTFwGX0qyTHl1kOpHOVBphZZ5
         SGvXL/9OQ13UJCzQefjuByTasnVK/jhhWbNfxl0ZEzhILfnfWVA4Ip/4k6S4sgknThVH
         K4aWqZXDjpo4Ye1D79GETKZEv+zLIuwEyye+UKy30niKOxojg9/8/AwbFsvED6lXvlmr
         VUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779164071; x=1779768871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=PqpqkEDZJ5JQ9n0H0+Dbc2eEpzy1rMrL9bgx5ZQsSp8LfUIVLJg7fLVctr4gg6jeen
         /kjWUoJ86wVs1KnjVuujCEy30F7+SW3Nk/m07pY98RBDrG1HewU2l3E+XShuGIO9ZcUi
         SJbaLl7xlRv5ihd2UFj97+vcI5WEystpUUEL+IUKe5MickA6JxgsMTzhSWFmwZLpO0D0
         1fADfIvdb0MGxoFb4//mqR0kPFC60gTPaebZ+0kAlFQ2JJcfXUko6Xankn7V0AZu58D4
         AkvbXpFG6qYrD7xrzMJJWbSj5xzYgk7ylHuPA5rx4rKa5Ytwjh07TD5J4Lb9pN8t2KD9
         M6Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9YSLAmEZfIEzIOab4DsXWth6PycyWKsf2lKw133mSti+LrCshumare9wKq5r5OVo8LC3Im@lists.linux.dev
X-Gm-Message-State: AOJu0YxAhJJpIFIjuTQnvoRdbc6z6jwuZpYuHmbgeahvHQE1NOHuI7ng
	F3k45ywqyK2P7ihWw9GOH/c/AaogK8V6/TwG8mgq8OTbLcQMNdXq2mbEwUaXAXtwo0pizbckqO7
	43VbBSkHkoliiyr6kOaa8bhOKTxBGIYY=
X-Gm-Gg: Acq92OEIBDXikuSUzTeRBcNNmn22PzvVyQ6WcWl6brFvJLYAA+9OLoEVHuzNysSCPA8
	Vw7H6yz8TSzbd1GBP2irU+b9zIVe44KdmEMCVpH2wlF/jXgPrP2dDsykA1fdo83P9PygszcIDCW
	2U+ZXYImK1in2TFCduSZ/idIMxNaljZSgfOoSbqy5udyGNzx4lMGPRazkI1kQkxH4w+uITK93Ll
	RKER8rZ08+tdEGqyb/XGrQoNd2iqqvFPK8naaXdirr1oWdfigzPtOQOK4zPdgyTZdCl4dnYWLI/
	r98OClFw
X-Received: by 2002:a05:690e:438d:b0:65e:782e:9df3 with SMTP id
 956f58d0204a3-65e782ea2bcmr1341256d50.7.1779164070708; Mon, 18 May 2026
 21:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518125500.1000083-1-lgs201920130244@gmail.com> <202605190845.KlMSPp80-lkp@intel.com>
In-Reply-To: <202605190845.KlMSPp80-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 12:14:18 +0800
X-Gm-Features: AVHnY4Km_xmIfqiLJD15ZaDQr9lLAh1Ogha024FXgf4YUM6n3JdHCvcB7t1E46k
Message-ID: <CANUHTR-J7VY4Jx7WVqEpC+Xg2cR_Rnb=gaA_xecyNO9dmFcyew@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video register failure
To: kernel test robot <lkp@intel.com>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the report.

On Tue, 19 May 2026 at 10:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linuxtv-media-pending/master]
> [also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
> base:   https://git.linuxtv.org/media-ci/media-pending.git master
> patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605190845.KlMSPp80-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:33: error: expected ';' after expression
>     1217 |         video_device_release(mdp->vdev)
>          |                                        ^
>          |                                        ;
>    1 error generated.
>
>
> vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
>
>   1172
>   1173  int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
>   1174  {
>   1175          struct device *dev = &mdp->pdev->dev;
>   1176          int ret;
>   1177
>   1178          mdp->variant = &mtk_mdp_default_variant;
>   1179          mdp->vdev = video_device_alloc();
>   1180          if (!mdp->vdev) {
>   1181                  dev_err(dev, "failed to allocate video device\n");
>   1182                  ret = -ENOMEM;
>   1183                  goto err_video_alloc;
>   1184          }
>   1185          mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>   1186          mdp->vdev->fops = &mtk_mdp_m2m_fops;
>   1187          mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
>   1188          mdp->vdev->release = video_device_release_empty;
>   1189          mdp->vdev->lock = &mdp->lock;
>   1190          mdp->vdev->vfl_dir = VFL_DIR_M2M;
>   1191          mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
>   1192          snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
>   1193                   MTK_MDP_MODULE_NAME);
>   1194          video_set_drvdata(mdp->vdev, mdp);
>   1195
>   1196          mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
>   1197          if (IS_ERR(mdp->m2m_dev)) {
>   1198                  dev_err(dev, "failed to initialize v4l2-m2m device\n");
>   1199                  ret = PTR_ERR(mdp->m2m_dev);
>   1200                  goto err_m2m_init;
>   1201          }
>   1202
>   1203          ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
>   1204          if (ret) {
>   1205                  dev_err(dev, "failed to register video device\n");
>   1206                  goto err_vdev_register;
>   1207          }
>   1208          mdp->vdev->release = video_device_release;
>   1209
>   1210          v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
>   1211                    mdp->vdev->num);
>   1212          return 0;
>   1213
>   1214  err_vdev_register:
>   1215          v4l2_m2m_release(mdp->m2m_dev);
>   1216  err_m2m_init:
> > 1217          video_device_release(mdp->vdev)
>   1218          mdp->vdev = NULL;
>   1219  err_video_alloc:
>   1220
>   1221          return ret;
>   1222  }
>   1223
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This build failure was caused by my oversight. I missed the semicolon after
video_device_release(mdp->vdev).

I will send a v2 to fix this issue.

Sorry for the noise.
