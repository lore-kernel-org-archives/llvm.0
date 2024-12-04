Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB122D4DA
	for <llvm@lists.linux.dev>; Wed,  4 Dec 2024 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331842; cv=none; b=VNr9KN44mNPFo3pyQtxdgdAMj7JWrwLBY6uQQqtN9s+moFgEHJK0GWWi1uHDki2oquoEqULhlQ5BkCefhzH6VILDsmtlVF5faedXFVKvRVgcAeum4g+KVwqHrFF64+BoUxuI8mDpL945bmpgYxSd7x91+Tyi0rrIu9bjWX5ysT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331842; c=relaxed/simple;
	bh=XVgTMkaQnWZypDe9THXFjpn6WhpDQVlRzEGdbJ21auc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVhb29KDH94p90uYyNme0sxRwT3L/n/fSmaMPaECMU26SaiO28NQuYKo88zsibWeJxV2j4ntNVgnp6Jz4v7OaVJ+oLGRYW3cG8bSFeOVcUfleVdQaoZWwTlsO1eyrtldfWRn2xfWK5tH/YkFgjU9LtgW8AIQZEBz0KJFb72hEKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nL/DFZ3a; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nL/DFZ3a"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-215da73e256so7073405ad.0
        for <llvm@lists.linux.dev>; Wed, 04 Dec 2024 09:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733331840; x=1733936640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKTr4vgYnNxGMKn6banAprynPQ5r+1qbhfcpS6aqFcU=;
        b=nL/DFZ3aKJcHvFQrsuv5sM03ZeT5IqU5Xw83XIPOCWLhaGahtyiBHLXGCK+NQ7oXER
         bdumxXCv3TfKsO8A2puNyTXfUZ38U3rcerYdjxXbgIcAoPxqFop45rAmqHJ34WBc+yZ+
         Y51jF3EcrLRrMBsfEzJNcmLllPxmO/rC2afX6chHMdTjT8tVhcIM54waWpcdwVkmE5qy
         2L3zV/Xh+OJULaZWaVbz3KFXZ3nlBOik4b6M57HFK1MKXiX4sUAGZ1u/9B6mIMch+eLr
         vrUJc0ia3nctRwQ+KpMIDQCmRFM54lBT4YehqZkdfrTWy+VSPCVUn91lgMXbi839KvNE
         cifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733331840; x=1733936640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKTr4vgYnNxGMKn6banAprynPQ5r+1qbhfcpS6aqFcU=;
        b=iNE80d7AwhFJi7cf0ZK0K3Nymk1439ADnfos9kKXUG1JpVJXhEGqlmDb8FxtQUbQn0
         g6P8a3ujJwzcxm07Ihe/TjgwlR0w+WETOVWn2bmDuKTroCgMnHQ6F+Lc52ctnrig9zL4
         ntiS5Oigol0kI+8FtTUOjkpuKPUEti31Cd93WERoh0jRBJySguGoI0O7trRG9HE1Zdsj
         5uHjeaWTk70+6DDCD8O7Qlol2Y7+zgZOvMznNWtASFWF0Gsmwp7hna0cmMyw2KiZmn+A
         jLgMZaVH/pQNx/w0vRoMPUGOnQeIDTsc4aTHMQECvVPUMu8EctuX2EFwkU7XaHModEBw
         7xAw==
X-Forwarded-Encrypted: i=1; AJvYcCWP9Yy04QkVMiKBMQNCrbEV8DbigQ4FHuHTW2r1xrTOCA/hRi/EL8m0ORk+ch19xmmc2cXu@lists.linux.dev
X-Gm-Message-State: AOJu0YwibgFkUmy+wSgylUEsCK6UIYQtbMx51KK+PgcRDXQlP9LddG51
	C7LbG3kPXTdPZ9BMuLl/6EVMsrt9v5lntttFOnGDGXTFMsU6oz8=
X-Gm-Gg: ASbGncvrdDu3F0SRnudk7/mVgxar6Hus5lY50pm5InwXtIGcchB85YAQhd7N3lkicm5
	1a/d2BaVvu11zOzrcCxQlxDScK1Z332PjAWgdCUcl9snCmegyV0blf3JPf/qNjAvWoqTR9n298P
	JMPmCisFhcwYmE3Smx3agTW3oXT1aXUMDDdw4GHaddw67gB8Gq+txTmCmDZDlbGGU9ILsjY9Zqj
	3BFiAkWYWaW5xzoon3GQwjFxiPeEuCM2c2vYOdTFhNJxy6VyQ==
X-Google-Smtp-Source: AGHT+IEYXZCwcvxk0zUlAPN8190KFwdu2z0T1sD7+oO3vIVKyF1lwiAKg/8rSXCynIC1VMsPscWmJA==
X-Received: by 2002:a17:903:2450:b0:215:a05d:fb05 with SMTP id d9443c01a7336-215d007659bmr84925795ad.32.1733331839927;
        Wed, 04 Dec 2024 09:03:59 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2155338c05dsm83350895ad.199.2024.12.04.09.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:03:59 -0800 (PST)
Date: Wed, 4 Dec 2024 09:03:58 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, edumazet@google.com,
	kuba@kernel.org, mkarsten@uwaterloo.ca,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH net-next v2] selftests: net: cleanup busy_poller.c
Message-ID: <Z1CLftOC58tUs6ZI@mini-arch>
References: <20241204163239.294123-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204163239.294123-1-jdamato@fastly.com>

On 12/04, Joe Damato wrote:
> Fix various integer type conversions by using strtoull and a temporary
> variable which is bounds checked before being casted into the
> appropriate cfg_* variable for use by the test program.
> 
> While here:
>   - free the strdup'd cfg string for overall hygenie.
>   - initialize napi_id = 0 in setup_queue to avoid warnings on some
>     compilers.
> 
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> ---
>  v2:
>    - initialize napi_id to 0 in setup_queue to avoid clang warning as
>      suggested by Stanislav. Tested with clang 10.0.0 and 18.1.8

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
