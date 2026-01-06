Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE143090C6
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767685830; cv=none; b=nuNG7IVRUvcRCRv6M2THLsBbkJzVmCDNW8HWgdcix7PFuSNW1VFaQsQQkIHbBeoiwYoj7fctXw2aEV2nIW3SmiLdXiyMQGbbznPHIe6mfWXVvQI2erdFO6yCC5JXmfzS0LliNAeEt5VHvkzjgBunQk3YnctZuoJ4VYXgN121HWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767685830; c=relaxed/simple;
	bh=jsF3NDuO62h6NCbXJop/CZsOfV7IwiG//knqQ7cqXW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MEJkWtM9FBhnelvqsW+ccsfWrdy75GxsVG4G8wxGY5tF/FKjS0nMXaqNkJUbqIa5j+fv1RAuD4fTxcpwZlmmODw9LfVUUEYEPLZWNbA6s4UuC2GXa9c9v6sWUoFar4E/ZKmNDgJxjDoQVdcTUZWw5S2txX55la59OhBlBLJeZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5JEf0Sg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5JEf0Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767685826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
	b=G5JEf0SgRbu8rI2bCfoy2aq3SERxGClJa0PeeGZN6yCFQhZAubc+Wt/vg9GTEzNeAtDOm0
	H9oXXbOlrkQKLIPeJDE3r/hQnZ3ELZiTMAMYcwzZKAcjhKupbdyW9dWVJtdlXB/VRvaZGu
	p1OQOFtJ56MMjsyFJdsRVCgIUkudpt0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-mikcTOW7OQWHiVUEFvo4JQ-1; Tue, 06 Jan 2026 02:50:23 -0500
X-MC-Unique: mikcTOW7OQWHiVUEFvo4JQ-1
X-Mimecast-MFC-AGG-ID: mikcTOW7OQWHiVUEFvo4JQ_1767685822
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c7957d978aso935666b3a.1
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 23:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685822; x=1768290622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
        b=Yk9jxjIPnXFfQR9+frNWI0kqXQHVs76/qjBf1Q8zISzMtfmdNg+teX7mnB44rlcuq6
         g8xiDEyNdr6WyeclDQ4G/RoEAxOOt/cbNH2ik0dehVyuweUfsj1n+lgQvgzJKxWOqb2/
         sKFL6RI8K8yjAi8U2rltBgES4zg2YfDTRet9P6Aho1YfY9JtxlAm9CQKmOdLz5nnm2rV
         z7aB5cARG6B1yiqbwMo1SEbkTruxNG2Lepx3bqzTy2PMARXpzLesB1ghGMDu7Ao/yNiZ
         9TP1z7RGsxpg8nLWrpeNxKAHHqz7kxtts+EUmF9Ad33x+lUNcilY94k+Ifp3fLMwrSPd
         qnLA==
X-Forwarded-Encrypted: i=1; AJvYcCVxbs5y7pOS78p657K1QOVK/YFfW/2e5/B4EzZQrnqHDx69F9UQVg+YXiBU+mQS2uhetLwq@lists.linux.dev
X-Gm-Message-State: AOJu0YzHTqBUD8QfXH4JJ+yF/UOf0Onqjjnv7XMMz5LsGrDY93aHi5fn
	ekzLYQ02m+upT03uswiQ0PMNX64eLJsnQ9tszIPrCWEp5MeqUx69B0cqNHecRi3bSk0leivsqIx
	nBZLD2bYLeZ8fqpQV3hBpEfGTjiN4h04fquN4M36R0bOL/LTdD2Oa9Cc=
X-Gm-Gg: AY/fxX5zQmSKP4yAAwY5M9/gi/tuPY0Z9XIPLIMsuypDnht+7o0XaMFbauimC/R0/Od
	LGlMY/8ftXU8uBUDNvvvQlI67c7vXYFNneJMCvYGiISM+ThNrwYdW9Dgiy8jG3D+TRRpRdxPibX
	ypjUcnhJv17CBJ3BxqB7Nc5oLtMW9HA7zyYufCEhZ7aB8LaVxDVgZuI69KxG9BCsWoFVh0yegj/
	3th9mzzroXu4HE4R8i94515UYWM60GdlqshuIkpeerUDkHtGOShkyzrb8pHwwsHERhDoaEtpHro
	AxJXaeymnlud2Qkqr4R/Bv1QvvSPAPYmW1yp0xW5uV62XKkB5zLLfAAe+cWt25rItUtaDj2TZ80
	p
X-Received: by 2002:a05:6a00:1d25:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81882ddd7c3mr1845196b3a.63.1767685821886;
        Mon, 05 Jan 2026 23:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDKsDXMRpPACVaN2GdRV6l0Fy6KDBpzSzhtqSYzxT7W76UAFruKAKNIbDHoNo+0oE4mtloEg==
X-Received: by 2002:a05:6a00:1d25:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81882ddd7c3mr1845179b3a.63.1767685821335;
        Mon, 05 Jan 2026 23:50:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0ddf97sm1263404b3a.19.2026.01.05.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:50:20 -0800 (PST)
Date: Tue, 6 Jan 2026 15:46:57 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Thomas Staudt <tstaudt@de.ibm.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aVy9qfeSDZyKybIC@Rk>
References: <20251226140636.1378505-1-coxu@redhat.com>
 <202512272218.ghBaSjzO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202512272218.ghBaSjzO-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZfLd-4IApJsSibA0xV1RIIHeQSgQoczdIbCbzEH4XC4_1767685822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Dec 27, 2025 at 10:35:11PM +0800, kernel test robot wrote:
>Hi Coiby,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/powerpc-kdump-pass-dm-crypt-keys-to-kdump-kernel/20251226-220726
>base:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
>patch link:    https://lore.kernel.org/r/20251226140636.1378505-1-coxu%40redhat.com
>patch subject: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
>config: powerpc64-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/config)
>compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>>> arch/powerpc/kexec/elf_64.c:95:9: error: call to undeclared function 'crash_load_dm_crypt_keys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      95 |                 ret = crash_load_dm_crypt_keys(image);
>         |                       ^
>   1 error generated.

This issue has been addressed in v2
https://lore.kernel.org/all/20260106074039.564707-1-coxu@redhat.com/

Thanks!

-- 
Best regards,
Coiby

