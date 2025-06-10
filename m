Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768FE264A9F
	for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749588726; cv=none; b=kXKRCGTw1O4xvMqEi+Tg3fil3o0gFZukxtilZrQ7547J0NQY22L/jxLpGIYVRpgxAOW1c1w3hup1MdTHCpbo3HtQYsWO1qH5u6ocSqCdAyZULAOhScBUmNKqAoAAtvL2p93ejdnEYIUnRvOFn/8ltD1jaaRbHoAdX+xM5UOO3CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749588726; c=relaxed/simple;
	bh=4/mjL6DCLB9sU8qSu6cX8+w0OujCflu4S+CA31auwjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSns2p9M+agX+O3Q4VmtkPhUnVawwRxo2Hp/D+Jmr4x0AYJXNy1Xt1zss+hS9CZDfRv4ztJoATJeLe8KEpl3FZclrORoQopA/JTmcAA93expYze1uWeebYbwtLQlXoKSBGsQoRmsCxN7UnIHYnJA9hPn3h6XfyloXaxhhhfGUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGoI2nlN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGoI2nlN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23539a1a421so51538155ad.0
        for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749588725; x=1750193525; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lvDDtsSJOqLbUB9jROuDsshsMgX7lIbOe6gG2Mnat0=;
        b=mGoI2nlNI+25++NOCSAPHm7XH5JKUJRFi4/+mWyxn+iBmRD6GuTC+vhgY8xgJr9jlw
         8KDR/mjDl+NKKmDZNavt4WguXYG6dfOIFTaAgj6SQuH1P1SNZ48dBPFDN11kHTwMozF8
         0UDqpu0F0JO9tqt4gOHswBkcCDlsfXm1ZbxPMgjviSpzSIsL2NQQ3awiFYmlLaPbUwSy
         bTFcvE9ZD5xOgNK3Ky+GSg7NXaN9FF0p59pNr5cyLeGvuRyE/JW/8GnZjVNO+6ocXDg1
         W89ztQySJLtLvn6tm2+/4I708TE3CWqfw/sVg19A7bBnPFOwxJBH7pbuPkRv7PHFyp5f
         UIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749588725; x=1750193525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lvDDtsSJOqLbUB9jROuDsshsMgX7lIbOe6gG2Mnat0=;
        b=iSXrON5OxWj9HrskSAmhepn8lgzHw2Au+sUVlGpwNzf5t98/5UM+OT5OIebJX8NdTf
         uXFg/h1K6VuLAkupt2LVSMeldRDwhDErnLgBMeLu/FlputSggpLnqLy+qDQ3dw+rPfQ0
         WhGp9PlM3SVV00W+R4wMXxk2TBxtPRPjWF7xA0LGpG+dHNBEJAZWyaIwZuSoK0UbA/nB
         q6WPQd75a40YCZtWgEITinOUlWVSTe8tpAtHBaRRFO6mtMUUf+gyZz0YaDqzsra4Qy1d
         OmTaNpbuCM/2fFdNyv6jJy26stjUzjaHSQU7/fdnKaADYJSbmlgHo+86tnXOIA8hU95C
         MSRg==
X-Forwarded-Encrypted: i=1; AJvYcCVFJNcQhcNMxGEKJsNZrSgN4iBt9qclwPWw16E2Jgzwgj+0DdTX9B+2luV8vHoJ9k7slz59@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx+Rn0sQPkITNUn+5KYObUibzqacjlg+N4oiQ3QP4hgdKDtxIk
	85deRF2qMsc9Ijj+eXJO2z2nu2WPWIkYsVhZg880LC+kvQ7b5rVS6h7E
X-Gm-Gg: ASbGncs0qMdK5ZJtKH3a9y/NnaBnR9hRQyd3B4NxA5J51+SvMBkg7I+f4Lkd9hRczEG
	tBgb3tHt+d5LMCriCYzcXBl9Nlh6MWgMfD9x0Ei8EnVmDbR9Lh2xe9Ye33xVenTAc/MgNaMVLI5
	HowI6FxuB5lOT8lnvi4N3annJrRQA5maeqQ/REk3nqtE12u68cTJ+4VkJoUsF71pCDorHnuuV3F
	j4Az7kFq7emRJwl0TYywTBu/s1qcjkPePedzYVxvPaV8v8PjNyvhaaw2LjPvxCzZmq6FY/hgYD8
	AZHrWci4VWP9NRGT01aj/hHqIMV8SVqNxcArYGdHTe9NYY01iT/c0ep52sVI2QhNKeQz5NvZlsU
	=
X-Google-Smtp-Source: AGHT+IFDTTJ12ct4ggXuJT+vt0JAsn5V3O2f4+SATlVrGxDureE2GORMih5a6gauFrVmV7FuCHUP2g==
X-Received: by 2002:a17:902:fc46:b0:235:f45f:ed41 with SMTP id d9443c01a7336-23641a9a269mr10914095ad.19.1749588724651;
        Tue, 10 Jun 2025 13:52:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603507a3csm74795905ad.228.2025.06.10.13.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:52:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Jun 2025 13:52:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Nathan Chancellor <nathan@kernel.org>,
	Eddie James <eajames@linux.vnet.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] hwmon: occ: rework attribute registration for stack usage
Message-ID: <7f1a87f9-1a70-4d63-a8a3-f914d4036f79@roeck-us.net>
References: <20250610092315.2640039-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092315.2640039-1-arnd@kernel.org>

On Tue, Jun 10, 2025 at 11:23:06AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang produces an output with excessive stack usage when building the
> occ_setup_sensor_attrs() function, apparently the result of having
> a lot of struct literals and building with the -fno-strict-overflow
> option that leads clang to skip some optimization in case the 'attr'
> pointer overruns:
> 
> drivers/hwmon/occ/common.c:775:12: error: stack frame size (1392) exceeds limit (1280) in 'occ_setup_sensor_attrs' [-Werror,-Wframe-larger-than]
> 
> Replace the custom macros for initializing the attributes with a
> simpler function call that does not run into this corner case.
> 
> Link: https://godbolt.org/z/Wf1Yx76a5
> Fixes: 54076cb3b5ff ("hwmon (occ): Add sensor attributes and register hwmon device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

Thanks,
Guenter
