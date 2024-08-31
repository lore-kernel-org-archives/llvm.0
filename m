Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282235674E
	for <llvm@lists.linux.dev>; Sat, 31 Aug 2024 04:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725077499; cv=none; b=m0X7kYcqm3ifIiVtzOSYBkpEwP0QYdZoi+4KojJYM7ZS6OMYi/2Z7sRO0HQrEh3G+oTKtojKHBRmyKwoeDmfKh2LUjQ+s9ceu5J8H8f+wklraBz/cJmsAwqnww9W2IjvnJ/lDNS9OnOYoXELjtjMWQ6EnWSKlD8+r94r9uPZoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725077499; c=relaxed/simple;
	bh=5cJOP/pm0inEcVN8TmugnTWworhyXeDseqeVL5SUMKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKeQ7+ffabZGOMGqFI8lF5/qkH5XHqBtOtn3/fNTTqJHdbSVTdKph7tMUw+0oLAvcwT+V0t4NpTDwS+tyvQpDJsbSbX9RdJx275xy/trBAZQsYCKb68kqnZK8ydK0Krirlcn+xrM3GmXznIfRRzzzdnEV2PxYbjJvjQdjH7HaIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9PkcFav; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9PkcFav"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7bcf8077742so1731160a12.0
        for <llvm@lists.linux.dev>; Fri, 30 Aug 2024 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725077497; x=1725682297; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLXEldDkMokuiHCr3eLGh09tB9NkALUAfqLTAJVc4tI=;
        b=L9PkcFavIUux2Be16X3jfQhtLbvAMPOBTTSDg2si82vgnj/GH3Om0BSpUKBvGObSK7
         p9DRaRLezY6VLFug8jenxsegB0tzESrd4Mx9h6v2eDdYqfIrZ2AJ6drvetQPRaTyfrdx
         5W2gwFtduJzMpQLxyKzMmek8vNbB03pRdRf/T4OdHeViGtpi1IYa0AXe3CRKp+tDGjQg
         tZ8U8/gWVa21w2Ycc638FR/7jjzNdKAJ9LGgJB9zcrHrmI5sZpWlAm9mID+BBF+lRCVn
         sKQERKf8E0RAHjIKQThMzAImatSI5Qsj0cRmwwHhlA5NIw3/Dxn6Br9BHaFg4FsYpgz8
         wm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725077497; x=1725682297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLXEldDkMokuiHCr3eLGh09tB9NkALUAfqLTAJVc4tI=;
        b=ISBWR1sXb+ZpdBJ22dMXdkkTQLqiSfcF98jeuZ0WNbjjV3oE+Fp3RDwzQNkDs8bN9z
         Cc4YIGdW8px1gYio/5LLZVnkB97eznapIrAXZo4CYj/TSKUeXFmJkHjpwqVWnep8BJli
         d1DjeE/FUt8y5T8ilSKpCwhHpa7LW5pBvcPu8aV8GeXbnUxxzxd61+ot7FaQP2VsTvi5
         1QlVWZLryvPSw7YvnWb5hWzYPJHj0JT+PmZpLjhZe2NPJybImftwLPbrbmGaIx08SQIe
         As+4uax9bxn5jcwuNCEr2DqHUESO/Q/+Ji55+rDghFUJ2vhJTSQkwh768iEC3WzgWW6t
         tdSA==
X-Forwarded-Encrypted: i=1; AJvYcCUx9MWYCumN4XcXMZa0tVcNfB5UL30DXuA00lfm5uGl2TG8rmB7E+25Pcuo5voWSv9u/idN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/bDhYNNd4Mi2FwmsCFP2TIhFh07pZm3par7W4MOvJbaosayGn
	VgmD68riW7uVNNDl2nLbYAMhZ1mZMsN9n+Q79zDBXRM8YIKxUOlg
X-Google-Smtp-Source: AGHT+IFXblbmu4Q/a9DLI+JTtBfP5/DA9RPdB6hm8BDbTWlIj+AL43G8h2/gPshKHcd+PA1gFebauQ==
X-Received: by 2002:a05:6a20:2d27:b0:1c6:fb69:b44c with SMTP id adf61e73a8af0-1cce10101e0mr9129713637.12.1725077496896;
        Fri, 30 Aug 2024 21:11:36 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d9716sm3594406b3a.174.2024.08.30.21.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 21:11:36 -0700 (PDT)
Message-ID: <0a434542-b207-4bb6-886e-74eff6cc9f39@gmail.com>
Date: Sat, 31 Aug 2024 12:11:28 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: add the translation of
 kbuild/gcc-plugins.rst
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240831034924.3729507-1-dzm91@hust.edu.cn>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20240831034924.3729507-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/31/24 11:48 AM, Dongliang Mu wrote:
> +目的
> +=======
> +

there are still a lots of sign incorrect. Please be sure everything looks fine in a web browser after you 'make htmldocs'

Thanks
 
