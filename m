Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987443EE1F2
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021768; cv=none; b=NVF9DSVnfULttpzaN/ODmrqMQNHBRocejyK8KTeEFBrM9SbWA77vthGvsM0lvqfdIG3pEkZPPl8JDFeAr3zv1Vj4WTFtZ8+yeNeV2HoWfFr1466zQVBVq/HNBIqrkP5agFWysDC0IMKr4jbLsR5KqK/IXjRuUN5BdjAkGtNIK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021768; c=relaxed/simple;
	bh=UF53KwwF+oAUSilICLt0Nu5fjrF/uLjngnHZ091+a2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bK00KuRTfjlsNptTmzfuXu2JkEVwd5inPIzJq0h7KnsIG22skVZ0uZGtg/smsjlIa+VJIJq/6gMTAayINGtHWg/WUmY12P6sJSRzL4/o+Zor/+a4HJtPCjPL59ly6TYsoC9n9XdFF8WGlfCROB0/wCTxfScvBZMICWm3DgMG0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKM3+nZJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKM3+nZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784021765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TBrhCMaLeefe3xIZ3hlRm/zq3XAKTj0MtjlETtKb8Pw=;
	b=VKM3+nZJwZpHPKMgWa+9V8D0MAoHLkPu8h4M8L8DV8+MVq2LSDQPrsG2hb5t6b3pZ8QNnb
	Izz8zoC/wN8O6kxwaos1ecVS2m9/yZn66/kPVJADLyOyzdKA4W1sLVRgC5C66rSu1XcL3l
	096WqfReLFbD311Oc0K1NAx9jIkfML0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-OyiqRRmMMoCS2inqXO-lJA-1; Tue, 14 Jul 2026 05:36:02 -0400
X-MC-Unique: OyiqRRmMMoCS2inqXO-lJA-1
X-Mimecast-MFC-AGG-ID: OyiqRRmMMoCS2inqXO-lJA_1784021761
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493bdaf8549so39637995e9.2
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 02:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021761; x=1784626561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBrhCMaLeefe3xIZ3hlRm/zq3XAKTj0MtjlETtKb8Pw=;
        b=pRFEqnyFmQY/dAjTBAGL4GH/gG6oPC7PjwW4LeTce2sPna3Gci0UmOgOdkk9lcQ5vc
         SgbBdwCb0dfMNTsSBLq0rc0seGjKKKavbHgf7FtUfNZlz9qp6bm6aeGJ6ZQqD+/REpLK
         rupzU+otuXxe4/a8Rw2cf9TmF4TQxTA026379lTuP1yeolCSeK2KdJt6I4v+bxwBwZQn
         SA2HV+wGdOS1HgYnXxokH2OQyyFxO+N0vZrfQHXon/9P+zBWDCrARoJvtcC73DKzmKl1
         yCYhi3qALHrx57h97mx1uCySJ4nSXhhLWH0mVMUUJ9lNvp88D8+j1DapwaA+vJBLbFP4
         pQtA==
X-Forwarded-Encrypted: i=1; AHgh+RoCT4MXYr0cvUH5OjTEI9T/lwj4Fv/NtS7SP4STLLn8gbdOobJ2oJAlJ19JGGwNB44XLFkr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9V4WNIbJGmaXFyfwSmrQ27IpDKdJ8tHWI8XtYnbDP3P2oYkte
	1flGHcSSu1+v9jxd/txuWSz+qpQgY4kigEsDhtyDatHjl/ze/wPmi7qXGj1RVdODc2XvC4QJaas
	JL1vcBwit4WaR06VwD4N2rsVs+fUjA2neTiLQiLfiRe9sNAFERcXhjjA=
