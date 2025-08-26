Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED52BE7DD
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225465; cv=none; b=ewFxE+7HCkoPvS+LXgDpKgYr96CR63YA302vsezNDSfIIvFTIRr2hLwBBEqYdbABG1G+zN0eQRxdetVlGZrrgThK79Or1RwwXYfyei+i/RpKcPDJS0olfLXxRCalD3ZdA9+jP+Dv25OO9R7Gubs9z9nNr/8ey3cEqRCj07qWD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225465; c=relaxed/simple;
	bh=pk1+KDkyoaqAtnIkFzZI+W1at4fbDeoEIRnzxJiguA4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwsn06QgtC1h4T5f5xvGePP8r8WsnzVzu7relbEYUmsMfcFeRR1heoZBi1Lu8ZSbOKG1fmspU7SegzG6KpK0M2ZgG4rV4oDBOsuvH+6je1WD6j5usvjqG1XC3fhrfQlAugIRZ4iWu7DyRbJsrL98/jtajby5Bdvt/r2ddOjLREk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFkdVRZJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFkdVRZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756225463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DRvj9SHcb313RxmMOQKtcYFfPDoXScIlFzVPwHabrg=;
	b=IFkdVRZJC4FbaR2J1kwGhAUevv7pMu9Qx1G4L3chFV5eblD8HICkc8W2vSZDKk+3KFjqV2
	CErIrYT2YM53OyjvQl7YVixjUrtKV7WjMHIdarSUalYI98r6w92yjN+ICKNTuLVHzVEg/7
	thRb4zzwnyMbhOBSkxWPvr9DPdyjNuU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-pXRSsICMPoGEW6zxuJNrxw-1; Tue, 26 Aug 2025 12:24:21 -0400
X-MC-Unique: pXRSsICMPoGEW6zxuJNrxw-1
X-Mimecast-MFC-AGG-ID: pXRSsICMPoGEW6zxuJNrxw_1756225461
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e8dffcf41eso2746195ab.0
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 09:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756225460; x=1756830260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DRvj9SHcb313RxmMOQKtcYFfPDoXScIlFzVPwHabrg=;
        b=e2iD0HaeGoKgyjAIjFXYf+Cpqmy6EF3CVTkQMjYQ4N5Hv6uuwsvbh1sxvzJUYOwK+B
         nRE9gS/LPEEQCwlDVFB4kIm75vgDttPjVWzdxNGZedjXFKKJTKEsNAL+jkDZeKHRwnh7
         a39h+VX+ob/kX1wBthhuNupvCJ4HfDKrNJ06CEVrvcwena/QFoO3r481XrV4TJDaGTuu
         NhUrK0idDfBSbYdtQM+AJc9kLyDmuDIfncHlvhpZ7Yfx1EMk7EDj217CTZoxnnVj+bbl
         ucKytzwcOKktc8iznf5T6lkus7Gm/EI57Ucl6lYB4sq4bTSnEP0R7wwNGJfe4b+bs8Nx
         DKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4cMT0SgREQk/d4cYRKMnuJPOtxZqtwUjGAtSYkcRO3YMgYniihun9/eNy8xMtUkNzlzIC@lists.linux.dev
X-Gm-Message-State: AOJu0YxSfUEPKW1MjRIo1ShZ2tM9TQB/9ydzrluHkP19wrG0A1ie7efD
	DWBLdx+EjHIWhGqLZzoTJS/TcXVerogkQVwMcQS6Few2L7EXEVvSoDaFSlErO8A3kgz3Y9qfDMC
	Ph3SF0QM3mmfZOKIZ4mp0YjbprjtWEZbVGC3utDO4Mujz2+pw53w2cxQ=
X-Gm-Gg: ASbGnctVpphK4odRmlv5L6SCPtuDQV/PoFquhloZX7bzcuy+M9dWqbnDGslBT/gXP5r
	p4raNGN9eP+PwQMfeGq3e75pNQage5Nc1sKWT8A3LIME7iCJvdp9jY6B7hMyWEn/kH2A1wPLCnW
	3NJEm1Dtep8m4atZQBwURXcTg+YabzVeQdsx9HS/cWtSXtZOlHe5kp9qqae8vGbK/qgBk1O1GAw
	L2uS9PCxLfzK7qVkmboJNyq3mHSD2e6k1nw7FZpL9qQVE2So/1GevarAJX8hGX6ek310wc/evzZ
	B5RL0z+q9CpHi94oSBRomhXQy2PiOORDtBxXWzEFjNM=
X-Received: by 2002:a05:6e02:ca3:b0:3eb:9359:d896 with SMTP id e9e14a558f8ab-3eb9359db7bmr40662565ab.3.1756225460621;
        Tue, 26 Aug 2025 09:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmin04GaruynHXLV3EmAB3AOv0MHqsYH/MYaIx/IC/y7jDBa3d4BpatCwcs6IsDHllI5zy1Q==
X-Received: by 2002:a05:6e02:ca3:b0:3eb:9359:d896 with SMTP id e9e14a558f8ab-3eb9359db7bmr40662465ab.3.1756225460200;
        Tue, 26 Aug 2025 09:24:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ec79dabe36sm42903925ab.29.2025.08.26.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:24:19 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:24:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <nikhil.agarwal@amd.com>,
 <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <robin.murphy@arm.com>, <krzk@kernel.org>, <tglx@linutronix.de>,
 <maz@kernel.org>, <linux@weissschuh.net>, <chenqiuji666@gmail.com>,
 <peterz@infradead.org>, <robh@kernel.org>, <abhijit.gangurde@amd.com>,
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250826102416.68ed8fc6.alex.williamson@redhat.com>
In-Reply-To: <20250826043852.2206008-2-nipun.gupta@amd.com>
References: <20250826043852.2206008-1-nipun.gupta@amd.com>
	<20250826043852.2206008-2-nipun.gupta@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 96b-YfGcqPt9TAOua87UjRHziWHKaSxGRNiKRfBse6c_1756225461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Aug 2025 10:08:52 +0530
Nipun Gupta <nipun.gupta@amd.com> wrote:

> Define dummy MSI related APIs in VFIO CDX driver to build the
> driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-lkp@intel.com/
> Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> 
> Changes v1->v2:
> - fix linking intr.c file in Makefile
> Changes v2->v3:
> - return error from vfio_cdx_set_irqs_ioctl() when CONFIG_GENERIC_MSI_IRQ
>   is disabled
> Changes v3->v4:
> - changed the return value to -EINVAL from -ENODEV

What are your intentions for merging this series, char-misc or vfio?
Thanks,

Alex

