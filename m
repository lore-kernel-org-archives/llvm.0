Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC48C0F
	for <llvm@lists.linux.dev>; Wed, 10 May 2023 20:20:41 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-959a3e2dd27so1364716766b.3
        for <llvm@lists.linux.dev>; Wed, 10 May 2023 13:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683750039; x=1686342039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAFo2QD9kP26+xLj7IQr31EYTyjtIOLhJ8ql3Ihcx00=;
        b=jxsmsS+gHVUJhyrdUSU1l6POO30DFjZvAUNL7ax2bs6B5GU/IFC6aC0LnwQX5zkrsx
         W/Nq0Z94IY3UyyadUsWpZDyLAaoy6pShR7AuyoznoXCXHVN5UKu4x+ioQKDdITW2GNPc
         am7MyjesHZcpOOaqtnKHkUegZ067hpj3saeOs31fcyOy4bdkWEEsFgtU21ZKYafg6bA2
         KL8lx28r5i1xZKrEjTbNYpjGDQmvISJNTGbQ9JKIjCUdI4ga/FhA03iXfRBXYhJnyvhj
         HEK+xU8GfzC47XnMA/+qWhX9uFByXx9EpBqLKRtLLQzwoEAruSlpkbA2YDasiHGldroa
         YHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683750039; x=1686342039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAFo2QD9kP26+xLj7IQr31EYTyjtIOLhJ8ql3Ihcx00=;
        b=AP9qlXej4kPKNnI6OYZSFHgHlhtyjoZ3ozuHqsjOojhWNUmWdNXImi3dO9oYy8Q5lE
         lLMML8MneZCu6R3BPoSmtmdtnHORWjoIqFdiH0+WEpzJTp3jr9bKHc8HMWWx8j3m9352
         rTyxXCL2uzWC5K8S5ZPAJwuSvQBmhmyH9LmGoh3T+qxMpIZ44jNfv9LAxVrh7HoMTdHc
         IPrh8OwWxV0DGabg01vB0Fkxue5AbGQ0YhiWAtV8Te0PfL+mNmsPhqQkwDu2BACfqPbW
         /PczD2hIl+akC29lrQUOxCT/O85AbwF0rrFauvH55ONlC72AmQqMwc4zYJShuRxHg0Gx
         om5A==
X-Gm-Message-State: AC+VfDzslBkW9DX/agu1c1Q7goyT2X1GQAwLyKTTx02CIM54lsGcEIgh
	+iJHE4KJOztMJi0XWr+nYIAvh3p3R+4WXLSnKKg=
X-Google-Smtp-Source: ACHHUZ6ZV3iLr3PUKpv3GxOStpEC4A5BOulRxZkBK+cDqBdXIdfnSBRtdzFLtvH4Qa3W8mSFyCCg+/4QeyJCLh7yU4g=
X-Received: by 2002:a17:907:e8b:b0:94f:764e:e310 with SMTP id
 ho11-20020a1709070e8b00b0094f764ee310mr19539753ejc.37.1683750038942; Wed, 10
 May 2023 13:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
In-Reply-To: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 May 2023 22:20:28 +0200
Message-ID: <CAFBinCBjvfNHUX5X=4jJ0Gtx1Z9MABMv7FioEabjvtbkOrTEkQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 2:39=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> Rather than casting mmc_free_host to an incompatible function type,
> provide a trivial wrapper with the correct signature for the use-case.
>
> Reported by clang-16 with W=3D1:
>
>  .../meson-mx-sdhc-mmc.c:791:38: error: cast from 'void (*)(struct mmc_ho=
st *)' to 'void (*)(void *)' converts to incompatible function type [-Werro=
r,-Wcast-function-type-strict]
>          ret =3D devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_=
host,
>                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>  ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_act=
ion_or_reset'
>          __devm_add_action_or_reset(release, action, data, #action)
>                                             ^~~~~~
>
> The same approach is taken in litex_mmc.c with the function
> litex_mmc_free_host_wrapper(). There may be scope for consolidation.
>
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
