Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1D13B7AE
	for <llvm@lists.linux.dev>; Sun,  1 Dec 2024 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733063497; cv=none; b=XywM9AAaCTYehzZY6GrA0NIVyd0Pi5JTZ7NXIUX3nrO+wg+M1oARA8/JsHknkYYril1IzRpbngQXwT+FZwfQpx32Vvoo7hk0lUj3FEx5m+CNhct7Fu3MEEcb7kDl6kl7gpLyTbW2v9MJBWugUDkbJ+w6UxaLfXyE/M1tema8GLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733063497; c=relaxed/simple;
	bh=cs07FUKuBT285LCr8xyS8sJE5bAzCSjYVFNiRrNf6e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSCn2J9aFPPMAU7ESKldf+8hT2xX/W+AvLBxSRQb+u9D7zeLHqn/sUamwoofx2eUds0SVovQnqFD+xgMcYivWDEuyRhJUZu/0Z9h4/ADAq506VBBXzdiAG1OwtHbjwPf9cXmIIB3GM0ZPQGgdkKbZYgDrFFCjHiQl/3+OIQ0PyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxIgGnez; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxIgGnez"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2129fd7b1a5so26616475ad.1
        for <llvm@lists.linux.dev>; Sun, 01 Dec 2024 06:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733063494; x=1733668294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSs1okWPJ9Uo0V4mm18+tBBS4yF0aCTku8uJEQLNf9w=;
        b=OxIgGnez3naljcmgBIVM8IEzGIXOFsaoPNBvRPOYZ/M5keeFsqbE/gorjoTgwGvNOB
         vmQLGz/Vt7m06FxiyAYs1FJR5r7N6O2YuS3vZx69wPOMbtwvTUcG5MtnVy/ts8TplvOe
         aBR8ly0Iux2zMwDafgBRTylOYerIFwdECDA81WA1GLQUtg00/n56ijZx8HqcU7CGXDCt
         9uwbJZ79M/gDcA4IjhDrWgG10oRVa3HwaAauOp4MV3HAbPn1gG4npsfjZJ2vPtaku+kn
         gi0bEU8FtESQ9+vew4Q7FmIFV5tZyGy8vt/N5/5iUA3etHKCRP2bnVImaJpn+yNYk1kC
         Ns/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733063494; x=1733668294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSs1okWPJ9Uo0V4mm18+tBBS4yF0aCTku8uJEQLNf9w=;
        b=UNZzuAGbP4H8nNQ6pm3AFH8vB5bEKttAzIpcDF943xSjv0WZDlALUK+hfNp2Q2Dbn9
         R4W6vyJOFALEjRquLUPLYPjnc3g/hc/j20vA9nZqlkVfRdynGAlLtidEN4VFOQErxpr3
         iPmdJx95cuv4+rByHdyjEHjN0zhjg6zm4qcnFA7FIfaYEZOQCRAwk0XBtKCKMzwzWeEK
         328CsJF2nTegSUXCRgqXPogLjd20iRFIAvSBSKDuUCatjxwqfx62x5K7+IML3lxLs8b2
         Io9RrjQgO/Db/K1cFeB99aRtpeziy1UlfI7vHwWgzRtGIyG6acFWjdcOy57kiBkGFM1d
         NckA==
X-Forwarded-Encrypted: i=1; AJvYcCVe6mzgwM1QyFkuGL7h/72FWpgvxD/dODTvVgsqwiMQ/N6nchkSnG3ykZHnauqCHAj5icNS@lists.linux.dev
X-Gm-Message-State: AOJu0YyZTa/+Zdb5JvN3zod/eQ5U9R2zw5y03m6rVYDFdk6rtKkaV33c
	RMxGux6F/KofsT5JEw4GHGDCfgv2mVtwQHj66xnDglPRpvq2iop3
X-Gm-Gg: ASbGncsYRdhUIwFo0NK1c34s3baojhDkPTnJFJigKaZMEr8Tb9JnsNW5gLlY0Re9/vb
	S/MemEmhHZEp/vEmKZwI20B9Mslr3FZiY9dY6gvfQL3RqW5yjpbceAxk4PAHs0oWlCdvLXczHid
	WwegboPn46cGVBmCP0t8vU4jEWfTsrwAWeR8ExCtTxiSmHslVu3lALUCDn2HZ2NtZnxtoVHdmOX
	9mzCvuQ/5LimqxDHRYF9tjkG/Jk3kGPgUbShZ60zPtJ0yksadl9zzY1POkyw/Q=
