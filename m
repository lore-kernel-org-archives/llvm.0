Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909823C0
	for <llvm@lists.linux.dev>; Sat, 29 Oct 2022 07:32:16 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id e129so6650991pgc.9
        for <llvm@lists.linux.dev>; Sat, 29 Oct 2022 00:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZy5lCa/2Ecq1kSp+TM41cU7cXmzgRAAem3qyDrtqVE=;
        b=A6ozaRuL05mZkdsRzdSlURHF6+RyhhlQMHJ17oRbpBtm3eHluiPPTe/pjG6GCA10vk
         tspsEtfuGzEps6YAzOIbVmjuDaXvqm1pWzEH1nBnDI3wqRh0OvIqYp2m7/OwTKipwoyl
         NAZ2yriUdMjhNWS1Wx7WX9sK0FE0Y59FOGeLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZy5lCa/2Ecq1kSp+TM41cU7cXmzgRAAem3qyDrtqVE=;
        b=vag2AJJ57yk+6BDp896lNLjYV2LbM/1kHcSzCEmwVDnOSTwennCawPi7vv25GCrTur
         YYZ4NMJ9G3mm4dTXHU53y/FAIT/ueA+R/ye13Ue2+SXTTLgMwg0OCO97b31amNMcxUDK
         u+w0VZnPCMsFMzxZyg6xH8agggQ7qOoY5OZy+CjO4hJoZ3gaUvj71+aOuF/IZvMhnVIQ
         xZ0ET4wCQtta39GEu4W07QFhYuz5K/j82AMA5ZhM0erWbJ2WwKZt4UZoiS6V2ZMXpK0m
         OxejXVstFvc4gZVXvIMEx16Ktrdwoa1LFOlcJD41Nlzi4OAPqcC8RGx4sqZ3HJjxGX1F
         pL9Q==
X-Gm-Message-State: ACrzQf0NAnaHPY4n348pFRd+xXtw1a5/Bzy0J+11YfX81ILs5/5QfTQj
	IPUDICnBngVaY0+MEBnPN++qGQ==
X-Google-Smtp-Source: AMsMyM6/CT3Vh+btOf4K3+q/dntWfviHzwWozBtDItq+XamMQLfaCbtowXk6VHNabYjKDdbmPNU6XA==
X-Received: by 2002:a05:6a02:10a:b0:461:26b8:1c95 with SMTP id bg10-20020a056a02010a00b0046126b81c95mr2895261pgb.503.1667028736033;
        Sat, 29 Oct 2022 00:32:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902758700b001868ba9a867sm607345pll.303.2022.10.29.00.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 00:32:15 -0700 (PDT)
Date: Sat, 29 Oct 2022 00:32:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: airlied@linux.ie, trix@redhat.com, dlatypov@google.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-sparse@vger.kernel.org,
	llvm@lists.linux.dev, arnd@kernel.org,
	intel-gfx@lists.freedesktop.org, nathan@kernel.org,
	rodrigo.vivi@intel.com, mchehab@kernel.org,
	tvrtko.ursulin@linux.intel.com, mauro.chehab@linux.intel.com,
	ndesaulniers@google.com, gustavoars@kernel.org, vitor@massaru.org,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <202210290029.3CD089A86C@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
 <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>

On Sat, Oct 29, 2022 at 08:55:43AM +0300, Gwan-gyeong Mun wrote:
> Hi Kees,

Hi! :)

> I've updated to v5 with the last comment of Nathan.
> Could you please kindly review what more is needed as we move forward with
> this patch?

It looks fine to me -- I assume it'll go via the drm tree? Would you
rather I carry the non-drm changes in my tree instead?

>
-- 
Kees Cook
