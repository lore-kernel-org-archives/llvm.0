Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360CE53E2F8
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921900; cv=none; b=GeanVCDJpQSDwhN60b+s4j+tgy8owxEdkhOw6vAMxby7pUzDmUqyGFScKAoeNckRxpFKVoBwasuiB/fVZl9bNcSBHL1JsjaIdYtpIWs3e5NDyGCX2UMtfhm3v4rWhYsJlX/yK9otL9V0Gjr1E3AUxEqvyrNGkp0Lpd1KzFz2VHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921900; c=relaxed/simple;
	bh=jsf/N4puSeJOQIlhIhkdxik0aMfrnwHvBR4c/f1fBN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxaERdhRA4YpdmHWBdcf+VnEWExLi3TYeZEo2iWEwHxrzbc8asSjMvnCItMCQIwGTaLwJe41dV7ktoR57PvvDO8NljZlYMA3xsRo1epSSjISxevuDNluMN/qBZ54AYcXP7arqRjpUc+1cHzGdRU+mPISK6n3bvpqDMiPvlZ2PPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fh5IMFH0; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fh5IMFH0"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df1eeb43feso1437528eaf.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791921896; x=1792526696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8k8GHcZymDm4VuYrOBPVcb94WVXehxdLUIl/SQhO0TQ=;
        b=Fh5IMFH0dqeVrMOdHNkShlFZSBWgYdjKhPGArtlnd13skIP10SRTPZ6goumgWdJ2Hx
         6hZDeMzWgmrvU5YE8gS3o7ryhyWcpuwIEjgkT1iyLTCCs0zNrGzTh8jJSoXeavfkF4vn
         OE6Qbn8f2XB7njF/3lXzJUQsZBspO6yOc024w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921896; x=1792526696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8k8GHcZymDm4VuYrOBPVcb94WVXehxdLUIl/SQhO0TQ=;
        b=FkD/Fy53yruUr5ir5tWz8NO+q6NBglUmfdIkof9euv0IGNATv76TI7eXWAhGjtHmii
         XASBZeP8yfRa1r621M1tTdC84cr07C6OIbSHZu8oUZzyNbtWZFLzxuao413JIp5PWnF4
         6+r2LctkeveqHXVVNxpqXw4MSeNyGmHGhTUwVmMIEp9zUdiyxRHOOgHsExHTl/oA1IHA
         6PBI8l9kS5c7+pErocrCNS4voQlCJ+lFz7B0bvbzR4ewBzASmvX71Btwg+BU4j5suh3I
         AhStop6pZygCiXsYBrNPE7nmJXl24qU6arw2PMciYrSjJHN1i87AJS399va9G62OEuVW
         fUxw==
X-Forwarded-Encrypted: i=1; AKwUvBzr2UU57VfOQw0W+C1QhAwoUwGVRt5T2y48ogX/+BOfa1n8n0R+dtUAvSaLXPxsFLfkYzSx@lists.linux.dev
X-Gm-Message-State: AFq9FYJHFueqF5tULsUAf7NuAcI6tEaFDJYZ/k6VvIZjddc3vmu52/K4
	oO6l1kDUnMYiF4p2Bx/k3JSPAee9Pz00OA4zuIMPLj6XlQ78az8pgUZk4KX5apsgiH8=
X-Gm-Gg: AYBFou0EfiEbw+oTgccaGeqIrLf75YqccvspqByJQnp+goslt8kTIuQ2ks6NBlMXCOo
	yiaoIl9CBXhzirhGGAHqjgoZteuoHs58gXiIfGKlorAJ14B0a3BNwhW5ytliInMq1f9IFftM4qc
	5EaMCfG7vyTOB2909sbD6sZ5CwZvvTE1y95YckPR5J8y6S+pfte0DfMHGPQnNDD67+Fkcrc7JUh
	nz0m/ndCqcCjl6UF8Dnjr5+sDB3yW1fo9ctPZK/Oc/zOIbUeoKH4eaTzK5xv3HHs88GeKC0phsh
	2qRRv5PqqmwLn8PJ+VaqvbfJ/GY/G9wZzTns/CZ/Q0hn5cJbekzW9qML2pXm0v2FofvbVBa73Rw
	MbqwNgFxClfD2UlLhI421N3VHqyQYlEZtmwFzyfnAEJF5XTrHJxuv/mMr72RWBLeWYplSAglCfi
	mFblG7FSwAcfhncitXIVLapDdrigljL5E0d0A8zm1MRyjo4m6qOqdFcoNN2TWWN3n47S8tflxc/
	W+hbIY=
X-Received: by 2002:a05:6820:c8b:b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-6ef10e69495mr9069578eaf.82.1791921895794;
        Tue, 13 Oct 2026 13:04:55 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfc3150bsm505062fac.10.2026.10.13.13.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:04:54 -0700 (PDT)
Message-ID: <21d16f93-316d-4043-a4f3-b4abbfe7990e@linuxfoundation.org>
Date: Tue, 13 Oct 2026 14:04:52 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 13:40, Mark Brown wrote:
> The kselftest_deps.sh script currently takes a compiler as the first
> argument and uses it to check that libraries needed by the selftests
> are installed.  This works well for GCC where a separate binary is
> provided for each target architecture but is less of a good fit for
> LLVM where a single compiler binary can target all of the supported
> architetures.  Extend the script to accept "LLVM" as the compiler with
> an additional optional ARCH= argument so that it can be used when
> building with LLVM in a similar fashion to how the actual build works.
> 
> The duplication with the main Makefile isn't ideal here.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++++++--
>   1 file changed, 80 insertions(+), 3 deletions(-)
> 

Thank you Mark.

Looks good to me. I will wait for others to chime in and will
apply this for 7.4-rc1

thanks,
-- Shuah
