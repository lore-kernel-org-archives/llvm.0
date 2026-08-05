Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869445FFBB
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932815; cv=none; b=HQ3+ZpYCtt7ZfUeR2Dx3lhENwVJB3zZ3ciUpTN27ovSir34abY0lBV21GRyh8x5Vq6a8YHofUnTSfJ1jAXfGEJIFV3luaAhTgEPi2m6fqPhEzBb+o26+qSkO+FmBicvq+R/RSSsMVtoV9JLocYbDNMg5IuN4hgXMBRn+mH7pWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932815; c=relaxed/simple;
	bh=UGcICKdK5wREleej2K1D6G2gBWEregBBuy1tlhv0/Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6p3UgBBOy1RaMtzs2dPhs9C7qkC3q6LGsncAUpQlZZuwV4RsCD/1IqvedaA9XWhzOwYwO1K5nrS5DND1AmoX62nZFI/X0dAv7fkaXHotZeN0bG7T0VHi+0g6cYmXPMEgtdKChqio0VnbjxQWAp0JnwoWohJknHM+RVITBZ5R3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ds64gvoT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ds64gvoT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso898241a91.1
        for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932813; x=1786537613; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zSS6W/f7vcLMC+n78G1WtF8yNf9UtnQtPxTkVsbxTU=;
        b=ds64gvoT7KKGTL5JBNWTmM3BTLSBjAtr22axggTCrVdzXcPg+6XZrEuLef9gBtslHe
         z8B0tDJsvoR15VgqjH3jtlP6y6BaVTnd5OQZMtly6spSvCius7k280gidalJ1sAad97x
         1JmCiR4V3PpViJagB44e4xSBXGR+ST738xp4lv3Mbr03QB4gNFrq2OROYOz7vFESXQv3
         3TxCpcWND2w/7i/mUEa/0v4zcVj5WVxM9S1NhhBkh4x352wS8fi6Kev0OCnPIS5djmkk
         iOIQRukLcRws/OfT/ht0x4pHJoHGeHucWwQfbA0YtZ0HcUOlvV70kYIdz9i9DQYDwRKt
         vw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932813; x=1786537613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4zSS6W/f7vcLMC+n78G1WtF8yNf9UtnQtPxTkVsbxTU=;
        b=CPyqiyiOcqZ5lsvqPjFQVjwqZCUdNvQBBpa2qAIYLh/+j9H4Dvpvd4atfCDlCC3suT
         KI+3UsbzFagQ8//JvcGDcMH56LTCfIRdOi+0QdiX7KXjW4g6c1KnhNNPeTuHy6amGoJI
         1FuNwTgLrvUaxOvCC//C2wJpcIYcH5/8MGPJmgVgnDLtDFWtPTuIHPRtBhov7lQNWzPK
         uJpd/5LSMx7U/nK4JwPZSfl0QM1ZuJiWn/iyZL/YMX3WOl97MzbGs7/iszozQXowwtz/
         XoQ2mZc5DHPBh4Su136r+1PAFisAh/LyHe05myZiWqJdA9RyiPGEd199Fo/bvqaXzVH9
         MHJw==
X-Forwarded-Encrypted: i=1; AHgh+RrlSmmkTqxucaIv9h1luXHGhXRbi3Mc298suwyvMuxIUjHpRZHE/2PWj1XH+OnJv9Rj3uXa@lists.linux.dev
X-Gm-Message-State: AOJu0YxTH46kDsogs9ZOEtSAlhH+9lobiQk7nJO5i5BYds9urdrMle+k
	HHFwqvBtXDsigfzwU3J355Pbpe43wniA2U8odkeuvoDJ3AVVdI/OXhVq
X-Gm-Gg: AR+sD13r2L7q9XwCajmx88zXRBVpljS0VDi83OEDx5VDxWe648xAkPIwjQ3rordBPCe
	yhTvP/4W6ylHFEtUxy8jaO97TQw0Pr2IeYOlp7sLtSZXQ90tS1RTpn1BwRY30K14jkfgBllsUQV
	EFhSmB1NcBjAKArOiVLb6VfEmrCyBf9kehQyAGV5HOurBfk4iaXsXl4JxBpDyrkiTakUC/vSvvx
	N6Pi0gZWM0OfsPm1MMwQTnwv7v+hjfqCmvqVKd/P5U+FM0uL3TztSyeZ+xRyY9PCcg0/Zcgquik
	IH2BdGBmXDsVdtMDa/BwlxK56eOlXhHXie7kebYevHjoDH/zbCMor65vaxPaK92z58oEhH938IZ
	nr2OIpTBxj/bFZE6qvjT3fwV/J4rYvrN3kyjsSEURuvX/3wVV2nx1CwIJsuAR4xU1lieqzKVI8N
	50cyigxhQstN4+XFNv3xEzrO2LdOSe0i5hPQ93Ao/Iiho8oNrkSY3risa7AQLgqdyESt/qBvSYP
	HfgHxcaeYCnM28st2r/VdrgJmfEbziCoiHNdf5kSi3yxYM=
X-Received: by 2002:a17:90b:5683:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3903c5380f7mr6328805a91.3.1785932813141;
        Wed, 05 Aug 2026 05:26:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.161.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39039002882sm3109185a91.0.2026.08.05.05.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:26:52 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:56:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, fujita.tomonori@gmail.com, 
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org, prafulrai522@gmail.com, 
	nsc@kernel.org, japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net, 
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anMry3IyjSKhuGI3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804202217.GA1109939@ax162>
 <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <anMq59xoOrusKKl2@desktop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anMq59xoOrusKKl2@desktop>

On Wed, Aug 05, 2026 at 02:21:59PM +0200, Link Mauve wrote:
> On Wed, Aug 05, 2026 at 05:40:42PM +0530, Mukesh Kumar Chaurasiya wrote:
> […]
> > For these warnings below diff should fix it. I'll send out a patch soon.
> > 
> > diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> > index 06d7d1a2e8da..acec2d2fede7 100644
> > --- a/rust/uapi/uapi_helper.h
> > +++ b/rust/uapi/uapi_helper.h
> > @@ -6,7 +6,7 @@
> >   * Sorted alphabetically.
> >   */
> >  
> > -#include <uapi/asm-generic/ioctl.h>
> > +#include <uapi/linux/ioctl.h>
> >  #include <uapi/drm/drm.h>
> >  #include <uapi/drm/nova_drm.h>
> >  #include <uapi/drm/panthor_drm.h>
> 
> You likely want to keep the alphabetical sort here.
> 
Yeah, Thanks,

I'll take care of this in the patch.

Regards,
Mukesh

[...]
