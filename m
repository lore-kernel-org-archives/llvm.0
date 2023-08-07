Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0EC11181
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 17:19:36 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-40ff82320a7so19560111cf.3
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691428775; x=1692033575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CzGcMtbdW5px13u7V86FR6wSOIpq5Rhi2EUJ/h5pT8=;
        b=RocDf+v3UtZKHTPJSxqnYPq/0dnC+MTTfUa8drQQ+uktU3n7oYg+gIgZtfp9HsqKEB
         4W/tYTR9iCKdxnUzfulLyp2m0K+Ja50FHbKdCIZSyt8q/CmpFK6PZcQ2AnHCvBl0T3AD
         9RyJRVHByL8ai8YYAgq/ZPf4xi2rKQL4aTJmlCemUjLFG9vFkd5rHQhdIB4eu5JLOCgk
         qtuwfH3Vc8lNiy9Ao4YmpF6iJBngD8vI0TLJPTqcfMkLf5VJNBo2rfDVVsnX+xLK4CVO
         YFrQHxyeb0pSitpbbgY3A1Vc2DDxuXoElajFK9YslM4+clQh/w+4YVJpg60aXRa36JdM
         46OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691428775; x=1692033575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CzGcMtbdW5px13u7V86FR6wSOIpq5Rhi2EUJ/h5pT8=;
        b=aYTBDINSFIeDLrQZBB3o8SIPZs4TQBdTF7qQ0X5KVOGK43rgveqB2K62NSD85+iLle
         6FCul/tbL7FZTzQXWRpsHna5yZIVT/p7ObX8L8Uk1bjvE34VyuUJWPSwJ+6rvpt1SsjH
         81DKNuf9/eXae+sYfiwRs3Hm5mhqe9iSrqtLzFHqRol2CHA+4Wey8FLgg/GnNVXXwsXw
         5xjJegMbJ5/9DdtVUmJaV3Dk02aBGxwvAwqKNAuE0ahh1/lOqPxuHoruFSR54NFa/hAF
         abZBX7d6wIJOOUNcZ+ht9e78pikOnIBTIa2jt9ZBIE+0AD5408k0wYZAVEie3foNARdz
         4h3A==
X-Gm-Message-State: AOJu0YxagGOc7pW00NTyT2Y6ZT7SuKIVEovijqrY5ihDqq5rMUP1zLus
	sgm9/kmlwNtUrHe7eaJL9Gbfil8f3oSJ+U2pZi0=
X-Google-Smtp-Source: AGHT+IFRdTZogtimi+4EQ4pPu6n36JrjKkyWttVsagb3sapEXKCBVjMJI/E2P8v5u8iTm3Kn9u+DLPUHpfJqMWR90GI=
X-Received: by 2002:ac8:7f0a:0:b0:401:e1e7:a291 with SMTP id
 f10-20020ac87f0a000000b00401e1e7a291mr14496121qtk.22.1691428775181; Mon, 07
 Aug 2023 10:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807-amd-pstate-cfi-v1-1-0263daa13bc3@weissschuh.net>
In-Reply-To: <20230807-amd-pstate-cfi-v1-1-0263daa13bc3@weissschuh.net>
From: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>
Date: Mon, 7 Aug 2023 19:19:24 +0200
Message-ID: <CAFqe=z+d2pi05KkOVw_LD00KHD-aX5tKVej5F6hc2wmUC9f_Yg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: amd-pstate: fix global sysfs attribute type
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Huang Rui <ray.huang@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Linux LLVM Build Support <llvm@lists.linux.dev>, 
	Linux Power Management <linux-pm@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for the super quick response, your patch fixes the issue.

Best
Jannik

