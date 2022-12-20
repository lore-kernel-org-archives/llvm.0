Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D891365
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 23:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671578464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/yL2ss9yIdWHwPse2tigQEB/FE3FbjAM3XIM8TGekM=;
	b=i+CJtNEDzlCqFSQjn5lbwH/fx0H1nGPCSpVNDnHWbSw+YLblO2UMzzNXyKcoDkP8PewWr1
	A6nQ1ui+4K0lnNOyXqFh0hK8rKG+Qv7M3g0FjpqC6Fd80kHfPm9AKXBDu1cQ4Aq5BJGVn2
	d3qFNAkwtP+YBWR6brhHn80GGCS2Zz0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-q1mp6wRFOtGISQfTCfVdpw-1; Tue, 20 Dec 2022 18:21:03 -0500
X-MC-Unique: q1mp6wRFOtGISQfTCfVdpw-1
Received: by mail-qt1-f197.google.com with SMTP id fg11-20020a05622a580b00b003a7eaa5cb47so6188120qtb.15
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 15:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/yL2ss9yIdWHwPse2tigQEB/FE3FbjAM3XIM8TGekM=;
        b=brKu7+Yhn/6sx3liUcd3FJbD/357/lTV6jcMO/bG/lsZ6dAEf8TW4aZCvOcH9YxOnR
         lQVEUqNocqGaIH61t8kmnKUcY8wv6WbEpQAsR0laXKf3IK3HjFQ61qY3ylcs+ugz4jls
         6A5+jZd6TqqlsVgC901ChICy1pMkYP6Yy8bEf0oTuhOiWFgLzw0JT04cze1H1LkR2Eh+
         aAAjBnR/JJHm4qjE0RxZBZx/S/2rd/kUF8lazjNYD6i31QAB3ozawdVVKCi19jr0GGOW
         rKi3MHM08cKKnM2Ds/hFg7hBYCj5HYYcifLK0GPtPLqNr21Q4568mVK8sfMzMp7QKTGH
         bEnw==
X-Gm-Message-State: AFqh2kon5obXyFfT1izu1Gv2w36XnCY+rPpcH9SYvaViN01T8ls1+Vqp
	OHt02IsliOLT2KfbdZTy/ra5xVaNspNARjxKzZFqhhWdhzkTtm0wwEJ+jGXb0meRLT+gcB/JILK
	PdzhMNp1724itpA==
X-Received: by 2002:ad4:4c50:0:b0:4c7:2547:bc03 with SMTP id cs16-20020ad44c50000000b004c72547bc03mr14988662qvb.50.1671578462604;
        Tue, 20 Dec 2022 15:21:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDl5nzwCTQTVtglgJWA2+tKSWwmW+GiT3UWFjEy1Jz1RZbeyhVIyRfPXdfqhBYgTBI7HoA+g==
X-Received: by 2002:ad4:4c50:0:b0:4c7:2547:bc03 with SMTP id cs16-20020ad44c50000000b004c72547bc03mr14988633qvb.50.1671578462340;
        Tue, 20 Dec 2022 15:21:02 -0800 (PST)
Received: from redhat.com ([37.19.199.117])
        by smtp.gmail.com with ESMTPSA id o20-20020a05620a22d400b006e07228ed53sm9565979qki.18.2022.12.20.15.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 15:21:01 -0800 (PST)
Date: Tue, 20 Dec 2022 18:20:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alvaro Karsz <alvaro.karsz@solid-run.com>,
	virtualization@lists.linux-foundation.org,
	linux-pci@vger.kernel.org, bhelgaas@google.com,
	Jason Wang <jasowang@redhat.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3 v6] virtio: vdpa: new SolidNET DPU driver.
Message-ID: <20221220182026-mutt-send-email-mst@kernel.org>
References: <20221219083511.73205-1-alvaro.karsz@solid-run.com>
 <20221219083511.73205-4-alvaro.karsz@solid-run.com>
 <Y6HjpvDfIusAz2uS@dev-arch.thelio-3990X>
 <CAJs=3_B7WoERAiXPyvz=6d7O5rcwXMfWZJFsi_ds-OAemvfcgQ@mail.gmail.com>
 <Y6IfwHicoMojJrIB@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y6IfwHicoMojJrIB@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2022 at 01:49:04PM -0700, Nathan Chancellor wrote:
> On Tue, Dec 20, 2022 at 06:46:20PM +0200, Alvaro Karsz wrote:
> > Hi Nathan,
> > 
> > > This does not appear to be a false positive but what was the intent
> > > here? Should the local name variables increase their length or should
> > > the buffer length be reduced?
> > 
> > You're right, the local name variables and snprintf argument don't match.
> > Thanks for noticing.
> > I think that we should increase the name variables  to be
> > SNET_NAME_SIZE bytes long.
> > 
> > How should I proceed from here?
> > Should I create a new version for this patch, or should I fix it in a
> > follow up patch?
> 
> That is up to Michael at the end of the day (each maintainer handles
> their tree differently) but I would recommend sending a follow up fix,
> as it is easy to fold it in if they want to rebase the tree for it or
> just take it as a fix.
> 
> Thanks for the quick triage and response!
> 
> Cheers,
> Nathan

on top is ok but post soon please as i need to send this to Linus.

-- 
MST

