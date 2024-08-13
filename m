Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A419AA68
	for <llvm@lists.linux.dev>; Tue, 13 Aug 2024 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552764; cv=none; b=BMek/JuC8+UHHFbUNVoee3TWLYnc0Tc320WWYLmQ1wOl4LNlVEumJ3LnNEob5ZlAOFaHPktc9GKVP1U48OTwFMOLyK1UV3ZomEP27NSWBc80+36ejYh2dCflBGhhpsnkbNWHT6CPi621vs6tTnKAFgbRG0r5AB8kHV8s08xa4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552764; c=relaxed/simple;
	bh=IeU4JlxvwEK1bR3LbZqNxmwBs83N7J65/pXnEfwbV3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=i7tqZT9P0pzTR6G3g1lVEFydvQIuZ1RelseDO1YBx6Su69ypoPlVTsd7ZABVPZJjZbCDPDyKUBhEaIIgHvH5+NCuRjbe4fqlLlWbC+uTtOjRmAaguINuFgMsfPBRimfNGBt7v7qiUsAiqFt71wmDYpuUA+Btg2D6GqpLWDxdC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdmicIKm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdmicIKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723552761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yjZ5sieVBQuEyESqvwBQfyzp0MLWovNJRBagi8Nh5WY=;
	b=bdmicIKmH4rmxeogiZL7G1VDjV3vZRao+ReAffo6yy9kMhJr9z4z1E7oNJpMb2R/8PKSOq
	F8GcdWG2R4wGMl/IxJlc8hstUQimc7Kem6EC3/QOfUTkdvg/AOTGjFFEWPFJ+WuiWAiDh7
	MRAHqb3Gk+WzQC32VtO99puiqBWJD7Q=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-1DM6gWvDOyGmg-MnMcgaXA-1; Tue, 13 Aug 2024 08:39:20 -0400
X-MC-Unique: 1DM6gWvDOyGmg-MnMcgaXA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-44fe28cd027so8442931cf.0
        for <llvm@lists.linux.dev>; Tue, 13 Aug 2024 05:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552759; x=1724157559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjZ5sieVBQuEyESqvwBQfyzp0MLWovNJRBagi8Nh5WY=;
        b=SozLAj76kugjoOB0M4UsofU7WCSpnvFbUR7cEUrzfbivRiK/MlWAukToemeWNoiYWt
         cDRJwayOEdVbnIxpaC6ZpU5RDpcrKwWTmnB+BIunbcEtHjROYsF0DqAGQ//J+rrQUxHW
         WHE5ZSdvorArAgyCMpr8xpDhbnGCaDUB0uJFR5+xxWPI0EElpDomurWsohRVMr83PlRV
         sYvnCQFCmphiiODCy6SPCtUVwBElu07IPUF+hGlksl/izvquvOlpm+uvrhrhcJLMGyU/
         uBs+15q+WD2TuDgMFlXbeBEuy4bHMWEEVJeSvFqDlSXrAmHS3fZ7ELVdl4cAowc84yO0
         Ubcw==
X-Forwarded-Encrypted: i=1; AJvYcCWTdxdf+lvacIcZqIU2A3kiVI+TATHaLvYH/oTcNVnbxetigns5Az1zMsN2H2d7UhG5ohqs@lists.linux.dev
X-Gm-Message-State: AOJu0Yw09CfnHPQNFh81I2/RaNlnzLOyMy9cqsnlPYQkDev6R9BjONDt
	+gM2bKTaTWojew9GQOeecEEROusWzIVTqsuuiGYOB2RBb2lrPNHdvNUnY8J+gR+MX/RCc3aZ1kG
	0VEhhzAjUJ5v9XTfpURSzTdJgFEDRYFE9dvowAbyXMsYhIKwf2vo=
X-Received: by 2002:a05:620a:28cc:b0:7a3:49e2:d5 with SMTP id af79cd13be357-7a4e4edce14mr160478585a.5.1723552759029;
        Tue, 13 Aug 2024 05:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFijS5tIdPnCQxLSINNXt4r0B0wDnse6msfM8zIMVpsdcIiZ1NrJPaY1kjG6rdOKYNXfDN8nA==
X-Received: by 2002:a05:620a:28cc:b0:7a3:49e2:d5 with SMTP id af79cd13be357-7a4e4edce14mr160477185a.5.1723552758684;
        Tue, 13 Aug 2024 05:39:18 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7df8c1asm336360985a.90.2024.08.13.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:39:18 -0700 (PDT)
Date: Tue, 13 Aug 2024 08:39:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 206/222]
 arch/x86/include/asm/pgtable.h:1420:10: error: invalid output size for
 constraint '+q'
Message-ID: <ZrtT89dGpvBmC2Ws@x1n>
References: <202408111850.Y7rbVXOo-lkp@intel.com>
 <ZrpKtnQqkrbfaUhp@x1n>
 <20240812192708.9b30a06b3fdc850430bd2a7f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240812192708.9b30a06b3fdc850430bd2a7f@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 12, 2024 at 07:27:08PM -0700, Andrew Morton wrote:
> On Mon, 12 Aug 2024 13:47:34 -0400 Peter Xu <peterx@redhat.com> wrote:
> 
> > I'll squash this when I repost the whole 1g pud series soon (with quite a
> > few commit message enhancements, and English fixes).
> 
> I'll drop the series "mm/mprotect: Fix dax puds", v4.  Please work
> against latest mm-unstable.

Yes, thanks.  I just pulled and it looks like the v4-dropped branch is
still not pushed.

Btw, I posted v5 yesterday:

  https://lore.kernel.org/r/20240812181225.1360970-1-peterx@redhat.com

I would hope it could already apply on top of latest mm-unstable after v4
dropped.  Please let me know otherwise.

Thanks,

-- 
Peter Xu

