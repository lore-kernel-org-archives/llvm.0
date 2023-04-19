Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745F333EC
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:14:18 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517bb11ca34so194543a12.0
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 14:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681938858; x=1684530858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nzf68FaVUmtk731uqhqZ3z1K+cuL6ITnPGFPOaYG/Xo=;
        b=1PWp293U9uQOzABXuwX03Nv6JhKms2u6bdpYCyD1vAGb4hDRq/D6tn2cx6GjwB5Pe/
         uI+SJuVTuc5W1fdoQARkAfBd71lmR7piYn5g9LAf2pvyyEhVbGDr427Bg0iWzN9My80B
         jPQl7CtUN6skO6UZ43Z9l1fFwAnJSYbR+BN56Uhj/PjHRzXG78LlFxRagzUcijHhgLC5
         Q2GDImKw9oZJeykT6L3srCK227EbSJo6e5NGmmo1NwlNDhZi2XLZ+1vcfCu/jHhRyMPd
         vrAtXrfqxXUsg3L4KvY0sU8TAROVNQeDcUT+5oLs67wBl3HB7uDziav3uAMf/TAFETCY
         9rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681938858; x=1684530858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nzf68FaVUmtk731uqhqZ3z1K+cuL6ITnPGFPOaYG/Xo=;
        b=bwNbhxFQPWhYrbi8TEqIvDvBscapSt+6tJ5m/VAm7++cqNu7Z8Zfwlr12NCgrftiSG
         yoPOa3bAnJSsk+KKdvub2ip8WwzFsk/GXX79kuf9PCTksjoMIdj09zDwP8m96YQ+vv/d
         QrOqTRuTqYRSbPD1dU5NybIPr2JR3Ric8vfGHy+4Iv7cA2hX1L3R8Utni2Zi4RRjiY6H
         1Nq2LPbsa08GoYDpm5QKgC8n7Y7VJzn/SopSw0K4+AmqzLltTXjHwJ/5y+BYRRk1o2m9
         5krDcjqhY+uPRZFIifRZWgYiz+BzY+/A9qnA6LWJZhPDsdFYQel2VpLAZFUXyPBo4Q9d
         O5IQ==
X-Gm-Message-State: AAQBX9eUMMkn08KFYDtXY/UPW9SuU2L9AtQ0F5E332ng8Wvmfl36oVk3
	qijrez2LDp/UvrLDa7lEPKMojaER+ftqzgV2hgpcog==
X-Google-Smtp-Source: AKy350ZHftN1Ugfbu/HRrNVQr6gP8etuO08rOMKi3s01Syg9itb4X0l03Y4y30BVLk+mVrwK5dPLpE+IE1iEK3oDmLA=
X-Received: by 2002:a17:90b:3141:b0:23b:2f4a:57bb with SMTP id
 ip1-20020a17090b314100b0023b2f4a57bbmr4260368pjb.10.1681938857703; Wed, 19
 Apr 2023 14:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
 <CAKwvOdnj7rNeh0YeX2NPcbkoJBnRwXb9Dt0SF9mHaMKYVLjCjw@mail.gmail.com> <ZD9/7Oed8Rujjj/0@kernel.org>
In-Reply-To: <ZD9/7Oed8Rujjj/0@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:14:05 -0700
Message-ID: <CAKwvOdn9heTWFTSA8oX56Grsh8z6wDEK5K6Mia2B=cO2gz-K8w@mail.gmail.com>
Subject: Re: [PATCH] soc: ti: pruss: Avoid cast to incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 10:45=E2=80=AFPM Simon Horman <horms@kernel.org> wr=
ote:
>
> On Tue, Apr 18, 2023 at 11:44:28AM -0700, Nick Desaulniers wrote:
> > On Tue, Apr 18, 2023 at 4:41=E2=80=AFAM Simon Horman <horms@kernel.org>=
 wrote:
> > >
> > > Rather than casting clk_unregister_mux to an incompatible function
> > > type provide a trivial wrapper with the correct signature for the
> > > use-case.
> > >
> > > Reported by clang-16 with W=3D1:
> > >
> > >  drivers/soc/ti/pruss.c:158:38: error: cast from 'void (*)(struct clk=
 *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,=
-Wcast-function-type-strict]
> > >          ret =3D devm_add_action_or_reset(dev, (void(*)(void *))clk_u=
nregister_mux,
> > >
> > > No functional change intended.
> > > Compile tested only.
> >
> > Thanks for the patch!
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > Here's some more suspects to look at, if you have cycles:
> > drivers/base/devres.c:734:int __devm_add_action(struct device *dev,
> > void (*action)(void *), void *data, const char *name)
> > drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1159: ret =3D
> > devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
> > drivers/soc/ti/pruss.c:96: ret =3D devm_add_action_or_reset(dev,
> > (void(*)(void *))clk_unregister_mux,
> > drivers/mmc/host/meson-mx-sdhc-mmc.c:791: ret =3D
> > devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
> > drivers/pci/controller/pcie-microchip-host.c:866:
> > devm_add_action_or_reset(dev, (void (*) (void
> > *))clk_disable_unprepare,
>
> Thanks, I will take a look as a background task.
> Let me know if there is any urgency on your side.

No urgency on W=3D1 warnings.  They are good cleanups to do.  I meant to
invite you to our meeting today (but forgot):
https://clangbuiltlinux.github.io/ has links to more info under
"Bi-weekly video meeting".

We could use your help if there's anything in our issue tracker that
looks tractable: https://github.com/ClangBuiltLinux/linux/issues

Thanks for the patches.

--=20
Thanks,
~Nick Desaulniers
