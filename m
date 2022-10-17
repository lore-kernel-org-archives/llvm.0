Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A254699
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 19:32:42 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d10so12020057pfh.6
        for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgoRbFnaF4liUWHPt9WHRYqaz0KaHrlhSQnzgk41VqE=;
        b=GT/v35LuZqCPLrxIFCXsGzIq6UX29tB0UKx6j+JPcHBoPfcu4dRDaBTgnhQyQW/4CA
         u0HRjqYoO06HhlEZ3S+T1lLSJkWrTk1lJcZNZKYhQyU1b6DelWiFNfrDefSd+w+e6RPr
         CXPqndttYWpUGPY0wRJed9zmFVDXfAAHjI4DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgoRbFnaF4liUWHPt9WHRYqaz0KaHrlhSQnzgk41VqE=;
        b=8RPOodcewNtbxZn+jR+bKq2ig4p3h7xqr+wuW7ywsw9t0zqTlFi7gEr+awu8ZChpT4
         RSuaHLX2fx7bwJgf/VNnvrVbZ/MLz0CN4YACLxgEmwvJeIRCzhkROSif3Q6ceDm31i+H
         cEGIBDdUU4QbscnE5UYDgjwsLP0cbMSss1pOwHEQEb/OqDEghE/+PalI4Sj+PzrcJhsw
         2Nc9uny5QDxdXPIt247P8NN6FfP86TTs4Z4PxC5FvCM6g8Rz4uHv/ywItBrF/hfPCwaB
         eWyb/wER9td2qlN8au3I9hFg23/i6bKbmF2xY+wsY5iP++Hz8DXpNWrK2GxKWyY2ndbD
         90HA==
X-Gm-Message-State: ACrzQf0IA5ag12gpjFWJGUk/uU5oiAcla9RtIbaSqs27XcUYGM1U+1jT
	tx595pDXsSpc1cMVwg7jREGrfQ==
X-Google-Smtp-Source: AMsMyM4SppBWDD+/sle64nI1LMESIyjHFXZcrMzEHZiZk5Ob29HL+SWbGljOvdBFioKXXWS4HDa0JQ==
X-Received: by 2002:a05:6a00:1145:b0:52b:78c:fa26 with SMTP id b5-20020a056a00114500b0052b078cfa26mr14186864pfm.27.1666035162005;
        Mon, 17 Oct 2022 12:32:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q59-20020a17090a1b4100b001efa9e83927sm9766278pjq.51.2022.10.17.12.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 12:32:40 -0700 (PDT)
Date: Mon, 17 Oct 2022 12:32:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Li, Xin3" <xin3.li@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"H.Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: upgrade the orphan section warning to a hard link error
Message-ID: <202210171230.CC40461C@keescook>
References: <BN6PR1101MB216105D169D482FC8C539059A8269@BN6PR1101MB2161.namprd11.prod.outlook.com>
 <Y02eZ6A/vlj8+B/c@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y02eZ6A/vlj8+B/c@dev-arch.thelio-3990X>

On Mon, Oct 17, 2022 at 11:26:47AM -0700, Nathan Chancellor wrote:
> It might be interesting to turn orphan sections into an error if
> CONFIG_WERROR is set. Perhaps something like the following (FYI, not
> even compile tested)?
> 
> diff --git a/Makefile b/Makefile
> index 0837445110fc..485f47fc2c07 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1119,7 +1119,7 @@ endif
>  # We never want expected sections to be placed heuristically by the
>  # linker. All sections should be explicitly named in the linker script.
>  ifdef CONFIG_LD_ORPHAN_WARN
> -LDFLAGS_vmlinux += --orphan-handling=warn
> +LDFLAGS_vmlinux += --orphan-handling=$(if $(CONFIG_WERROR),error,warn)
>  endif

Yes, this is much preferred.

> Outright turning the warning into an error with no escape hatch might be
> too aggressive, as we have had these warnings triggered by new compiler
> generated sections, such as in commit 848378812e40 ("vmlinux.lds.h:
> Handle clang's module.{c,d}tor sections"). Unconditionally breaking the
> build in these situations is unfortunate but the warnings do need to be
> dealt with so I think having it error by default with the ability to
> opt-out is probably worth doing. I do not have a strong opinion though.

Correct; the mandate from Linus (disregarding his addition of
CONFIG_WERROR for all*config builds), is that we should avoid breaking
builds. It wrecks bisection, it causes problems across compiler versions,
etc.

So, yes, only on CONFIG_WERROR=y.

-- 
Kees Cook
