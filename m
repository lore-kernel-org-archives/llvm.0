Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFD146D5A
	for <llvm@lists.linux.dev>; Sat, 14 Sep 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726308338; cv=none; b=XVnac/Jwh9u/48bcIH16TwO353WQh+4LSh9fQsD1ypFdHvkJiwn0KcBViPCoVMvjKXHjNDlUAL7Ty7FzrJwgSaqsFkfbmgXuDVxTvvmrgMM6P6x6Q183UB43FRXlx9Log3RdZD5ZhjHtWNp/d5blCLcJ/IEvAP4Z78eDuO1WA1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726308338; c=relaxed/simple;
	bh=uyUo2fF7wfyuRfSxg2fJMYfWzcWgmdiUEo5RMmlO/3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBIMkimWsV7Mj35bRm7UL9Ij5zAd7ljQiKjxk4MHuu3UDx8JeAZ0Mdb7MqD4UYOLxRyhb5wdIJVS/Z1NdUhkpETgcVlh7+Fyot4MZJJqNAGCfCYCyVKtYkKJKgdRhg7pGgPMTO59cej8hTTb5uHWnZXxORc/CVdAfYROH7Rko2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anANwye2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anANwye2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso468928666b.0
        for <llvm@lists.linux.dev>; Sat, 14 Sep 2024 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726308333; x=1726913133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQaP07kUjh9Hh3Vx1aYpBskYDsvr/ETiwaom9aVLxSk=;
        b=anANwye24gEOzmutkZyo3D6EYu+KIfEBae2AGHNGOTTDMfgZC62eWJ72hR5AJDQT19
         XY73pZ5/icbdSxPU4sEFBSm1fxrheh/RqBytU1IJy/MZZHssTRX5/IDV0t45o38uYaXz
         4RlzlpKzt5I9p1Ie+TsDRz8eqUchvB4YzKXl7EyUY5OyZamEmRsfs92mgyaYJlrEG3cF
         Aqz0XSywJ8D9FIKUVvAPQJg4p8M6z8k3ySXWNPOUxPXllCQZy8/G25OMqxe2UeJNjvTZ
         rO0l5Nj2q6jEBTT8E8ysZxE9QIEhOmNYVHlO/6e0ZM2vYDGBuZKdQPjrMx0wT1+EOpgX
         EBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726308333; x=1726913133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQaP07kUjh9Hh3Vx1aYpBskYDsvr/ETiwaom9aVLxSk=;
        b=jyeKl0pL0yr9kCAIFMEPYHJ2i4G4THPk2wwBKCDVepzXTQhHQZn/wz/8SCrN1RvptX
         GJNa41ijT9ZdL/GMLzBqdUQrXG4JM5/uPhDrNgM20dNS3BlLoPEjGmFDHJdVXOcxhVO5
         9ZrR3fIs7aJHbqbvrRnlPzS8iPXUhRgecBNeIx26Wt+V0+Jul1TH2NmoHROMWHcY+TS9
         2NnAtSO8G8D/MTXZOPwJEb+ImAghGpdjS6eetdaSqYw3ZJDB4Ctji3D+pgy3Qrb4iwSH
         zpe2eSvj5AHmN38gZtlx6DmEiUAsDn7XIHMkUFiISdI7HLQjfF5I0amp+O2ljrzramOh
         A78w==
X-Forwarded-Encrypted: i=1; AJvYcCXzsS/k5a5rae7pnfZ497+osjpGD7T8oCVdIscCSqozdj4Mkjxji7yEUx05Sg1jPbDv1q33@lists.linux.dev
X-Gm-Message-State: AOJu0YynWoYXaFixXohStvKn7CU8qFB2QrY/yvjFFjCpHQ1Qq7xfQMLo
	sX2RaX/LXjzcWIoJ+79I3aCGL/EAppB0q6R8W/4V5FOsJVe+YpZiW5AG8s0wlUs=
X-Google-Smtp-Source: AGHT+IFUGe/YZnTvrPrKTN9LdMp4s56tVPxGhPOwQHgiH6EffJdxr/Zlk+uPLUhxjZOYMNerF5RjBA==
X-Received: by 2002:a17:906:478a:b0:a8a:8c04:ce9f with SMTP id a640c23a62f3a-a90296eabbemr942716766b.52.1726308333391;
        Sat, 14 Sep 2024 03:05:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm61912566b.33.2024.09.14.03.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 03:05:32 -0700 (PDT)
Date: Sat, 14 Sep 2024 13:05:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Su Hui <suhui@nfschina.com>, jmaloy@redhat.com, ying.xue@windriver.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	tuong.t.lien@dektech.com.au, netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: tipc: avoid possible garbage value
Message-ID: <f1279370-a127-4946-8c46-cc89fd2a90a6@stanley.mountain>
References: <20240912110119.2025503-1-suhui@nfschina.com>
 <20240914094244.GG12935@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914094244.GG12935@kernel.org>

On Sat, Sep 14, 2024 at 10:42:44AM +0100, Simon Horman wrote:
> On Thu, Sep 12, 2024 at 07:01:20PM +0800, Su Hui wrote:
> > Clang static checker (scan-build) warning:
> > net/tipc/bcast.c:305:4:
> > The expression is an uninitialized value. The computed value will also
> > be garbage [core.uninitialized.Assign]
> >   305 |                         (*cong_link_cnt)++;
> >       |                         ^~~~~~~~~~~~~~~~~~
> > 
> > tipc_rcast_xmit() will increase cong_link_cnt's value, but cong_link_cnt
> > is uninitialized. Although it won't really cause a problem, it's better
> > to fix it.
> > 
> > Fixes: dca4a17d24ee ("tipc: fix potential hanging after b/rcast changing")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> 
> Hi Su Hui,
> 
> This looks like a bug fix. If so it should be targeted at net rather than
> net-next. If not, the Fixes tag should be dropped, and the commit can be
> referenced in the patch description with some other text around:
> 


It's one of those borderline things.  As the commit message says it doesn't
really cause a problem because cong_link_cnt is never used.  I guess if you had
UBSan turned on it would generate a runtime warning.  Still it also doesn't seem
intentional so I would probably count it as a bugfix and target net like you
suggest.

regards,
dan carpenter


