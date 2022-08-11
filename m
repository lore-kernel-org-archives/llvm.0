Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F102114
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 18:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660242795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7dz5R5ZNw+F9/FGCaE9Xpa/l+1/FjVP8+1bl2Y6XNQU=;
	b=RxSAEQ5wTY0LW3uFarJHkncrAoJsD2yHVkUYL+bM+CcllWUE63OEvFJ2NN6hmqEDeHX7ep
	iLE+SCCCYGNdi+qZ3j1YqBL27jGE47dEyO8OaxrngcgSmyTTQcNkMlCbW2h3A7U2oZ1Boz
	ChByS+pCPk8ZJdiVh5ke3SjEXcC8VH8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277--3orL-KoPvW4oGVHuFdx6w-1; Thu, 11 Aug 2022 14:33:14 -0400
X-MC-Unique: -3orL-KoPvW4oGVHuFdx6w-1
Received: by mail-ej1-f69.google.com with SMTP id js11-20020a17090797cb00b00730d73eac83so5735128ejc.19
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 11:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=7dz5R5ZNw+F9/FGCaE9Xpa/l+1/FjVP8+1bl2Y6XNQU=;
        b=We6E7KZ8eQJHeixD94vSmRRghowZtbaTkjqwf09YowpO2yA4WQUZ03SxEPLkFxehDz
         n2leMfe4pc5AbudVWnYa6uwy+mBwOjyKRHZ4OkB1rbddR+lMGsGJZiTd4f6HwYoNf3bg
         sEO7dT6zMEIdNd71Lg89WsqXL6AlICLaIaZyaRgpEHtP5LgiWWEjrQq6KV/s9vEqTwX+
         88YsiXCBFGizY43hQdU+m5f5pYbY0QQPRWPeYHmzWfd8tvbK7LSMX92+6+2d14jVcQf4
         OKPPjxJ/VENC9g8gPRMDK0HbXsUk0HesdMjfrIutKcto7wd3+nbxIUdDtctI75XuxPiC
         N5Nw==
X-Gm-Message-State: ACgBeo2i3hz0Xq1Prd6zgtcRgxC4Cgt+RVhXCHg2SM0NthFhguWGGFFJ
	2uqU0oHAy5o5WYHjAPdDFGpyzp0dzu5xY1BBS7WREajTHva1l4orhEGjX4GFZUJR60ZE2epl8Ql
	mJl44BRytQC1A8A==
X-Received: by 2002:a17:907:8b97:b0:730:9480:972a with SMTP id tb23-20020a1709078b9700b007309480972amr245527ejc.648.1660242793770;
        Thu, 11 Aug 2022 11:33:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7WllUicIl5uwdNr8dGWulKl9BvguFKH+7knv9r4HZiA3AtTg9mny3d4uq2XI+aRsoV3gOabQ==
X-Received: by 2002:a17:907:8b97:b0:730:9480:972a with SMTP id tb23-20020a1709078b9700b007309480972amr245507ejc.648.1660242793510;
        Thu, 11 Aug 2022 11:33:13 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it. [79.46.200.178])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709063d2a00b0072ecef772acsm3794657ejf.2.2022.08.11.11.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 11:33:12 -0700 (PDT)
Date: Thu, 11 Aug 2022 20:33:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	linux-next@vger.kernel.org
Subject: Re: build failure of next-20220811 due to d79b32c2e4a4
 ("vdpa_sim_blk: add support for discard and write-zeroes")
Message-ID: <20220811183310.ttewcrfhvs4mfohz@sgarzare-redhat>
References: <YvU67iF4z5gB4ZYk@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YvU67iF4z5gB4ZYk@debian>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Sudip,

On Thu, Aug 11, 2022 at 06:22:54PM +0100, Sudip Mukherjee (Codethink) wrote:
>Hi All,
>
>Not sure if it has been reported, builds of arm64 with clang failed to
>build next-20220811 with the error:
>
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
>                struct virtio_blk_discard_write_zeroes range;
>                ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:204:25: error: use of undeclared identifier 'range'
>                if (to_pull != sizeof(range)) {
>                                      ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:207:21: error: use of undeclared identifier 'range'
>                                to_pull, sizeof(range));
>                                                ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:212:60: error: use of undeclared identifier 'range'
>                bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
>                                                                         ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:222:38: error: use of undeclared identifier 'range'
>                sector = vdpasim64_to_cpu(vdpasim, range.sector);
>                                                   ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:43: error: use of undeclared identifier 'range'
>                num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
>                                                        ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:37: error: use of undeclared identifier 'range'
>                flags = vdpasim32_to_cpu(vdpasim, range.flags);
>                                                  ^
>drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:7: error: mixing declarations and code is incompatible with standards before C99 [-Werror,-Wdeclaration-after-statement]
>                u32 num_sectors, flags;
>                    ^
>8 errors generated.
>
>
>git bisect pointed to d79b32c2e4a4 ("vdpa_sim_blk: add support for discard and write-zeroes").
>And, reverting that commit has fixed the build failure.
>
>I will be happy to test any patch or provide any extra log if needed.

Thanks for the report, I already re-sent a new series with that patch 
fixed:
https://lore.kernel.org/virtualization/20220811083632.77525-1-sgarzare@redhat.com/T/#t

And it looks like it's already in Michael's tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next

Thanks,
Stefano

