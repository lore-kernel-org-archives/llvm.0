Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D122905
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 01:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711070938; cv=none; b=EJDGZIQ0Bykt/Y/agkTHFWHCgSlzgEfnRLxrV6VCqeNLCWQw9lf4CE6bgnKzOHptHX6vDODIY4z1RsfaLb2IKF51bEAQAPmJr6Pqz+Yne/yLgS5/tuP0CMkHmq2K3g60BJ3ws2NfVdSSAtF6+z1exlW64csezK0VnClml32VnB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711070938; c=relaxed/simple;
	bh=wUWtK/vMJLZwX1DvkPLzIaDS7xtrHfNcefyZ/OZD9mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6xI2+u8emnasU1gPdGdHtfjdbRFCpcNUv61l4eeL+PkRd65A/8w9Lho0Kw0PL1GuGgKOKLPd1WNv4QoGbCE86UBCHDzD6pf/HyRsuj6iL7jOoa7vz5NEKmyBqUktosvGIf2pEozZxWCfTI/MlxKqa0uSsDqrdLmnwungYk5mTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJTO6yS2; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJTO6yS2"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4d4585339ccso1473713e0c.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 18:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711070936; x=1711675736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elX0v/wzn8FOI5S/DSgb8r/0YEFXzUdTLBxZj76WCmE=;
        b=dJTO6yS2VUamFjhcpQl5xCKD58UAKVWnhF7JXJMkLgAadtpSb8q9Hv5WNVwsrv4MSG
         wHk9eSznbnR14BLix5vl2kq7Gjgx640QplDjwPplyfQgkcRueTr0Gd/rXbf5kycEMPiu
         MXwTITWhMNTpEMqY/UfJxQ4dSmomrxxy3soiMxAcLjnHLDxbDUxTnNR4lPqqw4r5njGL
         l6irigjFJnJKVj5odC3Y8D0pqRneX9ACNEFPi4hgpa6j5akoPhVvYHBBYwdvyKsdYr/4
         ouQ3IttW7Q6giKu1EGsEJhOfpy59wf9D8ZuCBDigNjuk7iyDQ4ACtSsnXrkLG13l1+Up
         Ygkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711070936; x=1711675736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elX0v/wzn8FOI5S/DSgb8r/0YEFXzUdTLBxZj76WCmE=;
        b=mxZzt35rW8uURZNOq3tS/j0BncH+eJ2uHelxCZkDnvz8obdFIVjZkex38ASlSbjeG5
         +J8xTpNqyUS55SOcW8YCgmNHUOmYsXyjGW2BTWHpRLffY6nfJ3NqgXRNDTTcHikNtQOL
         63rWeMm+6xu72HKBYgrKIDMHKj5/bN273XEbmLAXF+MsM/tvWKdkCz66Egg+5zYoL6FB
         u1YknR3cYcgmFFB+SHYkRnVlZXYKRY+LoAV8Y6PJ2TFH0RsxIBmZ+8Xk//O5NZ98MTO+
         A9nGLQQx7L+22yZD8UKhJ9XDQJfjgSbdKvKJq32Q0u2bgrfUyCVjF8eLZD30aFBnTU6I
         AeHg==
X-Forwarded-Encrypted: i=1; AJvYcCX8e1EdPOmarFHVOIhEvYJJdAvgY0SQhgEhwXUao5JjzxOq1ObC15mWWkmoFHqZrJmIRZR4wF705KUimqXTiuWn1e2dqQ==
X-Gm-Message-State: AOJu0YwyIqPdudb7vzoTZLbIauLCCgG8qa6FasghJpp+TG/vXg9v5N3j
	NChDV4A/V6zheGSWSri1Rm0Lle44+QUfJUg/KmSgfGRRrhbUM4u3iJ3vjxjFQKCckWSGhFL7Xff
	m2HssCO03jH91tTcOnibqr7xzvGw=
X-Google-Smtp-Source: AGHT+IG3Qs0+xfEueXgay/q0x75ZXaWOWC/3RP7WH7SqqyiLSOLlKrECWMc2rVaZGvh5qPUqqJBhFjmiwePw6P+eh6Y=
X-Received: by 2002:a05:6122:2014:b0:4d4:11e9:c33f with SMTP id
 l20-20020a056122201400b004d411e9c33fmr596399vkd.5.1711070935188; Thu, 21 Mar
 2024 18:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314141516.31747-1-liuhailong@oppo.com> <20240315081803.2223-1-liuhailong@oppo.com>
 <ZflTCY-Oaxm0U70u@tiehlicka> <CAGsJ_4w0EHuAwvSFuqUsMO-bLjJwCmN_qjL6NuA043-4rgfgsQ@mail.gmail.com>
 <ZfmV0uEMgZ2Dzdnm@tiehlicka>
In-Reply-To: <ZfmV0uEMgZ2Dzdnm@tiehlicka>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 22 Mar 2024 14:28:44 +1300
Message-ID: <CAGsJ_4zC5A2K6=u6jYDmCX4YWw-2utheQZzb8pi-BezayObvKw@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "mm: skip CMA pages when they are not available"
To: Michal Hocko <mhocko@suse.com>
Cc: liuhailong@oppo.com, akpm@linux-foundation.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, surenb@google.com, 
	zhaoyang.huang@unisoc.com, quic_charante@quicinc.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 2:40=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Tue 19-03-24 19:09:18, Barry Song wrote:
> > On Tue, Mar 19, 2024 at 4:56=E2=80=AFPM Michal Hocko <mhocko@suse.com> =
wrote:
> > >
> > > On Fri 15-03-24 16:18:03, liuhailong@oppo.com wrote:
> > > > From: "Hailong.Liu" <liuhailong@oppo.com>
> > > >
> > > > This reverts
> > > > commit b7108d66318a ("Multi-gen LRU: skip CMA pages when they are n=
ot eligible")
> > > > commit 5da226dbfce3 ("mm: skip CMA pages when they are not availabl=
e")
> > > >
> > > > skip_cma may cause system not responding. if cma pages is large in =
lru_list
> > > > and system is in lowmemory, many tasks would direct reclaim and was=
te
> > > > cpu time to isolate_lru_pages and return.
> > > >
> > > > Test this patch on android-5.15 8G device
> > > > reproducer:
> > > > - cma_declare_contiguous 3G pages
> > > > - set /proc/sys/vm/swappiness 0 to enable direct_reclaim reclaim fi=
le
> > > >   only.
> > > > - run a memleak process in userspace
> > >
> > > Does this represent a sane configuration? CMA memory is unusable for
> > > kernel allocations and memleak process is also hard to reclaim due to
> > > swap suppression. Isn't such a system doomed to struggle to reclaim a=
ny
> > > memory? Btw. how does the same setup behave with the regular LRU
> > > implementation? My guess would be that it would struggle as well.
> >
> > I assume the regular LRU implementation you are talking about is the LR=
U
> > without skip_cma()?
>
> No, I mean standard LRU reclaim implementation rather than MGLRU.

I guess Hailong was running the standard LRU with active/inactive lists
as his v1 even didn't touch MGLRU,
https://lore.kernel.org/linux-mm/20240314141516.31747-1-liuhailong@oppo.com=
/

Hailong, please correct me if this is not the case.

>
> --
> Michal Hocko
> SUSE Labs
