Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D34433
	for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 17:33:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so13634490pji.1
        for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 10:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDEbqRU8sq/kF2yRisiLgzU2HDxDOJoWb1vd6nz9uGU=;
        b=HnE1HY/lybPVFDB3zY/UJbK9AFVb+TSrUcgGvtOeU6QkvpRGeROW6dXTcNAUBtN+0l
         hyLL+Sxv44XqoB8Y3JQfHrkdy9RJKCOukBkjNycRA+DXPZKbEIEXMTPx1qX9l+OP1Iln
         Ci9XvTon4wufg6WV5poCy+kcBC4Jq9mWMkp/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDEbqRU8sq/kF2yRisiLgzU2HDxDOJoWb1vd6nz9uGU=;
        b=7pQzEc6wCM6zGS9F/O+998CSes1y3kNW4uDorDrt3fOFNEch6k7Yd5f/bfcufWxQ7o
         NRkL2SUaIdzEhd/7vkm4nOm5F0PdV6ifdhkqcCfGrOzLgacksckhPbi/ZLj7szE6Hloq
         dWzwKmFW9N65BZDKYDSKoF42GOYHMQysJ5NjlkM0HnxlMSCjtuMcsPrh3VPTTQP+Ky/X
         KMzAphYFEjohpnxfBFFV+dJYMPg5TYz3y7rnyIl1ecT4SP800+Z2Oqj8eXNIimTGibKz
         DVVPzo3P4hVwbez4Th1C9J0ojLgfQwRqPxM6JNbz14e1mqi9Z7JLIBMYbrjAtptOEyfH
         H4EQ==
X-Gm-Message-State: ACrzQf3gDPWC5g3KJTZmHWws1CBbAVyc8vo1OOSsZWCQNgHTxxfRBwPh
	CAkfFpkiuVF6J5X+0sEiqX7wOQ==
X-Google-Smtp-Source: AMsMyM5cwsymEhwq0BzYOsKfaqYpuQay0bmcMDUOWqTrARXwFCvkTtuhuNWAJSK43cbAt5aIcH6UGg==
X-Received: by 2002:a17:90b:38d1:b0:20d:8f2a:c4c4 with SMTP id nn17-20020a17090b38d100b0020d8f2ac4c4mr73462283pjb.192.1666632780418;
        Mon, 24 Oct 2022 10:33:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a65-20020a624d44000000b00540f96b7936sm87029pfb.30.2022.10.24.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:32:59 -0700 (PDT)
Date: Mon, 24 Oct 2022 10:32:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Xin Li <xin3.li@intel.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, x86@kernel.org,
	andrew.cooper3@citrix.com, hpa@zytor.com, peterz@infradead.org
Subject: Re: [PATCH 1/1] kbuild: upgrade the orphan section warning to an
 error if CONFIG_WERROR is set
Message-ID: <202210241031.4BB6E70FB@keescook>
References: <20221022030519.9505-1-xin3.li@intel.com>
 <20221022030519.9505-2-xin3.li@intel.com>
 <Y1bLk47I4pyEmJVi@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1bLk47I4pyEmJVi@dev-arch.thelio-3990X>

On Mon, Oct 24, 2022 at 10:29:55AM -0700, Nathan Chancellor wrote:
> On Fri, Oct 21, 2022 at 08:05:19PM -0700, Xin Li wrote:
> > Andrew Cooper suggested upgrading the orphan section warning to a hard link
> > error. However Nathan Chancellor said outright turning the warning into an
> > error with no escape hatch might be too aggressive, as we have had these
> > warnings triggered by new compiler generated sections, and suggested turning
> > orphan sections into an error only if CONFIG_WERROR is set. Kees Cook echoed
> > and emphasized that the mandate from Linus is that we should avoid breaking
> > builds. It wrecks bisection, it causes problems across compiler versions, etc.
> > 
> > Thus upgrade the orphan section warning to a hard link error only if
> > CONFIG_WERROR is set.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Xin Li <xin3.li@intel.com>
> 
> Thanks for the patch!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> We could deduplicate the '$(if $(CONFIG_WERROR),error,warn)' logic if we
> hoisted it into Kconfig by having something like
> 
>     config LD_ORPHAN_WARN_LEVEL
>         string
>         depends on LD_ORPHAN_WARN
>         default "error" if WERROR
>         default "warn"
> 
> in init/Kconfig then using it everywhere like
> 
>     --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
> 
> but I will let others decide if they would prefer that over the
> direction we went here.

I think this makes it look cleaner, yeah.

-- 
Kees Cook
