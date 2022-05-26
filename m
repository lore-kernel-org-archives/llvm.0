Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A210EA
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 00:55:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id n10so285063ejk.5
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JaqQEwN5gGu7MuEou1u1zwwpE+vqC3sAxcFTo02SWDA=;
        b=bhIkJ14BXb4Gmmp5f8z02sxBhmmF8TGvh22Xut1tW0ARNZ219RGX+wDUOBoddOxasb
         PGt9EIIl0NJdNBixbeh6bgcmUh5262AJYw/ZYLvhECdizqGT6ooae01wART2qqLCv8lf
         bA4cAR6zOdWtKEcUl8+nSv9hJS/mSVGl/hNMXAZlXHYa/YajTW7VXpZT7+oysBxRgIn+
         +IE6D8w+1ffUNjJ8HGKCYT16ltx/GffdyDJXa15RTvUM9gYm96e3z/BNOB/UsxEDnPi2
         FYPYdZFd6DEqztc01Reat8aS3WeDkLbWIixPR2WWoGeJtfsvcUm395TiS8r14DN8caIj
         qZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JaqQEwN5gGu7MuEou1u1zwwpE+vqC3sAxcFTo02SWDA=;
        b=SY63nMH6zc97kQwz+hi8loeXSRUr+nW9VLlPlu0x5SOIK3cmaNiI3utFDCteWUEdER
         tP32nIZhGLFnazNzhZe89eA/oZnhOAAOzJ9/cpGpcwZ7rmvdJmcLKZnsjqCdtcpDZDBn
         uQiFQSvL6AI1mIAPe5Jfg7Mn4jMA7cbJCkLadSEJnJ4kDJi0j/Rh6SqLMrfzi5GBvpsj
         1ZHRPWUVPirIIoEXHLXAHwWKiCQu81qTW1J4lsPVczEUPf3sNbM3Pceg9Ux10y+ezdGb
         jGDpFBnFsEVKdzBt4SPm0sTeEcWhMH2y0uvQ4PFpHn/Gh9zTye+JpYXgm88JZyMeDTwN
         zv0A==
X-Gm-Message-State: AOAM531z3+RIKWC5Ov6uXbFmEqmuRyyvDxpuH/J7+p9NGDpvsXAJWZmP
	/PMqF7exRWVNXn3cmyToWEZlYg305o/ys3zpzN8=
X-Google-Smtp-Source: ABdhPJxbRJIRlPwAO+7B0ZusKYSyfuUNbkRZqmO2LtsmNDK2xa9R6Xz5WYrhI9objzsk+DpgQnEBUMySDnRFwFcUp80=
X-Received: by 2002:a17:907:728b:b0:6f9:a9bf:a8e7 with SMTP id
 dt11-20020a170907728b00b006f9a9bfa8e7mr32415738ejc.696.1653526528840; Wed, 25
 May 2022 17:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205021042.xPjJ6Z4J-lkp@intel.com> <CAOMZO5Dg8_vDbW0vau4YFspZZ-RS=in8xEavkyYvBAQB41xTWA@mail.gmail.com>
 <Yo7MFbwDyT+1lzcr@dev-arch.thelio-3990X>
In-Reply-To: <Yo7MFbwDyT+1lzcr@dev-arch.thelio-3990X>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 May 2022 21:55:20 -0300
Message-ID: <CAOMZO5ARsRj_M_sX4dNk1039e+NG8C65asx2PG-kVzibQWfBZQ@mail.gmail.com>
Subject: Re: drivers/dma/imx-dma.c:1048:20: warning: cast to smaller integer
 type 'enum imx_dma_type' from 'const void *'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Wed, May 25, 2022 at 9:38 PM Nathan Chancellor <nathan@kernel.org> wrote:

> Either an intermediate cast to uintptr_t or unsigned long or replacing
> the enum cast with one of those should work. See commits:
>
> 2602dc10f9d9 ("memory: renesas-rpc-if: Silence clang warning")
> 10462b3558d4 ("can: mcp251x: mcp251x_can_probe(): silence clang warning")
> 83415669d8d8 ("can: hi311x: hi3110_can_probe(): silence clang warning")
> be5aeee30e45 ("scsi: fcoe: Suppress a compiler warning")

Thanks for sharing these commits.

I have submitted a patch.

Cheers
