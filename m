Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3F7F
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 23:51:16 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id h13so2038409pfr.7
        for <llvm@lists.linux.dev>; Thu, 06 Oct 2022 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flatmax-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb0bMzq7CzIxn27Bm3qAvEt7vJtMj9Hk4nZZ0L4qohs=;
        b=q4540usMviIDIHmpiRUMzOa910OncxizTkP+E/hL5zNuXzop6odk7tuyzVEDTHNHIX
         X/3uM3TDImpdIbf4DvksZX1syZyFsZK4mB3ANxxnmaqVDlvw1/wVxyOEI0siPqwKhj//
         MhmpNxgQNCEdGkfr95TMowoeyKvNWZ3P/PQorHxYmfj7BdtflyblEDl1m7lL7Jhi68xG
         14UsSIp+a9qRu7OCnaVXbOiV2Lmlvr3FgmmAjn6SB5AnbePu9oqN+FuzvjjsFrf43ntO
         5CD1mkbnRzyAk/OlS3YOZRbiQ7NAowFqbYUOK8b4Jad8rpaydFC3a69hOF6gUYrWiX4m
         o6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb0bMzq7CzIxn27Bm3qAvEt7vJtMj9Hk4nZZ0L4qohs=;
        b=mLbLfMsxFnwIr43FGMcPn+cuFh3SOPWsBbNvd1gYnXFjO79uU+T/zjHkddhD+z8aN1
         ySY4IpLiXP1zOmzGZVuBRYsZddp9Jq/OXCbY82cDBE1o6sn5gnzLJPEfGwplsx9MKw6S
         j/iRCDyaGMvqQYaHbVGHtDv3iTqgd5rU7WuI/HO4+59+9j2gkarhEH7Xe8HYQlTbv814
         cEUAVzquv46JmGIcR5Q599NUBq65dcvxEoIajj8iqlqi3QyXd5j5DcA6z90jFHi917qW
         c8bclI+Zs6mk5lnvDHyXb5AZkTXB2px1tKn8LlCeMj7trpKtwSbfU0CzpclUhnADwCgx
         38lw==
X-Gm-Message-State: ACrzQf0Wf6g5mRCYfEe8+2d/30Uc93cErI+T4CO9VyC1a9MUpavXjtq8
	sP2W+Q39WuF20JAvbftCRXQK6RaaLDwasmuX
X-Google-Smtp-Source: AMsMyM4oijrcSQd/dKg069SIlyyV2cQasyARBrPUoBqyO98yId81kE4Hm2QtLr3/SKm6UV/Hq/309A==
X-Received: by 2002:a05:6a00:1691:b0:53b:3f2c:3257 with SMTP id k17-20020a056a00169100b0053b3f2c3257mr1946901pfc.21.1665100275607;
        Thu, 06 Oct 2022 16:51:15 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:9df6:7e57:88ce:1bea? ([2406:3400:213:70c0:9df6:7e57:88ce:1bea])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902f68600b0017f92246e4dsm176326plg.181.2022.10.06.16.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 16:51:15 -0700 (PDT)
Message-ID: <4f2e69e1-c9a2-0197-341c-c8c0bc9fda1c@flatmax.com>
Date: Fri, 7 Oct 2022 10:51:11 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: sound/soc/codecs/src4xxx-i2c.c:28:34: warning: unused variable
 'src4xxx_of_match'
Content-Language: en-AU
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <202210070151.yWxzUNdm-lkp@intel.com>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <202210070151.yWxzUNdm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Can this test system be updated to catch of_match_ptr usage ?

Here is the decleration :

static const struct of_device_id src4xxx_of_match[] = {
     { .compatible = "ti,src4392", },
     { }
};
MODULE_DEVICE_TABLE(of, src4xxx_of_match);

Here is the usage (in the same file) :

static struct i2c_driver src4xxx_i2c_driver = {
     .driver = {
         .name = "src4xxx",
         .of_match_table = of_match_ptr(src4xxx_of_match),


On 7/10/22 04:21, kernel test robot wrote:
> Hi Matt,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   833477fce7a14d43ae4c07f8ddc32fa5119471a2
> commit: 4e6bedd3c396014ba70de2b4c9995c8e024e82b3 ASoC: codecs: add support for the TI SRC4392 codec
> date:   8 weeks ago
> config: hexagon-randconfig-r045-20221006
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e6bedd3c396014ba70de2b4c9995c8e024e82b3
>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>          git fetch --no-tags linus master
>          git checkout 4e6bedd3c396014ba70de2b4c9995c8e024e82b3
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> sound/soc/codecs/src4xxx-i2c.c:28:34: warning: unused variable 'src4xxx_of_match' [-Wunused-const-variable]
>     static const struct of_device_id src4xxx_of_match[] = {
>                                      ^
>     1 warning generated.
>
>
> vim +/src4xxx_of_match +28 sound/soc/codecs/src4xxx-i2c.c
>
>      27	
>    > 28	static const struct of_device_id src4xxx_of_match[] = {
>      29		{ .compatible = "ti,src4392", },
>      30		{ }
>      31	};
>      32	MODULE_DEVICE_TABLE(of, src4xxx_of_match);
>      33	
>      34	
>
