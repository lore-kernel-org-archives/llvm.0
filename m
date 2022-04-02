Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD67B7C
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 20:04:16 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id n35so3593041wms.5
        for <llvm@lists.linux.dev>; Sat, 02 Apr 2022 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yQeqwIeqI5CMAgG8hDfKbZn0Debf8w0vr8QNNYkJmUI=;
        b=rg468YkTGw4qq+7BTqNb+9e2AW7798nZyQsEw7APtpHfEScIn4mAxPp40epSJ/DqqM
         FW1ukFdIVMS8churmP06RZyQPTzPyQdeidOkNAX+hpVRYnSNHIas4ePrAYUdilNlEtP6
         yhnuvRTNyZSAysfMJPll2xZUF3wAuxL6zspWSXz5gwdt66ugNBr5eNsZNqbFT3zYWfIS
         xF11MED8ko9Bbk+x/u3f9nXO5nIl3PYMXVFAdWugobCvQR8MjCmx7qd9kQCp38gnhfrO
         fC+b2Ptuhb93WvKGvSwgJ6rFJy4o9pM7VSVPTbWuBDCRyrqbelhElQJYJEsZnujnWVO5
         McYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yQeqwIeqI5CMAgG8hDfKbZn0Debf8w0vr8QNNYkJmUI=;
        b=I8H2uM67jl7I8QBCUFWDONog3WcOsyt97PUQq4w7b7LxWmQkpefhJI8e37owuubGn7
         DC4dpR04YKi7x0Ds46kt9EFAqITeVJwKWwHkEdPimv94s0YU2/DpFx5oYyjXNj7donyC
         tdf1NyKSvefdJTw9j8K7MCoE4kmwPbsgWdPEJc3icj3pJdwp91qPrAUeDMSHGB6KdKE9
         FIl44EWRZF2sKcYdBgSOVyYS0R4yTiAbvhKgLOSo6UOS95vUofCKUVp0L23InAbrnW8m
         o/S2fJrdjIf0j2Ew4JY1Pup6C1xN4GxeR+lVpbJU8s6nPluSiV+DCg0uJi7EkyEsmRvv
         j99A==
X-Gm-Message-State: AOAM532fF+YCGGCyITBPAnoUhErqaT6F1AM2vKpKy43DAc/oipDh0QhY
	d+d5pkJObsKPlslgyRKHkqhMNQ==
X-Google-Smtp-Source: ABdhPJy6NaiDP7v3t/VgL9bpERiXPtZ6xlytZQf5riyEAwmfhgWKXXpEcvulkX/plHpsKoVk6W8Z4A==
X-Received: by 2002:a05:600c:5029:b0:38c:9768:b4c with SMTP id n41-20020a05600c502900b0038c97680b4cmr13117148wmr.123.1648929854661;
        Sat, 02 Apr 2022 13:04:14 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id h10-20020a05600c144a00b0038ccc75a6adsm13008386wmi.37.2022.04.02.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 13:04:13 -0700 (PDT)
Date: Sat, 2 Apr 2022 22:04:11 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
	robh+dt@kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 10/33] crypto: rockchip: rework by using crypto_engine
Message-ID: <YkisOxklZgCejfad@Red>
References: <20220401201804.2867154-11-clabbe@baylibre.com>
 <202204021634.IhyHrjoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202204021634.IhyHrjoT-lkp@intel.com>

Le Sat, Apr 02, 2022 at 04:22:56PM +0800, kernel test robot a écrit :
> Hi Corentin,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on next-20220331]
> [also build test WARNING on v5.17]
> [cannot apply to rockchip/for-next herbert-cryptodev-2.6/master herbert-crypto-2.6/master v5.17 v5.17-rc8 v5.17-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Labbe/crypto-rockchip-permit-to-pass-self-tests/20220402-042221
> base:    fdcbcd1348f4ef713668bae1b0fa9774e1811205
> config: arm64-buildonly-randconfig-r001-20220402 (https://download.01.org/0day-ci/archive/20220402/202204021634.IhyHrjoT-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/be381eb03ba20a6e06f0e880a9929d14a1e13064
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Corentin-Labbe/crypto-rockchip-permit-to-pass-self-tests/20220402-042221
>         git checkout be381eb03ba20a6e06f0e880a9929d14a1e13064
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/crypto/rockchip/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/crypto/rockchip/rk3288_crypto_skcipher.c:21:46: error: use of undeclared identifier 'tfm'
>            unsigned int bs = crypto_skcipher_blocksize(tfm);
>                                                        ^
> >> drivers/crypto/rockchip/rk3288_crypto_skcipher.c:328:6: warning: variable 'n' set but not used [-Wunused-but-set-variable]
>            int n = 0;
>                ^
>    1 warning and 1 error generated.
> 

Argh, I didnt retry to compile this serie one patch by one.

Thanks, I will fix that in v5.
