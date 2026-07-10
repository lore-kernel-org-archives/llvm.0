Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA1348C5A
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693356; cv=none; b=Qpb1M6vROvs285EAprbV0KN0eEwIuZsW61J06GW5w3zCi5jSv5bUT2U/uwMtqXn90wvF6HIJ4/Wgarxsq3o3G1tPvP6y/MiTlRoohPo9QqAsiQTA27j8qq1StY0wRNPe9xAFHNpN6nUy1DbAufY6JReYo7b2TfDdyiQmOU45V9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693356; c=relaxed/simple;
	bh=j8ztexVeHJ/lysG+dS4FCIohew2jdzXXgg6ocizaIc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhF3/hz28kQYgtKWUmYRZPOVQb63kxV1w/gcNM+vy3WS5MpEsJvJ821ftfSStZ1lvvkFSojN0RVGBs2/R2u3BNsOrrwSP47gHEwIi6UjWPhyiTJZS9qrXpnrdqz1SEJqO5/ml+ChNK38Aq1binti88QpJ8zx9uKWc1MpysWkYPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpnM4SiW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpnM4SiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783693354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Pii6+VUNSkz8RIoUJXNDNW7Hti+cX+eNSorBDf5XVU=;
	b=FpnM4SiWHhZNNuGi8YZwB1IJ/vT5sY1BkqL6zkmFHnhDFNurPnF8Maz9Ax5NjNCw4GRP4m
	Yo7GuCtWGfHZKKubBs3ACQ1oyEPWfHcCoQtjG2QmvhCBlQA3Ruh2vMiD8CzTmQAWqCrqAM
	wpK67o5py5RfCPBCAmb2LLEe9Eg26PU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-urUB76c0NwGg8Mw6rK4bSA-1; Fri, 10 Jul 2026 10:22:33 -0400
X-MC-Unique: urUB76c0NwGg8Mw6rK4bSA-1
X-Mimecast-MFC-AGG-ID: urUB76c0NwGg8Mw6rK4bSA_1783693352
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so18477575ad.3
        for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 07:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693352; x=1784298152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Pii6+VUNSkz8RIoUJXNDNW7Hti+cX+eNSorBDf5XVU=;
        b=RXxbjBgOyEBlxFn0LJSe569lcAcj91or27FOTsboLShhC9V4IWrRa+Hbs0Vu4knfbN
         muJ0ceGnqZHYBCesLTfWa2k/CMTTJptCjhG18p6P9g42R06dPJJpjTpJ34n0pmrpfIUk
         /kH7EFP2l8GVsIraF/99RRUWJ2HjeRpdLSwvF5RUDTuWDz+w+5jtCR2oJ/aHOzIeMWrI
         jBzKcUr7eGC570YQhgDzfRCglbUvlesyQ2TkoI6856Dg5r46HKdhYnHd19K2C0J4yqu4
         rofO5kgSSmEfFK0/MYoRgrABWQbBm1tW+o4bnMxYZz4oRd2S7eslpcO3pffFCnst2WNH
         kckQ==
X-Forwarded-Encrypted: i=1; AHgh+RppJqPCOMk75Jbz8pbKNPTeQoiaf3iQvdPLcqmSHXWbiohG5XXLXafy+4ZaBf1LoIA31dtX@lists.linux.dev
X-Gm-Message-State: AOJu0YzNPGLA7woro9ubArjLhSuJc4+UgyWa/HZbI3MSbqEvELHKcGBV
	FRkhK/WLesXy7cpkUy+4Mrkp4dzg7izcXSZUvCBy9qNvn8C1Dkjd0Q6opcSvqrubh2D7nHhZOw7
	uFZufYI2p0Q4H5PUf8ADrHS4LJid2Hhe8Ku3I579Eur2UE1qs7b3RUBbuGxUsb91ke8YgKplDu1
	dphoDpKQrQLvQILqyPpK6s+tyWUlK1GA==
X-Gm-Gg: AfdE7cnJgQruzADKQ75254rQXbvoPZpeW0GCaYqGr/jGdzhqTQwLH9qWsXrQU4Unlhm
	3p7ZSgr5zXspgRj/vaDses3+XVzpN5H21rTL5vSXTF//lmy56s+N8BIE2VYs55fMEODVWE8wuiz
	TKod1upBVnVEBV+PYMoO07ciDgicoKL13h6wl8fyQvYUzDydfp7YiVcgH50PzIsUwo
X-Received: by 2002:a17:902:e74a:b0:2ca:e08e:9e70 with SMTP id d9443c01a7336-2ccea47fc80mr112578745ad.46.1783693351899;
        Fri, 10 Jul 2026 07:22:31 -0700 (PDT)
X-Received: by 2002:a17:902:e74a:b0:2ca:e08e:9e70 with SMTP id
 d9443c01a7336-2ccea47fc80mr112578445ad.46.1783693351374; Fri, 10 Jul 2026
 07:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607061644.jD93AjWc-lkp@intel.com>
In-Reply-To: <202607061644.jD93AjWc-lkp@intel.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 10 Jul 2026 16:22:20 +0200
X-Gm-Features: AVVi8Cdjins50MTVFIvNiRiNn1jueuFwuqMPkbhEgZBeMXEs5Gzf-VNpsD_OXzo
Message-ID: <CAGxU2F5KvtLSgT9pzhv8YxcP_j9L7usXqKY+W446XxLAovdbog@mail.gmail.com>
Subject: Re: ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline asm>:5:8:
 unpredictable STXR instruction, status is also a source
To: kernel test robot <lkp@intel.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -8NKrNwdHsfgylSCVcLDO2krnWiY62rsSj6tsGRzKf8_1783693352
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 at 10:44, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
> commit: 102eab95f025b4d3f3a6c0a858400aca2af2fe52 vsock: lock down child_ns_mode as write-once
> date:   4 months ago
> config: arm64-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 102eab95f025 ("vsock: lock down child_ns_mode as write-once")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607061644.jD93AjWc-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline asm>:5:8: unpredictable STXR instruction, status is also a source
>    stlxr   w8, w8, [x21]
>    ^
>

Could this be related to https://github.com/llvm/llvm-project/issues/106380 ?
That issue seems fixed in llvm >= 20

Stefano

