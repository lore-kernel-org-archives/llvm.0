Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF1523B6
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645088450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YboZm8wetXcO2IwUxBmVJAYpkbGfmWzybnDuj1Yehck=;
	b=Hy4rUudv6jKit+hwyhHzu4ZrNa8UedH0B2kDCqoHtcQjZGZJS+HJiF8U7u2Gd1e9w7gRpU
	hWHGonGA68Lq0Avp+YXWrdsvU2hW7pe8vodlWAj1If3fNK9QIP+Vp1vWl4wjmbFHHS5D4k
	QGIwv48eSn//RVIcCaf4xApdZJIRht4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-o2ibhBOBMhK2eKYZ7oo3vw-1; Thu, 17 Feb 2022 04:00:47 -0500
X-MC-Unique: o2ibhBOBMhK2eKYZ7oo3vw-1
Received: by mail-wm1-f69.google.com with SMTP id u14-20020a05600c210e00b0037bddd0562eso1394754wml.1
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 01:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YboZm8wetXcO2IwUxBmVJAYpkbGfmWzybnDuj1Yehck=;
        b=U18ERRms7MmwsKGu24WKaHKosXcXhl5ObdWXS2q2IuwlqrShjsifZ3pjbhRmLn/bI7
         seJWN3/ElzTWqeBzYsxmdHlFLKA+JS4RXbnHJo5Q4IFto3A2IqHsp5v1KozPOM1eiL1K
         mpAEcpoj4MxeU5aUA3cQBtuGTdW/gRJIgj8FJ4I6l3VLqchoCCK5Dsxn1gKaxxjMv/Ld
         3/hN6KlBHOTRX3pyt/NAezzB0mc/hQ6V+zRUqvOvKGSE5YYK2hksRhnybcFqY3cMFhrz
         2Om7Qby1ArdhD6wDX4IiPqacqeZWMs0AacdyKpLIxHXgVZyjA9PHFdrBR8LBcEuAdHUE
         aelg==
X-Gm-Message-State: AOAM533HFJB3WCOD86xDSRo9xW8qQ+M/R5MxvNFxCx//oHp3oHtF2AeT
	rS8mNBR9eAJ+afiL1e1D6YyfC+3oQA09jCgV6wPl0eFABEGx23OTjLLVqOs/7DbASc/dTQOlDAr
	qneDrz4jG2sWLRw==
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id g16-20020a05600c4ed000b0037be983287bmr5133106wmq.156.1645088445871;
        Thu, 17 Feb 2022 01:00:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPKi1UC/ow0GLu8B5iIjrfMb4RUjmb9ONL+kvJSx3Kc/g95HyuwvZdPv+Moxqm8OH29oldbA==
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id g16-20020a05600c4ed000b0037be983287bmr5133075wmq.156.1645088445559;
        Thu, 17 Feb 2022 01:00:45 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c3sm17875598wri.109.2022.02.17.01.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 01:00:45 -0800 (PST)
Message-ID: <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
Date: Thu, 17 Feb 2022 10:00:42 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of
 type 'struct dma_buf_map'
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <202202171455.bclm1YBC-lkp@intel.com>
 <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Lucas,

On 2/17/22 07:36, Lucas De Marchi wrote:
> +Javier
> 
> 
> On Thu, Feb 17, 2022 at 02:25:08PM +0800, kernel test robot wrote:
>> tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
>> head:   e141e36b2871c529379f7ec7d5d6ebae3137a51b
>> commit: 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
>> config: mips-buildonly-randconfig-r002-20220217 (https://download.01.org/0day-ci/archive/20220217/202202171455.bclm1YBC-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
>> reproduce (this is a W=1 build):
>>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>        chmod +x ~/bin/make.cross
>>        # install mips cross compiling tool for clang build
>>        # apt-get install binutils-mips-linux-gnu
>>        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
>>        git fetch --no-tags drm-tip drm-tip
>>        git checkout 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f
>>        # save the config file to linux build tree
>>        mkdir build_dir
>>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/solomon/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>>> drivers/gpu/drm/solomon/ssd130x.c:447:74: warning: declaration of 'struct dma_buf_map' will not be visible outside of this function [-Wvisibility]
>>   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>>                                                                            ^
> 
> this is now called iosys_map in drm-intel... drm-tip will need a fixup
> for the merge.
>

I thought that the drm-intel tree was only for Intel DRM drivers changes and
subsystem wide changes should be merged through drm-mic ?

Doing refactoring in that tree will likely lead to merge conflicts like this.
Noticed your series in dri-devel but missed that already landed in drm-intel.

The resolution should just be [0] right? If you confirm that then I can post
a proper patch to dri-devel.
 
>>>> drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of type 'struct dma_buf_map'
>>           void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
>>                        ~~~^
> 
> this shouldn't really be done.
> 

Yes, I know but asked what would be the proper way and didn't get an answer.
We have many drivers doing the same and I couldn't find one that was doing
it correctly to use as a reference:

$ git grep "TODO: Use mapping abstraction properly" | wc -l
15

If you point me the proper way, I'll be happy to post a patch to change it.

> Lucas De Marchi
> 

[0]
From f8268e5b15c321b56862904665f5e312bf50d397 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 17 Feb 2022 09:52:37 +0100
Subject: [PATCH] drm/solomon: Rename dma-buf-map to iosys-map

Commit 7938f4218168 ("dma-buf-map: Rename to iosys-map") renamed the struct
dma_buf_map to struct iosys_map, but this change wasn't present in drm-misc
when the ssd130x driver was merged, and it created a merge conflict.

Fix this by renaming the data structure type in the ssd130x driver.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 19697c8c5a2c..92c1902f53e4 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -444,7 +444,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 	kfree(buf);
 }
 
-static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *map,
 				struct drm_rect *rect)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-- 
2.34.1

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

