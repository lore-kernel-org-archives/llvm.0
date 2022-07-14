Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77D2F53
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:40:16 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id n74so4168207yba.3
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lu6wSZdbs1tW8071fLNm+qwJz0Gga60nDMQS/pMdOy0=;
        b=Aq9vpPI5Nj7rZ9ygAzRYELM6TKqbC/rS7Y8wLUqfFzzonUDS56lJAGtX3d2AjDLXdg
         hfNUHlVocVgVMtlFX3Lirjg4nGjFr8CK348ciz9fPazt5ACLRjEm6R87jmKudzn656fd
         pN64g08RDcMA1Nc0gJpBzp235E75gO7kFr3Fc0CF6q2NcbIn3fPrUDVMvXvatx0sevKO
         my9ddWO3Uol4/J1hYa5V2jA4NAqDi4lFi6sA7F/BYtUfDhHy0+2SzM0WUIGLiVhHEc0E
         ohTPHUxW0AGrbtU2QhZGAkudjpfVjPsMer1oxyrtEWCJBEysl/7cqo3BpFl2kz5jPyP4
         PtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lu6wSZdbs1tW8071fLNm+qwJz0Gga60nDMQS/pMdOy0=;
        b=v2PocvUtOFfcW60Up4QgoQU/pbNPkPoD+C/sjXaSN06nAzc2kXV2z9RCWKN13XsrGx
         BKSM3yI5191ly6ez0zGN3oXmzzR1d8p5FXSDUj4cX3xGAZWgsOOCiMyC+zZA4FiImQQn
         M9YfcLpGoSo6SH1XcxlxIeivoWM4N9Lt04/2DzGelY4DEKXoEvajM5wUhmRUw0NZhaKb
         knLIVYb1WqcbTUApPJnRZivGwyYx5WGmqe4+CfLFbZzMRTj6mNm6kIBZb+Pxix3HGVnq
         dODcOZ4pPyQM1yM24V+l/Lfa/qxF3nNTODnAYqC9ILaViisSDSg0oB3W/feJ9jiYdYT/
         AzqA==
X-Gm-Message-State: AJIora9KvsIuj03wXm/LcQnkqyhexi3YoLW6FrCgzv5eatobxcAenQHQ
	oEg6LZsuvcCk9oEa6kkZufo06tENpS+DeZX3Yr97wa+/vIuZMQ==
X-Google-Smtp-Source: AGRyM1supX8hPuV/sZdbncNqOlH6yVsdNGats0XpBcSB7ua/uAi8Fvf/U06L6ue4KPyzlFqevwLdQuqPNZxvlFVQoIY=
X-Received: by 2002:a05:6902:983:b0:66f:c668:fe2b with SMTP id
 bv3-20020a056902098300b0066fc668fe2bmr5188764ybb.617.1657816815042; Thu, 14
 Jul 2022 09:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 14 Jul 2022 17:39:39 +0100
Message-ID: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
Subject: help with clang build for mips
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am trying to build the kernel for mips architecture with clang. I
see some of the configuration builds properly, but some of the configs
fails with the error (fuloong2e_defconfig):

error: unknown target CPU 'loongson2e'
note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5,
mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2,
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600

Another one fails with (jazz_defconfig):
error: unknown target CPU 'r4600'

is there any way to build these configs which fails with "unknown
target CPU". or they should be skipped for a clang build?


-- 
Regards
Sudip
