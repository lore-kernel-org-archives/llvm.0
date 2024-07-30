Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889C8C1F
	for <llvm@lists.linux.dev>; Tue, 30 Jul 2024 01:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722304136; cv=none; b=mHuAZkElNDaSFNll0+VqjTRv1OA27cWOg3EpEmp+6DEXQZ+3sUwrVf0fXt/AehHxIRFTfh4coRN4Wh+sJU9fxwZ0pZVRKiE/a4kPbnTBOL3x510An217Ri8ccXqEA7K0N5shE0xOLGBhLcB7QxkM7w71y0MltLV95zhCkYh1QK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722304136; c=relaxed/simple;
	bh=8n1996Y8lpYFOWA5Eh8nbf6QZqyqbZ6W7WJigmpON5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ke/Ih2egH4MmgkCPGhuhCe/b6EVSiLUG18q5EtLGs9TQf2hQLQD4dpdcgRsPybvqaBtrs5iOeUws54kP8HUb0eWxMcZ1InWqU8/tU52sVCt0oAseHCNZJ9kucJVAWbXlaw2ihhdVV4W/dZi9+IFoIWLdkrNj9cjiF1VWDpOun78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNS46FkV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNS46FkV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso2777515b3a.2
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 18:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722304134; x=1722908934; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8n1996Y8lpYFOWA5Eh8nbf6QZqyqbZ6W7WJigmpON5M=;
        b=TNS46FkVz/gzMg6h4SubXon2T9fF4qTBIyQOLlHTpghnMjQLMrXgFCswwlLQ76pav6
         AdhzLp+xpQSbDRSe8NdzgmWWHj3GHJNAvIk9R922tNn/H0aLKPQttY38hkCRt9HZGXqf
         fT8OkVN9lCPiJMngwXLx/iR8XVlYqd4bbA3YjWK2SGTDQSueELhH8CudZVglIFqRxjk4
         yN6cE1rUSiUhPCZuSjz+oowX1Zrj7Wt/EJvEllrxleBLqriFOj8eVJKTJ4fMBmr4OiYQ
         T8ge9KF63ZZX/Ez/yOk/hvfrzqNoE+h4LMS3S83VN6+qeswUy+EvLRXZKBaz3U3Jkqt8
         QF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722304134; x=1722908934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n1996Y8lpYFOWA5Eh8nbf6QZqyqbZ6W7WJigmpON5M=;
        b=rH9bhr/sRoVyZ7BgKaMMnav5EHhFTTYeqZPlqWmSirPiTkmivpHYabPqRfFEwn6fYE
         2f6IGDi3mEZSNGlalw5GuFnllmUmCFSgRgEVd3nnq3KSf5sTKb2bJwjm7QJEwkKHR4cW
         TIuOa73oGghBue2nAUHMbGsaEG+OdkF1pr7F4ByzO1SDL5vweBShcpeZmqbxWkp3vHUx
         FgDQoV4S1JCO6ETpwa/GrWk5JcKV0Ue7qUaql5No1kWzeE4VR7HlJn3Fo4G64sIQTYhJ
         +MQKa4tKMs1uGHivdrYBrfb9sKAun27TvpjwtbsO2NSU5xxs253kd2F2644j3jefA7wv
         GX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWM+sgP7vai2FTuOiF0IpzEH21ZNAcAi9R3Kj+aXB3LgJYJ3rZYI59f9qTtVWIIv080dU4yUrF3NMmHaurph3rSGu+m0Q==
X-Gm-Message-State: AOJu0YyPfz8hkyUFXqYWTT8Ugw9+WqVyoJNbsDzUiXGVNn3Pb8HRHfCw
	QHTLKoZY7PZmQM+mV/RAVJXBSt32E6L8uJ9r9gEcbCpbmAYMZhS6
X-Google-Smtp-Source: AGHT+IH7sIH1zweCsioW01t/maDkdbU9IGjwQFzOiWkCdl997w0ao4hui3UQ4BFfljKQfqX+6cWd4A==
X-Received: by 2002:a05:6a00:8597:b0:70b:2a:15da with SMTP id d2e1a72fcca58-70ece9facb3mr6515521b3a.4.1722304133953;
        Mon, 29 Jul 2024 18:48:53 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead890cb3sm7399127b3a.184.2024.07.29.18.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 18:48:53 -0700 (PDT)
Message-ID: <90b4bfb3-8fb1-4f77-b3e2-1c55605a8cbd@gmail.com>
Date: Tue, 30 Jul 2024 09:48:49 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/zh_CN: Add dev-tools/kcsan Chinese translation
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Haoyang Liu <tttturtleruss@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240727150844.6502-1-tttturtleruss@hust.edu.cn>
 <7670e090-92e5-48ed-9365-e611ae1d4972@gmail.com>
 <75cbc7d7-5faf-4286-a702-ac242c6f87f3@hust.edu.cn>
 <bbbc3a51-21c6-47fc-ba3e-924ad8d86b63@gmail.com>
 <CAD-N9QWBH8yZcUhSLwUCZCOBrLbS1AUONik2p5E4LWYkhyVaxQ@mail.gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <CAD-N9QWBH8yZcUhSLwUCZCOBrLbS1AUONik2p5E4LWYkhyVaxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/30/24 9:38 AM, Dongliang Mu wrote:
>>>> "compiler instrumenting" 为什么要翻译成插桩？
>>> 指的是“KCSAN then relies on the compiler instrumenting plain accesses.”这句吗。
>> I don't understand the details of KCSAN, but according the doc, KCSAN make a array and
>> watch the data address in the array, so is there a real stub which inserted by gcc/clang?
> Yes, the compiler(gcc or clang) will insert a real stub, i.e. some
> assembly code, in the generated kernel image.

OK， then it's fine to translate like this.
