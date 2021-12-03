Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED068
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 04:11:18 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id n85so1645569pfd.10
        for <llvm@lists.linux.dev>; Thu, 02 Dec 2021 20:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=chRUSqEaLCK4UXGMRZ4Wp7NZZHHltrpYU9yCMPNxKBw=;
        b=wlrwnagOpjfPirfchoR7ZHKq4utyU4DBXLcXw+m1t88ZggneLUJOOiwJktawCSrhez
         whEpO6zao8pHvU2quhgLE5TRsjOTOmi0oITsZHn3VO+rm6BsQ+/jE6dbtPJZgUIWL9Jf
         MHM48vbQ8GR0ypTJj50CpR0GCvnVLxDn71eddUCRNV9od5TZuHrpSZydCQ3ziDz8Ud9r
         c/Hc47J3bOmt5ek9QA9i8ePnCj79XcuN46qMT8RaFPLnnawDnpxjJ7aLjzaTRWsUiyHi
         PCEAw2r85se1XOLSxNbArrpB6cplHtqV5pfH+9kVGXPseBTyqZk0YcDmfgyq4KskYWsj
         kHtA==
X-Gm-Message-State: AOAM531hFp8bu6rnKDW3BRGEzsI42KsxH1siknXdx/ju9Ekvg+IWiebn
	/3/QII/Mz2dgdXK6nLXmo9M=
X-Google-Smtp-Source: ABdhPJzyrjA7mvvSflGdB/FBJvi4Ndvghcg3KwMAl6A255/bQSoWYDxUfaWAbtHgXyYG81Dv1Wr3kA==
X-Received: by 2002:a63:2cd1:: with SMTP id s200mr2690041pgs.489.1638504677530;
        Thu, 02 Dec 2021 20:11:17 -0800 (PST)
Received: from localhost ([2601:647:5b00:ece0:aab:34ff:52ca:a7a5])
        by smtp.gmail.com with ESMTPSA id v25sm1283780pfg.175.2021.12.02.20.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 20:11:17 -0800 (PST)
Date: Thu, 2 Dec 2021 20:11:16 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Yang Li <yang.lee@linux.alibaba.com>, mdf@kernel.org, hao.wu@intel.com,
	yilun.xu@intel.com, trix@redhat.com, nathan@kernel.org,
	ndesaulniers@google.com, linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH -next] fpga: region: fix kernel-doc
Message-ID: <YamY5IwKiQSU/BZf@epycbox.lan>
References: <1638499487-74388-1-git-send-email-yang.lee@linux.alibaba.com>
 <dd215074-38bc-5011-3e52-78858e9e2ea6@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd215074-38bc-5011-3e52-78858e9e2ea6@infradead.org>

Hi Yang,

On Thu, Dec 02, 2021 at 07:02:16PM -0800, Randy Dunlap wrote:

> Hi--
> 
> On 12/2/21 18:44, Yang Li wrote:
> > Fix function name in of-fpga-region.c kernel-doc comment
> > to remove a warning found by clang(make W=1 LLVM=1).
> 
> The patch below looks good, but the commit message about
> "found by clang" is not correct. Using 'make W=1' causes
> scripts/kernel-doc to run, and this warning message is from kernel-doc,
> not from clang.
> 
> > drivers/fpga/of-fpga-region.c:451: warning: expecting prototype for
> > fpga_region_init(). Prototype was for of_fpga_region_init() instead.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> > ---
> >  drivers/fpga/of-fpga-region.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
> > index 9c662db..50b8305 100644
> > --- a/drivers/fpga/of-fpga-region.c
> > +++ b/drivers/fpga/of-fpga-region.c
> > @@ -444,7 +444,7 @@ static int of_fpga_region_remove(struct platform_device *pdev)
> >  };
> >  
> >  /**
> > - * fpga_region_init - init function for fpga_region class
> > + * of_fpga_region_init - init function for fpga_region class
> >   * Creates the fpga_region class and registers a reconfig notifier.
> >   */
> >  static int __init of_fpga_region_init(void)
> > 
> 
> thanks.
> -- 
> ~Randy

Can you resend with these addressed?

Thanks
