Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7083207213
	for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076969; cv=none; b=HwY6cnCf3oYZamzD1gRivnLDb4Jg9wkZ0D1qMqM+Uu1kuM1Hi9vyCyLy4TXVn06rjPwQVjPgapSNTUv/nxVpXkx7wrZddfvRN7msuKR7+gWW8aALRn6P5+hXpNY0lXg14txMdjKWuON54iRa0+e2nHRdthWRDNRhnkwD8jbQL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076969; c=relaxed/simple;
	bh=8gP92A+Ze+n24rBoK52XoGxxw396/VWsU0nZSEiSWIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdFfi7krcMgHlVplM1gV7UMpvxKZhhOIywsngntMOzZuIxPVMOupQFnjcfKxnsq7eabof8G8YYQTILak6ulwbNzvWeJRoe+Ts9hdMuAZZzsWz3AZKpADMTmqxFn2a6YAaArvM/97l+i/Xi6N4kR1d7mf1Ah5iyWB1b7q+wfgssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=AkcDpWdh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="AkcDpWdh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0c40849cso492807766b.3
        for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1729076966; x=1729681766; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8gP92A+Ze+n24rBoK52XoGxxw396/VWsU0nZSEiSWIg=;
        b=AkcDpWdh2d2jG2tzNQUZAXutkeAwj0cTegZr/BLy3XUq2vWsMaHCIOGQh7zjUeD7vN
         kvqG993Nkd1ES/f6Z7UNi61uPqvIG9EmTpVrqrsfpWXvLC9UoWBDs/+WX/ZXrNgl+FvF
         0A5QpjVaaQVvRGMOJCC5gboZfao/zlQI4/oHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076966; x=1729681766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gP92A+Ze+n24rBoK52XoGxxw396/VWsU0nZSEiSWIg=;
        b=GlvtcJ2zkUCsqkt+st5M0ZIQLTaKBRlGd+M3gPyo1TgAo1RrGI5hp8sTfdmMMNjPUV
         tAN4LpC7I2yODrrdWNZ3kPf+VzxXhqxNsi7esMlaZcOWfW1pJC0EGZx+o9h3yVq8DDPd
         ZI/YGQoTp8e8HkmJPUOomQeBxzNydfnqN6Uhas3BOgD6BNUsns557uEJZmZiHq66XMIr
         oVB2+UW7N13VqfkY6ti/OD0q3iQRlmcjOz6mJWqfM2W+KALWIkt6vbRR6UveY6yOO8PM
         BE+IC5YQ22eUFFEeswFZwPwD2+h59c+RwS5YRAHywlkjNduTmSZBWxDsc9bMTVLHLB86
         hzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Dp3wEmfPvmj62dUY+omjjhAhrqrmgH6D55YL61rVzs2S11wgtbewf2rd361+tdOMHj0Q@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy57iAjBmzqOSxXK4vUGwOrujEbueqfPztzMRBzLgBFLhx6l6A
	QJSTC2waRKWySMq3HQ2X0sgLJU6rM2lo9tptVJg++ZRvG/cv3roMXDruZIFyLRyEBuK+/7dbklM
	AyL+6fpKwdKPh8Dd8JT+3eCdTuudTKcfLWm6RpA==
X-Google-Smtp-Source: AGHT+IEBWK43pEuSVPY5kfHUSC1ctgBijgdwpK1K66HvvMpx96cAtgZ0O0oJMCEPtTEDN0Fi58hIKlah5t26W53KDfY=
X-Received: by 2002:a17:907:74b:b0:a9a:222f:45bb with SMTP id
 a640c23a62f3a-a9a222f495bmr682124866b.35.1729076966086; Wed, 16 Oct 2024
 04:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410161847.oG293ywD-lkp@intel.com> <CAOQ4uxhD1QYnZHRekQPm-A+3SFXMzv3vZW6r59kSOFAtXNWHEA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhD1QYnZHRekQPm-A+3SFXMzv3vZW6r59kSOFAtXNWHEA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 16 Oct 2024 13:09:13 +0200
Message-ID: <CAJfpegvecwzi4FccCaVc-UFhRD88evWEFqe8S_DqMBwSePHXGg@mail.gmail.com>
Subject: Re: [linux-next:master 4258/4954] fs/overlayfs/file.c:234:57:
 warning: omitting the parameter name in a function definition is a C23 extension
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, overlayfs <linux-unionfs@vger.kernel.org>, 
	Christian Brauner <brauner@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Oct 2024 at 12:41, Amir Goldstein <amir73il@gmail.com> wrote:

> Preferably also the fuse_passthrough_end_write() function in the
> first patch, so there is no build warning mid series.

Fixed.

Thanks,
Miklos
