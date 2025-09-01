Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C330EF65
	for <llvm@lists.linux.dev>; Mon,  1 Sep 2025 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721375; cv=none; b=pBk0oqHX/I38hM86H2xEXhv+oXC/2QyX99KnEIb7zLZ1jWNmmkt0KHXVPHNTTan3VSk/yfCufsn3vgYBA64RLOA45WJVWelN4vuE23JL/pvS+8xObmzUXW66x2bAcfIL5qsSKNpytxgKw3dBsegSJmi0OkQC9bAzyegYG42Cn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721375; c=relaxed/simple;
	bh=LpM7Ymk89AHYw6ZHAsKiXms//9+nd5iDgs3bAU25bvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0fY7y8ZuHPEJUCjsJxcqCUMAD9prm86qDd8sSYRi1ojQBabR/O6LndjXlpVxtWjWNZHgIHYGpJ3DMUNisn4MNsa5mlbTM1FDCeEzVlvCIwYbWDrOtpIBjVgo6ayPBub2d3tKHvkL37MvGMjNFtc8AE5cVhVM/Lt3i3zCoXzPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zxr/LUg9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zxr/LUg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756721372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1a6KZNWDPzVRW16sFIGAaj4FrFvj+zYs7figVijp77Y=;
	b=Zxr/LUg9zEemGSWJ5SOdrbpms0OXXSZeCP96GjInyfeahPrMnVLKQ4/3j8BYJXkzQ9iiAL
	5VeOqgYf+tA7i2IGkqHc+t7ovKsyV/JwWQZAYBP7lqk9DIpONd7HoU1mABB99ukpVHKiVj
	7TV9eOVHWkUsPwhnPAdEjaeMQBj+eOk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-DcRK0AHzNdSO887TcoJxfg-1; Mon, 01 Sep 2025 06:09:28 -0400
X-MC-Unique: DcRK0AHzNdSO887TcoJxfg-1
X-Mimecast-MFC-AGG-ID: DcRK0AHzNdSO887TcoJxfg_1756721367
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ce7f782622so1772925f8f.1
        for <llvm@lists.linux.dev>; Mon, 01 Sep 2025 03:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756721367; x=1757326167;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a6KZNWDPzVRW16sFIGAaj4FrFvj+zYs7figVijp77Y=;
        b=dQEQwL6wINYoIF8uVYJYQOHQhaoIngXo9fWFDOHZJgxRhFY13t7ynXtw6WEXFdNCgv
         6agIa6q8jZj7gu/3UEkX/LgZaw/HN1IOlbZv6nUhx8iEglBfjW3o5sudJe2OYUcC4+RP
         wO+NNlnFlXgUARap6KQqp7zoG9XW8W0qC310eZf1zd5VYzTEDB8gCQkY9UoofhniFgC3
         PRWT0Uagv/476a8oJx0FEM2xRnASSIrVD5ei2ux0a1EyZiWiiqmHt38QusoMwWxslYST
         twqHdvl/a68d8PxMeP8bvbOA3WL6afZKeub9Uo3vZFVD4uaP46elMkHSFgGWmatNXrhk
         VEZg==
X-Gm-Message-State: AOJu0YybDki34Iabg0HBCwJTLZtb19ftjp+kwcj36DDhM/XJnzfFcV9G
	NyIikoaukS+K5Ntio2sr5IXW6rir58BGjAgtPkwTTjgmHHIR52+xhsmi6d2r20MB4DfZsI2vfAg
	CSkkQtnSC2j7R7M+jnCOyl2wh+Rt6ry3tDxUj7KGne5wvAeAJj1778Uc=
X-Gm-Gg: ASbGncvjfdFMWtzTbNsKpl3n7OcmFbfjUe5OGvNO9d1yf4syvFNsmNUMZWYExpru1AS
	DoGL66FZmMI2nhV0HX9MLC0ElvRt9DRDEnlBS4SwmKlM7rJbzkEa2qjsWtObGNx0XPN/VpEeDoZ
	uIQcYiJo/maJ/QjMfPjMqKjCx414GIpd8YmC/xaTL1qV4/oyLdRto4u8khV0Cy6AU+kYYV5RICA
	puauzrFqM3aoeybNYALa2OPlO1y7cdbKK/3u5bWQy8pONlc86Ma1ltlHQPRjkwROTWj7XJJPkZ5
	COLXdnpCKRqzcEK5y+e9cPoADo/zoopJkwkwIn4oHptwNy0lC4ZiLoqGSDZwAG1P2NnH08YuYkB
	Y3p6f5dqyzs8/Aof4699hZ85swTCMz8YjW0sKykVrTb2X2ZroCPjuCA49BBnZ1zl0CyM=
X-Received: by 2002:a05:6000:26d3:b0:3c8:2667:4e25 with SMTP id ffacd0b85a97d-3d1b26d6cd7mr6971335f8f.31.1756721367472;
        Mon, 01 Sep 2025 03:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkb44LikxyvVuQ5sprIX+jH2JFruQqpYBFaArGkw79FbPVYkH+h0h6DbFI5dwMA1LDmu3bFw==
X-Received: by 2002:a05:6000:26d3:b0:3c8:2667:4e25 with SMTP id ffacd0b85a97d-3d1b26d6cd7mr6971306f8f.31.1756721366996;
        Mon, 01 Sep 2025 03:09:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0b9402299sm13687409f8f.18.2025.09.01.03.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:09:26 -0700 (PDT)
Message-ID: <be511fb0-217e-43b2-9744-f9b001bff389@redhat.com>
Date: Mon, 1 Sep 2025 12:09:24 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] KVM: guest_memfd: add generic population via write
To: kernel test robot <lkp@intel.com>,
 "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "shuah@kernel.org" <shuah@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael.day@amd.com" <michael.day@amd.com>,
 "jthoughton@google.com" <jthoughton@google.com>,
 "Roy, Patrick" <roypat@amazon.co.uk>, "Thomson, Jack"
 <jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>,
 "Cali, Marco" <xmarcalx@amazon.co.uk>
References: <20250828153049.3922-2-kalyazin@amazon.com>
 <202508310252.E5uFh1hx-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <202508310252.E5uFh1hx-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LSoIdAsCUrd3a-xMnI0fRorw-T4QY-C0ccWUQ5SP9LI_1756721367
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.25 20:56, kernel test robot wrote:
> Hi Nikita,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on a6ad54137af92535cfe32e19e5f3bc1bb7dbd383]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kalyazin-Nikita/KVM-guest_memfd-add-generic-population-via-write/20250828-233437
> base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
> patch link:    https://lore.kernel.org/r/20250828153049.3922-2-kalyazin%40amazon.com
> patch subject: [PATCH v4 1/2] KVM: guest_memfd: add generic population via write
> config: x86_64-randconfig-001-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310252.E5uFh1hx-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310252.E5uFh1hx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508310252.E5uFh1hx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!

Right, that one is not exported.

-- 
Cheers

David / dhildenb

