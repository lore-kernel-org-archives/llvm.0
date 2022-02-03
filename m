Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927062F29
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 19:57:48 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f8so3152573pgf.8
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 11:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cGaByQ8siwOwFo3H6XR9VUUbom/VIgqp9w81CSI2uiw=;
        b=T92D31tAA5MiwOX/9m3Jeiumqwj0pecFkTk6CBukk20nvgu17OaKXN1AFtvgv57EKK
         jq70zxVaT7TPIB4Bc5IfKaIOWLzMDOYLs5SbK3iI9pc2pBwVHPciHGucPx4g5p7kADlq
         kbnX2qlS2n2xDOjJdk6xX/3F428RmLokW3rrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cGaByQ8siwOwFo3H6XR9VUUbom/VIgqp9w81CSI2uiw=;
        b=MJVLdS/wYOvzRMjxzAtJr1qPW2ERPo3BhOdKaV5Od4aBNrbbfxW6y0cJ462ylVcrLY
         MLeaWV7MbuTl+T2zPIxPFQZ3PMjYaULRwSlCEEzX2lDMU7wB2jlg4LYjb2fogpuytbOb
         pXD0qZ7zZFs+ElD8Nk0PweluE5BTxmIJ+I8RlogGN+bzZyuyV3+YF3bv6lJE/M5NFbW6
         7kBPCTZ52N38HZ5VlqoDki+cguQ6K4fTYrY8S8O5v33MPtzJeNXxGR6J1TqrGG5B18f4
         trk6NuvMG4YpBKNZWfOPOWO/kcKSZaQDQm4BG5pynq7PQPg2BnKfjj5De6IQX51fHxIT
         kOYg==
X-Gm-Message-State: AOAM533MD4+UIokButt1eNyvTCdbOJ1Tv/GFahYFZrQR7/Txzq7x//96
	xXqEHlIuPUFsZjwW8ROtgn+FoA==
X-Google-Smtp-Source: ABdhPJzbNSRl7D+yCCPxB+1tEd531BtF9DNUrQKCK6weQRbjWpzkV6o1fNMvnURTVpjTcfO9QN+K6A==
X-Received: by 2002:a63:d80b:: with SMTP id b11mr16714952pgh.189.1643918267952;
        Thu, 03 Feb 2022 11:57:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ck21sm10231314pjb.51.2022.02.03.11.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:57:47 -0800 (PST)
Date: Thu, 3 Feb 2022 11:57:46 -0800
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	George Burgess IV <gbiv@google.com>,
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 0/4] fortify: Add Clang support
Message-ID: <202202031157.E18FA7BAC@keescook>
References: <20220203173307.1033257-1-keescook@chromium.org>
 <CANiq72mnF5qxfHGoDmvueMY7n2us9ZtA-u3igCJ+QjcbfKMP=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mnF5qxfHGoDmvueMY7n2us9ZtA-u3igCJ+QjcbfKMP=g@mail.gmail.com>

On Thu, Feb 03, 2022 at 06:47:01PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 3, 2022 at 6:33 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > This has been updated from feedback on the v5 series. Builds correctly with Clang 12.0.1
> > too now. :)
> 
> Looks fine to me! Thanks for the changes. I assume you are taking these, so:
> 
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks! Does this tag apply to the fortify-string.h patch as well?

-Kees

-- 
Kees Cook
