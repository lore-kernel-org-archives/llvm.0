Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7169338DA
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645090784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLgXyaDdyKmF629yX/8jyqbwgfWH8asfchQ3m/1p7wI=;
	b=ZzCU8/Sax08B6tueFEC5QMANr1g4s7BkxkVsW2VBMgV34b9faJxoht8T+ZMa922nPBibuX
	xVtUTf7VOD+fROhwwR81fcf2sdi+6XLqZuTALHrHZJOBxW/OxE90XqSTvYZdmXlhzzrWVv
	w0ShK+/dbd5v2DPp0owqjcS8Nj4ZpB8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-tpTyVjiJNpazdM7pbFoy6w-1; Thu, 17 Feb 2022 04:39:43 -0500
X-MC-Unique: tpTyVjiJNpazdM7pbFoy6w-1
Received: by mail-wm1-f70.google.com with SMTP id u14-20020a05600c210e00b0037bddd0562eso1439641wml.1
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 01:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jLgXyaDdyKmF629yX/8jyqbwgfWH8asfchQ3m/1p7wI=;
        b=MdmGhpOxxY27/nD6rIS62r9LSUpgrpf7PzGLbX8/s3PGj5F5B8ComuPSH7CEwvvnQ4
         ZhgjYGxbh20syXKs0B4LPy6u7teGKXiDPPavBekBO5Ss+X+JybHV22KofGCVQx6jTuD9
         ABTAzRDA0n/T52njlxgLvs7G0tmgl0u+XJIrVy8SjKvX68uM2KjhiaKkEdRqe1tJpKyp
         Fz5dmTW+Z6kVAs6M4ErPaIc9dMhz+BzX0U6SIvG79MdlzBjuoRgh1d7FH1mErZZV3kgJ
         yUVDwiWx0IhwcbMyxYxYzDcfav8sAdsOmBRN/pYfPKRWFtKp06hCBpED7/dyFm7U3cl1
         LwQA==
X-Gm-Message-State: AOAM531vCj0j5k6AGSu1948i3bVdrF7iZJFtUXQnNCe9Idqntd42vPAA
	EfNfkChtDJ2b/6spPuFBMWH+56Lxoj+igHpwGawJH55PcMMHxc7+32X9hG80khb8W9n4kf55iEr
	3paXXqdiTpunxdw==
X-Received: by 2002:a05:600c:34c4:b0:37b:f84d:d55a with SMTP id d4-20020a05600c34c400b0037bf84dd55amr5219788wmq.123.1645090781818;
        Thu, 17 Feb 2022 01:39:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybTPMdUEv4yErAw/bHWXz3opBkboEQXbUIb0XIqgnTJgBeyfbHp2oe3xxJk8q91rF306F1sQ==
X-Received: by 2002:a05:600c:34c4:b0:37b:f84d:d55a with SMTP id d4-20020a05600c34c400b0037bf84dd55amr5219771wmq.123.1645090781577;
        Thu, 17 Feb 2022 01:39:41 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y4sm17410167wrd.54.2022.02.17.01.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 01:39:41 -0800 (PST)
Message-ID: <3cb4c64a-6a6a-97bf-682e-efcf9bd748b5@redhat.com>
Date: Thu, 17 Feb 2022 10:39:39 +0100
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
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <202202171455.bclm1YBC-lkp@intel.com>
 <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
 <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
 <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/17/22 10:25, Lucas De Marchi wrote:
> On Thu, Feb 17, 2022 at 10:00:42AM +0100, Javier Martinez Canillas wrote:

[snip]

>>> this is now called iosys_map in drm-intel... drm-tip will need a fixup
>>> for the merge.
>>>
>>
>> I thought that the drm-intel tree was only for Intel DRM drivers changes and
>> subsystem wide changes should be merged through drm-mic ?
>>
>> Doing refactoring in that tree will likely lead to merge conflicts like this.
> 
> Yes, I know. My initial proposal was to split the rename and do it per
> branch to avoid this kind of situation, but it was requested to be done
> all in a single patch. Since I had other ~15 patches dependent on that
> one to be merged in drm-intel, it was agreed to do the rename via
> drm-intel. See 
> https://lore.kernel.org/lkml/e3813696-7b91-510c-987f-85ed2fd502d6@suse.de/
>

Got it. Thanks for the explanation.
 
> I guess the conflicts won't be that terrible and can be fixed as they
> show up.
>

Agreed.

>> Noticed your series in dri-devel but missed that already landed in drm-intel.
>>
>> The resolution should just be [0] right? If you confirm that then I can post
>> a proper patch to dri-devel.
>>
>>>>>> drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of type 'struct dma_buf_map'
>>>>           void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
>>>>                        ~~~^
>>>
>>> this shouldn't really be done.
>>>
>>
>> Yes, I know but asked what would be the proper way and didn't get an answer.
>> We have many drivers doing the same and I couldn't find one that was doing
>> it correctly to use as a reference:
>>
>> $ git grep "TODO: Use mapping abstraction properly" | wc -l
>> 15
>>
>> If you point me the proper way, I'll be happy to post a patch to change it.
> 
> It depends what you want to do with the address. There are APIs to copy
> from/to. I also added a few to read/write to an offset. It seems the
> problem here is that you need to pass that to a helper,
> drm_fb_xrgb8888_to_mono_reversed(). I think the proper solution would be
> to change the helper to accept an iosys_map* as argument rather than a
> void*.
>

That makes a lot of sense. Once the dust settles and your series land in
drm-misc-next, I can take a look at this and removing the TODO comment.

> Lucas De Marchi
>>>
>>> Lucas De Marchi
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

