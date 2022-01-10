Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF82C80
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641797590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bAVEX5XE4qRstgXFBPQSZ2U9wJsRWTTP8EB2CgNFLGs=;
	b=e2p6wquVgdzQgqxcjh2970TqO7WNLJSm8t7U0mqodvee2no8dc+I9B7hOMfp46bPc4zmzq
	AIuLsY5G9WUUS6u+Of0wL4HkAQqPhXE4JOF2K0aE9LqTTFTC4UHGrYCqyxsUGchIyvx1hX
	UwtZtTIY1gzEIbPwM64kQrpCrXGZu50=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-vmrDBTWkN0GoX-DXkTqhyg-1; Mon, 10 Jan 2022 01:53:09 -0500
X-MC-Unique: vmrDBTWkN0GoX-DXkTqhyg-1
Received: by mail-wr1-f70.google.com with SMTP id o28-20020adfa11c000000b001a60fd79c21so2119872wro.19
        for <llvm@lists.linux.dev>; Sun, 09 Jan 2022 22:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bAVEX5XE4qRstgXFBPQSZ2U9wJsRWTTP8EB2CgNFLGs=;
        b=QuM4ZXbzLSYTbqz5sphJ30akFfUfQLW6zT9c3MY9I4HWKW6dmjaioDmL3uq2FOKanr
         H5iAYjIFld2QmpMwM8IkRGm9krroB7BPtvjsX5/5mSFmJyeS1gysfzOMZAnfECt8pmI+
         kBT14fwWVy2ow0c/MjopkOoJoIsRnrs5kgyHySoxfcP4LJbpk/9p9dw8KfxVxOUTVwd9
         4G49bZi8UWkV3JiM7lnXIzqDje6clYBZc5wUhJ6a3D80WaYGXmM/EWYg91HPojvr3HHx
         AGJF6WG6bbMbjyBUCbI45G7R4Djz7do66boBaQkrtIRd9GAsf02haEv6hjn13WKd3isS
         5Gbw==
X-Gm-Message-State: AOAM530nZrJwqovVMoE1R7tHa1rWL4M8PaYAMYSjqwCwAiI5ZlAf1iHN
	ye8bdEc1Sz+mmgMQ06Fe7TJqZ5LTVoWNUPrhB/8YoZXPDo1SNtEQ9bAH706XpcfovvAmL8QowIa
	CH2H2txKaVqNcuA==
X-Received: by 2002:a5d:5985:: with SMTP id n5mr64027059wri.63.1641797588099;
        Sun, 09 Jan 2022 22:53:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU4FC9pKm0TfR5HrVjZt3VG3toxN3FDZI29ak/UncvO20L/QqXmxSE3a4/iC/fhg46NNI7Pw==
X-Received: by 2002:a5d:5985:: with SMTP id n5mr64027043wri.63.1641797587914;
        Sun, 09 Jan 2022 22:53:07 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
        by smtp.gmail.com with ESMTPSA id f5sm2858744wmf.47.2022.01.09.22.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 22:53:07 -0800 (PST)
Date: Mon, 10 Jan 2022 01:53:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Eli Cohen <elic@nvidia.com>,
	jasowang@redhat.com, virtualization@lists.linux-foundation.org,
	lvivier@redhat.com, eperezma@redhat.com, llvm@lists.linux.dev
Subject: Re: [PATCH v7 07/14] vdpa/mlx5: Support configuring max data
 virtqueue
Message-ID: <20220110015040-mutt-send-email-mst@kernel.org>
References: <20220105114646.577224-1-elic@nvidia.com>
 <20220105114646.577224-8-elic@nvidia.com>
 <99150f0c-6814-a0cc-8640-aa8014af6ed0@oracle.com>
 <YdiABvwrK3WxfHqb@archlinux-ax161>
 <233b923b-e6e2-0d47-8230-df91a35ee4de@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <233b923b-e6e2-0d47-8230-df91a35ee4de@oracle.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 07, 2022 at 05:43:15PM -0800, Si-Wei Liu wrote:
> It's unfortunate. Don't know why this series got pulled into linux-next
> prematurely. The code review is still on going and there were outstanding
> comments that hadn't been addressed yet.

Most patches got acked, and the merge window is closing.
The only couple of issues seem to be with this specific patch, and I
think I fixed them up.
Still - I can hold them if necessary. What do others think?

-- 
MST

