Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C71528ED
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662144184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmufxSBBQcTrd+3JoNDIyWVS1rtnXN5eoVt7O6zwIMA=;
	b=U45F0pbB9AK3OdyOvhelbEnPkrtCBgiAX64dtGZwK+zgH8xpmR5FeqfR5vePYCyWsaDcjE
	uIx5rkzDjQp/RtooGlshe+mjPEzJjl82ygnqUoF8r3M5pw0iV6QDWum6xlwdCGRCiWYnHF
	zukMo4rTekuuddgfy2dstkhaBA6rLUY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-tyVFUX1VNCCZt6jsal9zUg-1; Fri, 02 Sep 2022 14:43:03 -0400
X-MC-Unique: tyVFUX1VNCCZt6jsal9zUg-1
Received: by mail-io1-f70.google.com with SMTP id z4-20020a6b0a04000000b006887f66dcf3so1818119ioi.18
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 11:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=xmufxSBBQcTrd+3JoNDIyWVS1rtnXN5eoVt7O6zwIMA=;
        b=FRfRgPIfpvdj3ZPRPs/rmcGJM4/dxW5rF9zpTHfrS8c3VCqQRfNp8r7Yw6W8E6yh/T
         x7OXpOSGftz4iz2q6g6txeHkrQbNmtuZhygQqhx3+/b8Q3ar1aJBraP9Pv2WqsyF86/A
         JmtrmaKw4Akm2rhr7uwQPUu4zGSJK6sihizRDlyn/Axp1EXQAFWZ4G7u7DcCT0+zkHWV
         snnDUYJz9HHAEWZJkhFlPKXaSP2Q/uUyIVG1LogDstsSiS/9xiHsjMsWZlG/RiNLEgOd
         QRBAB7PBxzE7p1SEXxYuWu9F7FIUMsyygIyNGJpvX7sh8E085fGjCDA314sGr+Hr0vRS
         vWMg==
X-Gm-Message-State: ACgBeo3vTg7kBOLPkXmmAzuksh8HexT0ACAfi0lhKrrJY/fLqlyBLKLG
	rqEdQ7WwKgyJZiHgO8pX34pk6rUkPUsv+ZWUauut940nXjFE+Kha3BnHXt8Vp8oP5+R0M7uyh/P
	RQjGUg3sBQVcwxQ==
X-Received: by 2002:a02:93e1:0:b0:33f:1c51:3fee with SMTP id z88-20020a0293e1000000b0033f1c513feemr19483527jah.171.1662144181530;
        Fri, 02 Sep 2022 11:43:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hPjY1pvVSyxZCMjoW6U6N6RRRlysGUzoVjaEowCMXe5gwI63Fs6zQbU0ECABhmJgD8Jx6RA==
X-Received: by 2002:a02:93e1:0:b0:33f:1c51:3fee with SMTP id z88-20020a0293e1000000b0033f1c513feemr19483516jah.171.1662144181220;
        Fri, 02 Sep 2022 11:43:01 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id x6-20020a056602160600b0067b7a057ee8sm1126680iow.25.2022.09.02.11.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:43:00 -0700 (PDT)
Date: Fri, 2 Sep 2022 12:42:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Kevin
 Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 0/8] Break up ioctl dispatch functions to one
 function per ioctl
Message-ID: <20220902124233.662b83b5.alex.williamson@redhat.com>
In-Reply-To: <0-v2-0f9e632d54fb+d6-vfio_ioctl_split_jgg@nvidia.com>
References: <0-v2-0f9e632d54fb+d6-vfio_ioctl_split_jgg@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 31 Aug 2022 17:15:55 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Move ioctl dispatch functions for the group FD and PCI to follow a common
> pattern:
> 
>  - One function per ioctl
>  - Function name has 'ioctl' in it
>  - Function takes in a __user pointer of the correct type
> 
> At least PCI has grown its single ioctl function to over 500 lines and
> needs splitting. Group is split up in the same style to make some coming
> patches more understandable.
> 
> This is based on the "Remove private items from linux/vfio_pci_core.h"
> series as it has a minor conflict with it.
> 
> v2:

Applied to vfio next branch for v6.1.  Thanks,

Alex

