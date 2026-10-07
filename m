Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF33D47BF
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383549; cv=pass; b=ijt32bUeAjH15Koc4PmND+trUdniWgX6IGqkmB8C4kjCkNXFz8lVwtCSptW9o6BSUlC3Fr2m8UQkZ0aON/sQ0m7K3syVilgNKNwi+ueUktnPI+a/L6+d6UdOnIlKFj9sWDsNE25dekCTBFaBRl9AyNXzOIre4i5i3lszVf6we5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383549; c=relaxed/simple;
	bh=kAAKOOjaAvYZaAHOUTCAOnLdyRNj6P0W/vYfaghxTeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwoLAcXu2V/ffMjixq641QYE7hA2hKNVsc0lX6DXedXayMBjsUdJSEsMENiLl4sZ0kgu25pOegp0XZ8XNm74Xukz1t21rv61DT4su/Yd1kJo1bamEcTvvxjHB7yD1BSFej9E3xjos4ydg5KncD5QLhfZFVN0sbe55jt9XaYYNtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RRRxeCaQ; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RRRxeCaQ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3516c82e96cso542988eec.0
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 07:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791383544; cv=none;
        d=google.com; s=arc-20260327;
        b=JxEiGLrla8nt/VoVXlfkot5Af/VdPocibxxWPxQUSZJfmTvPSqm65My7imPSOzqpRs
         NSvPF28SddAGVwciJ5F72ODISK2ne38zBECcxg+eTTMMelIfvfWgdeZWoRD8eKJAGWkP
         o8WVZy7kQOkgf+/jY1B3YVK4IJ/6fOmnyJzqQ3jhxgt4KcIFMZ+vZm0aK7IFNShv+FMN
         kJzctMt0QIRzOXy6+yhtkfZZJQvI0Q2x4g2NGp4EGAKW4Pzv5+xpPyqm3Fy1ttE4sZby
         mlZTLBydmfC0TEFZ4pjRQeXV341N4n/lk+dmIJHARrEjD19FPhpYpzu67EV71sGY7X0+
         nQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wNM9t3jtIo/GYt2tLLZSJbMvnD5utEjM7/ofYn8Iatc=;
        fh=D1Pbtth2oAA+0KoUWO2Uo2Q6qTuWjBLzeT0GpcBDbOw=;
        b=EwyKDAshNGVN3lqMKJMX2ERRO9cx75DAy6nTkppKUOYReluNG+TFAON1vypyY4BgpB
         ZlhhWcjtLzmu0SsE7DSfDiwqiZQ192YOcGXajYbIB7OwCqHvv1ijUqDqi75mYd8Uy6is
         1/GrVrHVr8Rjl2sANxC3RNmkEP3uSgXiMckv4fBoYOyTsgLNH18OBdAs68NxWhjld3R7
         FQe7V+FXcAB2QMs7lhEuQ+/LJxtqa5lnDn1vU4iuzariCpH//qH5IyKySApQMtw+p2bz
         h+FQrHPiZp2TD2D6X9B2gMMqSFUdscwSMNbAQfEvU38qc0lRM3DUKUC8P3Sm2kV4ATeU
         QiSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383544; x=1791988344; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNM9t3jtIo/GYt2tLLZSJbMvnD5utEjM7/ofYn8Iatc=;
        b=RRRxeCaQIGVS9NeXFuNBuSO+pxXtuyXXVdGJ/5r9bhlm0SNNB8EigyljE7gDIR8oYF
         aFTgcj0dWm8W7j5+P/5bTm7t1+UwKoQTRUbHpFFCP9fH9IQ+KuaUJOGDuVz1hNnGgrT/
         ygKrwvCZ+wZT7U5zRXT/xQee/SGoCNCLqd66XbA8hzLwlXh1FgwhqNR/b2yR3qNBS0kY
         5BBqfkY3wGNyaxpjZqlQQp2fXRaWpPFnk24FvD2Rlwqe9SyIpCDS6OZZjfGgBHb7f0rO
         aGx2XfesKGytcsyYqyl6IsXLz+I44X6ot2/lqmXc5R9b8tSzKugQIwcUM4BcpSZeBBKO
         jwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383544; x=1791988344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wNM9t3jtIo/GYt2tLLZSJbMvnD5utEjM7/ofYn8Iatc=;
        b=J53EtL6R8OWmt2V2XE/0K6F1UpeqdDSkWeKaXpSr+fAqM0JuoXDxaHo4FjNgIv/Isr
         lnq1DFOZdR8r8QvA6PUmU8ZJ/MSfaD/ky2XvvNb19jLITgJWMPgBti011Z5E22NE+qnP
         /mtizH9JlqhOOjvlVVZYtT4heab9pVpPMvSeRuWc1Gfr/FyGklC2r/nkEGTPsZWptP4Q
         EQeKDDMiUG0xEv7muwY4INaSsSmw0XkhN5pe60QgKUkVc+gEsV5ue78RHvCBvnYJ2CuS
         xu2LPbM82fNY+OREQsU8ffJ0Cq6ClRYAosdk7yj2/Uj8puZlyhIbJiB/TNSFEIjkv0A8
         oBEw==
