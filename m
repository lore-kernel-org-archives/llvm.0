Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1C7F3
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680647818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/FbBasFGKXho73GYLTBPrVyQLxAhNzEHS05zhrQhKI=;
	b=EJzNiTT5nTBN1UZblHDj3Z4uZDQLGL1yaln1r8T5RMCKVTcTF9XHuivHA5grcKNTy3XBLn
	1ODsMDk/QlrrJy68UBqbFArORPqaS4uIWkbQJNq0Mnki05farbwF2pn/JpMjyp95lntij/
	Ycsr5U3QCvarQgU7lnRh16RbHPKM1sQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-PD75XZJ2Pt2LHYTGAD_wHA-1; Tue, 04 Apr 2023 18:36:57 -0400
X-MC-Unique: PD75XZJ2Pt2LHYTGAD_wHA-1
Received: by mail-yb1-f198.google.com with SMTP id b124-20020a253482000000b00b72947f6a54so33628651yba.14
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 15:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680647817;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/FbBasFGKXho73GYLTBPrVyQLxAhNzEHS05zhrQhKI=;
        b=pB0T7aW5w7fEi8F0bhUWyvoWxI8/JTu8u6Axq8DtPyjubmQcMOiuZK4oIR7rdcVm5J
         iZspbjIhna+NAiOU3pWQ0cDMct3xFINEFuWBjrxZ43haMyJmqOsQk5FY7XP6Mdd+oG+U
         kahHDNDkm7refMifAq1YVpDQaUwYj3hsXoSOfqY9WdcLgpdSO6PmTF8yJoIS4Lk6RzPj
         DQSRsNEAEQjmC09VXex+ksfV44s8QLotVumVFCeRGjFDRbbA4mbMxlqC0V1CEJw+Izx2
         5APIdPSESOKYlLR4fahqLhxj41/r0qrwfDTWjoJzyh5ju/mZp0cyTFuhL4j72+ZkBzUF
         twWg==
X-Gm-Message-State: AAQBX9dTjFFOTkSXniPs1HDDe6E1lMzCMKRR8hNXVnpwvLg/BEwVSLaw
	0PCiH8F7PpdKS/1M5kLl1dtjL3UGCKZxvZ7nmFgHnhBaj+B0E823U2+vB0kJ7RxtNjbeNK1dfk6
	LPDSf2JR20B8U1g==
X-Received: by 2002:a25:5ec4:0:b0:b38:fad9:e1f4 with SMTP id s187-20020a255ec4000000b00b38fad9e1f4mr4523214ybb.27.1680647817158;
        Tue, 04 Apr 2023 15:36:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z+Y1glYqpspXbrweNu5K2lTRooFyGui/4SyHZmHEz9m05Pv+DeGb42aYVw1FPLAl3eznsFiw==
X-Received: by 2002:a25:5ec4:0:b0:b38:fad9:e1f4 with SMTP id s187-20020a255ec4000000b00b38fad9e1f4mr4523202ybb.27.1680647816864;
        Tue, 04 Apr 2023 15:36:56 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id d206-20020a251dd7000000b00b7767ca748asm3633950ybd.39.2023.04.04.15.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 15:36:56 -0700 (PDT)
Date: Tue, 4 Apr 2023 18:36:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel test robot <lkp@intel.com>, jic23@kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andriy.shevchenko@linux.intel.com, trix@redhat.com, lars@metafoo.de,
	nathan@kernel.org, ndesaulniers@google.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	hslester96@gmail.com
Subject: Re: [PATCH] iio: light: tsl2772: fix reading proximity-diodes from
 device tree
Message-ID: <ZCymhaDkRkfzk2kP@x1>
References: <20230404011455.339454-1-bmasney@redhat.com>
 <202304041451.gj8oasQp-lkp@intel.com>
 <ZCwGP6rBLgbDGvkv@x1>
 <20230404123544.6m5juesxwf4tklkm@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230404123544.6m5juesxwf4tklkm@pengutronix.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 04, 2023 at 02:35:44PM +0200, Uwe Kleine-König wrote:
> Hello Brian,
> 
> On Tue, Apr 04, 2023 at 07:13:03AM -0400, Brian Masney wrote:
> > This doesn't contain the code that's in iio/togreg [1], and that's why
> > the build failed. I originally developed / built this against
> > next-20230330. I just checked linus/master, next-20230404, iio/testing,
> > and all have the expected code that defines prox_diode_mask.
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/tree/drivers/iio/light/tsl2772.c?h=togreg#n593
> 
> You might want to make use of the --base parameter to git format-patch
> for you next submission. With that the auto builders have a chance to
> test on the right tree.

I'll add the --base parameter next time. However, I think the issue is
that this compiler error is triggered by this patch [1] that's not in
any maintainer trees. I suspect the kernel test robot still has that in
it's local tree from a previous round of testing against this driver.

[1] https://lore.kernel.org/lkml/20230327120823.1369700-1-trix@redhat.com/

Brian

