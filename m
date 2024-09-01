Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEB2F28
	for <llvm@lists.linux.dev>; Sun,  1 Sep 2024 06:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725170599; cv=none; b=CO73CmLFjlwCp0wIu6eqTo6JCP+k429FkRg7qWLdKVwgCyF8MFzmgjPtXhKuqfBJbGNkh81nEiJ9lNgtSUwD1hpqRLzYCpjIjPaLx7+dZu7ug/2FUfyZirLK8mywU9/74H1weSy9CPRDu6ng7AyB/b0M+QzxPwmkqVbEuYewNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725170599; c=relaxed/simple;
	bh=gTaVx+TwHD+FJbillFONR4wr3k7gQ6JEyFsWWKxKwTA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mJI+xm4m356bK9OzV4bP/vtrtypsvQYhKLoKdTiiYAjWchiF02RNGWKqCrPY0GFOboIPnkKV17zz1HJR1BU//aubb21SY8zROi3zZEr5T01bd3gJhfHArN+gMD4Uq8CaXSQdz3IoyJCYfru11mzRaEz1wFNZm2WrpxJu5oKETHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQDrgkqq; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQDrgkqq"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-39f51371baeso3011065ab.3
        for <llvm@lists.linux.dev>; Sat, 31 Aug 2024 23:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725170597; x=1725775397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ASaKifyh7CAWP7KfJ/Pkn2CRTiEMZbywc4FPBtZowk=;
        b=JQDrgkqqZjytWe/X5CsZzMaEuBg9UaDYdfm+NJtNzG6646FWr9fv5iCC3hb/3L0zib
         fz7T0ue9mKxQslSKpHjm4Zf77npRxoVnWjTmWz1ewcUtrNUtiOQaypG7LUbqV3cjRlhM
         Sk8hNgy4q6RDxlvxAiFK5oWIwm+Sf6K4wk4tpXj7LGBongVpttkY4iMwcb+57tYoiVDE
         jPK0sAcZTi2JvQGvjgIXGRwSfvyh3I3svG9LooBvXeqYF0iCV3FavMaSzPi+XZc9IuVd
         De8oWqvWBsC0FGhFT9QYgd/VpuWgcpRKOfvpDlYKbPOQYWfEOEr83p0pvPLVmo6UgEpE
         jcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725170597; x=1725775397;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ASaKifyh7CAWP7KfJ/Pkn2CRTiEMZbywc4FPBtZowk=;
        b=JpRCd0N+228bVN2lMgfmWVJl7a1YGmYwT6TY2mDie8B2uExae+4zAq2hl2w7cvTtnd
         XNMupMPx5oQvM54jo/a3eaMVnmdx7WSdBEf0a5uzlvBkV0xiPuLdnN72eMPJcfoPgHMn
         d01vuYU9Dj5QoFkVdAP4XG8TycC1eIpkATqbm77W3IhH8ik4QIIvYi1W9J1fWvD1cB84
         JBJt4CeOkhdufdEDVXEyJbFBXRTFepeADrjUGelwQiAbSWMgoMEY5seSORy3hgnbyEy2
         kJhxLNZvmc9sZRcTAxBJOrpDc2XGCxH+8pFIckU+UvvDATCBnVZnYJKTG5ku5gCen0C/
         Y76w==
X-Forwarded-Encrypted: i=1; AJvYcCXA8QmCHbMVAn7KM/YDuuFVvtMGrEx2pz+PPmHROoW+J3nxCnDsVyCAk8GnBUm5Y2YqUhDr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs3PQ1o3iHo1QlkJefNI5Qo/MlQIcjVd3cKjxqY5kOI1fRirwc
	7E+iqTMbKpxm+wwa2XJynSMeRC8viVI6ZqOl1ZbcJVVMtm/t/wth
X-Google-Smtp-Source: AGHT+IGw6QkiS7ytm3WVmlkoKhqjolc0dX880UP6OkyZZlWBmYHKwT4V+Nr35s91ww2YI7/yzG1CwQ==
X-Received: by 2002:a05:6e02:1cad:b0:398:16d1:6127 with SMTP id e9e14a558f8ab-39f37867c14mr129488355ab.21.1725170596927;
        Sat, 31 Aug 2024 23:03:16 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d92a5sm4631784a12.90.2024.08.31.23.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 23:03:16 -0700 (PDT)
Message-ID: <58b7c7d2-f60c-4a2d-9cb5-d583182bfef4@gmail.com>
Date: Sun, 1 Sep 2024 15:03:13 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dzm91@hust.edu.cn, seakeel@gmail.com
Cc: corbet@lwn.net, hust-os-kernel-patches@googlegroups.com,
 justinstitt@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com,
 nathan@kernel.org, ndesaulniers@google.com, siyanteng@loongson.cn,
 alexs@kernel.org
References: <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn>
Subject: Re: [PATCH v2] docs/zh_CN: add the translation of
 kbuild/gcc-plugins.rst
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I'm not Alex, but let me chime in.

On Sat, 31 Aug 2024 17:34:11 +0800, Dongliang Mu wrote:
> On 2024/8/31 12:11, Alex Shi wrote:
>>
>> On 8/31/24 11:48 AM, Dongliang Mu wrote:
>>> +目的
>>> +=======
>>> +
>> there are still a lots of sign incorrect. Please be sure everything looks fine in a web browser after you 'make htmldocs'
> 
> What do you mean by "sign incorrect"? I check the html rendering in the 
> vscode. It seems fine to me.

You are right.  There is nothing wrong as far as the reST specification
is concerned.

Quote from https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#sections
(emphasis by me):

    An underline/overline is a single repeated punctuation character that
    begins in column 1 and forms a line extending *at least* as far as the
    right edge of the title text.

HTH, Akira

> 
> Dongliang Mu

