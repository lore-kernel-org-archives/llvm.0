Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795067159;
	b=cUUZDdd5UzvbT3eUfEXqy8nGW2rumtxkU9mCPdq3fFxc248khK27seB6MATJmdVfJ1YC
	 gOniE9BsOtUQ1pqAhwrBfPkGusovP0Mmmv6+ph7sPMrHZFvbdcIhcy0gbplcWZpfPTN/0
	 K3ipNnNe/CIr28MHxDjK8B/T/vLOF5PA2r6lGLmvYUghcrI+GAN60n5mAgIhY1XiIDJ3B
	 yfQTUus0l+9nbnwKJuIPMkbERZHtcj7CiLeFhrewE0sxrwkoKEmIoL1/x2Pr8tQMoCfx0
	 UB7U7NPRlQApwndQ9rxq5lL5apk/p1Zfo33zW1XHcvLeBGtLX6TEduD/W9lSI0Kqi1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
	b=kyGC4NGbRP1MA6wjSSx5Xm2nA1K71ymAr3E/XQxZZNY/iO8iTpKCDtgDucteFRGTEW5S
	 Io1rU/1WFdtCR3v/yb8LbEFrZb+nwl1ACk1yuafHK5OzRSWAdoIejJaXjji3R94Mo2LGZ
	 VKyAZPMsovzuWsruyA8K3kmNp2BUo1vDjc0b2adwopI4fB1+6anWk7dL7g3FzzdCC4wdT
	 neLIGxN6Tc8SLAt/kE3LDjH+SAjYCew3muT+f8/BcGLqbp74RjKleW4fL8wiZEZyvEHN5
	 iN8Ke4hj40p1i2DoCqZayR71MkrccHVPjXn36lxXcHwWQUjQRRLtLqhfL7NoXAl70PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMxj3yB0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16884606A330
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16884606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMxj3yB0
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55be673e029so117421cf.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 21:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795067158; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7GCYHAIQvCasLHWlevLo3N0kHnaizfsO+fvHo50o2oMtVLYomVkKuUZ1EHmEBB/59
         0mi85l6//ZPLcuhxcXEEYRCMZBcEiuC2y3X7qVXDZFI6DttYstDwQC/SNJAto2H2actr
         ps6G13KhBw+3rHKEd5U9ULpB+oZu4UHd/+Pl4uVoK0bF/EU+2VRspcrKJsbEWvGuyzZi
         yEourH3w4UlQlxBNheTmmHJnwDw/JbmWjj+ksUkAp2ZsMjbLEoEoQEjG+QbrJkHjtCZF
         6hBGD0qtwQ0WEUpm2idPTpuiw4gYGbdkc3OvogHWjn/r8EbQYRm2LagD2hYXzE5qYCGs
         m3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        fh=0/jXngREDf6am/DBIBE6vCcLAc7lBEgXHtHZfZwviqA=;
        b=Xi/9fkYcwM9RO16WO3gy0o2xluaSwudWJgQG7wU2ejuAkF3DgO50tCg3N9SmDX8HEf
         4xsE3rlzdrVkx0Npu/VQDOTEq/zkRSVUTFURS3t7x07tfzsVGnrvN9nF1wG7URocoXXX
         CsAidx16JadPRu+PeOQ3pAiKzRmnNcmZ+x1avNVpTchffVpsqEbRbmKQlUohrZl0G4vp
         y5dxkxZiSlmp2sguJK4Ne1qErdruoVnS4HRD+n8OSAHUsdCHhkhn4OeMMOG4ng1OMOVs
         +uhx0oQr+p6qPfUNtGmHnAie6uOzcRjFe8KZ3wzN6cl3KS5fR9Nmp2t5F/sZiNJv8w3C
         sLmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795067158; x=1795671958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=JMxj3yB0SeAUHokTprfYVnrnmnS+Nxo3cczjmq3QQAOfFY6+gBYpfkzGSioGQ8MaaT
         9TcLPVQlTiiyLAcy5HbYgpaobHdwB4yb0nz9em2z5oxEKeLyVSIRtRD7ghLlVQDpESVp
         lbR5yGUGthueo8blACsDc54Ri2ML+0/lKnEgpTq7abthTw2uTpTi3VjzqOC/LMOvbPLc
         vbAjnK8Dp4ACS3bC2jUL8Yqi9Ak/QCMLL97O8cXzJ9g0FkzKoTefmYLT07Vmdfj/nSgt
         nTrKFZhlhf77LIKhdWcpjHZB9XGzJHjtgon1nmhQ5YDlKWjMjgcw0gIACUFXFgewRZLP
         Kgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067158; x=1795671958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=V+xWkjRFhkpnCK/KUgmCg5l8HiEX6urp35qrW2pevgpoDJUHedYxvvo0up1rDtcb7B
         dH87ePf4SvSVYEk0Lnlx3omzFQaV/mIOkw6hD9924MUDxnh6o5YZT1yinoxDwdzr0UJ0
         P59OtqrP8kXk+VIxh671sOowbsKRzTdmTXLS8GlhPWNQKULGbCh1HKkoR69LZth20bDI
         Ua4m2WfSZNcfelgMo4EWtn3iYWf7sgyVUza4cDFK8Pc7LxmpUlgl6GE58I4nTCgdGd++
         ZVDCi+8u7yDM+715PrAtTe7nabTOfEWkUi4D+bKOI7qUZvB8qr8ivSOSrn6cJ5etwsK5
         d8iQ==
