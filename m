Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D90257A
	for <llvm@lists.linux.dev>; Sat,  7 Jan 2023 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673113016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9gCpV0dGtCCGp1jPgBtNFnuKxWWQi0wqnd//45zEPmE=;
	b=EJIlnTDUVa1//NaJ/AOzvjM5lBFn33IZx484/SRp5tlZn2ZdKQigF/H5+yd6vv+CXcC4BW
	txU9mv2uMVZ0rsNkM9CP2X+Cg8SwCylE7gWzCBBuTmqaM0IZbMTuOQyskp9+qRyatCHRqI
	3DJdwtfza16KozX4iLBDX3+KslqtweA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-XAevGCa0Nli-TN76p5TTqw-1; Sat, 07 Jan 2023 12:36:55 -0500
X-MC-Unique: XAevGCa0Nli-TN76p5TTqw-1
Received: by mail-wm1-f71.google.com with SMTP id t24-20020a1c7718000000b003d1fd0b866fso985242wmi.3
        for <llvm@lists.linux.dev>; Sat, 07 Jan 2023 09:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gCpV0dGtCCGp1jPgBtNFnuKxWWQi0wqnd//45zEPmE=;
        b=dL4GmMsd/2Q6MRYiGQUYo9jt/y0sfgZ/tue9sBKr639xQuswqv5/7Jy4byZ3VLs2Ef
         7sx79U43xtUXGh7G5CY6HmbHfgtiIRQUkWLUYXwdNZ6E7lerP7OkI3SG4pAxHflN02TP
         4jZtOlyWJ1swdXNzbJb2aL1ExfuJeMl+6fXgCIwlv/iQLCqvG9Pl5I8zRJTFrtSr+CbU
         gRDJYanJkaHFMfalHV5ispNftccmWFZrNgT625AVZ62/N1LZCYHaP0rnhknDLQeQYnIA
         xDoe+oJIj/Ic478/z2864xdiPSL5fF3TNb9sFHNaZPDYueD1eItqxG8jIh5hu0rV0/lG
         zfvg==
X-Gm-Message-State: AFqh2kqE6S2Y5IQL12fNLtH4cvqpXogqFb2S0gMxRjDjBfI7eoEOLcJ1
	6OQYI7qEdIdXXGnOmfl61lwZjzvzP4hs06XfuX6nhgjga5K+ZwQqlgqXFE70UImiQHwp0s1Iu0M
	uWm7+A9eUBbNC5g==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id y25-20020a7bcd99000000b003d355061bacmr42940021wmj.30.1673113014604;
        Sat, 07 Jan 2023 09:36:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtq5O2gMQwBFZYJBuaPTxiyhl5nYlsXlZhAewhas7TQGY9Hr/5ja8BEgFOpLT7ZHXkopoF13A==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id y25-20020a7bcd99000000b003d355061bacmr42940017wmj.30.1673113014449;
        Sat, 07 Jan 2023 09:36:54 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d6a08000000b002a1ae285bfasm4291978wru.77.2023.01.07.09.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 09:36:53 -0800 (PST)
Message-ID: <8110a6b7-dacb-57d3-a9fd-b2caf9899ab9@redhat.com>
Date: Sat, 7 Jan 2023 18:36:52 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro
 definition format
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tom Rix <trix@redhat.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
References: <20230102202542.3494677-1-javierm@redhat.com>
 <Y7M+6gdQM/4DhQsP@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y7M+6gdQM/4DhQsP@ravnborg.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/2/23 21:30, Sam Ravnborg wrote:
> On Mon, Jan 02, 2023 at 09:25:41PM +0100, Javier Martinez Canillas wrote:
>> Change made using a `clang-format -i include/drm/drm_mipi_dsi.h` command.
>>
>> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Thanks,
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

