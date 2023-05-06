Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9146210C;
	Sat,  6 May 2023 20:35:46 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso3443868b3a.3;
        Sat, 06 May 2023 13:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683405346; x=1685997346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePf+V2r15a9+U18c5r7fdtX14NzXyo2pzCcvu9zcVLE=;
        b=bp5k6g01m9IDlDucoCTae0sK8IV6VORVSKXs40sNfOUekK+2gpxoKWI1bee1DuiyQi
         OD6oXllE7JFM327pV62Rb+DccPXLi9vfZloEIXzwLEYTU0e0gqT/Un5T/kt78IK/N/L7
         hwKaUuI5qdnayRYS/zonfQckhCE3UnZ8aONDoiqSY9oxPvvRc9fBzVRwPBJyVIsi8E1t
         M/gQDSHT5m09/fBOYA6oG1qMjoflH6hjbRuP0i5t07EkCYpV+NAtDt98Jc3J1ezTa+wG
         zVLfYyxdKXe9iB641MLN2M9jMT8Vm0WH4iozTmtrNfjhdbWtyXFKsCeBHRmTbPpEC1F/
         s+EA==
X-Gm-Message-State: AC+VfDxzWKa4b7kWcM/WH5kN8M44vqcuejcdRJptp6mfAatvsWJMJ+Py
	wFLPuDYUNlHPQeMwuKqOBoc=
X-Google-Smtp-Source: ACHHUZ5R4Z5jtbumWsIRm3yITqvoOsJEZ8hcXQTqQFDgh8DYBZvvU9/lY+UgRfTnpV/C3qia+eB6Ew==
X-Received: by 2002:a05:6a21:100e:b0:f5:7035:9a05 with SMTP id nk14-20020a056a21100e00b000f570359a05mr6321313pzb.29.1683405345773;
        Sat, 06 May 2023 13:35:45 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id y25-20020a62b519000000b00643a5f3ef45sm3081327pfe.199.2023.05.06.13.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 13:35:45 -0700 (PDT)
Message-ID: <e66ed1da-4bf6-e098-1f00-b0f35add2a9a@acm.org>
Date: Sat, 6 May 2023 13:35:44 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [bvanassche:mq-deadline 8/11] block/mq-deadline.c:785:43: error:
 incompatible pointer types passing 'struct list_head **' to parameter of type
 'struct list_head *'; remove &
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202305061437.7YgxVCFa-lkp@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202305061437.7YgxVCFa-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/23 23:21, kernel test robot wrote:
>>> block/mq-deadline.c:785:43: error: incompatible pointer types passing 'struct list_head **' to parameter of type 'struct list_head *'; remove & [-Werror,-Wincompatible-pointer-types]
>             if (blk_mq_sched_try_insert_merge(q, rq, &free))
>                                                      ^~~~~
>     block/blk-mq-sched.h:15:26: note: passing argument to parameter 'free' here
>                                        struct list_head *free);
>                                                          ^

A tested fix has been uploaded to my github repository.

Bart.

