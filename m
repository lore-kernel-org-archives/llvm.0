Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D42C0A3
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 21:49:37 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id k13so18475127plg.0
        for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 13:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K24hJmuuzDCWGJfa7cedDOeMiqAh7XOOikUOicrsYLk=;
        b=Nop4t4j/Ezoqqr7Wxz59BFFcsJEksG49eS0wzKJYp0Ewg6CRR2Z56e7MIKXOcTQroZ
         jmH+t/mxjQ/cE3U0i3+oUfIcqKyoLXqpDUBtpmA/0ewOc3LRubdiII7zMuWfo6pP5zs/
         U1qsI3khO4ndqEQ+91O3IXBhxmHP6OccfJk/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K24hJmuuzDCWGJfa7cedDOeMiqAh7XOOikUOicrsYLk=;
        b=uO7HHW9lrIqG+LU7n10ZJv0wvWBxZ/QLg7KZv+5AqqW7kBFoq9UbFX7C7up6KrdH88
         ZsEvt5+3/AuJaTobvTXGBIkiBh4dg3X/piVDW8pmH1Np9Je0bdFzGZeXyX9c0dVRPKQ1
         YsgHDun/bIGA0pU/pGEMY4qVPzTQmiENnNINbBfL3+xf7tHXLpSATaAqMFJR5wj3bFq+
         YR4N6uWZgWdgvtrjHRiyo5ORFJtJrMglBEqjEke9xWEEowbbPge2aRbnstgD9XvbmsbL
         DGrIwzXL+KvwiuAz63aSq+SEYeaLk+xxPNGaZkaTGwanD0XIzbD630RJfpXyzP0JySUB
         KKlw==
X-Gm-Message-State: AO0yUKWF+Vx8NvxlEy0Mo+JqObcWhfsXVLZZDKdX9YhG90oVYD773fjO
	xSX4K2gxfemNU6BxAxwLpZ7o9Q==
X-Google-Smtp-Source: AK7set9ijZSYts9u+A6XDClyLfPMQi8mabb6Pc9oedy/Kth90eU0jMozxH4xbvCYUALbaqjcfNSilA==
X-Received: by 2002:a17:90b:4b42:b0:234:5eb:2177 with SMTP id mi2-20020a17090b4b4200b0023405eb2177mr403521pjb.9.1676411376902;
        Tue, 14 Feb 2023 13:49:36 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q35-20020a17090a1b2600b002343bac52aesm30108pjq.7.2023.02.14.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 13:49:36 -0800 (PST)
Message-ID: <63ec01f0.170a0220.94c76.011e@mx.google.com>
X-Google-Original-Message-ID: <202302141348.@keescook>
Date: Tue, 14 Feb 2023 13:49:35 -0800
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

Perhaps this is arch or config specific? I haven't been able to reproduce
this for some reason.

-- 
Kees Cook
