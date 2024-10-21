Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702310940
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 01:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729474202; cv=none; b=B3uvWxX7zQ5XEy3pNPigTgFWvP8fZsNFbsT4IdpQoao9VVTMfGYI/ooKqdijFPhYvyuWbT/xpb5Pv/7IkOkTNqgOBI5bv3ipCdw858rV0pC/l52ODo/E/PU+y2p+8AhNa880bvMBfnh34GxvGuzjCaKFn/esMxy5/gszYW2dseg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729474202; c=relaxed/simple;
	bh=BPvJz5PSBbfj1CRGrc1kHyndLBkbI3a3KObZcVM6TMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5XRwyWrIpFJoOuMkKfihvSm7O0pve7W9/6XWnmksZT/VVURaNriYc7QUNSt6RZ96T8DBowU8M88Ir90VYoyxwhRdRr2ejFZpqJ1LSZ1lUi2fRN91BJfPd7yGRcsaRaHuC0XgJZ4oGLvwb/kqw8eXFdXEZetq9eNv+xexlYHSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUGtUJ6L; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUGtUJ6L"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso3499313276.1
        for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 18:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729474200; x=1730079000; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fE05LVkFI1sGMdobGg321AqnqgpjIWRmBV64yYRXDtU=;
        b=kUGtUJ6Lwf61Vt6rYo+0TORM+s8mIqE3OkEVUTXQE27roaw6W8b4+8CPjfXSZV/SvD
         a46idG8tqUZiQA4GxLslgTFIj3D1D/JEqrw83C8LCqV5sGERXgSdOU+YufZGiTJxckIA
         Quk761VQ0+yzmC1Fp92GcYLC45UvDnOW/+9+ekv1Qw/BcEtqa4iqo3p73yNC8Ddd1t4D
         FRMY3IcIgKT4uv2ajQjJ2qTAXSi0IkIIfiAey6DbdPrPamWNCyByKvT60+LtmNBNvGEe
         SNxYVxs0ItQJlGw2iYUOKPIWpOHp1FPCqncRAvgts4m9W/INWZjYx3SOvU+ephshBcnJ
         nhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729474200; x=1730079000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fE05LVkFI1sGMdobGg321AqnqgpjIWRmBV64yYRXDtU=;
        b=fTphy+/HUIUjLqaXp9oblzZ8Ztykpw4+Pv/aC5LvLz74FBObsZ7bzru/xjgv/tRM4M
         hPYNmEJmXiMztR1mVkN2ZpWvFbIjHnQ5KlLoGFQQX+LfsxlB9XrlPpD83Zmfmsk4Zqpg
         lAc9wpkam49AxdsI6SMuGKKhmxVUGAkoSAkNkhLRPOyK0OJKBNg4BfWXxsaKljxkqFZF
         SqYqOV9ZuXBRKHtZi2bgStP50DHHOedeRTXBRkpKDyj+REpJfdLlEtwLPDVVf2O7k56h
         uNEFpneUJk8SaqgSfjBscc+nUrs0hNDqEaEW7NhzMaSrE9wTACV5BQ0Z2+r7LePVZTLA
         akzg==
X-Forwarded-Encrypted: i=1; AJvYcCX4JCV7m1GGKBOUkzw5YFRfjqx9dFjDezrOMGTL/K9yVabDCiwBmMaxOsHTP6apm96JL8uQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwspbpLxDkV1UcbaLaUueBmau2qvss113Zgm55Jzu/pQCs777DD
	ql9PYx+RXuGAkTQrm3bs8FIIrSeG24ZGNuUlQxYEixF2/utweDL+
X-Google-Smtp-Source: AGHT+IFFsWARCAjDavvAcdqv6cyqEBhch+4Wm8sEFSItvnnwrVZ8BDRq46WnR3qh1+hzYVSF/KeY8Q==
X-Received: by 2002:a25:6951:0:b0:e2b:b456:f61b with SMTP id 3f1490d57ef6-e2bb456f6edmr6425894276.20.1729474200045;
        Sun, 20 Oct 2024 18:30:00 -0700 (PDT)
Received: from [192.168.2.226] ([107.175.133.150])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdcaec280sm518768276.43.2024.10.20.18.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 18:29:58 -0700 (PDT)
Message-ID: <2bf8ba2e-9c5f-4f89-9399-f6320aa32a16@gmail.com>
Date: Mon, 21 Oct 2024 09:29:50 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add the translation of documents in kbuild
To: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc: hust-os-kernel-patches@googlegroups.com, llvm@lists.linux.dev
References: <cover.1729259177.git.dzm91@hust.edu.cn>
 <8a882bc0-7125-4036-b939-fbd9e821c041@hust.edu.cn>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <8a882bc0-7125-4036-b939-fbd9e821c041@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/19/24 14:19, Dongliang Mu wrote:
> +to Jon and Alex.
> 
> It seems that tocmd and cccmd does not work with cover letter. Any suggestions?
> 
>     tocmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats --nol"
>     cccmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats --nom"
> 

Do you mean that to or cc cmd should give a name list for cover-letter?
I don't know if it's common needs, since some of people don't like to get every patches, maybe only the related patch is enough for them. But in another side, full name list is may wanted for others.

Another interfere like this, is the 'git am 00*.patch', it failed on 0000-cover-letter as cover-letter is empty patch. I'm also not sure it's common needs...

Thanks
Alex
> Dongliang Mu
> 
> On 2024/10/18 21:47, Dongliang Mu wrote:
>> Since llvm refers to reproducible-builds.html, so I create this patchset
>> and add the translation of these two documents
>>
>> Dongliang Mu (2):
>>    docs/zh_CN: add the translation of kbuild/kbuild.rst
>>    docs/zh_CN: add the translations of kbuild/reproducible-builds.rst
>>
>>   .../translations/zh_CN/kbuild/index.rst       |   4 +-
>>   .../translations/zh_CN/kbuild/kbuild.rst      | 304 ++++++++++++++++++
>>   .../zh_CN/kbuild/reproducible-builds.rst      | 114 +++++++
>>   3 files changed, 420 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/kbuild/kbuild.rst
>>   create mode 100644 Documentation/translations/zh_CN/kbuild/reproducible-builds.rst
>>
> 
