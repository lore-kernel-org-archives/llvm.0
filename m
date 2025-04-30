Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2F1DD9AC
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998792; cv=none; b=bO5sQJMfwVp2wGZcWz18rODk+Kwx61aiTPx6cetBg9kEfqCvByMM/iAKqhtUH+duLlN9QzirD1fVPwaAkamesl55VJADHDOD66kZ12qJGPwJT12gSqz72gD9y4gRYIhWu9rKfdVCt5eTYMmrniA47cYU6+ftl8eIOqrG1buGSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998792; c=relaxed/simple;
	bh=RYF5rT5SGXiuiOMM3oZfVuad7Ga744mi0LsZrurPLlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZgniNDoIe2UAqKkT/eRDTKxysWlbbzqy/DiqvBjJlhZyn9oogCOK6SXmmDSaXuD0NxovixtoMDdVE957CHKesL1gbrjkE9UX3WGPljFCac4pCR/ES4/TL77QmuRKn+gp4UZu33c3EdXZHDe/oKqC/UsnT+MUtBBowWr4S3WXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SBDSP98y; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SBDSP98y"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so42997525e9.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745998788; x=1746603588; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5U9OMJXkSPz8hKC+syIhe+oLvZq6aylg9p+TfyNHAYs=;
        b=SBDSP98y7wPtreg0PrPo0l7MO074IspczXlLPkcB+7cmrxAn3WVFzl4Zpljg8sJY//
         E1ycbss39GrCjMgvB5u8EzTUCju7Dp71XBPxluCvnJhPf9232J2c55ZJmSGjEHW/4NDJ
         XswhTERZKbPq0eYSL1wXG3ucH8SZL8VTj00uGRIAnnnYwKThrUBVz0A7eT3XKhvis6pT
         acVymTsKgDYrHAVnF7Lnt1u0YqB4lxlx0tx7ld4r+OPG5LvV8EIXQXEnehA1kTFlylF9
         j3EbaD5r6N+WU+qRRYjxncv3mFlF9H4QTXex1dXNRqs867aWDzY/kC1kGsSjeoKoLruX
         76ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998788; x=1746603588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5U9OMJXkSPz8hKC+syIhe+oLvZq6aylg9p+TfyNHAYs=;
        b=boANxXw/TLwXSrRFlQ25krfsWlGHZSJj8ihFHVbP9b8sgfNzBZfB3hjxsGgzHTmpdK
         ftSLHHqPMap+ZVLfarejTB3KcLlJ3azAlMhOBdoxNAfencf/5s86OA39te4ejCUi/wX9
         viaS2PBhhTD+18xxMaSOm19aybNcGdGQnxiq1vJ8cldM3grO0uemMG0roEbqSRJCxurF
         Pp+B1oB2CtvyJNfPyjnWf+m0h9fUAsZGDW4UcRaQ3LYgUIeE6T5lzD30cnBMLOkMaf87
         zARwA/UUzr+KFDRjvJ5r7pG7x26gnTahxSLiYRzpa+3Z1ERFGiqz188Jzh4M9fXkHPqe
         iTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqo6yU3YfVUS1T9EKIGCJ2idhp6TSyPYxGkdGhHkqaxoOA22bqwk8k0/e2Iexgku3gtxto@lists.linux.dev
X-Gm-Message-State: AOJu0Yx13CR/od5OUaLHOC+P4J6YCLBg9l9zio3OK1BTVilu4Fmp02oI
	JUzkJWVXF6FJ7otYvgm4CH2kZgGlkJgK4umHskKYbCb9eDU+lgX3DjU/6IUNGvI=
X-Gm-Gg: ASbGnct3zN/p9w6sBQp+q8F5e5YCB6pplXRx4xtH9FPYPSNJAxYUKYKzaOH2KJaoEsE
	dSKoBIh4xgHVnJt5Ivx6lQ4sledu061pzFgoIYccmtzGRamWxHfuIz7FjdrSqe/8+2954oS2VY/
	Mj6kgE/MRy5JrytHk9ohkdT+Dj7a8kgSwA9kwvYXRmJNeo3B+O8dNtHe9uXYNgX+GkvxYj0t0C6
	Y1CQu2bs0HM1Y1sPcIWHjoIDOHDYRFwi996kb0RKZG2RAPIClYG4iOpPMDy+E5kHFqvnGuSSKCQ
	ztAvajiCUJbAW79xUhrmY979Qi3NBvWEOMXfccipf8vNbT9xaMY8l3FsMG4FrrmdlPSsFsllRdy
	lgCKp4PM=
X-Google-Smtp-Source: AGHT+IE8jp0ZjUVoh7f9msS1Shj+zFFjpix/VROzqHbjQs2YUPeE4capqjHRAxR03y+nyYOapSyDRw==
X-Received: by 2002:a05:600c:500a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-441b2695e64mr12959955e9.30.1745998788203;
        Wed, 30 Apr 2025 00:39:48 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c6:eb01:e359:8d71:4b9a:921f? ([2001:a61:13c6:eb01:e359:8d71:4b9a:921f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4b10sm14125645e9.16.2025.04.30.00.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:39:47 -0700 (PDT)
Message-ID: <41bc286e-6e6b-4ae8-ad6a-3bdf56cd172b@suse.com>
Date: Wed, 30 Apr 2025 09:39:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: dc395x: Remove leftover if statement in reselect()
To: Finn Thain <fthain@linux-m68k.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Ali Akcaagac <aliakc@web.de>, Jamie Lenehan <lenehan@twibble.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Colin Ian King <colin.i.king@gmail.com>, linux-scsi@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
References: <20250429-scsi-dc395x-fix-uninit-var-v1-1-25215d481020@kernel.org>
 <91ba6cf2-ca95-1ebe-837f-ecc89f547ea2@linux-m68k.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <91ba6cf2-ca95-1ebe-837f-ecc89f547ea2@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30.04.25 03:36, Finn Thain wrote:
> 
> On Tue, 29 Apr 2025, Nathan Chancellor wrote:
> 
>> This if statement only existed for a debugging print but it was not
>> removed with the debugging print in a recent cleanup
> 
> The patch you called "cleanup" has a "fixes" tag. Strange.
> 
> I think it's unreasonable to refer to a patch which alters object code as
> "cleanup".

Hi,

yes, I was unsure about terminology used for code that is by default not
compiled, but would not compile if the attempt is made to compile it.

	Regards
		Oliver

