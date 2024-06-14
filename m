Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A818F2F9
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718406619; cv=none; b=CxD2eHhNX9G5Yt0fqy8rzmWv7tTDGmChecJEL+3aS1Glkx/Sm3ivMwVu/SPvEfkIsC8LHfenbesvVnZZuUqOxEwrt14hNvaggEsWaprC5QR56eNxiWvp5AXM+WbAP+/aHO9SXz8IHcWVlU8Vkf/uPEpFl1WcNDga/oqVlukvdd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718406619; c=relaxed/simple;
	bh=HBZ8c72MkYU8netKasktWfqGShzs0OT54b/QhebpP2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdvvpAz6GgOxjxSCCY10hfaM/jjdDa25e/LMmx7c0yDyQn2kKjOE81xIJvsouIYkTKszzqSpWKgZQ67XIlohjUt+Eb5jVncc8foAMHjUC4YBEV1k4M5Fmb1Vwl7eLgIfl9P2bpm/tQaTWQvtkJs+YQDwvf6+bthW5ZK44zAFagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F9cjnI1f; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F9cjnI1f"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f44b594deeso26142115ad.2
        for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 16:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718406616; x=1719011416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLrLbkLvm0tzY1MpEgPbssfKu8Uj01vCeIVrV1R6cSw=;
        b=F9cjnI1fFN4RwXMvZnlGycIfyGqk55TqGloJrSHQQVJgKYzGXXiTq9jZ1FCa5iIVGY
         PVZSitLRVOBOSvxEz2LuvW9+xXQkKebBxIjHSnuiWSl7+i3aqpCo7y9znjAcoBTjkLvz
         E7DDEqshjgcN2/YLlL9FesHOwNcBpCycRzHTyQaXMR1qQTuj9ARNmVsYcVuE5EZqmV9A
         U3RfxC3SCKiBW3bkH0pS5FPMcEwRroHKhYFcBtfcINWIP5YNTCVglHxSXPyBEPzgQOrC
         cK8nf+OVqcImyrqeGLYsa0fpMFfoaANlncwN1DIBE6o1E7bRVtpe2nF85DBJ6979nsCp
         eUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718406616; x=1719011416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLrLbkLvm0tzY1MpEgPbssfKu8Uj01vCeIVrV1R6cSw=;
        b=MYk5/N20TxMhLURiKJuV1FAFI4PDs28xoWjspsPNvsvMCio5SAxW3K8ULSnIaKOrtS
         TXuZLZgbcY+hHrjDYCGY+5AZq3ddZZ+w96vyvR5x3ar5VyrpznYbfqi1d9RPmOwJzeiJ
         E31kLH8et69HV2rfXy+hUqJ8Mr3zzxVVwpGiMFQYhFDUmxNfP5+u4ZlgS6b3A75uEFTP
         bIBkmJef2DOgSl6dUQR4eGg8uAILALpKsv1sBXV/xrI3PsLcGU4uB/83ODap8DWUf1MS
         42RunvUhUHB7lTQU4efW+re2vqakoJBwZbBnss4JRMyXUSfdjXh7CGYhSGGoYDG3icSX
         xZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCX7JBvuoNTaesIWx/KuKxEquqhThxIJKw6310+H9eB6EeSBcvCorhhEra6YPK0Q5nfwP/a0bhL0gtTCRqP33shtNDg+OA==
X-Gm-Message-State: AOJu0Yw3pgzbDCkoGIcG2VuTqDGyy8/uqHgkI+QJ5stFHWeJtjBIPdSB
	+041iiu/6vIrtpwdvpUZ4wqVkc7HfyDHIWQPyxzWQ6YJsgSLcXm6n9fxOX0avg==
X-Google-Smtp-Source: AGHT+IFcGsUH/QLxSXoL5wsJjIp8jl2vBep3vY4YHvN9/DueuGnm24AE2rupPbUPlpI7DAnWqNrRNg==
X-Received: by 2002:a17:903:32c9:b0:1f4:7713:8f6 with SMTP id d9443c01a7336-1f8629fb039mr39146585ad.52.1718406615926;
        Fri, 14 Jun 2024 16:10:15 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f485ccsm37485285ad.279.2024.06.14.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 16:10:15 -0700 (PDT)
Date: Fri, 14 Jun 2024 23:10:12 +0000
From: Carlos Llamas <cmllamas@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kselftest@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] selftests/vDSO: fix clang build errors and warnings
Message-ID: <ZmzN1CBv5j9YV543@google.com>
References: <20240527211622.290635-1-jhubbard@nvidia.com>
 <ZmiXqOHYaLLX557z@google.com>
 <2461f002-fdd4-4bf5-b797-827069cafc4b@nvidia.com>
 <8a6f384f-02b7-4a0b-90dd-e6843909e8a9@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a6f384f-02b7-4a0b-90dd-e6843909e8a9@nvidia.com>

On Fri, Jun 14, 2024 at 03:56:01PM -0700, John Hubbard wrote:
> On 6/14/24 3:51 PM, John Hubbard wrote:
> > On 6/11/24 11:30 AM, Carlos Llamas wrote:
> > > On Mon, May 27, 2024 at 02:16:22PM -0700, John Hubbard wrote:
> ...
> > > Reviewed-by: Carlos Llamas <cmllamas@google.com>
> > 
> > Thanks for the review! I have no earthly idea what will happen next.
> > I'd like to hear at least something from the maintainers about their
> > intentions here.
> > 
> 
> In fact, I have two more patches for vDSO (these are separate issues,
> for the Makefile), and I just noticed that there are several accumulated
> Reviewed-by and Tested-by tags on this patch here. So I think the way
> forward is this:
> 
> I'll post a v3, with three patches for vDSO selftests, and the latest
> tags. And let's see how that fares.
> 

Yeap, a resend would have been good. This time it might be best to bring
Andy and Thomas in the loop too.

Cc: Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>

> thanks,
> -- 
> John Hubbard
> NVIDIA
> 
