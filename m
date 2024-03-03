Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C587F;
	Sun,  3 Mar 2024 02:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709433224; cv=none; b=aNUZMH0KQ1gDjH48+RbBTQ3hGHb/ZL2sdqlE8VzaEKSv2KvwbTgh6h1bRsiD3sfa8HJHD8NEIJe/PsAHFjEb9wGKGnNZPxu1TusUHzWjOiYCV2TK8eFaGa8KZA31LdRo7mzl3amvPv9HBbpSh249EJRQdHAGhiFs0L4xYFlxd+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709433224; c=relaxed/simple;
	bh=yEZHnDxt3aK00X+oGwgMpASVQgIxFgzXMuJx9M47Uqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke1mNs447Pd2oXrEqgYLtrNRBsw1Y4ud9f/DutVhTn1QxT1/WpmHpj5GmyJtUZWUdgIL0yL5El8XEf/ahsDFvfaKtUbEzMcPo+r69C2l2eMrPEwB3Z+wMXBYufnb1EII4QFnamNs8tfAbnZ5Optf65040sNnCSw/+6xq+2yl2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21ea1aae402so1816103fac.1;
        Sat, 02 Mar 2024 18:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709433222; x=1710038022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeOBfZ5Q+fBsbXONI2t1u4E3fjlJdUV+x3b7E4W6R4g=;
        b=CvJfXmKaFtt0MwWJK053VyUsnWE92H7cU8DwxebdoZOosSbsL6jybtodpQZiLJ1nhx
         hxCFMw2dfXP6/nzz2yPWd7hzk/6u82CTQOAsT4L1cinw0Uzugtjl2SslrP6OZZDYyx32
         wPaI4lCwTai8cGQ6E2YO4dfL2Mcf42Efy0/J16kqT4oTL2uRQydCEihiMNDUnhdKMkH8
         N/uF7JqllgeFv+RIm/PjAaA+18fwZgEavyb84BxKW4ybAHbf7BxaQNB0Xl7NIXk+D5JM
         bbfGCW7//aP0r7Qqw7La97t3InQl8QmQBaWPJ7TRYf4jQXVorNdiaqSXJ2n9zvwoJUu4
         Pi+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQiiciQGW4UhFYQ+Gyq9Z++wM1VsZw3FMrBEMyKksrSpeQZ5vyZAftduVWpidot1h0Nz+u1DoPucyhb6PzC/mTs+fP4uCefvgUFN2f8fp8hTNi0zEp1tZN8tHZhXQa+Z+qoQ0=
X-Gm-Message-State: AOJu0YyMNxqIbFOeOGcHX9n6ik4iC5w5hkuSa7qlZcMx3UnQMHTHdXMV
	IRDqWmQuAFiczEOyUX7ZqW93xFI9MAJB+DT28HdTC7ZBEaKaKfkw
X-Google-Smtp-Source: AGHT+IEBsMGZZYIPXWi9LTZI21qkAKZyfLTzoSrzsxErBRL/BENHQACKtHAh8O2c5xiaGfp3iqdb3A==
X-Received: by 2002:a05:6870:179a:b0:219:668:3924 with SMTP id r26-20020a056870179a00b0021906683924mr6860718oae.26.1709433222408;
        Sat, 02 Mar 2024 18:33:42 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id ln22-20020a056a003cd600b006e6150afc9csm172088pfb.80.2024.03.02.18.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 18:33:41 -0800 (PST)
Date: Sun, 3 Mar 2024 02:33:37 +0000
From: Wei Liu <wei.liu@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Saurabh Sengar <ssengar@linux.microsoft.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [hyperv:hyperv-fixes 11/12] ld.lld: error: undefined symbol:
 idle_thread_get
Message-ID: <ZePhgQ5g4s_wyoas@liuwe-devbox-debian-v2>
References: <202403021151.guImV1Gx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403021151.guImV1Gx-lkp@intel.com>

On Sat, Mar 02, 2024 at 11:58:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
> head:   ea05b55de1e0af196caaa9ef70ebd0b29a0f7b45
> commit: 9904eadec6dab60ab590fa800fccfc9715020e46 [11/12] x86/hyperv: Use per cpu initial stack for vtl context
> config: x86_64-buildonly-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021151.guImV1Gx-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021151.guImV1Gx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403021151.guImV1Gx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: idle_thread_get
>    >>> referenced by hv_vtl.c
>    >>>               arch/x86/hyperv/hv_vtl.o:(hv_vtl_wakeup_secondary_cpu) in archive vmlinux.a

Saurabh, I'm dropping the offending patch for now.  Please fix it up and
resend.

Thanks,
Wei.

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