X-Forwarded-Encrypted: i=1; AKwUvBySRIQgkC6y/5B3tqZLfy4XGczVmyi/0OoJv8kpDEKl5sGQMO3f4mMYqHqiyzqCib4n+2UL@lists.linux.dev
X-Gm-Message-State: AFuF++k2pK6zBOnS9fV9w8VS2wmxo0XBsDr79AH4uaFLtmrGoeN44T7z
	abE48C47fJb5M1TdApFCksmJSIvT7Xj91M/j11CZkiQOsfPfX+Swa1Ov3l0SJoHq1alQKxR6JJj
	PmGhlwdg1yFPe9Ix0afU/I2Q2Bu1i3xfZ4wT4aBPq
X-Gm-Gg: AYBFou0J4UcDTgj8lAUh5lAof1ur+Jj3sexr5qk6BtoUrq7TaH1bwj71dzJ91D16WJv
	xjoUg7B9rpEyG1b8y78CM6GNuGbXuqewWVLdLFYkzCa+LfbJKm9rAzU4akoJIZI2tt79MqSZlWe
	oSFm7mTW0hmj4D/sFAyhXEYulzHYUzncwbiqiiuXI7Tmq4YuylijQvBzqu4c4/7WTwBOamsI1/I
	wqWeZk8fAY6VQG/N9X7B1tapHX24wKDZpo9797ZvtfIH7TFW1KfpX7uKPD35pUd67R4rGhqnM1z
	ayi2pWybYU3k5xGEbJu4102uvDTYHatra+R30O3jnZ08fbubNmcJvNQQj9Wy9rEWPlX0YX5sIwi
	QP2D9BPPL2mXm3wcdHQMM2g==
X-Received: by 2002:a05:701b:458d:b0:14c:d84c:7182 with SMTP id
 a92af1059eb24-16205ead94bmr2126585c88.22.1791383543226; Wed, 07 Oct 2026
 07:32:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1791349129.git.bvanassche@acm.org> <765bf3683555f3d7fbe8510cde1eb50d5f6d0c6f.1791349129.git.bvanassche@acm.org>
 <20261007131411.GE30647@lst.de>
In-Reply-To: <20261007131411.GE30647@lst.de>
From: Marco Elver <elver@google.com>
Date: Wed, 7 Oct 2026 16:31:45 +0200
X-Gm-Features: AclHuK9avBQrZLO05u7yyi3tvHf6fXRKzgFjjrsP78FV-9q7VTnQzI8J5lXgpbw
Message-ID: <CANpmjNOUKf49YsujdfA-c553mx7G7+NWEPJjwNxCyTWafDZBOg@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] scsi: scsi_debug: Improve lock context annotations
To: Christoph Hellwig <hch@lst.de>
Cc: Bart Van Assche <bvanassche@acm.org>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	linux-scsi@vger.kernel.org, John Garry <john.g.garry@oracle.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 15:14, Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Oct 06, 2026 at 10:07:29PM -0700, Bart Van Assche wrote:
> >  static inline void
> >  sdeb_read_lock(rwlock_t *lock)
> > +     __acquires_shared(lock)
> > +     __context_unsafe(/*conditional locking*/)
> >  {
> > -     if (sdebug_no_rwlock)
> > -             __acquire(lock);
> > -     else
> > +     if (!sdebug_no_rwlock)
> >               read_lock(lock);
> >  }
>
> Is there no way we can make the spare-style __acquire/__release work for
> clang?  That would be this and similar patterns so much better and
> safer than the blanket __context_unsafe.

__acquire/__release/etc. fake acquire/release functions do already
work with Clang Context Analysis. I spent quite a while making them
work because of patterns like above, and lots of macros which rely on
them. See definition of context_lock_struct() in
include/linux/compiler-context-analysis.h where they are implemented
(tldr; they are "overloaded" empty inline functions which exist per
context lock type).

Thanks,
-- Marco
