Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540BC43935C
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527660; cv=none; b=L3JeXTzrCiVpjvcwabGfBa60WFkf//e1KhkPi66JFecEsP0pzLqGCmsVgRaKEf7sBxfqHdLWdg0efHleXe3iVDXal+8maAJjDpGauQbePkofvtSZhqJxxg1On7uRbd21zZD83StvwdGMiKv1fxqrUdTZer8Db/WRfZPFaref+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527660; c=relaxed/simple;
	bh=PPjhDWa+0AEAs/Q0tIcWkxY7V7zsF1IrAWp1MaUwiDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzVM2ADba3/f6oxCzyosV8tAJ0aw2fcHRblOMgN3Z5o6gg07TnoVHXTN39BtSVVmHaDrrmaVQib1f7tY4l8YFqmtJNrI7mRN3UtnlBihtLCLMjlilojQ73NzV5Vh4ZDnRIK0Z8npPo13R1PNGgX8FT+mbK2EmSHxZeWOUeP5N1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bIGlaoTP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bIGlaoTP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e5c92c389so46157285a.3
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783527657; x=1784132457; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aNrEM48/kUAtSeWbSxXUhqAsANl+gd1l+W0ysjw18Qo=;
        b=bIGlaoTPm/lhbL9+Vm4Q54At3pAVwKVK5KjaLfyPr4C0rgHZFLdWGEd3al2xthr+zk
         MRe4mzAiVMI9aTEZ+eEzQrdJlWjy35uEwwqedQbYDz+crMnD3Dd1MaSJJk2hJ4FqUCDn
         zrQ0+RqlLxx6CbYsgMfHtYBEK4QSYzKEAr5kV7hgv6uDe/CR1JmElKNhSHaZq9z8yooz
         wBxmTllvxd9ahn0KX23cujouhIJGflyHwuSDpJkRLjT4bZ1IbDRynUtNsZx4c5PUjdg1
         G8ledpIPBBT2KHu8bKKV0hnmSnHh2HfFISVwRUCkozvC2O8n9x0atIE8S9xZbQPpxg66
         dtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527657; x=1784132457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNrEM48/kUAtSeWbSxXUhqAsANl+gd1l+W0ysjw18Qo=;
        b=YpYMA4FsKUC0tBNwmMwk+aXU+boy8XIugsL1js7f6QnvljtOtwZ+6yP1HSVXeDUFi6
         iLWBc8vGVbHqdEz8NbXrTKDQHkYSZPC3lviboOGkwV6JmBBuI5kVyUXIucYkebq13z25
         SIX3EW5IVFFVWUk7eYQT+C5TUK/w7+qCYSYisajqRiIDzwjZSS6qD6s6Vo/AfR/tfpM8
         3yP4esRKtlNVowlkYs4trOzt9jm0mXqk0uXNQ5VCAJtTxg3SYLHvvszSamCGFRD95NTR
         KTVPc7q5lWxvYfKCEpBDnOpkmU5zzJ0lMCDJqx1uuBa64ZvYMQYNExTiDFTrDeUospgH
         SLkg==
X-Forwarded-Encrypted: i=1; AHgh+RoBd60XCyWE1sYiYqZsCt7N3XB978xvVuSEbO9XSMtfQvVFI+Wedf8HFXNFWbdGzVLIyLxH@lists.linux.dev
X-Gm-Message-State: AOJu0YwkiUaJ0BUb9bY0z/W7FC6Q6utAok18TdqFuSNfMIAjcGa0RB/S
	YUCgEQneFqBwDTJ209Dko8ocushZu0ZYYPGdpRtmOZ9xCrvkY4vWE5spNpVhjsMr/Ko=
X-Gm-Gg: AfdE7clw+fq2NTuuELpa3GRz7se3OCv+eCk3NCUizr7V2NgLbFvtrIn7fmfnbAmsKK4
	O/MtN3rT+INoq0HUiZtTxKuiGv2FJPx1WlRGgXIQa+aY2nM13GiPedZJH/NT24d7eFsZdohyFIM
	WFTSCjzUGt2J1HaeFC/u1Dphckb9LTEoEwIKA9Wn2M1YAZHRSIU0PCoZA42OSbf5TXlqgQxd6ED
	JSXpnJiqNcE4Luwu0q2x5wkHC5JuNZKAhSl+QOfMLEXKBanzC17wJAcG6/SPqI3KXhX0Xx1HbUi
	ZcjCaqiZO5idcHsDHYlmjV+rBukJ8aPnnNyIr3gP6qo1dQnj+SuiRGyymLmO3lQ/h/4bwOPBTWj
	bwSOAwDW96Ig4qYgV+eVLA4lyvN+abWhPPxbcroIE06QEH8/h8O6iwREoLzDc6gAbL5BYaXWtXF
	BSDXttUxjjP6K8yg/CWxttD4S33hQitP28ejbj0eKMNW9EjwDYgn/oISIgIJKl96+u3xAX
X-Received: by 2002:a05:620a:4041:b0:92b:67e6:8ab4 with SMTP id af79cd13be357-92ecf671299mr280183485a.62.1783527657124;
        Wed, 08 Jul 2026 09:20:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ba1a3dsm1471710285a.15.2026.07.08.09.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:20:56 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:20:52 -0400
From: Gregory Price <gourry@gourry.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:core/entry 2/3] arch/s390/include/asm/entry-common.h:49:18:
 error: call to undeclared function 'task_stack_page'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <ak545Coj9ogxnt4_@gourry-fedora-PF4VCD3F>
References: <202607081402.DO1ePla3-lkp@intel.com>
 <877bn5sxl3.ffs@fw13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bn5sxl3.ffs@fw13>

On Wed, Jul 08, 2026 at 10:19:04AM +0200, Thomas Gleixner wrote:
> On Wed, Jul 08 2026 at 14:56, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
> > head:   34ef6308418f138395a664bf9f5d80ace9825ac6
> > commit: 7fc04d7044aaa5ffe2afe78979fe6ddd5da24f10 [2/3] syscall_user_dispatch: Make it configurable in Kconfig
> > config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607081402.DO1ePla3-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081402.DO1ePla3-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607081402.DO1ePla3-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from arch/s390/kernel/traps.c:24:
> >    In file included from include/linux/entry-common.h:5:
> >>> arch/s390/include/asm/entry-common.h:49:18: error: call to undeclared function 'task_stack_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >       49 |         pai_kernel_exit(current_pt_regs());
> 
> Bah. I missed to spot the header ordering change putting the
> asm/... includes in front. I really hate our include mess.
> 
> Let me fix that up.
>

Ah, I wasn't 100% sure on this - noted for the future.

Sorry about the headache and thank you for the fixup.

~Gregory
