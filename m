Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456598F43
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 17:38:32 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id jh15so2582554plb.8
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 09:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ejS+fA6FXopXLvgXoYeghfO4Gq+OL51G2M5fMvFWUSA=;
        b=b3x1gtRASyVfGRtlJoCkIywjYwfoZC5CtHFS2el8MYUbQdx4cgghkl94J/FCr8Wbbe
         yZXH3ZnZxx/1IHJ/deyGQhwon38isJshX5XBUzawlFvToU3NKOzBSyShAMv3nOipxFL0
         O0TYJ7toYRLtk2hDXrtiXCz8PYBmcOSUD5M/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejS+fA6FXopXLvgXoYeghfO4Gq+OL51G2M5fMvFWUSA=;
        b=RRZsDjtGuXop991BX5gseJo6Vod2QMNPWKwVsw4r2+UzXZ9BSem9SCn2/cc0ValebR
         NQtVw1oYOPYAi6L/iRloFketd9K/hZayrB8lHllO6mqDI6FyHJEdHa39MdooMhLciVe9
         nAi8YVg13X0nsHR+YTutFjH1jhR/etoD0mla0McR2kGWwmcy1/hLn27pj4qZeG2p7Ixi
         xFOBJrcGI3lTraLaE6Xls7CyYnm73lppbPiQRhS4CNYaIMmBK4428oOTAQgiAXuT99TQ
         MusA3QykGItSMZZ0xO35omNA+TM4fMkiDYDKPsZETDazkaK+UvDRTMcQxXBhH3CuceLO
         qAIQ==
X-Gm-Message-State: AO0yUKXlSDzMD2PAh7PYR1UJNkigqXMhMX+Okuj9wioY0GPMdB1unhRb
	gvGPX5baJleDklZuDsV5n9WuoQ==
X-Google-Smtp-Source: AK7set80/QWi2ZBrv8yRSPbkEc2D7xyp0jIgn+EHMwhfhvi+pHfUa4N0s+tXpJ+i+2BV4s1sZRxfLA==
X-Received: by 2002:a17:902:d292:b0:197:90f8:f3b with SMTP id t18-20020a170902d29200b0019790f80f3bmr6363019plc.57.1675359511761;
        Thu, 02 Feb 2023 09:38:31 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 22-20020aa79256000000b0058baf8694e1sm13785961pfp.71.2023.02.02.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 09:38:31 -0800 (PST)
Message-ID: <63dbf517.a70a0220.d9b66.9217@mx.google.com>
X-Google-Original-Message-ID: <202302021738.@keescook>
Date: Thu, 2 Feb 2023 17:38:30 +0000
From: Kees Cook <keescook@chromium.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: akpm@linux-foundation.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Marco Elver <elver@google.com>, Dan Li <ashimida@linux.alibaba.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arch/Kconfig: Fix indentation
References: <20220518054801.364376-1-juergh@canonical.com>
 <20230201162435.218368-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201162435.218368-1-juerg.haefliger@canonical.com>

On Wed, Feb 01, 2023 at 05:24:35PM +0100, Juerg Haefliger wrote:
> The convention for indentation seems to be a single tab. Help text is
> further indented by an additional two whitespaces. Fix the lines that
> violate these rules.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
