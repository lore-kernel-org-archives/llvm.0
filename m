Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737E814A8E
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 17:22:34 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76cded293e8so422341985a.2
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515353; x=1692120153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QToAetuOKqk6KlcwFnxlW4pv9tJbYlRSUo8zVZOIBoo=;
        b=x3+okNrHxwteJVxE9P7xvlSvMXSMSfFQLXfreCFLO+KwUMB1ZcLkHHWvsw8C1crZfi
         94/Wv7lhK1/n5VulvtHVY0DXE3MdbInnralMazMsyNkQDLoupBzwQrKVvYxj5pWCPA2+
         WooLZaDnpKfes/b0/A19G1uhHVaDc6CtW3H8qRJQbZD/TSJWWVeoMtgCgplEmW8gs49P
         W3K3dooGHhgco6o69EVttAFhlfEznGqM92TBQQtIVdGvnekAS6qEq1nOM0ZLwHCthmHf
         2OSXnBlD1FDXktBAf9BSUKU7BeBPbN/XWswa9E1b+ewibdmiaCVyqIksW5wmwYo85QZt
         EFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515353; x=1692120153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QToAetuOKqk6KlcwFnxlW4pv9tJbYlRSUo8zVZOIBoo=;
        b=dH8cVhMkbQTJ8MquzEfM8Jxq8y6F7i2KX2zCBgldxn94Vl5Y33GopzzpwhNmq/AAkh
         CSgY4Ok8iA1OUANuoZED1IzS1/yLEjK+TuII2ZoduNEc17mvZ/x/WxByqhyXAEcvlADy
         F/5NmjeTgzaawyNXczy9Qki/ff/ObnOpLg6xQwaO/FhLfZStjTU9L980Kx3mePdvRPvm
         rp25SVeB5nPH7H50ZxJnxHSxDhISsilSl9Tbw5bv1mpxexeVBcXplB6g3PjIJa1Xhi8i
         lTBfLw07KaKr/81c81Qwkj7OEk0U+Pclc2Z59ru9qmPuNBS3scluJe/AjetGHf0xaNSn
         UayQ==
X-Gm-Message-State: AOJu0YysPLM27p5TOx8xohDitXBI/pqf+LB6Bapl5G+ZjQ4EHSmlnipr
	PZeZHQs8XVbmPQ094UH87f0UAQPSFaXBTgkUsdgHzmShA3FfslcKnh9bPA==
X-Google-Smtp-Source: AGHT+IGx1Hvm8GzUNEC4qBxcvszi1ZgPs7hwI3gCJ7ARlCRyZ6+kA7nZ6709ZdZ9q/d5dH8ck5s7td3mHpji47CG91s=
X-Received: by 2002:a0c:cc03:0:b0:63f:7b35:6ad8 with SMTP id
 r3-20020a0ccc03000000b0063f7b356ad8mr88500qvk.23.1691515353160; Tue, 08 Aug
 2023 10:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230808-um_hostaudio-v1-1-3d40fbe1fb1e@google.com>
In-Reply-To: <20230808-um_hostaudio-v1-1-3d40fbe1fb1e@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Aug 2023 10:22:21 -0700
Message-ID: <CAKwvOd=+GHvgFhZyWbZsR8+-Z0WzVAvncM-mhcycR1q244GykA@mail.gmail.com>
Subject: Re: [PATCH] uml: audio: fix -Wmissing-variable-declarations
To: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 10:21=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm looking to enable -Wmissing-variable-declarations behind W=3D1. 0day
> bot spotted the following instance:
>
>   arch/um/drivers/hostaudio_kern.c:316:3: warning: no previous extern
>   declaration for non-static variable 'module_data'
>   [-Wmissing-variable-declarations]
>   } module_data;
>     ^
>   arch/um/drivers/hostaudio_kern.c:313:1: note: declare 'static' if the
>   variable is not intended to be used outside of this translation unit
>   struct {
>   ^
>
> This symbol is not referenced by more than one translation unit, so give
> it static storage.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/

^ D'oh, wrong report, this should be
https://lore.kernel.org/llvm/202308081050.sZEw4cQ5-lkp@intel.com/
Resending.

> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/um/drivers/hostaudio_kern.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/um/drivers/hostaudio_kern.c b/arch/um/drivers/hostaudio=
_kern.c
> index 5b064d360cb7..c42b793bce65 100644
> --- a/arch/um/drivers/hostaudio_kern.c
> +++ b/arch/um/drivers/hostaudio_kern.c
> @@ -310,7 +310,7 @@ static const struct file_operations hostmixer_fops =
=3D {
>         .release        =3D hostmixer_release,
>  };
>
> -struct {
> +static struct {
>         int dev_audio;
>         int dev_mixer;
>  } module_data;
>
> ---
> base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
> change-id: 20230808-um_hostaudio-21d7207deaed
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
