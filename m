Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748682F38
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653920032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=My0d94IHmiGuBzUrJl4GrT8CrvGcL1Llk9nU8K4G0dk=;
	b=b2lLh9IKZBceztfNg2d1MSRgY6Pdggo0GCXT81dewcZObkax/8r7lB2riECDJRCIuGTTVf
	2Gj3iLp7ckDrLzh3saulAguiWSwwIXEIYRgUAwOtIMbi1Nw+eJNmu6OuFuWXBLwyI9pOFO
	CDFkJgJc5U0fAO77NHdh9Rvi/6awaeI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-sMz1J7GlMRuh1_HPtVf5TA-1; Mon, 30 May 2022 10:13:51 -0400
X-MC-Unique: sMz1J7GlMRuh1_HPtVf5TA-1
Received: by mail-wm1-f69.google.com with SMTP id c187-20020a1c35c4000000b003970013833aso4652526wma.1
        for <llvm@lists.linux.dev>; Mon, 30 May 2022 07:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=My0d94IHmiGuBzUrJl4GrT8CrvGcL1Llk9nU8K4G0dk=;
        b=XCNWwm3NRGR43PeFWx3zDEW4t+Mm5rhIhtETJFIMnABCxK4HnDHDYpuOcvrLhk8ozN
         Qx1otGzti6ZNlxcnkjBx/wycorujDoCjZzVLb1CvAB1ObDIvk0BXyCE6Z5un1kOfUHy7
         /o/Xkw5cfyHeYHA1LLXT8v7I8NfJNc3JmTtRtr7+hlGcliOZBgoadSF5RsOL6BXGAtQ7
         HCNuyGS+cHWg7HtZSfHuBpChnkFmbVLec0FvwvCg9xxOBtdLW2nhBHyvVHasgv4+X4Sy
         WrbIDMIxb26UGZ6bePX1jwqriyy+NOfmrMqY2AodPNsXDwO4vVxGynuS3A+/m6WZmptO
         aJ/w==
X-Gm-Message-State: AOAM533hPYNVkesXz8bquNd5uAVpRG/ICuJh07FQ1dcZ2fdimjkQp9M2
	h9ZFr+9nCgW5GsbnrHrf6CZwv73dwEWdgvEI6nXMK1ZlLRvxZp0Ns/b1AW+xxgGG8qBfgXug+jW
	TLIk4F6vviWimhw==
X-Received: by 2002:adf:ee8d:0:b0:210:1873:c3d9 with SMTP id b13-20020adfee8d000000b002101873c3d9mr13911811wro.696.1653920029914;
        Mon, 30 May 2022 07:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/iCgo4uwGn5S2awMlXSuPR6ifvyuA9XqWpTCehNJrPlLvJl/TJOPFU8LtmrJ9Vif/v+TC3A==
X-Received: by 2002:adf:ee8d:0:b0:210:1873:c3d9 with SMTP id b13-20020adfee8d000000b002101873c3d9mr13911785wro.696.1653920029576;
        Mon, 30 May 2022 07:13:49 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003973d0a78casm11460061wmq.38.2022.05.30.07.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 07:13:49 -0700 (PDT)
Message-ID: <a806fe1c-0e48-7936-26a4-fb3fd8270300@redhat.com>
Date: Mon, 30 May 2022 16:13:48 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: warning: unused
 variable 'ssd130x_spi_table'
From: Javier Martinez Canillas <javierm@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <202205290422.eoxGqDMR-lkp@intel.com>
 <607265eb-bfbf-4134-f2fe-d66cacd7bfbb@redhat.com>
 <YpLF9jdqiub98Nl/@dev-arch.thelio-3990X>
 <0a3c11c7-2669-ca85-69d1-3b3faa2f7a3c@redhat.com>
In-Reply-To: <0a3c11c7-2669-ca85-69d1-3b3faa2f7a3c@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/29/22 09:34, Javier Martinez Canillas wrote:
> Hello Nathan,

[snip]

>>
>> You'll see the same warning with GCC and a similar configuration:
>>
> 
> Yes, I'm not saying that the compiler warning is a false positive but
> that the reported error for this driver is. Since the correct fix on
> a driver that support SPI platform devices would be to use the table
> and set it to the struct spi_driver .id field.
>  
>> drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: error: ‘ssd130x_spi_table’ defined but not used [-Werror=unused-const-variable=]
>>   154 | static const struct spi_device_id ssd130x_spi_table[] = {
>>       |                                   ^~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> At the end of the day, this warning only shows up under W=1, so take it
>> as you will. The kernel test robot is a sign, not a cop :)
>>
> 
> I guess something that could be done is to guard the definition of the
> ssd130x_spi_table with a `if IS_MODULE(CONFIG_DRM_SSD130X_SPI)`, since
> if the symbol is 'y' and the driver built-in, then won't be used indeed.
>  

I posted https://lists.freedesktop.org/archives/dri-devel/2022-May/357088.html
to fix this compile warning. Thanks folks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

