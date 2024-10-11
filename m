Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F031CCEED;
	Fri, 11 Oct 2024 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728668157; cv=none; b=RrTMPPRMpNBvjbzYioWmhjU6nW1P59C34vYUc9SnMkvVZ+r3D9PBnb3lnkXN6s9FYAzXvX3Dqb3uz0+dI/gYVUt207PFTSmgnnkOE2WTTnsq+gb7rhXctzvQTDJugsQIt/zmAbT3Dsra0F53QlCMt09JkH4CAWAzNNHx+qgXVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728668157; c=relaxed/simple;
	bh=IYbGB9zTZe3U4tbPtF6I2VuL+FdnP/iE5YbWhTENcA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZXTe3VPzEtUpCxCp6hVXcB59lhImp9qJmFlRi4sAhkXvjEaxOALRfEHGpUAVkLfX3iMyW5TdvdMk4UbogQomsdaSFNHqi8VF7jKZImwew7HXzTfEAUMNLOOy8bQnd7Coz9S49QUtymGzujoQtkdT5fxYi0UiPDcSejSFIyu4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aH465mWk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aH465mWk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d495d217bso1840830f8f.0;
        Fri, 11 Oct 2024 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728668154; x=1729272954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWWmMF+4cpC5c54790uxJHV+gvXu/38t3jODh8WCL1I=;
        b=aH465mWkavrxOKTT1TD03gdvPCYMqcHiG22Qx9mgrJfNuwj4UvOg8w1XxTMEdDV4N0
         oCragQvM23nfkNd5cNZWQZrB4djZJ4caoD8yk+m/4WNzvMqbbs7p0mr9kaqtpm8f2Cxu
         h5c5eWTmnYhP/OgQyuDDNBCIi2MDNP3oIfWAXClbCmMxUnBFawkL3cGd7m14ZYHZVF54
         U0s1j9pAn9qQtdtcJb1e6ly/u6Sac2NCbgD7dZksx3CaUVNfEG5qVwbRDV+cTDffLbp5
         YaGnpXpsZdai+4Y2XoYlI3RlOTioBiOIfLnxhmDhDwKAR4GP4bTLJdw2KlZTIR59CHbz
         gIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728668154; x=1729272954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWWmMF+4cpC5c54790uxJHV+gvXu/38t3jODh8WCL1I=;
        b=gVZJf/16yRdt776vAEhy8sl4Br6bhJb+D5Tq/E+rllVTp3atmO25b19hdEhT7ReABg
         RvSm2j+PEtZASlexRJ956n7kHCSubHpo9cg4C+Y5xEfDqWaTQ3XW/IYLY2Z3eBurq+cL
         37fp/lybZZbWE9DFJ4rw+YtuwLOHSwih5k5WVTpXUgcNPE2mDlYH4hIlw61i5tyTHel8
         Cn7ypqeLuxvn4o+BH240xWZz8oynbZ4bEyZCKUS61h73m8FPjZW4MdH7i69MNi8iRtlr
         Wc33FLbbLnZU++SN7VLbCQPPbY+tLmPW8Qs+2vy3CYzT1YlGS7zWK3rurEU3cAl8Lvcg
         A5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUecJwMH08Z03OtHc08a3IZT0CB3TyJBqDqCyDlrVesNQYdxjFScBHmAiJeaqa7HTJiAy3CbiIudKM06ZwWTg==@lists.linux.dev, AJvYcCVCZLhFOE/EtRExRdArlV9D6QRYmx1zDmuXOn+aZHe/PhY2UaIfZduvp0Xtx6L4x8wsOhCl@lists.linux.dev
X-Gm-Message-State: AOJu0YzTLIli+lMjOmBWJRn17XmrYlMU81zkLLccq8uaa+K8qd4UWTQy
	2HL/2j5fdnbp46IEx+MRhdofEMporxmR0swaPKfe5PeOPHJvJyc0JfQIDAMn+oI=
X-Google-Smtp-Source: AGHT+IHlbWMalnq6TxqUn2FGn+wxIKQNsE0A9Dg3qiymPAAswYQzCLia0kJLFZN+dVleeD4Jm07Ezw==
X-Received: by 2002:adf:eac4:0:b0:37d:5130:b380 with SMTP id ffacd0b85a97d-37d5ff8a2a4mr379362f8f.23.1728668153637;
        Fri, 11 Oct 2024 10:35:53 -0700 (PDT)
Received: from vamoirid-laptop ([2a04:ee41:82:7577:73c8:39ee:29b7:ae8c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f25dc6sm234259266b.72.2024.10.11.10.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:35:53 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:35:50 +0200
From: Vasileios Aoiridis <vassilisamir@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, jic23@kernel.org, lars@metafoo.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ang.iglesiasg@gmail.com, linus.walleij@linaro.org,
	biju.das.jz@bp.renesas.com, javier.carrasco.cruz@gmail.com,
	semen.protsenko@linaro.org, 579lpy@gmail.com, ak@it-klinger.de,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v8 1/4] iio: pressure: bmp280: Use sleep and forced mode
 for oneshot captures
Message-ID: <Zwlh9rxuEcxSu37C@vamoirid-laptop>
References: <20241007194945.66192-2-vassilisamir@gmail.com>
 <202410111221.YIeXHxOv-lkp@intel.com>
 <ZwkDoSeXA1T4VD0L@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwkDoSeXA1T4VD0L@smile.fi.intel.com>

On Fri, Oct 11, 2024 at 01:53:21PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 11, 2024 at 12:32:12PM +0800, kernel test robot wrote:
> > Hi Vasileios,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on 96be67caa0f0420d4128cb67f07bbd7a6f49e03a]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Vasileios-Amoiridis/iio-pressure-bmp280-Use-sleep-and-forced-mode-for-oneshot-captures/20241008-035238
> > base:   96be67caa0f0420d4128cb67f07bbd7a6f49e03a
> > patch link:    https://lore.kernel.org/r/20241007194945.66192-2-vassilisamir%40gmail.com
> > patch subject: [PATCH v8 1/4] iio: pressure: bmp280: Use sleep and forced mode for oneshot captures
> > config: i386-randconfig-006-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111221.YIeXHxOv-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111221.YIeXHxOv-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410111221.YIeXHxOv-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/iio/pressure/bmp280-core.c:1051:3: warning: variable 'meas_time_us' is uninitialized when used here [-Wuninitialized]
> >     1051 |                 meas_time_us += BMP280_PRESS_HUMID_MEAS_OFFSET +
> >          |                 ^~~~~~~~~~~~
> >    drivers/iio/pressure/bmp280-core.c:1046:32: note: initialize the variable 'meas_time_us' to silence this warning
> >     1046 |         unsigned int reg, meas_time_us;
> >          |                                       ^
> >          |                                        = 0
> >    drivers/iio/pressure/bmp280-core.c:2452:2: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
> >     2452 |         offset += sizeof(s32);
> >          |         ^~~~~~
> >    drivers/iio/pressure/bmp280-core.c:2437:17: note: initialize the variable 'offset' to silence this warning
> >     2437 |         int ret, offset;
> >          |                        ^
> >          |                         = 0
> 
> Rarely, but looks like this suggestion is okay, rather I would do it as 'else'
> branch and convert '+=' in the 'if' part to be '='.

Hi Andy,

I though exactly the same, thanks for confirming my thoughts and thanks
for taking the time to suggest it!

Cheers,
Vasilis

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