X-Gm-Gg: AfdE7clmOsHEB02EyF3BcIbBLMOGngQk3pG/6gCZxM6mRQRxJmRVEbL59rZT+col4wM
	GRM2iijaTy7jg5nPG0haF5lB+ZxInWLh3PF4WUcdfx6l2hnDmKexuPGvL36FafyvlsXoHQbQqY/
	EkH3JyyJl4YuSYZlGX0vM2bUi6d5n4uWwg0gTiTHDc1ysi1da1/Fxs/PvjRqZKrYVvDv5IertK2
	Xad9I2lQwsgMzb2igU2fGKiPk85FjsZc68S2YYjFBnwmNlAthimGqHLHYyKD0/TA0FyFgtiIBQ8
	OcnHtAtTZNwNc9hO5FIBOLXfFitavfouMAOHtbXEWhr1CKqwutvBBGhQArdhCFipAfyir3+Cmpy
	QGUF4U8B29cLHB+6sQFguAg4PnkVN1luydohGnVny4LOTLHR4Dp9958Ex8b0h
X-Received: by 2002:a05:600c:a4d:b0:493:e4b2:5290 with SMTP id 5b1f17b1804b1-493f87e5a62mr129201905e9.12.1784021760724;
        Tue, 14 Jul 2026 02:36:00 -0700 (PDT)
X-Received: by 2002:a05:600c:a4d:b0:493:e4b2:5290 with SMTP id 5b1f17b1804b1-493f87e5a62mr129201545e9.12.1784021760325;
        Tue, 14 Jul 2026 02:36:00 -0700 (PDT)
Received: from sgarzare-redhat (host-79-34-22-35.business.telecomitalia.it. [79.34.22.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32c65asm61563095e9.14.2026.07.14.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:35:59 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:35:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline
 asm>:5:8: unpredictable STXR instruction, status is also a source
Message-ID: <alYCoW08UPIGV9np@sgarzare-redhat>
References: <202607061644.jD93AjWc-lkp@intel.com>
 <CAGxU2F5KvtLSgT9pzhv8YxcP_j9L7usXqKY+W446XxLAovdbog@mail.gmail.com>
 <20260710155428.GA3149665@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260710155428.GA3149665@ax162>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YztgVCVhL--1LtduIqm2V5jNPr88wAdGNHYJpwqzzQo_1784021761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Jul 10, 2026 at 08:54:28AM -0700, Nathan Chancellor wrote:
>On Fri, Jul 10, 2026 at 04:22:20PM +0200, Stefano Garzarella wrote:
>> On Mon, 6 Jul 2026 at 10:44, kernel test robot <lkp@intel.com> wrote:
>> >
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> > head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
>> > commit: 102eab95f025b4d3f3a6c0a858400aca2af2fe52 vsock: lock down child_ns_mode as write-once
>> > date:   4 months ago
>> > config: arm64-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/config)
>> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
>> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Fixes: 102eab95f025 ("vsock: lock down child_ns_mode as write-once")
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607061644.jD93AjWc-lkp@intel.com/
>> >
>> > All errors (new ones prefixed by >>):
>> >
>> > >> ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline asm>:5:8: unpredictable STXR instruction, status is also a source
>> >    stlxr   w8, w8, [x21]
>> >    ^
>> >
>>
>> Could this be related to https://github.com/llvm/llvm-project/issues/106380 ?
>> That issue seems fixed in llvm >= 20
>
>Indeed, this is resolved by
>
>  https://github.com/llvm/llvm-project/commit/7183771834d9035ffbedd8f1ff9233b16722b986
>
>in LLVM 20.1.0, I confirmed with a reverse bisect. It looks like

Thanks for checking!

>this issue triggers on undefined values being passed to inline asm but I
>don't see where there is an undefined value in the blamed commit but I
>did not look too hard. Presumably this is around the try_cmpxchg() in

Yeah, I suspected the same.

>vsock_net_set_child_mode(). I am not sure this will be easily to
>workaround so we might just have to leave it broken.

I think so, I can't see any simple workaround :-(

Thanks,
Stefano

