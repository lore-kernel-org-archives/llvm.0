Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725147E
	for <llvm@lists.linux.dev>; Mon,  4 Sep 2023 08:55:52 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-563f8e8a53dso425789a12.3
        for <llvm@lists.linux.dev>; Mon, 04 Sep 2023 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693817751; x=1694422551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bv44DxuNITNpd4qmM6vPqTpOEKj8EebxgG2BGExGRc=;
        b=1eYgej6Tghct/xeaW2FeMOXK7lOPcexstlNs8+yxWuOTcvEnayI8HWzRheCEcrH47q
         1Me65J4vqopsf9fsuVqEhNVRrAZfJmfDn90/cxpY15zY6AOXjbatjiTVp0u3s2lHuRxz
         yrYdwzmiEQwD6PpfncXRXOM9HVmIorGFcgpDHiEvoZ3zXm9dKdeMnedkS1+G89e71bvU
         TnL7J0+m2zvv+Ir8ZJ9G+vmhNLVBkWIxTySkZfbK8jP8OfsbmDZRVBW8Rna8bzOV29eo
         Mx2P7w+EiMHeavZfUJz0hdamNZnJeHZG5+kki2MlOly9U6hr2GImsOy+qn0UMUkZ2wKC
         WDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817752; x=1694422552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bv44DxuNITNpd4qmM6vPqTpOEKj8EebxgG2BGExGRc=;
        b=ASmsoQKl51pf1dsRi6a+MVswg7tuwlb99cg1wJ9O76wM+PA5fqMdbs52Ii871927q/
         1mT0G/uhropiJsdvTcSXhUoBWMUNY3V92YxXEmuKdIBiBvCwpsPcaojGwqDYDGjuCe/f
         KY+F4jOKMv910XF/BW6pDVd6obylvzr+jd+/pVZKxcBr3oYCt4em4EmAxBurkYQXlIwv
         dcyBoATyedFaRZBqcXI69r412cxSnp+mC6h43wmDRq+JJ/y1yJpzN7qZJOGXEPXm5/4X
         1N9N8/k3RZuT/xbW/ArY3zrMgPzc8f6IzSNewk1c8WEScZfKFLCF7kHhXXzGZx1PME5x
         t6Lw==
X-Gm-Message-State: AOJu0YyVHAlQtrrVPvevWl0x2Nk3PPfEU3V+4F/XFKbSHbt2GH3DrtWC
	AWJYDmTBE2mWcdcDf0RTIuwHeQ==
X-Google-Smtp-Source: AGHT+IHeoMKsRckRtk2mpp27WiGyUYVnjLYXKja/59GxduUL+F6fIrYIlPB5LwoH/z6bxVuWblRoFA==
X-Received: by 2002:a05:6a21:33a1:b0:137:7198:af9b with SMTP id yy33-20020a056a2133a100b001377198af9bmr9168852pzb.56.1693817751696;
        Mon, 04 Sep 2023 01:55:51 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b006828e49c04csm6870058pfi.75.2023.09.04.01.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:55:51 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qd5N6-00Ae83-1u;
	Mon, 04 Sep 2023 18:55:48 +1000
Date: Mon, 4 Sep 2023 18:55:48 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>,
	syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>,
	djwong@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com,
	viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
Message-ID: <ZPWblP6LFKRcUFcv@dread.disaster.area>
References: <000000000000e6432a06046c96a5@google.com>
 <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f>
 <ZPUIQzsCSNlnBFHB@dread.disaster.area>
 <CAGudoHE_-2765EttOV_6B9EeSuOxqo1MiRCyFP9y=GbSeCMtZg@mail.gmail.com>
 <ZPUSPAnuGLLe3QWH@dread.disaster.area>
 <20230904-beleben-adipositas-ac1ed398927d@brauner>
 <20230904-nashorn-gemeckert-3ca91ef71695@brauner>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904-nashorn-gemeckert-3ca91ef71695@brauner>

On Mon, Sep 04, 2023 at 10:23:33AM +0200, Christian Brauner wrote:
> > > Which is pretty much the case for all filesystem bug reports from
> 
> I think we should at least consider the option of reducing the number of
> filesystems syzbot tests. Filesystems that are orphaned or that have no
> active maintainers for a long period of time just produce noise.

I wish you good luck in convincing the syzbot maintainers that
testing obsolete, unmaintained and/or deprecated code should be
outside the scope of what syzbot exercises...

> Slapping tags such as [ntfs3?] or [reiserfs?] really don't help to
> reduce the noise.

Yup - they can't be trusted to be correct, so it does nothing to
reduce the noise. There's been two false XFS categorisations
in just the last half a day....

-Dave.
-- 
Dave Chinner
david@fromorbit.com
