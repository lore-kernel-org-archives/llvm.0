Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191CD72
	for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634562825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zFsOIZ9Hrg2pMl+8sVl9brJknkWSKGh2+jN0s/ZerU=;
	b=iANSzRf6loUwfAAzdQtmzPxigSWxI3e/+XilpEYtuRXsM/coWKZ2MPtx6+tiPCLYK3/fsu
	1I2I+7hz5Ne55bf7sAl3Vgn8ioQxNDQE9EfeouyQ7Nlu7BrfX9+fMSiuwj+F5JFYz1UQiC
	BiKHHC8NyhDLoL41NZllUQ3Od0FIARI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-qZ-nZGumN0qubJMcggbC7A-1; Mon, 18 Oct 2021 09:13:38 -0400
X-MC-Unique: qZ-nZGumN0qubJMcggbC7A-1
Received: by mail-ed1-f69.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso14316967edf.7
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 06:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7zFsOIZ9Hrg2pMl+8sVl9brJknkWSKGh2+jN0s/ZerU=;
        b=BJog/0mo6OEMY3CAoAqhTnXdx1OmZR1UVeYtVdVlMxlGdeOg2eqGbHu4JbUuJeD4zX
         9ZH6JWNsVn5KIyRB5nC9lq0hERu+tw+6RuDYKnR/xVAlGA0FjMk49dTzqjiKQ5e680wV
         OZ8a01F/oHw02m2NmVSMyfFoAxW1AxeO5XWSasLYECkXFVROhMAhv8qiNXkrt5EvoV3i
         bHZGfB7Q2hjmqe0rlLoOswtugnYzkhJkKYOToLO1YstEHTAktOBdVDd/9WIK8BbG6giV
         YQPxyxtktImm7KCnWFEA1phMKyHZTmXbUtHP8sO4UgZ8CUJFfp+3CoBpRmIqTcZ12Nw6
         q0yg==
X-Gm-Message-State: AOAM5313YIW8ZfPcbkUOhCi+9QnXGPgIicYEfRDTYpdgbsk93Nv4/vpa
	PTDUl5Ydy1DVUn2SLrjpMR+hcseQ6B39crsedXSeqBWw6Af5foUrBOT3v+CKVsTFk9UYEX8kYTC
	tx1gvYdyS7MwicA==
X-Received: by 2002:a17:907:d89:: with SMTP id go9mr19366310ejc.451.1634562817528;
        Mon, 18 Oct 2021 06:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdsW+haCMpnvNwSOrpS2ftUBCG/xmxZkDdBRQeMfeBm6XeCxpDHYm9EwPnSnliBp5VMGgjhA==
X-Received: by 2002:a17:907:d89:: with SMTP id go9mr19366282ejc.451.1634562817286;
        Mon, 18 Oct 2021 06:13:37 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b22sm9714633edj.83.2021.10.18.06.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 06:13:36 -0700 (PDT)
Message-ID: <d187e5f8-ba43-78ca-bbe5-bd8eddced1bc@redhat.com>
Date: Mon, 18 Oct 2021 15:13:36 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [linux-next:master 7104/8410]
 drivers/power/supply/axp288_charger.c:411:8: error: implicit declaration of
 function 'iosf_mbi_block_punit_i2c_access'
To: kernel test robot <lkp@intel.com>, Kate Hsuan <hpa@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <202110170208.VfLZSzaB-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202110170208.VfLZSzaB-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/16/21 20:05, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7c832d2f9b959e3181370c8b0dacaf9efe13fc05
> commit: ed229454856e565c5a7d3287cbc63f2cf077b34f [7104/8410] power: supply: axp288-charger: Optimize register reading method
> config: i386-randconfig-c001-20211016 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3ef19fe82d7ad6a6e1515317dcc01b41515)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ed229454856e565c5a7d3287cbc63f2cf077b34f
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout ed229454856e565c5a7d3287cbc63f2cf077b34f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Note: the linux-next/master HEAD 7c832d2f9b959e3181370c8b0dacaf9efe13fc05 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):

> 
>>> drivers/power/supply/axp288_charger.c:411:8: error: implicit declaration of function 'iosf_mbi_block_punit_i2c_access' [-Werror,-Wimplicit-function-declaration]
>            ret = iosf_mbi_block_punit_i2c_access();
>                  ^
>>> drivers/power/supply/axp288_charger.c:430:2: error: implicit declaration of function 'iosf_mbi_unblock_punit_i2c_access' [-Werror,-Wimplicit-function-declaration]
>            iosf_mbi_unblock_punit_i2c_access();
>            ^
>    drivers/power/supply/axp288_charger.c:430:2: note: did you mean 'iosf_mbi_block_punit_i2c_access'?
>    drivers/power/supply/axp288_charger.c:411:8: note: 'iosf_mbi_block_punit_i2c_access' declared here
>            ret = iosf_mbi_block_punit_i2c_access();
>                  ^
>    2 errors generated.

This is my bad, the Kconfig entry for CONFIG_AXP288_CHARGER now needs a depends on IOSF_MBI, just like
we needed it for AXP288_FUEL_GAUGE when similar changes were made to that. I should have caught this
during review.

I'll send a follow-up patch fixing this.

Regards,

Hans

