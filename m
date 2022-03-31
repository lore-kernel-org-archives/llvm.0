Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808447E0
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 04:58:04 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id mp11-20020a17090b190b00b001c79aa8fac4so2485517pjb.0
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 21:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PiZCacnPf98OojdKuzINeLxopb1yUnx6kMNzrFZ8Z0Q=;
        b=QdzIGs75a0rR3hVHkIuN7hxiZ4aIPzuc4M/KeYmxbrkFiL2oGnnYcUls5gqOUADsU2
         /InY719mlbvIERZhcMJAgrG8BBz2ZeMeB3Ji3RIEPHvOtKDuV+gYWU+24hqigzBclFxM
         a+QyB2x5+PDV0Czos3Hs9krBMqsVR9J5hbf10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PiZCacnPf98OojdKuzINeLxopb1yUnx6kMNzrFZ8Z0Q=;
        b=Rt0QQMno2BZpWtJJCmgZNy9R00oxbTt/kevKFnzbDhKxOYpFBImDDA5IBiGe9y/KGA
         bBd7mbrNSfWC3YtpCzZwSS4C/cE0Kx+KHVN1pZXX1qcocBOv7fakkZrxdnSvT9qLZWvK
         6c9zkIENveWEvcq4SRj+aIM+7YTOVbWYZnc8mUHG22Q9yhFFw+EmtNpJm8AAF+gsneAr
         +Vwt8ohEozQ4A60EbhgqiJ7lkEaTg6qDC9GHC8fSKwpGoushRK8YJBepcOZatdQ24HVw
         yq0gc6YMkjSt0cAGKftvgsk2Yn0ip41xJF5UGVuzZJ0TEhp/5JAISESs+wYgfctZwaXt
         3QLA==
X-Gm-Message-State: AOAM530uHthLs+bAzaKu9zaEOfDHu8zzfP2BSTBUX2YBuJSdE8DY0vwF
	Z4fz/MV3dslT/quPLQ2r3OvZHQ==
X-Google-Smtp-Source: ABdhPJx04e6lBaZRpW1n1dYJytcwlo3x5EktBQVulB7uPke2GcjNB3IWVFbK2YSFUSHzNkltQKTqwg==
X-Received: by 2002:a17:903:3051:b0:154:6fa8:2fa3 with SMTP id u17-20020a170903305100b001546fa82fa3mr3515456pla.129.1648702683965;
        Wed, 30 Mar 2022 21:58:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090a2ec800b001ca0ce2e2c8sm1912587pjs.47.2022.03.30.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 21:58:03 -0700 (PDT)
Date: Wed, 30 Mar 2022 21:58:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH 2/2] Revert "um: clang: Strip out -mno-global-merge from
 USER_CFLAGS"
Message-ID: <202203302158.BEAB17240@keescook>
References: <20220330234528.1426991-1-nathan@kernel.org>
 <20220330234528.1426991-3-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330234528.1426991-3-nathan@kernel.org>

On Wed, Mar 30, 2022 at 04:45:28PM -0700, Nathan Chancellor wrote:
> This reverts commit 6580c5c18fb3df2b11c5e0452372f815deeff895.
> 
> This patch is buggy, as noted in the patch linked below. The root cause
> has been solved by removing '-mno-global-merge' for the entire kernel.
> 
> Link: https://lore.kernel.org/r/20220322173547.677760-1-nathan@kernel.org/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
