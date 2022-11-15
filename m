Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75B024F29;
	Tue, 15 Nov 2022 17:52:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a14so25607629wru.5;
        Tue, 15 Nov 2022 09:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qY6nRVloPMu0a9o0f6TK0ayYypeD2+K8gsrO+p4X8nM=;
        b=AgHw/atYW1ynEx3QMQW5EwlMPEW2RaZIK9cNwFKfUHWohAAiYu+Ui6tfcT2yVb2y5L
         dTbk+zIOFCb3kKe2Qy7lOc8vM4e+5tVOq+ZesdWxQYfL7m5XIdQgycUSJIvUv40v/QFD
         5hHJB2xnRCYoEsAHDDW2vcAkrVTl1bU05mzHqeKsNCnqnE8yTPDneEgqgiPx7/beAlXF
         NESn1MN1+E9xsJt2SyLCrrURvIKAaBflk9Tubdgwx0bj7IDKumVkQyoc/euNdcq9XEE6
         Evq+uyFAXxyx7h3JWOMVddyxTnBrNyfZxSBmlCmSJHzXsZ25IRiDc1Fm3VRwmZcWY2Y1
         eruw==
X-Gm-Message-State: ANoB5pnHUU2MT2q77HfHAn7twcLeDbiQZ6rKdfMTuW/CBi+J40X25Qr5
	hQg2ptGlnblU644fA3TquWI=
X-Google-Smtp-Source: AA0mqf5lHeNocUoDpqqafZ5+2xlzWcWsctgjNGvtBrkjBSU9GL/Yu+kTRaxpDwH0GXyOJuVgfkYUlw==
X-Received: by 2002:a05:6000:1b86:b0:22c:c8cb:486f with SMTP id r6-20020a0560001b8600b0022cc8cb486fmr11198619wru.402.1668534757934;
        Tue, 15 Nov 2022 09:52:37 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id co19-20020a0560000a1300b0022e66749437sm13077761wrb.93.2022.11.15.09.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 09:52:37 -0800 (PST)
Message-ID: <5d14f4b9-5c1d-9caa-e70d-576bac98abc3@grimberg.me>
Date: Tue, 15 Nov 2022 19:52:35 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [linux-nvme:nvme-6.2 26/41] drivers/nvme/host/core.c:5122:6:
 error: assigning to 'int' from incompatible type 'void'
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-nvme@lists.infradead.org, Hannes Reinecke <hare@suse.de>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <202211160055.rbjs32vH-lkp@intel.com>
 <edda71f4-9912-d336-6d5b-0e1e102d4bfe@grimberg.me>
 <Y3PLZxNwqioynAtw@dev-arch.thelio-3990X>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <Y3PLZxNwqioynAtw@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> tree:   git://git.infradead.org/nvme.git nvme-6.2
>>> head:   e2deb6d1a5b2dcff71f429a64fb516186aa0382c
>>> commit: c1658b482f1bec9ebafa49eec69a29aebbc23556 [26/41] nvme-auth: don't ignore key generation failures when initializing ctrl keys
>>> config: i386-randconfig-a016-20221114
>>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>>> reproduce (this is a W=1 build):
>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>           chmod +x ~/bin/make.cross
>>>           git remote add linux-nvme git://git.infradead.org/nvme.git
>>>           git fetch --no-tags linux-nvme nvme-6.2
>>>           git checkout c1658b482f1bec9ebafa49eec69a29aebbc23556
>>>           # save the config file
>>>           mkdir build_dir && cp config build_dir/.config
>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/nvme/host/core.c:5122:6: error: assigning to 'int' from incompatible type 'void'
>>>              ret = nvme_auth_init_ctrl(ctrl);
>>
>> Christoph,
>>
>> Can you fold this into the offending commit please?
>> --
>> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
>> index a50b0743728e..273f4f95f425 100644
>> --- a/drivers/nvme/host/nvme.h
>> +++ b/drivers/nvme/host/nvme.h
>> @@ -1063,7 +1063,7 @@ static inline int nvme_init_auth(void)
>>          return 0;
>>   }
>>   static inline void nvme_exit_auth(void) {};
>> -static inline void nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};
>> +static inline int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};
> 
> Won't -Wreturn-type flag that this function is not returning a integer
> value? I assume that wants 'return 0'?

Didn't even compile it...
infradead is down again, I trust that Christoph applied this fixup 
correctly...
