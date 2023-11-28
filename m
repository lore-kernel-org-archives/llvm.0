Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1180E35287
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdJIkT6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701191691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gtaSo1ub4uORnqknoH16PJEFq9uekg4hoFlfPiGwcdU=;
	b=DdJIkT6jde7a217/0seKrqD6amZi6lmt9+acHATH2/DL/kWMJ9qXKy3Q5+v+dTjC3hMJy4
	TiUf8LyTGK/f5x820I+MNapr9X/0w+8oeLijMR6Su53fgqV+JU0EMMFphBLnt8sNoVnPuU
	p/20znwlzK2ZRX27WCLKlg4Kqwt50HI=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-UhQPisDoPA2usmjEcnxrjA-1; Tue, 28 Nov 2023 12:14:50 -0500
X-MC-Unique: UhQPisDoPA2usmjEcnxrjA-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7b39e0d8185so271357939f.0
        for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 09:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191690; x=1701796490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtaSo1ub4uORnqknoH16PJEFq9uekg4hoFlfPiGwcdU=;
        b=v9zlFHpG/hnMNKcu6ZKuyuMUGB2s/h9zKOyOHmETd742W73g8PLHVAts4wJQMzlcWb
         gIF7+51bz1k30o9Pp2TegQyxQ5dg0NZEsLEg+ZruACRi9Q7UXisLFfKkh4oHskTVP4ju
         l8KvplEtReYv+sZDV/TZ9WPwzGT+R1Ag2BXi2ZgEHBoobsL8R5b1NI7/WuX1iowmptZW
         UM5hptcuHJdITJuHV/FeK2n7m5tc2OtqzOjkbuzxsdHIuhW6KsFZpIlDAMsQnCawmjov
         eChQo2VgjC7knP3ISx31lLfBFmGo2eW9rG5tf4JH7yVoewpCacezA+8fHDqOs+ud2XHp
         6KbA==
X-Gm-Message-State: AOJu0YzccCKhNBzRJGESbDybOeOYRkwwe2GTREDDI36/dw5ConbfzWmB
	TYaV+fJbB3L6rQ6k7/paKR/e51blnkwDbILr5N1H3WgscDxB1YsFDGkRe48ANy40zC4OyXfttXq
	UhvvKS5IJchimWA==
X-Received: by 2002:a05:6602:131e:b0:7b0:2037:68f3 with SMTP id h30-20020a056602131e00b007b0203768f3mr15000354iov.13.1701191689952;
        Tue, 28 Nov 2023 09:14:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD6oEwpFjpUyHT/D0OGCBMhCVi5mSaIjGthKIjs5b6xAvuny8q9LhuouQv4++AjP9LEwy0Kw==
X-Received: by 2002:a05:6602:131e:b0:7b0:2037:68f3 with SMTP id h30-20020a056602131e00b007b0203768f3mr15000328iov.13.1701191689657;
        Tue, 28 Nov 2023 09:14:49 -0800 (PST)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id ep10-20020a0566384e0a00b00459949acd10sm2956452jab.39.2023.11.28.09.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:14:49 -0800 (PST)
Date: Tue, 28 Nov 2023 10:14:47 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kernel test robot <lkp@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning:
 attribute declaration must precede definition
Message-ID: <20231128101447.2739afa9.alex.williamson@redhat.com>
In-Reply-To: <20231128124538.GO436702@nvidia.com>
References: <202311280814.KwQVhwqI-lkp@intel.com>
	<20231128124538.GO436702@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Tue, 28 Nov 2023 08:45:38 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Nov 28, 2023 at 11:01:45AM +0800, kernel test robot wrote:
> > Hi Yi,
> > 
> > FYI, the error/warning still remains.  
> 
> The patch is still here:
> 
> https://lore.kernel.org/r/0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com
> 
> Alex? Maybe you should send it to -rc now?

Looks like this was originally targeted going through KVM.  I'm
intending to do a v6.7-rc pull anyway and it's relevant to vfio, so I
don't mind including it, but I think we need an ack from Paolo.

Paolo?

Thanks,
Alex

