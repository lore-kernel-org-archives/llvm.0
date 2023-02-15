Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EE9D2F5
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 21:32:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d8so23750plr.10
        for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 13:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kfYEghNnaEjUfoOcnZ4G0+8zAvGSYgSt957kdbuuys4=;
        b=d1rnikvOvf/SGy/v2+qrDhe4dbC1eCnXDz2MDCEFQFrQmdniFgCZOM0UH4WI+8mPwQ
         rlJUw1nQQEmDoXRV0zbXQF6kb7rEpfJHHVQHdB3XjGdjohKrW7Iwhl5w5fjc/7y68clN
         O0NbwwIz7iyeQ9gHUSU7DHnh/S+DprlGjeGqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfYEghNnaEjUfoOcnZ4G0+8zAvGSYgSt957kdbuuys4=;
        b=2hWgOIgE5fSnb1HFBeZgRTs0tW8y9xuYNVoNfHXXY38Un4axTj2+2NUD54vY4r1FNW
         oRrbpEL/n5nDoDXdDhgKPC26MC6pZDaGhI+cjLE3TD8UnAq7tv6xudCRDy3BVL/XNEhy
         V1his0ugtTOOyrZtLebv3nSMpERC/CrIT0FlMpLwRyeVBKK8ODaSG2CCS8amw7V2fka5
         eVTHQILENjTuHLXV8ILnqJ74UmeTZ1lbChYsHOBML7QGSlbfYWrJeceCDuN6e+Xgpk6H
         A7JQyo+kKoFCWyOj6pV8CTTFIn+LsoIdJ+KPd+0pHu7hEvliDX1gkz4RVzmtImXd9UxV
         cVBw==
X-Gm-Message-State: AO0yUKUQoVWQ/rEWFgkbDetQGOj4hXnTpkS2HRAfeuM2HAdYjFfchSd4
	pBJzKuYWqu68RM9hF1t+5rsHRA==
X-Google-Smtp-Source: AK7set+wTlRh8SP7In9F+w0tsSMTRd836XZmLAJXyqYif3yvQ2ETEmZh7wyNqIPWtp3PhiL6eWURgA==
X-Received: by 2002:a17:903:120e:b0:197:35fc:6a5d with SMTP id l14-20020a170903120e00b0019735fc6a5dmr4153057plh.30.1676496741565;
        Wed, 15 Feb 2023 13:32:21 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902b58a00b001991e4e0bdcsm12548670pls.233.2023.02.15.13.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 13:32:21 -0800 (PST)
Message-ID: <63ed4f65.170a0220.b2f75.8a8f@mx.google.com>
X-Google-Original-Message-ID: <202302151330.@keescook>
Date: Wed, 15 Feb 2023 13:32:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Brian King <brking@us.ibm.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Bottomley <James.Bottomley@steeleye.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	John Garry <john.g.garry@oracle.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] scsi: ipr: work around fortify-string warning
References: <20230214132831.2118392-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214132831.2118392-1-arnd@kernel.org>

On Tue, Feb 14, 2023 at 02:28:08PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ipr_log_vpd_compact() function triggers a fortified memcpy() warning
> about a potential string overflow with all versions of clang:
> 
> In file included from drivers/scsi/ipr.c:43:
> In file included from include/linux/string.h:254:
> include/linux/fortify-string.h:520:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>                         __write_overflow_field(p_size_field, size);
>                         ^
> include/linux/fortify-string.h:520:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> 2 errors generated.
> 
> I don't see anything actually wrong with the function, but this is the
> only instance I can reproduce of the fortification going wrong in the
> kernel at the moment, so the easiest solution may be to rewrite the
> function into something that does not trigger the warning.
> 
> Instead of having a combined buffer for vendor/device/serial strings,
> use three separate local variables and just truncate the whitespace
> individually.
> 
> Fixes: 8cf093e275d0 ("[SCSI] ipr: Improved dual adapter errors")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

Reproduced this locally -- I agree your fix looks like the best
approach. I think Clang was seeing the old "i + 2" return as potentially
overflowing in the case where there was no space-padding on any strings.

-- 
Kees Cook
