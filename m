Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB58F54
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 04:57:49 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 9so1875841pfz.12
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 21:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=v7kWrPbPEQnUozxdNS5JdmbVNWJ4CHYPrZUZ4V2zRBs=;
        b=enyqEF6ygA7V87gDWotsh10kd6fPVz5rTFRXsc8xm7ENhXrESwtah2QDneBSLsG1Ix
         KzZUA+2b81cD+ep20K1LmiSzAQxvp65GCkZaCzRv6RENRU5LRCtVo+aecNTwn/7ZguoZ
         z4ogI8vGaQeq1Bk+y2dUEOMuIwJpIpR7h4BSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=v7kWrPbPEQnUozxdNS5JdmbVNWJ4CHYPrZUZ4V2zRBs=;
        b=mQ3Byno5wUm+/PuvzrHrfUobO+B0oS7+FLkPF6sNdcBrFxHsTQ5yw72vY2JfBQm8fW
         JR4TSp05icWVJ2PzQkfSfXqTdW3FsZNO6s2YU1t1cQG/OoqNKKGHhC8cRSsgzCD9jk6L
         Xq/tCuOIYtA7Nx0YGWpU4oGWV8bWNEpwdllzdBaswP3TctU1R+Hy60kB7TqTytLVhlZZ
         kVgWlFDuJZL3GE+mEpcNjz6+XcHPMsJVk2khStA2Ckmjmw60uzFupVanCyLE5tJu8ML4
         AqwBu+sWboascGtBL/9UZQb6oqhQx8okrfoi2gh5diJqYA5Z28G9GufNmVjWMQ7OocD+
         +Sxg==
X-Gm-Message-State: ACrzQf1sjr6ZODJKOGcASd0pHRAF6N1VRABz4Gm//bv1LlcAT5ac4f+F
	ssjKgpzWKfUOGdtASAAnU7+hhw==
X-Google-Smtp-Source: AMsMyM5ALGEW52BP/WsgdiSVqzxe8HxFAHDE8Rb8WicdYa03ISm4MLjN1PxlV8W1MXz8rEfQ7pygUw==
X-Received: by 2002:a63:1546:0:b0:42c:50dc:2115 with SMTP id 6-20020a631546000000b0042c50dc2115mr10662678pgv.613.1663995469373;
        Fri, 23 Sep 2022 21:57:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z8-20020a62d108000000b0053e984a887csm7497176pfg.96.2022.09.23.21.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 21:57:48 -0700 (PDT)
Date: Fri, 23 Sep 2022 21:57:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] drm/i915: Fix CFI violations in gt_sysfs
Message-ID: <202209232143.172BCCDC4@keescook>
References: <20220922195127.2607496-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922195127.2607496-1-nathan@kernel.org>

On Thu, Sep 22, 2022 at 12:51:27PM -0700, Nathan Chancellor wrote:
> [...]
> To make everything work properly, adjust certain functions to match the
> type of the ->show() and ->store() members in 'struct kobj_attribute'.
> Add a macro to generate functions for that can be called via both
> dev_attr_{show,store}() or kobj_attr_{show,store}() so that they can be
> called through both kobject locations without violating kCFI and adjust
> the attribute groups to account for this.

This was quite a roller coaster! I think the solution looks good, even
if I'm suspicious of the original design that has the same stuff
available twice in different places. (I have a dim memory of rdma
needing a refactoring like this too?)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
