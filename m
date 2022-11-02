Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74C7C;
	Wed,  2 Nov 2022 08:06:41 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso3113828pjn.0;
        Wed, 02 Nov 2022 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:in-reply-to:references
         :thread-topic:message-id:cc:to:from:subject:date:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GLszQCumZWqrTfvpFmiT1zAxxk2ej2c9UMZ+mNXeV94=;
        b=Moi7dpk1LJeUfxV0DdqXgPkpq5kb5nYev7rVzmpwpkmLq4SV8METyZ8EDaFUa8Bc/u
         oAuYb9WSEL4oFHSRATMeGK8R/gDkEla+oHGEgC485GLTkPxkQWukERCuUFQBOLipzj7u
         7uykdoRmOVafFQh6o4lwtapbJeAMaEa2EHs0kxSA6JsOUrmonUiOxnW46WW5AkPT+GyX
         6C9K9uzDTEsQ+ThBO3VsnWi4lGd2xx5pdVrviOMBZgLCuclSvVaxqefSX2o985BbM7r7
         o9eMrzDOLEmCqul0QCJDd+WO5qtQqy9n3F1E62DD8u1pmqxxHuws6CKuMi/UBNNIWDBW
         xpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:in-reply-to:references
         :thread-topic:message-id:cc:to:from:subject:date:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLszQCumZWqrTfvpFmiT1zAxxk2ej2c9UMZ+mNXeV94=;
        b=8ERq/vT3eQmhPomus/css7p8X4t+nOXb/aVMGix7luo9w+xVqpzfOUuoK3oi66v04a
         71ZxtvoHcPmC9GoCA9pEaWZplTcxZ72b7KfB661jXVDhMz2GiqtQgu8KH/uEfDKasBa8
         kCXJszUidFK4EZP0pv31DcTqBhtyeNeRKx3g3uqlNWAntIOxneLbowrgJs0tgemiKArj
         d7jMyefdcY1hKVqGU9JD0YOhZFiyRJuRf1qxQOu3RqGQfbPIku35Ds48dl2Ax4hi1LXt
         V1IeE+iRoDABU/uzGAama8Zt/aVqKFL9ZpS/jWCN5L4A0Ujm0A43Q+/BrgFpzW4cA5vx
         YZ/Q==
X-Gm-Message-State: ACrzQf35Z6ohJDXvpV+8h77gDp4jl95OljSk1yOTDY+lgyghGIy+kO35
	Xgd1FzZrNtMB0VxJ/sszoC8=
X-Google-Smtp-Source: AMsMyM5ApROJteN8GCkjXAcHHCSwo5JHewXdkxfieJTf035q106jCFJaP/DWZiC1p14+TbUXQiBG9A==
X-Received: by 2002:a17:90a:2f88:b0:213:f498:eb63 with SMTP id t8-20020a17090a2f8800b00213f498eb63mr12350187pjd.232.1667376400471;
        Wed, 02 Nov 2022 01:06:40 -0700 (PDT)
Received: from [30.20.53.44] ([203.205.141.83])
        by smtp.gmail.com with ESMTPSA id a19-20020aa795b3000000b005636326fdbfsm7827431pfk.78.2022.11.02.01.06.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Nov 2022 01:06:40 -0700 (PDT)
User-Agent: Microsoft-MacOutlook/16.66.22102801
Date: Wed, 02 Nov 2022 16:06:37 +0800
Subject: Re: [PATCH] io_uring: fix two assignments in if conditions
From: Xinghui Li <korantwork@gmail.com>
To: kernel test robot <lkp@intel.com>,
	<axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
CC: <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>,
	<io-uring@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Message-ID: <F8C3CD1A-A2C0-4772-8AB6-2F2ED04A9F76@gmail.com>
Thread-Topic: [PATCH] io_uring: fix two assignments in if conditions
References: <20221101072956.13028-1-korantwork@gmail.com>
 <202211012335.tCnMjA6q-lkp@intel.com>
In-Reply-To: <202211012335.tCnMjA6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-version: 1.0
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable



=EF=BB=BF=E5=9C=A8 2022/11/1 23:10=EF=BC=8C=E2=80=9Ckernel test robot=E2=80=9D<lkp@intel.com> =E5=86=99=E5=85=A5:

>    Hi,
>
>    Thank you for the patch! Perhaps something to improve:
>
>	......
>    If you fix the issue, kindly add following tag where applicable
>    | Reported-by: kernel test robot <lkp@intel.com>
>
>    All warnings (new ones prefixed by >>):
>
>    >> io_uring/poll.c:601:7: warning: variable 'apoll' is used uninitiali=
zed whenever 'if' condition is false [-Wsometimes-uninitialized]
>                       if (entry !=3D NULL)
>                           ^~~~~~~~~~~~~
>       io_uring/poll.c:608:2: note: uninitialized use occurs here
>               apoll->double_poll =3D NULL;
>               ^~~~~
>       io_uring/poll.c:601:3: note: remove the 'if' if its condition is al=
ways true
>                       if (entry !=3D NULL)
>                       ^~~~~~~~~~~~~~~~~~
>       io_uring/poll.c:594:26: note: initialize the variable 'apoll' to si=
lence this warning
>               struct async_poll *apoll;
>                                       ^
>                                        =3D NULL
>       1 warning generated.=20
>
>
>    vim +601 io_uring/poll.c
>
It is do a problem, I will sent v2.
Thanks a lot!
    --=20
    0-DAY CI Kernel Test Service
    https://01.org/lkp


