Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728407EC
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 09:28:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n7so12417451wrv.4
        for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=LZiPZabk8uBgJRKOzhDJ2uC93G1aMkxBm+1//LLMvqw=;
        b=PpCeVcqMgILqQyzKcfm/hYQMiH5rJcmQtUa6hRVk7gORFWsMAM2eLp32v6iNcRPARn
         fsAkKZTs/7l5zKLu7ltMs1T/BZ5ZGFymB0XPU4Q+y0zBKGi1q/LoFDldlYrZL354K48/
         dTTuZPFwEoyiKuzStbwLcyQNTCvZUnIqnURkyotQO+xz5KeNVbRlCh9y0xRh6hqHpjyB
         R7VIFpAB70knHoCKjMHifSF9vovtTz7LBvXMpB4Djr0JBm98LGaAKUowFbNo7hMrzkWd
         l/bu3mEzm8qZoFWvCwQNw+SLYbKSyK0IyaIvnVsq0KYqo9jPcubYL8FXUg8GJieNuJvm
         NzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=LZiPZabk8uBgJRKOzhDJ2uC93G1aMkxBm+1//LLMvqw=;
        b=Cv1yTkzKEb6NlzkDj12+rBf60l/hzMOJtI3jOd53F3y4zhYa3YaHRsiDMoZvQL8mib
         FA5gDL7N7XeNbdAtQ6npL4dQjqZCdrPnoGnPZJThQmh00ResKgC12aSqMWHMB8zaWd5Y
         3n3Q5IvbbJMbOnIDVSGLmL9J8hXnPQh/MR/z7ae6ZerweMNngwTNfzV/iaWfSJJiyXXA
         ehvfiWa0RZX0kzwTuGzJ0N70DeJIbiqUxnlF/oTOEYXFxXO2f8WaEEMun6kII5+kQQ/j
         Q5UZauMdaVHU4rUZPlkLVsYmM9jsTa2knlzLhIh0Dt6uPsNudx8mvTIz+mgIUWh++YuL
         jmrQ==
X-Gm-Message-State: ACgBeo33NJMFO+Y4v1kZ8SO5R3ZeEim+uFjMmLP7AMzh9AJUnZvVj2LQ
	VYQ0uID6PnI3MU8OLdg23PQ=
X-Google-Smtp-Source: AA6agR5TCN6tBlMC5N0TVpsdW5/8135kWB6j/OBUdEV/Us8d0j9b322vyx644RgsF8mNnzeqLXBAVA==
X-Received: by 2002:a05:6000:1acf:b0:222:cff7:3b6c with SMTP id i15-20020a0560001acf00b00222cff73b6cmr10285263wry.191.1661160532519;
        Mon, 22 Aug 2022 02:28:52 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c355500b003a5ee64cc98sm19491518wmq.33.2022.08.22.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 02:28:51 -0700 (PDT)
Date: Mon, 22 Aug 2022 10:28:50 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Matt Flax <flatmax@flatmax.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: build failure of next-20220822 due to 4e6bedd3c396 ("ASoC: codecs:
 add support for the TI SRC4392 codec")
Message-ID: <YwNMUlAmu/qCjuva@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

Not sure if it has been reported, builds of arm64 with clang failed to
build next-20220822 with the error:

sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                default:
                ^~~~~~~
sound/soc/codecs/src4xxx.c:298:59: note: uninitialized use occurs here
                ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
                                                                        ^
sound/soc/codecs/src4xxx.c:223:20: note: initialize the variable 'd' to silence this warning
        int val, pj, jd, d;
                          ^
                           = 0
sound/soc/codecs/src4xxx.c:280:3: error: variable 'jd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                default:
                ^~~~~~~
sound/soc/codecs/src4xxx.c:293:59: note: uninitialized use occurs here
                ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
                                                                        ^~
sound/soc/codecs/src4xxx.c:223:17: note: initialize the variable 'jd' to silence this warning
        int val, pj, jd, d;
                       ^
                        = 0
sound/soc/codecs/src4xxx.c:280:3: error: variable 'pj' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                default:
                ^~~~~~~
sound/soc/codecs/src4xxx.c:288:59: note: uninitialized use occurs here
                ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
                                                                        ^~
sound/soc/codecs/src4xxx.c:223:13: note: initialize the variable 'pj' to silence this warning
        int val, pj, jd, d;
                   ^
                    = 0
3 errors generated.

git bisect pointed to 4e6bedd3c396 ("ASoC: codecs: add support for the TI SRC4392 codec").

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
