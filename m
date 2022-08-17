Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86823CB
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 05:44:38 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id u22so2851588plq.12
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flatmax-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3znbrSjjpvJwytUCGFSSBt6kROH+ezee+opuMaP8YXM=;
        b=QM4/8vv4gJc7BKd4E0KpFd/jkT5JS5MDx2a73/YDZSzUwSXScNudb9Rs8q8wgeBuX1
         zbj1k9PqFDHNSGvsrcpMu66A30mQTYKvVVfyPDpEerG/8/OcUppDwVsQv0NhLYEJjObM
         7bb9JeZ52OFNxj+XCK6r9zVoLlrqmwmn41E3NPv1MAl8iNeNEsBxpFavaq19Qnmwech2
         KGOgrAVlqKSVXAdRV+PZnXIjNelGcihZnl4Y0UUP5iXJX1gQApqmNkU6Pa0dG5G9XXKR
         oEgWV52VWk1OaHITiJzVp5he3ICwDiofFbG/lf8cf5wTWLy4NCcbcb2SrZQ+P+k3i7MX
         Q0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3znbrSjjpvJwytUCGFSSBt6kROH+ezee+opuMaP8YXM=;
        b=rYdrqaYuV7B5thS0cPreBcx4KhoyuXaNQjGxdWnW6L73x0e58QxKJhZcaUEu+/rBWf
         Dmqjp3OLXm9BgerW0XOWaM0VwbuR6Y75iEbt+ppzfgrdnXw2C/9aUlSvgE1B9NEC27R8
         /QIE1ka8vuCw6jBIcEdRiKig1xEUBeNw4FkXTEuIernBpovuEgE3lHHTMy/F2z+hYS74
         RcSWXecoQ6HdYVTjxisBDZi875uo9R2Jw7waCw8h3WnsUOiIBNJm9dbJ6H+82EPzgn4O
         YP3b4qp0EBJiOIKCg+EcNbJXcYe5S9hCJQfSiqyPIm9yldvJFM0G3NhzFLuZFLGxRWsU
         vV2w==
X-Gm-Message-State: ACgBeo0uSoyG5O7/kNGxAG57hymeCV+x1xkNqzCQEBGZbhOfd1uJGVgA
	0vm7n3SEWBBb1IEyKIH48yF6ZMesb1aejxtf
X-Google-Smtp-Source: AA6agR4bs1aL5MGE/NgKp+m43p6eTohs7NwK08JnwHC/Xg0owMyOXV/oKri9+jtYA8YBskgwxJPebg==
X-Received: by 2002:a17:90b:4b0c:b0:1f4:ffac:699a with SMTP id lx12-20020a17090b4b0c00b001f4ffac699amr2091787pjb.145.1660715077630;
        Tue, 16 Aug 2022 22:44:37 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:9df6:7e57:88ce:1bea? ([2406:3400:213:70c0:9df6:7e57:88ce:1bea])
        by smtp.gmail.com with ESMTPSA id o21-20020aa79795000000b0052d8405bcd2sm9451333pfp.163.2022.08.16.22.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 22:44:37 -0700 (PDT)
Message-ID: <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>
Date: Wed, 17 Aug 2022 15:44:33 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Content-Language: en-AU
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, broonie@kernel.org
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17/8/22 04:00, Nathan Chancellor wrote:

>>     265			/* set the PLL for the digital receiver */
>>     266			switch (src4xxx->mclk_hz) {
>>     267			case 24576000:
>>     268				pj = 0x22;
>>     269				jd = 0x00;
>>     270				d = 0x00;
>>     271				break;
>>     272			case 22579200:
>>     273				pj = 0x22;
>>     274				jd = 0x1b;
>>     275				d = 0xa3;
>>     276				break;
>>   > 277			default:
>>     278				/* don't error out here,
>>     279				 * other parts of the chip are still functional
>>     280				 */
>>     281				dev_info(component->dev,
>>     282					"Couldn't set the RCV PLL as this master clock rate is unknown\n");
> In the final commit, there is a 'break' here. Should it be a 'return 0'
> instead? Or should there be a different fix for these warnings?

The data sheet for the src4392 doesn't list defaults for these registers 
(loaded with pj, jd and d). The actual state of these registers is not 
known until we load them with something, arbitrary or not.

	{  SRC4XXX_RCV_PLL_0F,		0x00  },  /* not spec. in the datasheet */
	{  SRC4XXX_RCV_PLL_10,		0xff  },  /* not spec. in the datasheet */
	{  SRC4XXX_RCV_PLL_11,		0xff  },  /* not spec. in the datasheet */

The state of DIR PLL registers aren't important if the user doesn't 
specify a known mclk frequency.  The implication is that the DIR will 
not function, however that is already implied by the user lacking to 
specify a known mclk frequency.

The other functions on the chip (port A/B I2S, SRC, DIT, etc) will 
behave as per usual, only the DIR will be dysfunctional.


>>     283			}
>>     284			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>>     285			if (ret < 0)
>>     286				dev_err(component->dev,
>>     287					"Failed to update PLL register 0x%x\n",
>>     288					SRC4XXX_RCV_PLL_0F);
>>   > 289			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
>>     290			if (ret < 0)
>>     291				dev_err(component->dev,
>>     292					"Failed to update PLL register 0x%x\n",
>>     293					SRC4XXX_RCV_PLL_10);
>>   > 294			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>>     295			if (ret < 0)
>>     296				dev_err(component->dev,
>>     297					"Failed to update PLL register 0x%x\n",
>>     298					SRC4XXX_RCV_PLL_11);
>>     
> Cheers,
> Nathan
