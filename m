Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981BD5CAB
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646245777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjxXLj8rr6mOagH85zE8xjeRN36BLXJyOv2Vow+3Iko=;
	b=SOBLWlsFreRPM9eDqwcF4muymatDR8dAreRea7oVmdcOiR1GJrdqiSLmCKl0M+dz8WdhoR
	7kN4NCR0FCL3Kcf4JwHjZi8yV4EGhDTccHYjgdD7Ik0aHkf3YkoefxXB67AL/V65ZbSSV8
	Mj6+EH3wg3LO31QvJFu59lQUUKivTuY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-VvzbUPrvOheTGkAV6oHGJg-1; Wed, 02 Mar 2022 13:29:36 -0500
X-MC-Unique: VvzbUPrvOheTGkAV6oHGJg-1
Received: by mail-ed1-f70.google.com with SMTP id l24-20020a056402231800b00410f19a3103so1481247eda.5
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 10:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjxXLj8rr6mOagH85zE8xjeRN36BLXJyOv2Vow+3Iko=;
        b=SD2RZeA1rPy6KYQ4A6thjuzEs67CXQWIKQSnG4n0CUrkDWTpxisewBIKDzj3moiCte
         kOV25nXqvao2vqYvkl/mNqeVxeNUC28zWpsQqbSwK6HjzCtcpXAkszYG5Ud+RfmddRO0
         wOpLfOU/5dH7nDkf47syxIozni5ZziM0JFugW9IZ5vz/rmAMJJP6cuqVGBCG0phbEviZ
         QPqNP05XG8sIyUWYtieGa6oh9UEkHcdEBlCukZ8V+6hkCQkFrJPL796qhKrQC14wDC2h
         bhBHBWNoNAFii4yzH6cvun0DETd8hcd0DMXMXlQK9qQAFo7IAJgWXY2WQFmPCmCjTz+g
         ilIw==
X-Gm-Message-State: AOAM531kHZ6f8r8AlgHsvm1WxDRsyWN7xAzvlUnUlcd4qHSbBEFzF5F6
	6gYuN4qSGq0jvxyy5eFBN0sMSQiTnTsJVhjl+W1QhtEIvlPdi44xJ21R9kxhymm1jTR2BjnA72O
	Jfp9sdAaOlIFX7MfnJGZpxCgQ9tKdKg==
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id z14-20020a170906434e00b006d0ed9c68bcmr23152255ejm.70.1646245775072;
        Wed, 02 Mar 2022 10:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHDUcMifYOCkwoFjllRL4kRy+OwEBd4SDygd8H9xrln/fRsbCeSVG7U4y0FcBBR2l+QPrmM5Lpj1qKYIEzkDQ=
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id
 z14-20020a170906434e00b006d0ed9c68bcmr23152246ejm.70.1646245774790; Wed, 02
 Mar 2022 10:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220302175309.1098827-1-colin.i.king@gmail.com>
In-Reply-To: <20220302175309.1098827-1-colin.i.king@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 2 Mar 2022 19:29:23 +0100
Message-ID: <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
Subject: Re: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
To: Colin Ian King <colin.i.king@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fmartine@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello Colin,

Thanks for the patch.

On Wed, Mar 2, 2022 at 6:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Pointer mode is being assigned a value that is never read, it is
> being re-assigned later with a new value. The initialization is
> redundant and can be removed.
>

Indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