Am Mo., 7. Aug. 2023 um 08:37 Uhr schrieb Thomas Wei=C3=9Fschuh
<linux@weissschuh.net>:
>
> In commit 3666062b87ec ("cpufreq: amd-pstate: move to use bus_get_dev_roo=
t()")
> the "amd_pstate" attributes where moved from a dedicated kobject to the
> cpu root kobject.
> While the dedicated kobject expects to contain kobj_attributes the root
> kobject needs device_attributes.
>
> As the changed arguments are not used by the callbacks it works most of
> the time.
> However CFI will detect this issue:
>
> [ 4947.849350] CFI failure at dev_attr_show+0x24/0x60 (target: show_statu=
s+0x0/0x70; expected type: 0x8651b1de)
> ...
> [ 4947.849409] Call Trace:
> [ 4947.849410]  <TASK>
> [ 4947.849411]  ? __warn+0xcf/0x1c0
> [ 4947.849414]  ? dev_attr_show+0x24/0x60
> [ 4947.849415]  ? report_cfi_failure+0x4e/0x60
> [ 4947.849417]  ? handle_cfi_failure+0x14c/0x1d0
> [ 4947.849419]  ? __cfi_show_status+0x10/0x10
> [ 4947.849420]  ? handle_bug+0x4f/0x90
> [ 4947.849421]  ? exc_invalid_op+0x1a/0x60
> [ 4947.849422]  ? asm_exc_invalid_op+0x1a/0x20
> [ 4947.849424]  ? __cfi_show_status+0x10/0x10
> [ 4947.849425]  ? dev_attr_show+0x24/0x60
> [ 4947.849426]  sysfs_kf_seq_show+0xa6/0x110
> [ 4947.849433]  seq_read_iter+0x16c/0x4b0
> [ 4947.849436]  vfs_read+0x272/0x2d0
> [ 4947.849438]  ksys_read+0x72/0xe0
> [ 4947.849439]  do_syscall_64+0x76/0xb0
> [ 4947.849440]  ? do_user_addr_fault+0x252/0x650
> [ 4947.849442]  ? exc_page_fault+0x7a/0x1b0
> [ 4947.849443]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> Reported-by: Jannik Gl=C3=BCckert <jannik.glueckert@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217765
> Link: https://lore.kernel.org/lkml/c7f1bf9b-b183-bf6e-1cbb-d43f72494083@g=
mail.com/
> Fixes: 3666062b87ec ("cpufreq: amd-pstate: move to use bus_get_dev_root()=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Note:
>
> This was not tested with CFI as I don't have the toolchain available.
> Jannik, could you give it a spin?
> ---
>  drivers/cpufreq/amd-pstate.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 81fba0dcbee9..9a1e194d5cf8 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -1012,8 +1012,8 @@ static int amd_pstate_update_status(const char *buf=
, size_t size)
>         return 0;
>  }
>
> -static ssize_t show_status(struct kobject *kobj,
> -                          struct kobj_attribute *attr, char *buf)
> +static ssize_t status_show(struct device *dev,
> +                          struct device_attribute *attr, char *buf)
>  {
>         ssize_t ret;
>
> @@ -1024,7 +1024,7 @@ static ssize_t show_status(struct kobject *kobj,
>         return ret;
>  }
>
> -static ssize_t store_status(struct kobject *a, struct kobj_attribute *b,
> +static ssize_t status_store(struct device *a, struct device_attribute *b=
,
>                             const char *buf, size_t count)
>  {
>         char *p =3D memchr(buf, '\n', count);
> @@ -1043,7 +1043,7 @@ cpufreq_freq_attr_ro(amd_pstate_lowest_nonlinear_fr=
eq);
>  cpufreq_freq_attr_ro(amd_pstate_highest_perf);
>  cpufreq_freq_attr_rw(energy_performance_preference);
>  cpufreq_freq_attr_ro(energy_performance_available_preferences);
> -define_one_global_rw(status);
> +static DEVICE_ATTR_RW(status);
>
>  static struct freq_attr *amd_pstate_attr[] =3D {
>         &amd_pstate_max_freq,
> @@ -1062,7 +1062,7 @@ static struct freq_attr *amd_pstate_epp_attr[] =3D =
{
>  };
>
>  static struct attribute *pstate_global_attributes[] =3D {
> -       &status.attr,
> +       &dev_attr_status.attr,
>         NULL
>  };
>
>
> ---
> base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> change-id: 20230807-amd-pstate-cfi-8302498c54f5
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
