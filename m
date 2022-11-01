Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B821D77
	for <llvm@lists.linux.dev>; Tue,  1 Nov 2022 23:06:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y203so688109pfb.4
        for <llvm@lists.linux.dev>; Tue, 01 Nov 2022 16:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPbyEQQBk73Ni0h1h30fs6y6Ff39h2pLPwf6IGZm/XU=;
        b=eUptdhlUsvV6f6+h66eOG5r0izRulrLvkJ5ys7OCQD/MHQs5xN6d6LVLU3v2yxx4CR
         raSVpGmGBR51oXmx9pkSq8GN45s+bvJYMB8GYdxFRTlJL1yujWq5juUIeiJcJUWwkSQz
         2/xal7WVL9cZlY4jIns8zQ4LgzzbZdBp7YoPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPbyEQQBk73Ni0h1h30fs6y6Ff39h2pLPwf6IGZm/XU=;
        b=MsJ/NCt0UbkKOopMjZP/CgxUgR1Mtf3d69Wnfprl4MgTzvLECKBXg5d//jGedYWhgK
         QDFTHVlK+vWnUcv0ONHu/tIqtWEDA5T7hXlGLDDWNJy4EbO04QFH/jaQRZ9yWwg59Yqs
         maMmJdTwkv/fFuWko532Pt2Ysp0TCT5gXt9ZR+AsGWxxLh9BaWb9ass1KQ7eA5R9PJG1
         V4RuAavTPTHp6DTljIWGIz3KFwwoiGUVQHh48L2L0qKhKCAevNU10OC1DPhKX8t0sJ0g
         JgIHyNJJDTsn05vdc+4i+lghrcaHjSX8mSpe92JKuSMis5tlcxmByAqT//e0jgyH5rvx
         Pd5w==
X-Gm-Message-State: ACrzQf0DN2tsem2HpfstPUajPEt/rkAGdHGWaU0nUjxLR/UQj4yD1HCA
	jNPgdSEFfbe5kceXjZWfIOvFCA==
X-Google-Smtp-Source: AMsMyM7KcPBNktfAVOVyJfxO7PvzhGbnCFsHqvVrZlIhrLio7l35KizVH52ERAEGwnHFBBN97GItsQ==
X-Received: by 2002:a63:ec51:0:b0:46f:ed8d:7089 with SMTP id r17-20020a63ec51000000b0046fed8d7089mr4658386pgj.469.1667343973773;
        Tue, 01 Nov 2022 16:06:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h29-20020a63121d000000b004388ba7e5a9sm6344238pgl.49.2022.11.01.16.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 16:06:13 -0700 (PDT)
Date: Tue, 1 Nov 2022 16:06:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: arnd@kernel.org, mauro.chehab@linux.intel.com,
	tvrtko.ursulin@linux.intel.com, airlied@linux.ie, trix@redhat.com,
	dlatypov@google.com, llvm@lists.linux.dev, ndesaulniers@google.com,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	gustavoars@kernel.org, nathan@kernel.org,
	linux-sparse@vger.kernel.org, linux-hardening@vger.kernel.org,
	rodrigo.vivi@intel.com, mchehab@kernel.org,
	intel-gfx@lists.freedesktop.org, luc.vanoostenryck@gmail.com,
	vitor@massaru.org
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <202211011605.2D8C927C2@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
 <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
 <202210290029.3CD089A86C@keescook>
 <850085e1-e420-b6eb-104d-15694a400bb7@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <850085e1-e420-b6eb-104d-15694a400bb7@intel.com>

On Sat, Oct 29, 2022 at 11:01:38AM +0300, Gwan-gyeong Mun wrote:
> 
> 
> On 10/29/22 10:32 AM, Kees Cook wrote:
> > On Sat, Oct 29, 2022 at 08:55:43AM +0300, Gwan-gyeong Mun wrote:
> > > Hi Kees,
> > 
> > Hi! :)
> > 
> > > I've updated to v5 with the last comment of Nathan.
> > > Could you please kindly review what more is needed as we move forward with
> > > this patch?
> > 
> > It looks fine to me -- I assume it'll go via the drm tree? Would you
> > rather I carry the non-drm changes in my tree instead?
> > 
> Hi!
> Yes, I think it would be better to run this patch on your tree.
> this patch moves the macro of i915 to overflows.h and modifies one part of
> drm's driver code, but I think this part can be easily applied when merging
> into the drm tree.

I've rebased it to the hardening tree, and it should appear in -next
shortly:

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=5904fcb776d0b518be96bca43f258db90f26ba9a

-- 
Kees Cook
