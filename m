Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C1BA4F;
	Fri,  4 Aug 2023 14:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71796C433CA;
	Fri,  4 Aug 2023 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691159183;
	bh=E3e/RrfDh8oIx0OZAQHQ+IDfpwQVMEWdT14roAUdV4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OCLpdh7eoaScz11goFs38Ng2rtjJ8uzfmOnQpOygNjtun+9bMnKoH4phYDWX16uez
	 cEwhoXE7qL3uSHw+F6qQZusKpKc4KX8Eg9xvUVcGUK98ifBK66kSV+yGQheeDOyd1a
	 ijczwVMBK3ex69WwTknCblUC7NcJ0zOEHy2hitxdrVMR86N4ihKqMfGAWXjxXAtp2z
	 zkkETMsadN400FO2EoH6wIeZMkX7F3RoLU1c4C3LF5DNEF5tyN5yxwm3aiV1B31soX
	 eB8fTzK4Etphyl18h5khS5HxJx3cD6L16J4tJqHVP92rvE7OwkAnvtBfOgi5QAODIS
	 sMCsuFf2cQF2Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9cf2b1309so27288051fa.0;
        Fri, 04 Aug 2023 07:26:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YyUUaqQCD235B/kwfQycJSZ/uOfFK2lObeqc5ICRiQBxW9rf6Ew
	0uIYW7go4UZcVc6HdO5MLN8tSekHaOcO1wsrgg==
X-Google-Smtp-Source: AGHT+IGVwA3t/rc+I8YxkRQqV7zrIm/I886EhP+qYvTae2ciEnvfPlYw7WitcST/wmTl7QqZA9FKIl0ERIQIB+2ZgeU=
X-Received: by 2002:a2e:b5c8:0:b0:2b9:b1fb:5ff4 with SMTP id
 g8-20020a2eb5c8000000b002b9b1fb5ff4mr667905ljn.21.1691159181464; Fri, 04 Aug
 2023 07:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308042049.8R2tNRoo-lkp@intel.com>
In-Reply-To: <202308042049.8R2tNRoo-lkp@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Aug 2023 08:26:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKn3vm_LQ64eo-fgQ09RBPtSH=CdC-u=ezyOQs=kMHmBQ@mail.gmail.com>
Message-ID: <CAL_JsqKn3vm_LQ64eo-fgQ09RBPtSH=CdC-u=ezyOQs=kMHmBQ@mail.gmail.com>
Subject: Re: [herbert-cryptodev-2.6:master 83/83] drivers/char/hw_random/xgene-rng.c:110:2:
 error: call to undeclared function 'writel'; ISO C99 and later do not support
 implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 6:14=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev=
-2.6.git master
> head:   1ce1cd8208ad6060e4fcf6e09068c8954687c127
> commit: 1ce1cd8208ad6060e4fcf6e09068c8954687c127 [83/83] hwrng: Enable CO=
MPILE_TEST for more drivers
> config: s390-randconfig-r015-20230801 (https://download.01.org/0day-ci/ar=
chive/20230804/202308042049.8R2tNRoo-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042049=
.8R2tNRoo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308042049.8R2tNRoo-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/char/hw_random/xgene-rng.c:110:2: error: call to undeclared fu=
nction 'writel'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
>      110 |         writel(fro_val, ctx->csr_base + RNG_FRODETUNE);
>          |         ^

Looks like my DT header clean-up patch collides with this one. An
explicit io.h include is needed.

Rob
