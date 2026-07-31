Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1F93BCD14
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510812; cv=pass; b=SiT6L+kFoCSqde4eR4mHjF44ANx/PFOOgl1SWFeP+0S4Ak6ftE5/2H3MwQmk2aMjoTNdQhmZ/RpIa3iuKPdGi0jnF6z1LYuujqRA1iwK0/kFa89GpxFM4x/vsXm2JYKI+98ncoyoymm7+ae/ICTfiDMZTC57FmvLQcg3oIvcbXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510812; c=relaxed/simple;
	bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIrWtpEGavIIzjXQATyNjDUTcF8sXorLV/wusikWbDK8jvzb6wXkojaNwyGVozu4Kfe8fh+IQSJzjqxDjaSpc3zd/jgYYxvbASamNcdWOvYwYUpO5PzcxvXK5/GFcmiQ3OMhazUsQc3tieUMTpmQyITjoosbLlOfhKMOw0D4Rsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOigwtl/; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOigwtl/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cecdc24b1cso1090525ad.1
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 08:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785510811; cv=none;
        d=google.com; s=arc-20260327;
        b=Ns9/eZLJyr8hZJsQv+7XNDG6Z+UA5s3Pwm1MO1ofp2GorHDD88tt+Rok4G9x/UDS+C
         4KrNtnysFfErKw2w2JD+b5wtqmsf6fAfujrFfAkH9JDsu5hQLGXJWiX8Xuxq1Y6C0JXu
         oNIBQHpXi2BU3kJ6oeTI1rSYfOVsdAQoHyzp2CNcWsC0L7FIyf92mB9bZm497TqruT8i
         GTcJWXnDhrBYkkcc6jKBJWkoBptYN1uOiYPbAfdYe/dC5Wn9iUWNnF1VvS00um2IoU+A
         FbrDbmVm4/MYEbeTvsw8I6UZ47+2HCKwRQhMncHj+T2ez26cczK9KlKUQxnr8nxuNEod
         pc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
        fh=a94DuNl/P9tR0t05m3yYVXu4c7oGechnPXKKBgVhga4=;
        b=Ew8SsotaPsuCD3EHEd0yR9Ce9ylKWjJCRetE3C11IJ9zW4OiTqTyN4Hasuy1asdmic
         lhfcs9qKfsf2/vwjetxV8+6gKT1xdbzPMc50jj4QhPgKxhSYU31n1Lj40OVWi1ntkwqv
         zS2p3SEaVtwd06qu7J0RkEwYlD2uRRUgb8eOTjiV6O1ItGc4NJ/vPUz1sittkJR7WPBL
         PC9x832mGLWUC7AIO7ouOyiBcBar9o8RQkKIg5DoKdIb0MXIgvaWmdPYrA8WoFNgUze0
         SVCSw/ysqdBI7yJnoRHriRr7rDKJf+kSYOz2DFCOX9rbNjFXjToCJWZGGAXhiRBtbrgF
         /zDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785510811; x=1786115611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
        b=HOigwtl/dbKiAm1KLeRpqGk5h/UFQwhPH3nVygmsvDdQ0+ZgHnq/KtBeLmkIvBNQwX
         +EYlP+fml2Z8axTkf/bVWX5P9m9mlsfRvMFymn0Jbx9R6Id2AeISM6+hJaIBQ9BscJNS
         P/iiiWi/UFCNJjJWSMd3+SL89Um+paejleooScNqhKlUHfBFYnDFvLBBO6cAeBUrMYEx
         DT70i02T3fh7ffdy9zGZA70RCKNkcmcm0dnzlBlpD0dwDZ6MEK1o1DKG7d8HPHsw5SLp
         UssiNiGvrWTw5kvFwJLFu6YVEsfAjS4K+guLjeNko0rjGXoUUDVgerGxm8xpIP6qEM70
         AqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510811; x=1786115611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
        b=LWvQl/EIVP2thZ2EJN+SVK7N03KE/wVBjwcjFXFi9tmwYFZodFWaGSNyCm2YsKH5yy
         z8K/qQ7x1yzwPGMQybYaDJcrIuX0BKNSR7ejggYWfQ22l9R9S7/Sb3D1kj6tS/wawBgz
         xboJ0VTVKX3LeKlbrhU4S6Xvgbj5wKaSpwJa6hdFl+WOYztY27XLJiGVhCzIjIPpLcmo
         DE6pXxbuVhbV47c6sark2RhswuLwYOemNfAN2SkDL3J2UGz0T9a3fCN2xiNbFC8fMQKB
         DYah8MWaxW5Gx/PukvVL1Mx8NMuzrxUdy9pnlcWohMLuMCtPzAsaNAjFy0l/fNfNIJAO
         mvvw==
X-Forwarded-Encrypted: i=1; AHgh+RqovWnlYJyIyGlcrkMYW8kYvLXjOmuABTp1i2zl0RnNYbV2o7VPz55t+wIw2GoplfCNaDwA@lists.linux.dev
X-Gm-Message-State: AOJu0YzRX2AHjGa2SXbs4UKTTJzjvR9QNBKaAnS8brQyzlb0rq1mFzbZ
	/DxenV4+mPStXFXc5lQM3cJwSka4li89UkQTzjdmEB8ThpG8zq906FMOaQR9jREvzFmdXnjC6Fa
	CcIhzk4pJwqhBYKPUODt3YJsfuMdcIa4=
X-Gm-Gg: AR+sD11UAnTIBlP8K7nhNPovrBoG4nvH1I9Rbq7FUW/lTIuhx+7RiYa93f476wCIp6H
	9t2a4t+tZ6MLgomOyYv0hkNUuNBXSt0eviHtXja3caId6ra5mNEGqNXDv8XsKsE3p/YFbzkx7Ub
	tMMoxTLU98NkI/gpYWUxU3tayBzH2/MjOLhRwfjO5sg6FF7wotdJxUMH9A1g+OVKWxhlzwrbpgr
	O/90Rhkt1uM+kxQIwGMCufHLNinLvQMRS2xaMVNrh4TUyT32hbdw3IhwWSIsjW97ITrkUHdsxMC
	gh+OR4uNjtkTqLejMeHl3JVrHfG/7aHM9lOZPzmA/iiyRcQ985DCdRa6qyw8bl44h2th9PzuiAA
	9at3hmryLWCdlLfIW8hatB630PVBG/lQPyR6CoXCv+bd1OuFGaSP0dMeTCVrS1FL5RdT6iEw=
X-Received: by 2002:a17:902:f78b:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d05206277emr6050695ad.0.1785510810738; Fri, 31 Jul 2026
 08:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607311850.6p0ZUVq4-lkp@intel.com> <amy2RIReGPFzDSVW@lore-desk>
In-Reply-To: <amy2RIReGPFzDSVW@lore-desk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 17:13:18 +0200
X-Gm-Features: AUfX_mzV5YdpsTyhkA4IWD2DZsnjJYS5s09tasm0ljwol0yZLuOuBYodZ2UDeME
Message-ID: <CANiq72nFoPshLi_8OAYxpda-rJnRCh=UpB2CovMZXj+vo3BDeA@mail.gmail.com>
Subject: Re: [linux-next:master 10570/10862] drivers/net/ethernet/airoha/airoha_eth.c:3470:18:
 warning: division by zero is undefined
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Paolo Abeni <pabeni@redhat.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 5:03=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> Is it a false-positive? I can't see how sizeof((arr)[0]) can be 0 here.

`CONFIG_SMP` is not set, so the spinlock is empty, no?

Cheers,
Miguel