X-Forwarded-Encrypted: i=1; AL+hErE/KYuB/sclL0P28y3nrmapXYt57MPE3tmr/3+1TjKEzVBwkcJgM3B0f53YXZf81jTCaXL6@lists.linux.dev
X-Gm-Message-State: APuU4Z97C6i6/4gB2eLkoC/fAjn3eW60jKRjJ5gwdP43u70DRuECsvvB
	cPF5fBPxzf3qvuiZDBTkF+wehGB+XfhYz1Q9Wvt0IClxCf3eDrZhsYc1Y/cC13dpJtOmQ3XtPq2
	JEgafG3kOu2c5vZGsogZQTFIofxp5vZdg293DbuB4
X-Gm-Gg: AYBFou0lYsZqBAdqFUjBuQoJr+6jUsck+Wu64yuxDf9m5lx+RfZ8Ifmlt1C2vr8qr8l
	Y/6D9ZBkIebhV7bnGHds3Pb6wzLLge9uZeh3TUx1ihYygNTzsT1Mlw2BIA+Z9yMy3qBWgj/YSW9
	omhTAQ3/Uwu5xNoBIez9pW/tAtoC21KM64eDVTeUCxgN1EvTa3OrOLz65s5ng7Eare0h+x7yD0t
	hMfIoAYHyry3f9YWQgxq7tiZWqXTP+eVzN9Ym2HoVgDXg1hy/6k2RWY6cheCaXtRZIYVdDmc3qF
	LncyGyXxWXl/GbRIFyV5H50Di1MGUh9aTzYww7viELAcdTjL2m8+flzDFrxI5bpMN4zgrzGTU7U
	dYKB4bGIdil+ti4qWHTrO1veF+gapoE4f6Rem
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr6557911cf.2.1795067157461; Wed, 18 Nov 2026
 21:45:57 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-10-irogers@google.com>
 <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
In-Reply-To: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 21:45:45 -0800
X-Gm-Features: Aa3M54p8GzPfKDPQ_HJcPbdLHGq3vwK7n9VGnVvnVB1ODjbFHeHwrlgOfVCaaEo
Message-ID: <CAP-5=fXrMyfLFXq6CiqwWMSbtYVRNESxuDo-ddqNwDmq5Nm4SA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of struct kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Nov 8, 2026 at 11:39 PM CET, Ian Rogers wrote:
> >  static const struct kobj_type cpuregs_kobj_type =3D {
> > +     /*
> > +      * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
> > +      * cpuid_cpu_offline() only calls kobject_del().
> > +      */
>
> All of these comments carry a =E2=80=9CPre-existing:=E2=80=9D prefix, but=
 that doesn=E2=80=99t
> distinguish cases with broken lifetime management from those where the st=
orage
> remains valid despite the API misuse.
>
> For example:
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_xcp.c
> > index ab14079d1c42..0847134a1391 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > @@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_op=
s =3D {
> >  };
> >
> >  static const struct kobj_type xcp_cfg_res_sysfs_ktype =3D {
> > +     /*
> > +      * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
> > +      * rather than freed individually by kobject_put().
> > +      */
> > +     .release =3D NULL,
>
> Being embedded in another structure doesn't explain what guarantees that =
the
> enclosing allocation outlives the kobject=E2=80=99s final cleanup.
>
> Could you please drop the =E2=80=9CPre-existing:=E2=80=9D prefix and make=
 that distinction
> explicit? For broken cases, describe the lifetime problem and mark it as =
needing
> a follow-up fix. For cases where the lifetime is safe, explain what guara=
ntees
> that safety, while acknowledging that omitting release() still violates t=
he
> documented API contract.
>
> Also, do you plan to follow up on those cases?

Makes complete sense, thanks Danilo!

Auditing all 17 files in patch 9 with that distinction in mind:
- Only 3 built-in sites (arm64 cpuinfo, ACPI hotplug profiles, and
s390 sclp_mem) have backing storage that genuinely remains valid for
the lifetime of the kernel.
- The other 14 files either free/zero an enclosing dynamic or devm
allocation without waiting for final kobject cleanup, or are tristate
modules that unregister static kobjects/ksets on module_exit and can
unmap module memory before delayed cleanup finishes.

I've dropped the "Pre-existing:" prefix, documented the specific
guarantee or FIXME lifetime hazard at each site in v4, and yes, I plan
to send follow-up fixes to the respective subsystems once __must_init
is in place.

Thanks,
Ian

> Thanks,
> Danilo
>