X-Google-Smtp-Source: AGHT+IHez05EYi6Jr4b/fsMBN/z//mvCD2nUHZ3frqiYhHt5hXzXEq52h6WucQvOD9jNiEl0syoZRg==
X-Received: by 2002:a17:902:f70b:b0:212:46c2:6330 with SMTP id d9443c01a7336-21501381475mr240993735ad.18.1733063494317;
        Sun, 01 Dec 2024 06:31:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm60223015ad.184.2024.12.01.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 06:31:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Dec 2024 06:31:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rong Xu <xur@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>,
	Brian Gerst <brgerst@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Maksim Panchenko <max4bolt@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Yabin Cui <yabinc@google.com>,
	Krzysztof Pszeniczny <kpszeniczny@google.com>,
	Sriraman Tallam <tmsriram@google.com>,
	Stephane Eranian <eranian@google.com>, x86@kernel.org,
	linux-arch@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, linux-openrisc@vger.kernel.org
Subject: Re: [PATCH v7 3/7] Adjust symbol ordering in text output section
 [openrisc boot failure]
Message-ID: <5e032233-5b65-4ad5-ac50-d2eb6c00171c@roeck-us.net>
References: <20241102175115.1769468-1-xur@google.com>
 <20241102175115.1769468-4-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102175115.1769468-4-xur@google.com>

Hi,

On Sat, Nov 02, 2024 at 10:51:10AM -0700, Rong Xu wrote:
> When the -ffunction-sections compiler option is enabled, each function
> is placed in a separate section named .text.function_name rather than
> putting all functions in a single .text section.
> 
...
> 
> Co-developed-by: Han Shen <shenhan@google.com>
> Signed-off-by: Han Shen <shenhan@google.com>
> Signed-off-by: Rong Xu <xur@google.com>
> Suggested-by: Sriraman Tallam <tmsriram@google.com>
> Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> Tested-by: Yonghong Song <yonghong.song@linux.dev>
> Tested-by: Yabin Cui <yabinc@google.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>

With this patch in the tree, the openrisck qemu emulation using
or1ksim_defconfig fails to boot. There is no log output, even with
earlycon enabled.

Bisect log attached.

Guenter

---
# bad: [bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a] Merge tag 'turbostat-2024.11.30' of git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux
# good: [2ba9f676d0a2e408aef14d679984c26373bf37b7] Merge tag 'drm-next-2024-11-29' of https://gitlab.freedesktop.org/drm/kernel
git bisect start 'HEAD' '2ba9f676d0a2'
# good: [831c1926ee728c3e747255f7c0f434762e8e863d] Merge tag 'uml-for-linus-6.13-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
git bisect good 831c1926ee728c3e747255f7c0f434762e8e863d
# bad: [6a34dfa15d6edf7e78b8118d862d2db0889cf669] Merge tag 'kbuild-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
git bisect bad 6a34dfa15d6edf7e78b8118d862d2db0889cf669
# bad: [e397a603e49cc7c7c113fad9f55a09637f290c34] kbuild: switch from lz4c to lz4 for compression
git bisect bad e397a603e49cc7c7c113fad9f55a09637f290c34
# good: [d6a91e28d11902e6cd5715633ed6f9b6df75de32] kconfig: qconf: remove unnecessary mode check in ConfigItem::updateMenu()
git bisect good d6a91e28d11902e6cd5715633ed6f9b6df75de32
# bad: [0afd73c5f5c606b0f8f8ff036e4f5d6c4b788d02] kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
git bisect bad 0afd73c5f5c606b0f8f8ff036e4f5d6c4b788d02
# bad: [db0b2991ae1aac5ca985ec6fd8ff9bd9b2126c9b] vmlinux.lds.h: Add markers for text_unlikely and text_hot sections
git bisect bad db0b2991ae1aac5ca985ec6fd8ff9bd9b2126c9b
# good: [315ad8780a129e82e2c5c65ee6e970d91a577acb] kbuild: Add AutoFDO support for Clang build
git bisect good 315ad8780a129e82e2c5c65ee6e970d91a577acb
# good: [52892ed6b03a14b961c1df783ed05763758abc73] MIPS: Place __kernel_entry at the beginning of text section
git bisect good 52892ed6b03a14b961c1df783ed05763758abc73
# bad: [0043ecea2399ffc8bfd99ed9dbbe766e7c79293c] vmlinux.lds.h: Adjust symbol ordering in text output section
git bisect bad 0043ecea2399ffc8bfd99ed9dbbe766e7c79293c
# first bad commit: [0043ecea2399ffc8bfd99ed9dbbe766e7c79293c] vmlinux.lds.h: Adjust symbol ordering in text output section
