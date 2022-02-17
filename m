Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5C38DA
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645091518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjAkGPjCABeyW0Gcd3V5/Yp+7WRVwbV3GUQOEkRq3r4=;
	b=e7cwtOyBqDM5FL5qtdoQfSuXizTaN92mi2uUprXAsBP4PIdilV0zTAP8dQv23i9GKzonCI
	o5tarvYMh5MyDRkRgtRF0Ni3kYKTrEZ1+i+YeU4HR7LyRvN7vVzPHv1420YmX/gmP3EQ2f
	MP1PK9bKqVXybeaJtV/2G/2oLUnzJsA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-cdrxtrrFP8K-NvDYvV3znA-1; Thu, 17 Feb 2022 04:51:57 -0500
X-MC-Unique: cdrxtrrFP8K-NvDYvV3znA-1
Received: by mail-wm1-f72.google.com with SMTP id p24-20020a05600c1d9800b0037be98d03a1so4025897wms.0
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 01:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GjAkGPjCABeyW0Gcd3V5/Yp+7WRVwbV3GUQOEkRq3r4=;
        b=oQhPik4gzPH51A0Q+irgVvcf7hvYHiLm4MirejVo8phOweL5zNBCx9WTGD6pqJ34zh
         S3koEFOvEMH5iHNhHtVRhPnGFcrwqrTXI8Gw0VzqKM2A/wdOr6/o9JUuPOxgJbMqlKb+
         T1o71Ialh+YyD4lhRs00T7A2cOgCBHXFGV5TTquuQQ/VQn+j/1y6g4J/SJc0+AA3O+hm
         fb6qfXN0F6PKqNCme/RuApIGO45UBgXgiPqg4Q5N+AmYf22qfAZp8NBX9NCDSNL7RbYD
         emAFWNWBx/quCtRAwzmlh1yGAgCe+y9l9SMEC+y1stUC2nPHrCIPkDU7wgVIGFox8632
         dK7g==
X-Gm-Message-State: AOAM533bvVBXCeJeAJS4+eFBWHM/dcbGunmxgkiYESnAG5EJfsDNyPsU
	39nEXQ75mpkO7mZr13jfzZj3lpjTiEOzslXfK53o6xpY6GerraXUFMT50QPzZOvDdQSQCpeWHw7
	OZrjpTYpGw9wD9g==
X-Received: by 2002:adf:f44e:0:b0:1a9:f21:2250 with SMTP id f14-20020adff44e000000b001a90f212250mr1658098wrp.263.1645091515965;
        Thu, 17 Feb 2022 01:51:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZllfGRweBQ8shZ+yBvcfWtgaeNv0G0mGqBezZOKeBuh1xIW/cWJX8HtYpgXMY57Gpy8G+/w==
X-Received: by 2002:adf:f44e:0:b0:1a9:f21:2250 with SMTP id f14-20020adff44e000000b001a90f212250mr1658084wrp.263.1645091515744;
        Thu, 17 Feb 2022 01:51:55 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n7sm688930wmd.30.2022.02.17.01.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 01:51:55 -0800 (PST)
Message-ID: <dc350aa0-9f59-36c2-9534-f0798f3d0d6a@redhat.com>
Date: Thu, 17 Feb 2022 10:51:54 +0100
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
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <202202171455.bclm1YBC-lkp@intel.com>
 <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
 <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
 <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
 <95cce34d-fa67-2da9-f065-a6dacfa980d6@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <95cce34d-fa67-2da9-f065-a6dacfa980d6@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/17/22 10:41, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.02.22 um 10:25 schrieb Lucas De Marchi:
> [...]
>>> $ git grep "TODO: Use mapping abstraction properly" | wc -l
>>> 15
>>>
>>> If you point me the proper way, I'll be happy to post a patch to 
>>> change it.
>>
>> It depends what you want to do with the address. There are APIs to copy
>> from/to. I also added a few to read/write to an offset. It seems the
>> problem here is that you need to pass that to a helper,
>> drm_fb_xrgb8888_to_mono_reversed(). I think the proper solution would be
>> to change the helper to accept an iosys_map* as argument rather than a
>> void*.
> 
> There are several of these TODOs in the DRM code, because our 
> format-conversion helpers are still from the time before 
> dma_buf_map/iosys_map. The easiest workaround is to take the raw pointer 
> and give it to them. One day, DRM's public blit and conversion 
> interfaces will take an iosys_map and handle the different memory types 
> internally.
>

Yes, as Lucas mentioned there are copy from/to helpers but didn't want to
use it because would be another unnecessary copy just to avoid to take the
map->vaddr raw pointer and pass directly to the format-conversion helper.

> Javierm, that's when the internal _line() helpers will become useful. 
> They can use system memory directly, and for I/O memory the 
> blit/conversion helpers allocate an internal temporary per-line buffer. 
> The code you made for the new driver has this designed outlined already.
>

Indeed. I understand now what you meant when proposing to add those helpers.
 
> Best regards
> Thomas
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

